#!/bin/sh

# Author: Ethan Thompson
# Description: Updates a repo in your current folder
#              Use at your decision!

git add .
git commit -m "new update!"
git branch -M main
git push -u origin main
