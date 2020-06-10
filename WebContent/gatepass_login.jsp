<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" ng-app>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Welcome to Material Gate Pass-BHEL, Vishakhapatnam</title>

<!-- Importing the Bootstrap CSS File -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">

<!-- Importing the Custom External CSS -->

<link rel="stylesheet" href="css/login.css">
</head>
<body>

	<!-- Importing the angularJS javaScript file for directives -->

	<script type="text/javascript" src="js\angular.js"></script>

	<!-- Top Block Element -->

	<div class="container-fluid header-leaf">
		<img src="img_src\login_logo.jpg" alt="" align="left" height="90"
			class="logo-top"> <img src="img_src\gandhi-logo.png" alt=""
			align="right" height="90" class="logo-top">


		<p class="text-white">
			Bharat Heavy Electricals Limited <br>Heavy Plates and Vessels
			Plant <br>Visakhapatnam
		</p>
	</div>


	<div class="jumbotron text-center login-main">
		<div class="container-fluid">
			<img src="img_src\landing3.jpg" align="left" class="img-main">

			<!-- Login Form -->

			<form name="login_form" class=""
				action="<%=request.getContextPath()%>/login" method="post" align="center">
				<label for="uName">Username:</label> <img src="img_src\useLogo.png"
					class="icon" width="20" height="20"> <input
					class="loginField" type="text" name="username"
					placeholder="Enter Username" ng-model="user.name"
					ng-required="true" required> <br> <label for="uPassw">Password:</label>
				<img src="img_src\computer-icons-password-login-user-padlock.jpg"
					width="20" height="20"> <input class="loginField"
					type="password" name="password" placeholder="Enter Password"
					ng-model="user.pass" ng-required="true" required> <br>

				<input class="btn btn-outline-primary" type="submit" value="Sign In">
			</form>
		</div>
	</div>
	<div class="container-fluid align-bottom floor-leaf"></div>

	<!-- Importing script for tether,jQuery,Bootstrap -->

	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
		integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
		crossorigin="anonymous"></script>
</body>
</html>