# Git Rebase and Force Push Script

This script automates the process of rebasing your current feature branch onto a specified branch (default: `main`). Afterward, it copies the git command to commit with the previous commit message and force push the changes to the remote repository into your clipboard.

Just paste the command and hit enter.

## Usage
- Run the script with the desired branch as an optional argument. If no branch is provided, it defaults to `main`.

```bash
./grr.sh branch_name
