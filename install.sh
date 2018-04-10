apt-get update -y

echo 'Installing curl'
apt-get install curl

echo ''
echo 'Installing git'
apt-get install git -y

echo ''
echo 'Configure git'
echo ''

echo 'Enter the Global Username: ';
read GITUSER;
git config --global user.name "${GITUSER}"

echo ''
echo 'Enter the Global Email for Git: ';
read GITEMAIL;
git config --golbal user.email "${GITEMAIL}"

echo 'Git has been configured'
echo ''
git config --list
echo ''

echo 'Installing Node Source'
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh

bash nodesource_setup.sh

echo ''
echo 'Installing NodeJS'
apt-get install nodejs

echo ''
echo 'Installing Build Essentials'
apt-get install build-essential

echo ''
echo 'Installing PM2'
npm i -g pm2


