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

INSTALL_DIR="$HOME/.local/bin"

echo "Installing to $INSTALL_DIR (user mode)..."
mkdir -p "$INSTALL_DIR"

if cp gcast "$INSTALL_DIR/gcast"; then
    echo "Successfully installed 'gcast' to $INSTALL_DIR"
    
    # Check if INSTALL_DIR is in PATH
    case ":$PATH:" in
        *":$INSTALL_DIR:"*) 
            echo "You can now run 'gcast' from anywhere."
            ;;
        *) 
            echo "WARNING: $INSTALL_DIR is not in your PATH."
            echo "Add the following to your shell config (.zshrc, .bashrc, etc.):"
            echo "  export PATH=\"\$PATH:$INSTALL_DIR\""
            echo "Then restart your terminal."
            ;;
    esac
else
    echo "Error: Could not copy to $INSTALL_DIR"
fi
