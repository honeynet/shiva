# This file contains python variables that configure Lamson for email processing.
import logging


#debugFd = open("/root/Desktop/LamsonHoneyMail/MyMailServer/debug.txt", 'a')
#debugFd.write("------------------------------------\n")

# You may add additional parameters such as `username' and `password' if your
# relay server requires authentication, `starttls' (boolean) or `ssl' (boolean)
# for secure connections.
relay_config = {'host': 'localhost', 'port': 8825}
#relay_config = {'host': '10.91.1.144', 'port': 25}


#receiver_config = {'maildir': './run/undeliverable/'}
#handlers = ['app.handlers.sample']

#receiver_config = {'host': 'localhost', 'port': 8823}
#receiver_config = {'host': '14.140.125.209', 'port': 25}
receiver_config = {'host': '192.168.6.97', 'port': 25}


#handlers = ['app.handlers.sample']
#handlers = ['app.handlers.spampot', 'app.handlers.undeliveredFilter']
handlers = ['app.handlers.spampot']


router_defaults = {'host': '.+'}
template_config = {'dir': 'app', 'module': 'templates'}

# the config/boot.py will turn these values into variables set in settings

#debugFd.write("[+] Finished parsing setting.py file\n")
#debugFd.close()



