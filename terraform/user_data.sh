#!/bin/bash
apt-get update -y
apt-get install -y docker.io git
systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu