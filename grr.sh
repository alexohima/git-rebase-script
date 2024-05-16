#!/bin/bash

# Set default branch to main if no argument is provided
BRANCH=${1:-main}

# Switch to the main branch
if ! git checkout $BRANCH; then
    echo "Failed to checkout branch $BRANCH"
    exit 1
fi

# Pull the latest changes from main
if ! git pull; then
    echo "Failed to pull changes"
    exit 1
fi

# Switch back to the feature branch
if ! git checkout -; then
    echo "Failed to switch back to previous branch"
    exit 1
fi

# Rebase the feature branch onto the main branch
if ! git rebase $BRANCH; then
    echo "Failed to rebase branch onto $BRANCH"
    exit 1
fi

# Get the commit ID of the main branch
COMMIT_ID=$(git rev-parse origin/$BRANCH)

# Reset the feature branch to the commit ID (soft reset)
if ! git reset $COMMIT_ID --soft; then
    echo "Failed to reset branch to commit $COMMIT_ID"
    exit 1
fi

# Get the commit message of the latest commit message on the current branch
COMMIT_MESSAGE=$(git log -1 --pretty=%B)

# Output the command to commit the changes with the previous commit message and force push them to the repository, then copy this command to the clipboard.
echo "git commit -m \"$COMMIT_MESSAGE\" && git push --force" | pbcopy

