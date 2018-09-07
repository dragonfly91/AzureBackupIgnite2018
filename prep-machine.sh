SCRIPT_LOCATION=/etc/azure/sam
mkdir -p $SCRIPT_LOCATION

wget -q https://raw.githubusercontent.com/dragonfly91/AzureBackupIgnite2018/1c810c2df489fd3ef589ae2e90aa72a286ca896c/mysql-app-consistent-backup-env.sh -O $SCRIPT_LOCATION/mysql-app-consistent-backup-env.sh
wget -q https://raw.githubusercontent.com/dragonfly91/AzureBackupIgnite2018/1c810c2df489fd3ef589ae2e90aa72a286ca896c/mysql-app-consistent-backup-funcs.sh -O $SCRIPT_LOCATION/mysql-app-consistent-backup-funcs.sh
wget -q https://raw.githubusercontent.com/dragonfly91/AzureBackupIgnite2018/1c810c2df489fd3ef589ae2e90aa72a286ca896c/mysql-app-consistent-backup.sh -O $SCRIPT_LOCATION/mysql-app-consistent-backup.sh
wget -q https://raw.githubusercontent.com/dragonfly91/AzureBackupIgnite2018/1c810c2df489fd3ef589ae2e90aa72a286ca896c/pre-mysql-backup.sh -O $SCRIPT_LOCATION/pre-mysql-backup.sh
wget -q https://raw.githubusercontent.com/dragonfly91/AzureBackupIgnite2018/1c810c2df489fd3ef589ae2e90aa72a286ca896c/post-mysql-backup.sh -O $SCRIPT_LOCATION/post-mysql-backup.sh
wget -q https://raw.githubusercontent.com/MicrosoftAzureBackup/VMSnapshotPluginConfig/6ee4794d92870f452143cd987299929dadb8f012/VMSnapshotScriptPluginConfig.json -O $SCRIPT_LOCATION/VMSnapshotScriptPluginConfig.json

sed -i 's#"preScriptLocation" : ""#"preScriptLocation" : "'"$SCRIPT_LOCATION"'/pre-mysql-backup.sh"#g' $SCRIPT_LOCATION/VMSnapshotScriptPluginConfig.json
sed -i 's#"preScriptLocation" : ""#"postScriptLocation" : "'"$SCRIPT_LOCATION"'/post-mysql-backup.sh"#g' $SCRIPT_LOCATION/VMSnapshotScriptPluginConfig.json

chmod 700 $SCRIPT_LOCATION/pre-mysql-backup.sh
chmod 700 $SCRIPT_LOCATION/post-mysql-backup.sh
chmod 600 $SCRIPT_LOCATION/VMSnapshotScriptPluginConfig.json
