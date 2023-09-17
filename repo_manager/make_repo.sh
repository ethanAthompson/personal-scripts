#!/bin/sh

# Author: Ethan Thompson
# Description: Creates a repo in your current folder
#              Use at your decision!

# initalize variables
commit_msg=""
repo_name=""

# processes args as flags
while getopts "c:n:" flag
do 
  case "${flag}" in
    c) commit_msg="${OPTARG}";;
    n) repo_name="${OPTARG}";;
  esac
done

# checks if flags are setup
if [ -z "$commit_msg" ] || [ -z "$repo_name" ]; then
    # helps user know what flags to setup
    echo "Commit Message: $commit_msg"
    echo "Repo Name: $repo_name"
    echo " -c 'commit_message'\n -n 'repo_name'"
    exit 1
fi


echo "Do you want to Run this File? (y/n)"
read check1

if [ "$check1" = "y" ]
then
  echo "This file creates a repo within this folder ARE YOU SURE? (y/n)"
  read check2 

  if [ "$check2" = "y" ]
  then 
    # I had to make sure you were paying attention, you know what to do (:
    git init

    git add .

    git commit -m "$commit_msg"

    # creates a pointer to the main branch
    git branch -M main

    # creates repo with the default remote
    gh repo create "$repo_name" --public --source=. --remote=origin --push
  else 
    echo "Okay! Have a nice day check2:$check2"
  fi
else 
  echo "Okay! Have a nice day check1:$check1"
fi

