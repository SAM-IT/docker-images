#!/bin/sh
if [ -z "$GIT_COMMITTER_EMAIL" ]; then
    export GIT_COMMITTER_EMAIL="backup@rancher.via"
fi

if [ -z "$GIT_COMMITTER_NAME" ]; then
    export GIT_COMMITER_NAME="Backup"
fi

if [ -z "$DB_PASS" ]; then
    DB_PASS=$(cat $DB_PASS_FILE)
fi

cp /run/secrets/ssh ~/.ssh/id_rsa
chmod 0400 ~/.ssh/id_rsa

# Initialize git repository.
git clone --depth 1 $GIT_REPO /backup
cd /backup;
while :;
do
    echo "Starting backup";
    echo 'show databases where `database` not in ("information_schema", "performance_schema", "mysql");' |\
    mysql -h $DB_HOST -u $DB_USER --password=$DB_PASS |\
    tail -n +2 |\
    parallel --verbose --will-cite mysqldump \
        -h $DB_HOST \
        -u $DB_USER \
        --password=$DB_PASS \
        --skip-extended-insert \
        --skip-triggers \
        --skip-dump-date \
        --single-transaction \
        -r '{}'.sql '{}'
    git add *.sql
    git commit -a -m "Automated backup $(date)" --author "$GIT_COMMITER_NAME <$GIT_COMMITTER_EMAIL>" --allow-empty
    git push
    echo "Sleeping for 1 hour."
    sleep 3600
    git pull
done
