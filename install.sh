#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/aula-f75"
BIN_DIR="${HOME}/.local/bin"
LINK="$BIN_DIR/aula"

if [[ ! -x "$SRC" ]]; then
    echo "aula-f75 not found or not executable: $SRC" >&2
    exit 1
fi

mkdir -p "$BIN_DIR"
ln -sfn "$SRC" "$LINK"

echo "Installed: $LINK -> $SRC"
echo "Ensure $BIN_DIR is on your PATH."
