#!/bin/sh

gunicorn -w 16 --bind 0.0.0.0:8080 hello:app -D
