#!/bin/false

# Tidy up and keep image small
apt-get clean -y
micromamba clean -ay

rm /etc/ld.so.cache
ldconfig