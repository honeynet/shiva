from config import settings
from lamson.routing import Router
from lamson.server import Relay, SMTPReceiver
from lamson import view, queue
import logging
import logging.config
import jinja2

logging.config.fileConfig("config/logging.conf")

# the relay host to actually send the final message to
settings.relay = Relay(host=settings.relay_config['host'], 
                       port=settings.relay_config['port'], debug=1)

# where to listen for incoming messages
settings.receiver = SMTPReceiver(settings.receiver_config['host'], 
                                 settings.receiver_config['port'])

#settings.queue = QueueReceiver(settings.queue_config['queue'],
#			      settings.queue_config['sleep'])

#settings.receiver = QueueReceiver(settings.receiver_config['maildir'])

#debugFd = open("/root/Desktop/LamsonHoneyMail/MyMailServer/debug.txt", 'a')
#test_fd = open(cwd + '/' + debugFile, 'a')
#debugFd.write("[+] boot.py - before loading handlers\n")
    

Router.defaults(**settings.router_defaults)
Router.load(settings.handlers)
Router.RELOAD=True
Router.UNDELIVERABLE_QUEUE=queue.Queue("run/undeliverable")

#debugFd.write("[+] boot.py - after loading handlers\n")
    
view.LOADER = jinja2.Environment(
    loader=jinja2.PackageLoader(settings.template_config['dir'], 
                                settings.template_config['module']))

#debugFd.write("[+] boot.py - Finished Parsing\n\n-------------------------------\n\n")
#debugFd.close()