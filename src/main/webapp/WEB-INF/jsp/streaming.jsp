<!doctype html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js"><!--<![endif]-->
<html>
  <head>
    <meta charset="utf-8">
    <title>Streaming Streaming</title>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
		CloudSole - Streaming
	</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width">

	<script src="/resources/assets/javascripts/1.2.2/adminflare-demo-init.min.js" type="text/javascript"></script>

	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,600,700" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		// Include Bootstrap stylesheet 
		document.write('<link href="/resources/assets/css/' + DEMO_ADMINFLARE_VERSION + '/' + DEMO_CURRENT_THEME + '/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" id="bootstrap-css">');
		// Include AdminFlare stylesheet 
		document.write('<link href="/resources/assets/css/' + DEMO_ADMINFLARE_VERSION + '/' + DEMO_CURRENT_THEME + '/adminflare.min.css" media="all" rel="stylesheet" type="text/css" id="adminflare-css">');
		// Include AdminFlare page stylesheet 
		document.write('<link href="/resources/assets/css/' + DEMO_ADMINFLARE_VERSION + '/pages.min.css" media="all" rel="stylesheet" type="text/css">');
	</script>
	
	<script src="/resources/assets/javascripts/1.2.2/modernizr-jquery.min.js" type="text/javascript"></script>
	<script src="/resources/assets/javascripts/1.2.2/bootstrap.min.js" type="text/javascript"></script>
	<script src="/resources/assets/javascripts/1.2.2/adminflare.min.js" type="text/javascript"></script>
	
	<script src="/resources/js/jquery-1.7.1.min.js"></script>
    <script src="/resources/js/json2.js"></script>
    <script src="/resources/js/cometd.js"></script>
    <script src="/resources/js/jquery.cometd.js"></script>
   	<script src="/resources/assets/javascripts/1.2.2/adminflare-demo-init.min.js" type="text/javascript"></script>
   	
	<style type="text/css">
			/* ======================================================================= */
		/* Server Statistics */
		.well.widget-pie-charts .box {
			margin-bottom: -20px;
		}

		/* ======================================================================= */
		/* Why AdminFlare */
		#why-adminflare ul {
			position: relative;
			padding: 0 10px;
			margin: 0 -10px;
		}

		#why-adminflare ul:nth-child(2n) {
			background: rgba(0, 0, 0, 0.02);
		}

		#why-adminflare li {
			padding: 8px 10px;
			list-style: none;
			font-size: 14px;
			padding-left: 23px;
		}

		#why-adminflare li i {
			color: #666;
			font-size: 14px;
			margin: 3px 0 0 -23px;
			position: absolute;
		}


		/* ======================================================================= */
		/* Supported Browsers */
		#supported-browsers header { color: #666; display: block; font-size: 14px; }
			
		#supported-browsers header strong { font-size: 18px; }

		#supported-browsers .span10 { margin-bottom: -15px; text-align: center; }

		#supported-browsers .span10 div {
			margin-bottom: 15px;
			margin-right: 15px;
			display: inline-block;
			width: 120px;
		}

		#supported-browsers .span10 div:last-child { margin-right: 0; }

		#supported-browsers .span10 img { height: 40px; width: 40px; }

		#supported-browsers .span10 span { line-height: 40px; font-size: 14px; font-weight: 600; }
		
		@media (max-width: 767px) {
			#supported-browsers header { text-align: center; margin-bottom: 20px; }
		}

		/* ======================================================================= */
		/* Status panel */
		.status-example { line-height: 0; position:relative; top: 22px }
		
		.box { padding-bottom: 0; }

		.box > p { margin-bottom: 20px; }

		#popovers li, #tooltips li {
			display: block;
			float: left;
			list-style: none;
			margin-right: 20px;
		}
		
		.adminflare > div { margin-bottom: 20px; }
	</style>
    
    <script type="text/javascript">
      (function($) {
        var cometd = $.cometd;

        $(document).ready(function() {
          function _metaHandshake(handshake) {
            if (handshake.successful === true) {
              cometd.batch(function() {
                  cometd.subscribe('/force/NewAccounts', function(messages) {
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
      
      $(document).ready(function(){
    	    $('#myAnchor').click(function(e){
    	      e.preventDefault();
    	      $.get('/sfdc/streaming', function(data) {
    	    	  $("#messages").append('<pre>' + JSON.stringify(messages) + '</pre>');
    	      });
    	    });
       });
     
    </script>
    <style type="text/css">
		.stream-event-server-error i {
			background: #d54848;
			color: #fff;
		}

		.stream-event-server-warning i {
			background: #ecad3f;
			color: #fff;
		}

		.stream-event-server-success i {
			background: #71c73e;
			color: #fff;
		}

		.stream-event-mailer i {
			background: #77b7c5;
			color: #fff;
		}

		.stream-event-cron i {
			background: #ddd;
		}

		.stream-event-shop i {
			background: #7764ae;
			color: #fff;
		}
	</style>
  </head>
  <body class="pages-stream">
  	<!-- Main navigation bar
		================================================== -->
	<header class="navbar navbar-fixed-top" id="main-navbar">
		<div class="navbar-inner">
			<div class="container">
			

				<a class="btn nav-button collapsed" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-reorder"></span>
				</a>

				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a id="myAnchor" href="/sfdc/streaming">Create Account</a></li>
						<li class="divider-vertical"></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- / Main navigation bar -->
  	<section class="container">
		<section class="row-fluid non-gutter-grid">
			<div class="row-fluid">
				<div class="span4">&nbsp;</div>
				<div class="span8">
					<h3 class="box-header">
						<i class="icon-leaf"></i> Live stream
					</h3>
				</div>
			</div>
   			<div class="box" id="messages"></div>
		</section>
  </section>
  
  </body>
</html>
