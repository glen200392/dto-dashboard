#!/bin/bash
# Push DTO Dashboard to GitHub
# Run this script from the dto-dashboard directory

echo "🚀 Creating GitHub repo and pushing DTO Dashboard..."

# Create new repo on GitHub
gh repo create dto-dashboard \
  --public \
  --description "致伸集團 Digital Transformation Office Dashboard with AI Agent Orchestrator" \
  --source=. \
  --remote=origin \
  --push

echo ""
echo "✅ Done! Your repo is at: https://github.com/glen200392/dto-dashboard"
echo ""
echo "To enable GitHub Pages (optional):"
echo "  gh api repos/glen200392/dto-dashboard/pages -X POST -f source.branch=main -f source.path=/"
echo ""
echo "Your live dashboard will be at: https://glen200392.github.io/dto-dashboard/"
