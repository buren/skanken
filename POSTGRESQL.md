# Set up the application

## Install postgresql (if it's not installed)

* ```$ sudo apt-get install postgresql postgresql-contrib```
* ```sudo -u postgres psql postgres```
* Set password by running
* ```\password postgres```
* And then set your password when prompted
* Create a user by running
* ```createuser --interactive the_user_name```
*  Select y when prompted if the user should be a superuser

## Rerun the the db setup

Development:
```rake db:drop db:create db:migrate ```

Production rails:
```rake db:create db:migrate RAILS_ENV="production"```

Production heroku:
```heroku rund db:create db:migrate```

## Comment

You might have to add this to config/database.yml: 
```
username: myapp
password: password1
```

But I didn't think that is because i choice the same username for postgresql as my unix login name. It looks kind of insecure to keep that in a open file