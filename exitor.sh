# remove prior run files

rm TorBulk*  ;

# go to location of files

cd ~/den ;

# get your IP addy

ipaddy=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'` ;

# get the list of exit nodes that can reach your server

wget https://check.torproject.org/cgi-bin/TorBulkExitList.py?ip="$ipaddy"&port= ;
sleep 2 ;

# make into executable script

mv TorBulk* ipaddy.sh ;
chmod +x ipaddy.sh ;

# transform file into list of ip addresses

grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ipaddy.sh ;
sed -i -e 1,3d ipaddy.sh ;
# transform list into iptables drop commands

sed -i s"|^|iptables -A INPUT -s |" ipaddy.sh ;
sed -i 's/$/ -j DROP/' ipaddy.sh ;

# execute drop line by line

./ipaddy.sh ;

# remove duplicate rules from iptables

iptables-save | uniq | iptables-restore ;
