# Force.com Streaming API tests with Jetstream and Srping MVC

This is a template for a web application that uses Spring MVC and Jetstream to stablish a proxy to utilize the Force.com Streaming API.


## Running the application locally

- On Linux/Mac:

        $ export FORCE_FORCEDATABASE_URL="force://<instance>.salesforce.com;user=<username>;password=<password+security_token>"

- On Windows:

        $ set FORCE_FORCEDATABASE_URL="force://<instance>.salesforce.com;user=<username>;password=<password+security_token>"

Build with:

    $ mvn clean install

Then run it with:

    $ java -jar target/dependency/webapp-runner.jar target/*.war


## Running on Heroku

Clone this project locally:

    $ git clone git://github.com/jamesward/hello-java-spring-force_dot_com.git

Create a new app on Heroku (make sure you have the [Heroku Toolbelt](http://toolbelt.heroku.com) installed):

    $ heroku login
    $ heroku create -s cedar

Add config params for authenticating to Salesforce.com (replace the values with the ones from the Remote Access definition on Salesforce.com):

    $ heroku config:add FORCE_FORCEDATABASE_URL="force://<instance>.salesforce.com;user=<username>;password=<password+security_token>"

Upload the app to Heroku:

    $ git push heroku master

Open the app in your browser:

    $ heroku open
