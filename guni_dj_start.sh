cd /home/box/web/ask
sudo gunicorn --bind 0.0.0.0:8000 -w 4  ask.wsgi --access-logfile access-dj.log --error-logfile error-dj.log --log-level debug -D
