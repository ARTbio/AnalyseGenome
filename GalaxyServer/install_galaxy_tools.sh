echo "please enter your admin API key: "
read API
/root/galaxy/database/dependencies/_conda/bin/conda update conda -y
/root/galaxy/.venv/bin/pip install ephemeris
echo "Installation of the 21 galaxy tools may take a long time. Keep cool\n"
echo "to follow installation, you may use 'screen -r ephemeris' command\n"
screen -dmS ephemeris /root/galaxy/.venv/bin/shed-tools install \
                                                   -g http://127.0.0.1 \
                                                   -a "$API" \
                                                   -u admin@galaxy.org \
                                                   -t ~/AnalyseGenome/GalaxyServer/bg_tools.yml \
                                                   --log_file ~/tools.log && \
                                               echo "tool installation is complete, press 'enter' key to terminate this screen session.\n" && \
                                               read interrupt
