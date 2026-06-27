#!/usr/bin/env bash
# Run this script once to set up repository labels.
# Requires GitHub CLI (gh) to be installed and authenticated.
# Usage: bash scripts/setup-labels.sh

set -euo pipefail

REPO="raviraushanweb/parrotdev-issues"

echo "Setting up labels for $REPO..."

declare -A LABELS
LABELS=(
  # Type labels
  ["bug"]="d73a4a"
  ["enhancement"]="a2eeef"
  ["documentation"]="0075ca"
  ["question"]="d876e3"

  # Extension labels
  ["lang: javascript"]="f7c6c5"
  ["lang: python"]="3572a5"
  ["lang: php"]="4f5d95"

  # Status labels
  ["status: needs triage"]="fbca04"
  ["status: in progress"]="0e8a16"
  ["status: waiting on user"]="cfd3d7"
)

for label in "${!LABELS[@]}"; do
  color="${LABELS[$label]}"
  echo "  Creating: $label ($color)"
  gh label create "$label" --color "$color" --repo "$REPO" 2>/dev/null || \
    echo "    (already exists, skipped)"
done

echo "Done!"
