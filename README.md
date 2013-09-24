# Force.com Streaming API Spring MVC

This is a template for a web application that uses Spring MVC and Jetstream to stablish a proxy to utilize the Force.com Streaming API.

## Step 1: Create a PushTopic of Account

Use the System Log to create the PushTopic record that contains a SOQL query. Events notifications are generated for updates that match the query. Alternatively, you can also use Workbench to create a PushTopic.

  1. Select Your Name > Developer Console.
  2. On the Logs tab, click Execute.
  3. In the Enter Apex Code window, paste in the following Apex code, and click Execute.

    PushTopic pushTopic = new PushTopic();
    pushTopic.Name = 'AccountPushTopic';
    pushtopic.Query = 'SELECT Id, Name FROM Account';
    pushTopic.ApiVersion = 27.0;
    pushTopic.NotifyForOperations = 'All';
    pushTopic.NotifyForFields = 'Referenced';
    insert pushTopic;

Because NotifyForOperations is set to All, Streaming API evaluates records that are created or updated and generates a notification if the record matches the PushTopic query. Because NotifyForFields is set to Referenced, Streaming API will use fields in both the SELECT clause and the WHERE clause to generate a notification. Whenever the fields Name, Status__c, or Description__c are updated, a notification will be generated on this channel.

## Step 3: Subscribe to the PushTopic Channel

Add this to your view:

    <script src="/resources/js/jquery-1.7.1.min.js"></script>
    <script src="/resources/js/json2.js"></script>
    <script src="/resources/js/cometd.js"></script>
    <script src="/resources/js/jquery.cometd.js"></script>
    <script type="text/javascript">
      (function($) {
        var cometd = $.cometd;

        $(document).ready(function() {
          function _metaHandshake(handshake) {
            if (handshake.successful === true) {
              cometd.batch(function() {
                  cometd.subscribe('/force/InvoiceStatementUpdates', function(messages) {
                    $("#messages").append('<pre>' + JSON.stringify(messages) + '</pre>');
                  });
              });
            }
          }

          // Disconnect when the page unloads
          $(window).unload(function() {
              cometd.disconnect(true);
          });

          var cometURL = location.protocol + "//" + location.host + "/cometd";
          cometd.configure({
              url: cometURL
          });

          cometd.addListener('/meta/handshake', _metaHandshake);

          cometd.handshake();
        });
      })(jQuery);
    </script>


## Running the application locally

- On Linux/Mac:

        $ export FORCE_FORCEDATABASE_URL="force://<instance>.salesforce.com;user=<username>;password=<password+security_token>"
        OR
        Update forceDatabase.properties with url, user and password

- On Windows:

        $ set FORCE_FORCEDATABASE_URL="force://<instance>.salesforce.com;user=<username>;password=<password+security_token>"
        OR
        Update forceDatabase.properties with url, user and password

Build with:

    $ mvn clean install

Then run it with:

    $ java -jar target/dependency/webapp-runner.jar target/*.war


## Running on Heroku

Clone this project locally:

    $ git clone https://github.com/dangt85/template-sfdc-java-springmvc.git

Create a new app on Heroku (make sure you have the [Heroku Toolbelt](http://toolbelt.heroku.com) installed):

    $ heroku login
    $ heroku create -s cedar

Add config params for authenticating to Salesforce.com (replace the values with the ones from the Remote Access definition on Salesforce.com):

    $ heroku config:add FORCE_FORCEDATABASE_URL="force://<instance>.salesforce.com;user=<username>;password=<password+security_token>"

Upload the app to Heroku:

    $ git push heroku master

Open the app in your browser:

    $ heroku open
