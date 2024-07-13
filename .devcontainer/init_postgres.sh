#!/bin/bash
# Start the PostgreSQL service
sudo service postgresql start

# Update pg_hba.conf to allow password authentication
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/12/main/postgresql.conf
echo "host all  all    0.0.0.0/0  md5" | sudo tee -a /etc/postgresql/12/main/pg_hba.conf

# Restart PostgreSQL to apply changes
sudo service postgresql restart

# Set password for the postgres user
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"

# Create a new database
sudo -u postgres createdb mydatabase
