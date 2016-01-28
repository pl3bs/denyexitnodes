# denyexitnodes
## require ubuntu & apache2


I was getting spammed by bots creating phony referrels in apache logs using tor exit nodes on a new server contract from Kimsufi to the tune of 20k hits a day. After loading mod_security into apache and denying requests with 503, it still loaded up my server a bit and ticked me off. After entering in the IPs in a browser and finding they were all tor exit nodes, I got the public listing and wrote a script to extract exitnode IPs, and send that list through iptables to drop the connection completely.

The following is a program to deny all known exit nodes capable of attacking your server, which will update listing, run daily, and remove duplicate rules from iptables. 


## run this command in terminal to initialize program 

cd /tmp && wget https://raw.githubusercontent.com/pl3bs/denyexitnodes/master/setup.sh && chmod +x setup.sh && ./setup.sh

![alt tag](http://i.imgur.com/HQhoQVo.png)

