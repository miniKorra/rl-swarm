# 1. copy: gen.sh -> ~/gen.sh
cp gen.sh ~/gen.sh
sed -i "s/{vps_no}/$vps_no/g" ~/gen.sh

# 2. copy: gen_update_date -> ~/gen_update_date
cp -rf gen_update_date ~/bb/gen_update_date
cd ~/bb/gen_update_date
npm install

# 3. run: generate userApiKey.json, userData.json
cd ~/bb/0.5/rl-swarm
./r.sh

# 4. run: gen.sh
~/gen.sh
