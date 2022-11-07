git clone https://github.com/artbio/analysegenome
git clone https://github.com/galaxyproject/galaxy # and decide the Galaxy Branch
du -sh galaxy/
cp ~/analysegenome/GalaxyServer/galaxy.yml ~/analysegenome/GalaxyServer/job_conf.xml ~/galaxy/config/
pico ~/galaxy/config/job_conf.xml # check destinations
screen -S galaxy # To install Galaxy
cd ~/galaxy
sh run.sh
# exit galaxy screen by Ctrl-A D
screen -S ephemeris # ephemeris screen environment then Ctrl-A D
source .venv/bin/activate # install ephemeris in the galaxy venv
shed-tools install -g http://127.0.0.1 -a 4b29cb2dd14a8b88cd4ab639f0aa5403 -u chris -t ~/galaxy/config/bg_tools.yml
