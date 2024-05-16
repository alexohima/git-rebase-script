#!/bin/bash

# Set default branch if no argument is provided
BRANCH=${1:-main}

# Switch to the specified branch
if ! git checkout $BRANCH; then
    echo "Failed to checkout branch $BRANCH"
    exit 1
fi

# Pull the latest changes
if ! git pull; then
    echo "Failed to pull changes"
    exit 1
fi

# Switch back to the previous branch
if ! git checkout -; then
    echo "Failed to switch back to previous branch"
    exit 1
fi

# Rebase the current branch onto the main branch
if ! git rebase $BRANCH; then
    echo "Failed to rebase branch onto $BRANCH"
    exit 1
fi

# Get the commit ID of the main branch
COMMIT_ID=$(git rev-parse origin/$BRANCH)

# Reset the current branch to the commit ID (soft reset)
if ! git reset $COMMIT_ID --soft; then
    echo "Failed to reset branch to commit $COMMIT_ID"
    exit 1
fi

# Get the commit message of the latest commit on the current branch
COMMIT_MESSAGE=$(git log -1 --pretty=%B)

# Echo the command to paste the commit message and push changes, and copy it to the clipboard
echo "git commit -m \"$COMMIT_MESSAGE\" && git push --force" | pbcopy

