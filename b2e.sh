#!/bin/bash

SRC_DIR="$1"
DEST_DIR="${2:-.}"
RES_DIR="src"
SCRIPT_NAME="$(basename "$0")"
USAGE="USAGE: $SCRIPT_NAME SOURCE [DESTINATION]"
BRANCH_NAME="$(basename "$SRC_DIR")"

exception () {
  MSG=${1:-"$SCRIPT_NAME exception"}
  echo "EXCEPTION: $MSG" >&2
  [ $2 -eq 2 ] \
    && echo $USAGE >&2
  exit "${2:-1}"
}
git_init () {
  git -C "$DEST_DIR" init \
  && echo -e "/*\n!/$RES_DIR" > .gitignore \
  && git_commit "Init git" \
  || exception "Unable to init git"
}
git_commit () {
  MSG=${1:-"$SCRIPT_NAME autocommit"}
  git -C "$DEST_DIR" add --all \
  && git -C "$DEST_DIR" commit -am "$MSG" \
  || exception "Unable to commit changes"
}
git_status () {
  git -C "$DEST_DIR" status --porcelain 2>/dev/null \
    || git_init
}

[[ -n "$SRC_DIR" ]] \
  || exception "Missing source folder" 2
[[ -d "$SRC_DIR" ]] \
  || exception "Source folder $SRC_DIR does not exist"
[[ -d "$DEST_DIR/$RES_DIR" ]] \
  || exception "Destination folder $DEST_DIR/$RES_DIR does not exist"
[[ -z "$(git_status)" ]] \
  || git_commit

git -C "$DEST_DIR" checkout "$BRANCH_NAME" 2>/dev/null \
  || git -C "$DEST_DIR" checkout -b "$BRANCH_NAME"
rm -rf "$DEST_DIR/$RES_DIR" \
  || exception "Unable to delete folder $DEST_DIR/$RES_DIR"
cp -r "$SRC_DIR" "$DEST_DIR/$RES_DIR" \
  || exception "Unable to copy from $SRC_DIR to $DEST_DIR/$RES_DIR"

[[ -z "$(git_status)" ]] \
  && echo "No changes since last update" \
  && exit
git_commit "Copy $BRANCH_NAME"
