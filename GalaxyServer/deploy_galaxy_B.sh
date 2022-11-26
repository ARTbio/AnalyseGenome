#!/usr/bin/env bash
set -e
apt update
apt install git screen -y
git clone https://github.com/ARTbio/AnalyseGenome.git
git clone https://github.com/galaxyproject/galaxy.git -b release_22.05
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFdDo/U2shXOKSwSz1JhYY7jDCwuAt4sgPH2pw0r1fKmxJpsY7vZgwkn1XvZPDPPo9Go2LgNVCRBgRZ60f1ivlviy5D1deo/5XtMshDjJDSBaGx4QQhtjAsCgvZ/2Sx+wP2l7IVEYKzWdKens4JVZ+gIh/PwXS0PzNeWOLiCynlLncEm0nuV9Y6wCbhnUt9Zjbe/y0/Cm6wPpOqu9J2BKVerGZtnfvM2+MD6S40n4CH7iFRrnqlOlc6junnuJ6g/u2sIcYXhmD6bOttI5cOINGcDacitp7enUaiSt5ViVz0vjkHfuxr42rtq5dLMI6hQxnq8sjpfb1ygpe7HHHnHCn chris@lbcd-17.snv.jussieu.fr" >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
cp ~/galaxy/config/galaxy.yml.sample ~/galaxy/config/galaxy.yml
sed -i.bak "s/# bind: localhost:8080/bind: '0.0.0.0:80'/" ~/galaxy/config/galaxy.yml
sed -i.bak "s/#admin_users: null/admin_users: admin@galaxy.org/" ~/galaxy/config/galaxy.yml
rm -rf ~/galaxy/client ~/galaxy/static
cd ~/galaxy && wget https://storage.googleapis.com/ag-2022/caches/client.tar.gz \
                    https://storage.googleapis.com/ag-2022/caches/static.tar.gz
tar -xf static.tar.gz && tar -xf client.tar.gz
cp ~/AnalyseGenome/GalaxyServer/job_conf.xml ~/galaxy/config/
sh run.sh --daemon # Triggers deploiement and leave galaxy running as a deamon
echo "source /root/galaxy/.venv/bin/activate" >> /root/.bashrc # automatically activate galaxy .venv
echo "/root/galaxy/.venv/bin/galaxyctl start" >> /root/.bashrc # automatically start galaxy at next connection (harmless if already running)
echo "Galaxy is now running as a daemon in the background\n"
