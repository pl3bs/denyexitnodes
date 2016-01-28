echo "11 3   *   *   * root    cd ~/den && ./exitor.sh" >> /etc/crontab ;
cd /root/den
wget https://raw.githubusercontent.com/pl3bs/denyexitnodes/master/exitor.sh ;
chmod +x exitor.sh
./exitor.sh ;
