#!/bin/sh

#Download stuff.
curl -L "https://$GITLAB_URL/api/v3/projects/$PROJECT_ID/builds/artifacts/$REFERENCE/download?job=$JOB" \
  --header "PRIVATE-TOKEN: $ACCESS_TOKEN" \
  -o /artifacts.zip
unzip /artifacts.zip -d /tmp
mv /tmp/dist/* /www/
rm -rf /tmp
rm /artifacts.zip