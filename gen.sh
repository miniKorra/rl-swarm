!/bin/bash

cd   ~/bb/gen_update_date
nohup  node index.js  > output.log 2>&1 &

cd ~/bb/0.5/rl-swarm
./d.sh
