#!/bin/bash

VERSION_FILE="lib/git_notified_on_trello/version.rb"

# Extract the version into something we can work with
V=$(cat "$VERSION_FILE" | awk '/VERSION/ {print $3}' | tr -d '"')
VERSION=${V:0:1}
MAJOR=${V:2:1}
MINOR=${V:4:1}

# Do the version bump
if [[ $MINOR -lt 9 ]]; then
    MINOR=$(( $MINOR + 1 ))
elif [[ $MAJOR -lt 9 ]]; then
    MINOR=0
    MAJOR=$(( $MAJOR + 1 ))
else
    MINOR=0
    MAJOR=0
    VERSION=$(( $VERSION + 1 ))
fi

# Get the version back into a string
TAG="$VERSION.$MAJOR.$MINOR"
echo "Releasing gem with tag $TAG"

# Update the version file
sed -i 's/\(.*\)VERSION = .*/\1VERSION = "'$TAG'"/' "$VERSION_FILE"

# Do the Git work
git add $VERSION_FILE
git commit -m "Release $TAG"
git tag "$TAG"
git push --tags


echo "Done!"
