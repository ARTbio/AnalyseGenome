#!/bin/bash
echo "please enter your admin API key: "
read API
/root/galaxy/database/dependencies/_conda/bin/conda update conda -y
python3 -m venv /root/tools_venv
/root/tools_venv/bin/pip install ephemeris
VAR=`grep -c "\- " /root/AnalyseGenome/GalaxyServer/ag_tools.yml`
printf '\nInstallation of the $VAR galaxy tools may take a while (~16 min). Keep cool\n'
printf "\nYou'll find the tool install log in ~/tools.log\n\n"
printf '\nIn the meantime, you can start to browse your Galaxy web interface !\n\n'
/root/tools_venv/bin/shed-tools install \
                                  -g http://127.0.0.1 \
                                  -a "$API" \
                                  -u admin@galaxy.org \
                                  -t ~/AnalyseGenome/GalaxyServer/ag_tools.yml \
                                  --log_file ~/tools.log
