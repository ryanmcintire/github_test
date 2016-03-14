#!/bin/bash

branch="beta"
master="master"
backup="beta_bak"

echo "Creating backup..."
git checkout -B beta_bak
git push origin $backup:$backup

echo "Deleting $branch branch"
git checkout master
git branch -D $branch
git push origin --delete $branch

echo "Creating branch $branch"
git checkout -b $branch
git push origin $branch:$branch
git checkout master

echo "Finished"