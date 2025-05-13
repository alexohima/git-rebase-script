# Git Rebase and Force Push Script

This script automates the process of rebasing your current feature branch onto a specified branch (default: `main`). Afterward, it copies the git command to commit with the previous commit message and force push the changes to the remote repository into your clipboard.

Just paste the command and hit enter.
## Usecase example
- You are currently on a feature branch with multiple commits and want to merge to main with only 1 commit:
  + Run this script
  + Commit
  + Force push
  + Your feature branch will now have a single combined commit and you are now ready to create a PR for merging.
## Usage
- Run the script with the desired branch as an optional argument. If no branch is provided, it defaults to `main`.

```bash
./grr.sh branch_name
