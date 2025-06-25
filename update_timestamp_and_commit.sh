#!/bin/bash
# update_timestamp_and_commit.sh
# Usage: ./update_timestamp_and_commit.sh "Your commit message here"

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 'Your commit message'"
  exit 1
fi

# Get current CT (GMT-5) time in the required format
timestamp=$(TZ="America/Chicago" date +"%Y-%m-%d, %H:%M CT (GMT-5)")

# Update all HTML files in the directory
for file in *.html; do
  sed -i "s|<i>Last updated: .* CT (GMT-5)</i>|<i>Last updated: $timestamp</i>|" "$file"
done

echo "Timestamps updated to: $timestamp"

git add *.html
git commit -m "$1"
echo "Committed with message: $1"
