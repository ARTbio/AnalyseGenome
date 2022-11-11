git clone https://github.com/ARTbio/AnalyseGenome.git
git clone https://github.com/galaxyproject/galaxy.git -b release_22.05
cp ~/galaxy/config/galaxy.yml.sample ~/galaxy/config/galaxy.yml
sed -i.bak "s/# bind: localhost:8080/bind: 0.0.0.0:80/" ~/galaxy/config/galaxy.yml
sed -i.bak "s/#admin_users: null/admin_users: admin@galaxy.org/" ~/galaxy/config/galaxy.yml
rm -rf ~/galaxy/client ~/galaxy/static
cd ~/galaxy && wget https://psilo.sorbonne-universite.fr/index.php/s/Kw9y8LgYyXBq3pr/download/client.tar.gz \
                    https://psilo.sorbonne-universite.fr/index.php/s/YCEe2XNbgLMf2Px/download/static.tar.gz
tar -xvf static.tar.gz && tar -xvf client.tar.gz
cp ~/AnalyseGenome/GalaxyServer/job_conf.xml ~/galaxy/config/
pwd
echo "Galaxy is now deployin in the background\n"
echo "To follow deployment, please execute `screen -r galaxyscreen`"
screen -dmS galaxyscreen sh run.sh # this command runs in the screen session galaxyscreen until killed
