# Notes

Next cloud reccomends you install imagemagic:

docker-compose exec nextcloud apt -y update
docker-compose exec nextcloud apt -y install libmagickcore-6.q16-6-extra

# Startup after docker compose

 - Create admin email account
 - Update dkim and DNS records
 - Get and configure SendGrid SMTP relay
