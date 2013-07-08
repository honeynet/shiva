# This file contains python variables that configure Lamson for email processing.
# You may add additional parameters such as `username' and `password' if your
# relay server requires authentication, `starttls' (boolean) or `ssl' (boolean)
# for secure connections.

relay_config = {'host': 'localhost', 'port': 8825}

receiver_config = {'host': '192.168.6.97', 'port': 25}

handlers = ['app.handlers.spampot']


router_defaults = {'host': '.+'}
template_config = {'dir': 'app', 'module': 'templates'}

# the config/boot.py will turn these values into variables set in settings


