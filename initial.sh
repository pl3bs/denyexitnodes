echo "11 3   *   *   * root    cd ~/den && ./exitor.sh" >> /etc/crontab ;
wget https://raw.githubusercontent.com/pl3bs/denyexitnodes/master/exitor.sh ;
chmox +x exitor.sh
./exitor.sh ;
