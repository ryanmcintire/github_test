#!/bin/bash

branch="beta"
master="master"

echo "Deleting $branch branch"
git checkout master
git branch -D $branch
git push origin --delete $branch

echo "Geting most recent alpha release"
git fetch --tags
newest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)

if [ -n "$newest_tag" ]; then
    echo "Most recent release: $newest_tag"
    echo "Creating branch $branch release $recent_tag"
    git checkout -B $branch $newest_tag
    git push origin $branch:$branch
    git checkout master
    

else 
    echo "Error - unable to obtain latest release."
fi

echo "Finished."
