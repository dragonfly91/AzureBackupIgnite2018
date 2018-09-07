mkdir -p /etc/azure
cd /etc/azure

wget https://raw.githubusercontent.com/dragonfly91/AzureBackupIgnite2018/1c810c2df489fd3ef589ae2e90aa72a286ca896c/mysql-app-consistent-backup-env.sh
wget https://raw.githubusercontent.com/dragonfly91/AzureBackupIgnite2018/1c810c2df489fd3ef589ae2e90aa72a286ca896c/mysql-app-consistent-backup-funcs.sh
wget https://raw.githubusercontent.com/dragonfly91/AzureBackupIgnite2018/1c810c2df489fd3ef589ae2e90aa72a286ca896c/mysql-app-consistent-backup.sh
wget https://raw.githubusercontent.com/dragonfly91/AzureBackupIgnite2018/1c810c2df489fd3ef589ae2e90aa72a286ca896c/pre-mysql-backup.sh
wget https://raw.githubusercontent.com/dragonfly91/AzureBackupIgnite2018/1c810c2df489fd3ef589ae2e90aa72a286ca896c/post-mysql-backup.sh

wget https://raw.githubusercontent.com/MicrosoftAzureBackup/VMSnapshotPluginConfig/6ee4794d92870f452143cd987299929dadb8f012/VMSnapshotScriptPluginConfig.json

sed -i 's#"preScriptLocation" : ""#"preScriptLocation" : "/etc/azure/mysql-app-consistent-backup-env.sh"#g' VMSnapshotScriptPluginConfig.json