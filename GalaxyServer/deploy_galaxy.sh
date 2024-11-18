#!/usr/bin/env bash
set -e
apt update
apt install -y python3.10-venv
git clone https://github.com/ARTbio/AnalyseGenome.git
git clone https://github.com/galaxyproject/galaxy.git -b release_24.1
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFdDo/U2shXOKSwSz1JhYY7jDCwuAt4sgPH2pw0r1fKmxJpsY7vZgwkn1XvZPDPPo9Go2LgNVCRBgRZ60f1ivlviy5D1deo/5XtMshDjJDSBaGx4QQhtjAsCgvZ/2Sx+wP2l7IVEYKzWdKens4JVZ+gIh/PwXS0PzNeWOLiCynlLncEm0nuV9Y6wCbhnUt9Zjbe/y0/Cm6wPpOqu9J2BKVerGZtnfvM2+MD6S40n4CH7iFRrnqlOlc6junnuJ6g/u2sIcYXhmD6bOttI5cOINGcDacitp7enUaiSt5ViVz0vjkHfuxr42rtq5dLMI6hQxnq8sjpfb1ygpe7HHHnHCn chris@lbcd-17.snv.jussieu.fr" >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
# exemple of access: ssh -i ~/.ssh/id_rsa_chrisartbio  root@34.105.216.34
cp ~/galaxy/config/galaxy.yml.sample ~/galaxy/config/galaxy.yml
sed -i.bak "s/# bind: localhost:8080/bind: '0.0.0.0:80'/" ~/galaxy/config/galaxy.yml
sed -i.bak "s/#admin_users: null/admin_users: admin@galaxy.org/" ~/galaxy/config/galaxy.yml
sed -i.bak "s/# galaxy_user:/galaxy_user: root/" ~/galaxy/config/galaxy.yml
sed -i.bak "s/# virtualenv:/virtualenv: \/root\/galaxy\/\.venv/" ~/galaxy/config/galaxy.yml
cp ~/AnalyseGenome/GalaxyServer/job_conf.xml ~/galaxy/config/
sh ~/galaxy/run.sh --daemon # Triggers deploiement and leave galaxy running as a deamon
echo "source /root/galaxy/.venv/bin/activate" >> /root/.bashrc # automatically activate galaxy .venv
echo "Galaxy is now running as a daemon in the background\nand is controlled by systemctl\n"
