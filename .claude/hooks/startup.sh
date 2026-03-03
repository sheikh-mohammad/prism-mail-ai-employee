#!/bin/bash
# Startup hook to read AGENTS.md when Claude Code starts in this project

echo "=== Claude Code Startup Hook ==="
echo "Reading project agent configuration from AGENTS.md..."

# Read and display the AGENTS.md content
if [ -f "../AGENTS.md" ]; then
    echo ""
    echo "Contents of AGENTS.md:"
    echo "======================"
    cat "../AGENTS.md"
    echo ""
    echo "======================"
    echo "Agent configuration loaded successfully."
else
    echo "Warning: AGENTS.md not found in project root."
fi

echo "Startup hook completed."