# gcast: Google Cast Discovery & Control CLI

`gcast` is a simple yet powerful command-line tool written in Python to discover, control, play media, and send text-to-speech (TTS) messages to Google Cast devices (Chromecasts, Nest Audio, Google Home, etc.) on your local network.

## Features

- **Discover**: List all Cast devices on your network.
- **Play**: Stream audio from a URL to a specific device.
- **Support for Volume Control**: Set volume levels directly from the CLI.
- **Text-to-Speech (TTS)**: Speak any text message on a device (Mac-only, requires `ffmpeg`).
- **Stop**: Stop playback and quit the active app on the device.

## Prerequisites

- **Python 3.7+**
- **macOS** (Required for the `say` command used in TTS)
- **ffmpeg** (Required for TTS audio conversion). Install via Homebrew:
  ```bash
  brew install ffmpeg
  ```

## Installation

1. Clone or download this repository.
2. Run the install script:
   ```bash
   ./install.sh
   ```
   
   Or manually:
   ```bash
   pip3 install -r requirements.txt
   chmod +x gcast
   ```

## Usage

### 1. List Devices
Find all available devices on your network.
```bash
./gcast list
```
*Output:*
```text
Found 1 device(s):
----------------------------------------
Name: Living Room Speaker
Model: Google Home (Google Inc.)
IP: 192.168.1.50:8009
...
```

### 2. Play Audio
Play a default test sound or a custom URL.

**Interactive Mode** (Prompts you to select a device):
```bash
./gcast play
```

**Targeted Playback**:
```bash
./gcast play --device "Living Room" --volume 0.5
```

**Custom URL**:
```bash
./gcast play --device "Living Room" --url "http://example.com/music.mp3"
```

### 3. Text-to-Speech (Say)
Make your device speak!
```bash
./gcast say --device "Living Room" --message "Dinner is ready!" --volume 0.8
```
*Note: This generates an audio file using macOS `say`, converts it to MP3 with `ffmpeg`, hosts it on a temporary local web server, and streams it to the device.*

### 4. Stop Playback
Stop whatever is playing.
```bash
./gcast stop --device "Living Room"
```

## Options
- `--verbose`: Enable detailed logging for debugging.
- `--version`: Show version number.
- `--timeout`: Set discovery timeout (default: 5s).
- `--json`: Output discovery results in JSON format.

## Troubleshooting
- **No devices found**: Ensure you are on the same Wi-Fi network and mDNS is allowed. Try increasing timeout: `./gcast list --timeout 10`.
- **TTS not working**: Ensure `ffmpeg` is installed (`ffmpeg -version`) and you are on macOS.
