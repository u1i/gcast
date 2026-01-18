#!/bin/bash
echo "Installing dependencies..."
python3 -m pip install -r requirements.txt

echo "Checking for ffmpeg..."
if ! command -v ffmpeg &> /dev/null; then
    echo "Warning: ffmpeg could not be found. TTS features requires ffmpeg."
    echo "Please install it, e.g., 'brew install ffmpeg'"
else
    echo "ffmpeg found."
fi

chmod +x gcast
echo "Done! You can now run './gcast'"
