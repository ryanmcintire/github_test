#!/bin/bash

branch="beta"
master="master"

echo "Deleting $branch branch"
git checkout master
git branch -D $branch
git push origin --delete $branch

echo "Geting most recent alpha release"
git fetch upstream +refs/tags/*:refs/tags/remote/*
recent_tag=$(git describe --bbrev=0)
echo "Most recent tag: $recent_tag"

echo "Creating branch $branch from "
git checkout -B $branch $recent_tag
git push origin $branch:$branch
git checkout master

echo "Finished"