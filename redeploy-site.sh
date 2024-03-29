#!/bin/bash

# kill all existing tmux sessions
tmux kill-session -a

# change directory to project folder
cd pe-portfolio

# fetch latest changes from main branch
git fetch

# reset the local repository to the latest changes from the main branch
git reset origin/main --hard

# activate Python venv and install dependencies
source python3-virtualenv/bin/activate
pip install -r requirements.txt

# start new detached Tmux session
tmux kill-session -t myflaskapp
tmux new-session -d -s myflaskapp

# start Flask server within Tmux session
tmux send-keys -t myflaskapp "flask run --host=0.0.0.0" Enter
