#!/bin/bash

if [[ $# < 1 ]]; then
    echo "you must specify the new repository name."
    exit 10
fi

echo "About to create a new blank branch named: $1"

read -p "continue? " -n 1
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

git symbolic-ref HEAD refs/heads/$1
echo "$1" > README.md
git add README.md
git commit -m 'Initial blank branch commit'
