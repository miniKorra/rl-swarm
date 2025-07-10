# chmod +x *.sh

# 1. copy: gen.sh -> ~/gen.sh
cp gen.sh ~/gen.sh
sed -i 's/{vps_no}/$vps_no/g' ~/gen.sh

# 2. copy: gen_update_date -> ~/gen_update_date
copy -rf gen_update_date ~/bb/gen_update_date

# 3. run: generate userApiKey.json, userData.json
./r.sh

# 4. copy: *.json -> data/*.json
#cp ~/bb/0.5/rl-swarm/modal-app/temp-data/*.json  ~/bb/0.5/rl-swarm/modal-app/data/*.json

# 5. run: gen.sh
~/gen.sh
