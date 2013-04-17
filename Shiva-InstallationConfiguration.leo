<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo (http://webpages.charter.net/edreamleo/front.html) -->
<?xml-stylesheet ekr_test?>
<leo_file xmlns:leo="http://www.leo-editor.org/2011/leo" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="template.20120807112617.1347" a="E"><vh>Shiva - Install &amp; Configuration</vh>
<v t="template.20120807112807.1352"><vh>Installation</vh></v>
<v t="template.20120807112807.1351" a="E"><vh>Configuration</vh>
<v t="template.20120807120617.1358"><vh>ShivaReceiver</vh></v>
<v t="template.20120807120617.1357"><vh>ShivaAnalyzer</vh></v>
<v t="template.20120807120617.1363"><vh>exim4</vh></v>
</v>
<v t="template.20120807114143.1356" a="E"><vh>Run</vh>
<v t="template.20120807120617.1361"><vh>ShivaReceiver</vh></v>
<v t="template.20120807120617.1360"><vh>ShivaAnalyzer</vh></v>
</v>
<v t="template.20120924125452.1377"><vh>BackUp</vh></v>
<v t="template.20120807120617.1362"><vh>Debugging</vh></v>
<v t="template.20120809005311.1369"><vh>Lamson Commands</vh></v>
<v t="template.20120809005311.1370"><vh>Network Config of Shiva</vh></v>
<v t="template.20120815011138.1373"><vh>MySQL Privileges</vh></v>
<v t="template.20120924125452.1378"><vh>MySQL Data Export</vh></v>
<v t="template.20120815011138.1374"><vh>Things to be automated</vh></v>
<v t="template.20121018145151.1381"><vh>Remote commands</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="template.20120807112617.1347"></t>
<t tx="template.20120807112807.1351"></t>
<t tx="template.20120807112807.1352">1. Install Virtual Environment python-virtualenv
    # apt-get install python-virtualenv
    sudo pip install virtualenv

2. Install two virtual environments for Shiva
    # cd Shiva/
    # virtualenv ShivaReceiver
    # virtualenv ShivaAnalyzer
    
    For a different version of python in virtualenv
    # virtualenv --python=/usr/bin/python2.7 myvirtualenv

3. Install lamson under both virtual environments
    # Shiva/ShivaReceiver# source bin/activate
    (Receiver)root@mail:/home/template/Desktop//ShivaReceiver# pip install lamson
  
    # Shiva/ShivaAnalyzer# source bin/activate
    (ShivaAnalyzer)root@mail:/home/template/Desktop/Shiva/ShivaAnalyzer# pip install lamson

4. Generate projects under both virtual environments
    (ShivaReceiver)root@mail:/home/template/Desktop/Shiva/ShivaReceiver# lamson gen -project iReceiver
    (ShivaAnalyzer)root@mail:/home/template/Desktop/Shiva/ShivaAnalyzer# lamson gen -project iAnalyzer
    
5. Install MySQLdb for Analyzer
    (ShivaAnalyzer)root@mail:/home/template/Desktop/Shiva/ShivaAnalyzer/iAnalyzer# apt-get build-dep python-mysqldb
    (ShivaAnalyzer)root@mail:/home/template/Desktop/Shiva/ShivaAnalyzer/iAnalyzer# pip install MySQL-python

    
    Anyway, on following worked sometimes:
        # sudo apt-get install libmysqlclient-dev
        # pip -E /srv/someDir/ install -I MySQL-python

6. Install APScheduler for Analyzer to make counters '0' after fixed number of hours
     pip install apscheduler

7. Install exim4 on local server for mail relay
    # apt-get install exim4-daemon-light
    
    


When nothing is there on system:
    http://askubuntu.com/questions/101591/how-do-i-install-python-2-7-2-on-10-04
    #sudo apt-get install build-essential
    #sudo apt-get install libreadline5-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
   
    Then download using the following command:

    cd Downloads/

    wget http://python.org/ftp/python/2.7.2/Python-2.7.2.tgz

    Extract and go to the dirctory

    tar -xvf Python-2.7.2.tgz &amp;&amp; cd Python-2.7.2/

    Now install using the command you just tried:

    ./configure
    make
    sudo make altinstall
    
# Install virtualenv-1.5.2 from source

    </t>
<t tx="template.20120807114143.1356"></t>
<t tx="template.20120807120617.1357">1. Copy config files
# cp /home/template/Desktop/Temp/analyzer/LamsonAnalyser/lamson-analyser/config/boot.py /home/template/Desktop/Shiva/ShivaAnalyzer/iAnalyzer/config/

# cp /home/template/Desktop/Temp/analyzer/LamsonAnalyser/lamson-analyser/config/settings.py /home/template/Desktop/Shiva/ShivaAnalyzer/iAnalyzer/config/

2. Copy lamson/* files

    ShivaConfig.py
    ShivaLinkParser.py
    ShivaMailParser.py
    ShivaMailRelayer.py
    ShivaNewSpam.py
    ShivaOldSpam.py
    ShivaScheduler.py
    ShivaTackleQueue.py
    server.py

    Control flow:
        server.py -&gt; ShivaTackleQueue -&gt; ShivaMailParser -&gt; ShivaMailRelayer -&gt; (ShivaOldSpam | ShivaNewSpam) -&gt; 

6. Copy clearLogFiles.sh file
root@mail:~# cp /home/template/Desktop/Temp/analyzer/LamsonAnalyser/lamson-analyser/logs/clearLogs.sh /home/template/Desktop/Shiva/ShivaAnalyzer/iAnalyzer/logs/

7. Edit settings in files
    queuePath -&gt; config/settings.py
    Relay IP -&gt; config/settings.py
    lamson/ShivaConfig.py

</t>
<t tx="template.20120807120617.1358">1. Copy config files
# cp /home/template/Desktop/Temp/receiver/LamsonHoneyMail/MyMailServer/config/boot.py /home/template/Desktop/Shiva/ShivaReceiver/iReceiver/config/

# cp /home/template/Desktop/Temp/receiver/LamsonHoneyMail/MyMailServer/config/settings.py /home/template/Desktop/Shiva/ShivaReceiver/iReceiver/config/

2. Copy app/handlers files

root@mail # cp /home/template/Desktop/Temp/receiver/LamsonHoneyMail/MyMailServer/app/handlers/spampot.py /home/template/Desktop/Shiva/ShivaReceiver/iReceiver/app/handlers/

root@mail:~# cp /home/template/Desktop/Temp/receiver/LamsonHoneyMail/MyMailServer/app/handlers/forward.py /home/template/Desktop/Shiva/ShivaReceiver/iReceiver/app/handlers/

root@mail:~# cp /home/template/Desktop/Temp/receiver/LamsonHoneyMail/MyMailServer/app/handlers/log.py /home/template/Desktop/Shiva/ShivaReceiver/iReceiver/app/handlers/

root@mail:~# cp /home/template/Desktop/Temp/receiver/LamsonHoneyMail/MyMailServer/app/handlers/queue.py /home/template/Desktop/Shiva/ShivaReceiver/iReceiver/app/handlers/

3. Replace buggy file lamson/encoding.py
template@mail:~/Desktop/Shiva/ShivaReceiver/lib/python2.7/site-packages/lamson$ cp /home/template/Desktop/Temp/receiver/LamsonHoneyMail/lib/python2.6/site-packages/lamson/encoding.py ./

4. Copy lamson/queue.py and lamson/server.py
    This file prepares and stores spams with IP and SensorID extensions

4. Copy global configuration files

root@mail:~# cp /home/template/Desktop/Temp/receiver/LamsonHoneyMail/lib/python2.6/site-packages/lamson/spamConfigR.py /home/template/Desktop/Shiva/ShivaReceiver/lib/python2.7/site-packages/lamson

5. Copy restart.sh file
root@mail:~# cp /home/template/Desktop/Temp/receiver/LamsonHoneyMail/MyMailServer/restart.sh /home/template/Desktop/Shiva/ShivaReceiver/iReceiver/

6. Copy clearLogFiles.sh file
root@mail:~# cp /home/template/Desktop/Temp/receiver/LamsonHoneyMail/MyMailServer/logs/clearLogFiles.sh /home/template/Desktop/Shiva/ShivaReceiver/iReceiver/logs/

7. Edit settings in files
    Sensor name -&gt; lamson/spamConfigR.py
    Listening IP -&gt; config/settings.py

8. Edit signature of smtpd.py
    /usr/lib/python2.7/smtpd.py - line 84: 
    #__version__ = 'Python SMTP proxy version 0.2'
    __version__ = 'ESMTP'
</t>
<t tx="template.20120807120617.1360">root@mail:/home/template/Desktop/Shiva# cd ShivaAnalyzer/
root@mail:/home/template/Desktop/Shiva/ShivaAnalyzer# source bin/activate
(ShivaReceiver)root@mail:/home/template/Desktop/Shiva/ShivaAnalyzer# cd iAnalyzer/
(ShivaReceiver)root@mail:/home/template/Desktop/Shiva/ShivaReceiver/iReceiver# lamson start --Force

To stop:
    lamson stop -ALL run


root@mail:/home/template/Desktop/Shiva/ShivaAnalyzer/lib/python2.7/site-packages/lamson# ./ShivaScheduler.py
</t>
<t tx="template.20120807120617.1361">root@mail:/home/template/Desktop/Shiva# cd ShivaReceiver/
root@mail:/home/template/Desktop/Shiva/ShivaReceiver# source bin/activate
(ShivaReceiver)root@mail:/home/template/Desktop/Shiva/ShivaReceiver# cd iReceiver/
(ShivaReceiver)root@mail:/home/template/Desktop/Shiva/ShivaReceiver/iReceiver# ./restart.sh 
</t>
<t tx="template.20120807120617.1362">6.0 Gb is used space on local machine (df -h). Unusual high usage indicates larger size of log files
* Check ShivaReceiver/iReceiver/logs for errors
* Schedule regular log deletion and undelivered mails in /iReceiver/run/undelivered/*
* 

# Foreign IPs connected to server:
    netstat -natp | grep -i established | awk '{ print $5}' | cut -d":" -f1 | sort | wc -l
    
# IPtables to restrict maximum number of connections per IP:
    iptables -A INPUT -p tcp --syn --dport 25 -m connlimit --connlimit-above 3 -j REJECT --reject-with tcp-reset
    iptables -L
    
# Deleting tons of files:
    find . -type f -print -delete    

# Moving or deleting tons of files:
    find . -name "*" -print | xargs rm
    
# Checking size of a directory:
    du -h
    du -h *
    
# While processing spams which are entitled to get relayed, </t>
<t tx="template.20120807120617.1363"># dpkg-reconfigure exim4-config
    Opted for "internet site; mail is ent and received directly using SMTP"
    Configured hostname to mail.lightbrigade.org before configuring exim4
    (hostname, vim /etc/hostname)
    
# vim /etc/exim4/exim4.conf.template
    daemon_smtp_ports=2500
    
# running on local host and listening on interface 127.0.0.1. If needed to run on all interfaces:
    local_interfaces = 0.0.0.0
    and commentout following in config file:
        # listen on all all interfaces?
        .ifdef MAIN_LOCAL_INTERFACES
        local_interfaces = MAIN_LOCAL_INTERFACES
        .endif
   
    
# Removal:
    apt-get remove exim4 exim4-base exim4-config exim4-daemon-light
    sudo aptitude purge exim4
    sudo aptitude purge exim4-config
    rm -r /var/log/exim4</t>
<t tx="template.20120809005311.1369">lamson start
lamson start --Force
lamson stop
lamson stop -ALL run</t>
<t tx="template.20120809005311.1370">vim /etc/network/interfaces 
/etc/init.d/networking restart

 
 This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
#auto eth0
#iface eth0 inet dhcp

# Static IP manually assigned - b0nd 08082012
auto eth0
iface eth0 inet static
address x.x.x.x
netmask 255.255.255.248
broadcast x.x.x.x
gateway x.x.x.x

auto eth1
iface eth1 inet static
address 192.168.7.51
netmask 255.255.255.0
broadcast 192.168.7.255</t>
<t tx="template.20120815011138.1373">On local console of BackEnd MySQL Server:
    # mysql -u root -p
    (mysql -u root -p -h &lt;IP&gt;
    
    mysql&gt; GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.7.51' IDENTIFIED BY 'password';
    mysql&gt; FLUSH PRIVILEGES;
    
    
# Solution to MySql has gone away:
    By default it keep connection for 8 hours (8*3600 seconds)
    
    mysql&gt; show variables like 'wait_timeout';
    28800
    
    Edit my.cnf and add
    wait_timeout=86400
    interactive_timeout=86400   
    
    86400 / 3600 = 24 hours
    restart mysqld
    
# Indexing from command line:
    ALTER TABLE `spam` ADD INDEX(htmlMessage(996));  
    
# Optimizing tables:
    OPTIMIZE TABLE table_name;
      </t>
<t tx="template.20120815011138.1374">In addition to initial stuff of installation, configuring and running lamson, following too needs automation:
    1. Deleting ShivaDistortedSamples directory as its size keeps on building up:
        rm -r ShivaDistortedSamples ; mkdir ShivaDistortedSamples
    
    2. Flush out established connections regularly or put a limit if &gt;1000 then disestablish all
    3. Delete files from Shiva/ShivaReceiver/iReceiver/run/undeliverable:
        find . -name "*" -print | xargs rm
        
    4. Restart both, iReceiver and iAnalyzer each xx number of hours. That would resolve following problems:
        1. Kill all "ESTABLISHED" connections
        2. MySQL has gone away - the connection to SQL server is established only when iAnalyzer is started</t>
<t tx="template.20120924125452.1377"># Using rar to take backup of whole tree:
    rar a -r LamsonAnalyzer.rar LamsonAnalyzer/
    rar a -r LamsonReceiver.rar LamsonReceiver/</t>
<t tx="template.20120924125452.1378"># mysqldump --opt --where="1 limit 400" databaseName -u root -p &gt; output.sql</t>
<t tx="template.20121018145151.1381">
# mysql -u root -p -h 10.91.1.169

# ssh 10.91.1.169 -l template</t>
</tnodes>
</leo_file>
