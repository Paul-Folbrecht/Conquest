#!/bin/sh
set -eu

cd "$(dirname "$0")"
./build.sh

archive="$PWD/Conquest-Mac.zip"
staging=$(mktemp -d "${TMPDIR:-/tmp}/conquest.XXXXXX")
trap 'rm -rf "$staging"' EXIT
trap 'exit 1' HUP INT TERM

mkdir "$staging/Conquest"
cp startConquest.sh README.md "$staging/Conquest/"
cp -R classes lib "$staging/Conquest/"

# Replace rather than update the archive so old entries cannot linger.
rm -f "$archive"
cd "$staging"
zip -qr "$archive" Conquest
printf 'Created %s\n' "$archive"
