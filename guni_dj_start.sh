cd /home/box/web/ask
sudo gunicorn --bind 0.0.0.0:8000 -w 16  ask.wsgi #GuniDjango
