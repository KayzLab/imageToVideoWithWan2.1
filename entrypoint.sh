#!/bin/bash
set -x  # Print each command before executing

echo "Checking for pretrained model checkpoint..."
if [ ! -f checkpoints/vox-cpk.pth.tar ]; then
  mkdir -p checkpoints
  echo "Downloading model checkpoint..."
  curl -L -o checkpoints/vox-cpk.pth.tar https://www.dropbox.com/s/1sd4fwk44k4y8fp/vox-cpk.pth.tar?dl=1
  echo "Download finished."
else
  echo "Model checkpoint already exists."
fi

exec "$@"
