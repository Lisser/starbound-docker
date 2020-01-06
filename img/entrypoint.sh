#!/usr/bin/env bash

# Define the exit handler
exit_handler()
{
	echo ""
	echo "Waiting for server to shutdown.."
	echo ""
	kill -SIGINT "$child"
	sleep 5

	echo ""
	echo "Terminating.."
	echo ""
}

# Trap specific signals and forward to the exit handler
trap 'exit_handler' SIGHUP SIGINT SIGQUIT SIGTERM

# Download latest Starbound save
echo ""
echo "Pulling latest Starbound save.."
echo ""
cd /starbound
git init --quiet
git remote add origin https://github.com/Lisser/starbound-sessions.git
git pull --quiet --depth=1 origin master
git branch --quiet --set-upstream-to origin/master

# Run the server
echo ""
echo "Starting Starbound.."
echo ""
cd /starbound/linux
./starbound_server 2>&1 &

# Wait for Starbound to stop
child=$!
wait "$child"

# Sync save files back to Github
echo ""
echo "Post shutdown starbound.."
echo ""
git config --global user.email "jesselisser@gmail.com"
git config --global user.name "Jesse Lisser"

cd /starbound
git add -A
git commit -m "chore(save): data from $(date +\"%Y-%m-%d\ %H:%M\")"
git push https://Lisser:$github_password@github.com/Lisser/starbound-sessions.git --all
