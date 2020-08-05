#!/bin/sh
expect -c "
spawn sftp pything@frs.sourceforge.net
expect \"yes/no\"
send \"yes\r\"
expect \"Password\"
send \"${{ secrets.PASSWORD }}\r\"
expect \"sftp> \"
send \"$SFDIRA\r\"
set timeout -1
send \"put *Aonly*.zip\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
interact"
expect -c "
spawn sftp pything@frs.sourceforge.net
expect \"Password\"
send \"${{ secrets.PASSWORD }}\r\"
expect \"sftp> \"
send \"$SFDIRAB\r\"
set timeout -1
send \"put *AB*.zip\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"bye\r\"
interact"