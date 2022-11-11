/root/galaxy/.venv/bin/pip install ephemeris
echo "Installation to galaxy tools may take ~1 hour. Keep cool\n"
echo "to follow installation, please use 'screen -r ephemeris' command\n"
screen -dmS ephemeris /root/galaxy/.venv/bin/shed-tools install \
                -g http://127.0.0.1 \
                -a "$1" \
                -u admin@galaxy.org \
                -t ~/AnalyseGenome/GalaxyServer/bg_tools.yml
