#/bin/bash -e

AppRoot=/opt/app-root/src

cd $AppRoot/myblog-master

# fix you mysql database
sed -i 's/mysql_host/'"$MYSQL_HOST"'/g' ./myblog/settings.py
sed -i 's/mysql_user/'"$MYSQL_USER"'/g' ./myblog/settings.py
sed -i 's/mysql_password/'"$MYSQL_PASSWORD"'/g' ./myblog/settings.py
sed -i 's/mysql_db_name/'"$MYSQL_DB_NAME"'/g' ./myblog/settings.py


for i in {1..10}
do
    echo "Trying to connect mysql service."
    timeout 3s bash -c 'cat < /dev/null > /dev/tcp/${MYSQL_HOST}/3306'
    if [ $? -eq 0 ]; then
        echo "connection successfully!"
        python manage.py makemigrations
        python manage.py migrate
        python manage.py runserver
    else 
        sleep 3s
    fi
done
echo "Failed to connect mysql service. exit 1"
exit 1

