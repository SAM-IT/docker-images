#!/bin/sh

#Download stuff.
curl -L "https://$GITLAB_URL/api/v3/projects/$PROJECT_ID/builds/artifacts/$REFERENCE/download?job=$JOB" \
  --header "PRIVATE-TOKEN: $ACCESS_TOKEN"
  -o /artifacts.zip
unzip /artifacts.zip -d /www
rm /artifacts.zip

# Start nginx.
exec nginx -g daemon off;