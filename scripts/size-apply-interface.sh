#!/bin/sh
# Apply the reviewed SIZE interface patch to the pinned Passbolt styleguide.
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
style_dir="${SIZE_STYLEGUIDE_DIR:-$root/node_modules/passbolt-styleguide}"
patch_file="$root/size/patches/interface.patch"
if [ ! -f "$style_dir/package.json" ]; then
  echo 'Passbolt styleguide missing; install dependencies first.' >&2
  exit 1
fi
version=$(node -p "require(process.argv[1]).version" "$style_dir/package.json")
if [ "$version" != '5.17.2' ]; then
  echo "Unsupported styleguide version: $version; expected 5.17.2." >&2
  exit 1
fi
if patch --silent --batch --forward --dry-run -p1 -d "$style_dir" -i "$patch_file" >/dev/null 2>&1; then
  patch --silent --batch --forward -p1 -d "$style_dir" -i "$patch_file"
  echo 'SIZE interface applied.'
elif patch --silent --batch --reverse --dry-run -p1 -d "$style_dir" -i "$patch_file" >/dev/null 2>&1; then
  echo 'SIZE interface already applied.'
else
  echo 'SIZE interface patch does not match the installed source; refusing to build.' >&2
  exit 1
fi
