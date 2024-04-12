#!/usr/bin/env bash

# Prompt the user for the TOOL and VERSION
read -p "Enter tool: " TOOL
read -p "Enter version: " VERSION

# Find the tool's location and create a symlink
S=$(find / -name "${TOOL}_v${VERSION}" -printf '%h' -quit)

echo -e "\n"

if [ -n "$S" ]; then
  sudo ln -s "$S/${TOOL}_v${VERSION}" "/usr/local/bin/${TOOL}"
  if [ $? -eq 0 ]; then
    echo "Symlink created successfully."
  else
    echo "Symlink was not created successfully."
  fi
else
  echo "Tool not found with the specified version."
fi