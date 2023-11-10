#!/bin/bash
echo "please enter your admin API key: "
read API
/root/galaxy/database/dependencies/_conda/bin/conda update conda -y
/root/galaxy/.venv/bin/pip install ephemeris
VAR=`grep -c "\- " /root/AnalyseGenome/GalaxyServer/ag_tools.yml`
echo "Installation of the $VAR galaxy tools may take a while (10/15 min). Keep cool\n"
echo "You'll find the tool install log in ~/tools.log\n\n"
echo "In the meantime, you can start to browse your Galaxy web interface !\n\n"
/root/galaxy/.venv/bin/shed-tools install \
                                  -g http://127.0.0.1 \
                                  -a "$API" \
                                  -u admin@galaxy.org \
                                  -t ~/AnalyseGenome/GalaxyServer/ag_tools.yml \
                                  --log_file ~/tools.log
