#!/bin/bash
echo "please enter your admin API key: "
read API
rm -rf /root/galaxy/database/dependencies/_conda
wget -qO- https://psilo.sorbonne-universite.fr/index.php/s/6AsHpgxqtnbrQDm/download/_conda.tar.gz | tar xz -C /root/galaxy/database/dependencies/
/root/galaxy/database/dependencies/_conda/bin/conda update conda -y
/root/galaxy/.venv/bin/pip install ephemeris
screen -dmS ephemeris /root/galaxy/.venv/bin/shed-tools install \
                                                   -g http://127.0.0.1 \
                                                   -a "$API" \
                                                   -u admin@galaxy.org \
                                                   -t ~/AnalyseGenome/GalaxyServer/bg_tools.yml \
                                                   --log_file ~/tools.log
echo "To follow installation, you may use the 'screen -r ephemeris' command"
echo "Alternatively, you can use the 'tail -f /root/tools.log' command and terminate by Ctrl-C"
VAR=`grep -c "\- " /root/AnalyseGenome/GalaxyServer/bg_tools.yml`
echo "Installation of the $((VAR-1)) galaxy tools may take a long time. Keep cool"
