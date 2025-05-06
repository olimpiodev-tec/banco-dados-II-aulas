# Créditos
# https://gist.github.com/lbbedendo/6be08a6159d68be56642bc749f54778d

# Adaptado da página oficial do pgAdmin: https://www.pgadmin.org/download/pgadmin-4-apt/
# Testado na versão 20.3 (una)

#
# Setup the repository
#

# Install the public key for the repository (if not done previously):
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Create the repository configuration file:
sudo sh -c '. /etc/upstream-release/lsb-release && echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$DISTRIB_CODENAME pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

#
# Install pgAdmin
#

# Install for both desktop and web modes:
sudo apt install pgadmin4

# Install for desktop mode only:
sudo apt install pgadmin4-desktop

# Install for web mode only: 
sudo apt install pgadmin4-web 

# Configure the webserver, if you installed pgadmin4-web:
sudo /usr/pgadmin4/bin/setup-web.sh
