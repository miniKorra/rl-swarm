#!/bin/bash

cd   ~/bb/gen_update_date
nohup  node index.js {vps_no} {prefix} > output.log 2>&1 &

cd ~/bb/0.5/rl-swarm

# fix: hang for valueError exception
cp -f game_manager.py  /home/user/.local/lib/python3.12/site-packages/genrl/game/game_manager.py

./d.sh
