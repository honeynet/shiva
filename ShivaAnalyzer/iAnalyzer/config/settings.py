# This file contains python variables that configure Lamson for email processing.
import logging

# Put this somewhere in global config file
queuePath = '/home/template/Desktop/SHIVA/ShivaReceiver/iReceiver/run/queue/'

# You may add additional parameters such as `username' and `password' if your
# relay server requires authentication, `starttls' (boolean) or `ssl' (boolean)
# for secure connections.
#relay_config = {'host': 'localhost', 'port': 8825}
relay_config = {'host': '127.0.0.1', 'port': 2500}	# Exim4 listening on this port on local machine
#relay_config = {'host': '10.91.1.144', 'port': 25}

#receiver_config = {'host': 'localhost', 'port': 8823}
receiver_config = {'maildir': queuePath}

handlers = ['app.handlers.sample']

router_defaults = {'host': '.+'}

template_config = {'dir': 'app', 'module': 'templates'}

# the config/boot.py will turn these values into variables set in settings
