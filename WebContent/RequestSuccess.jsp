<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Approved List</title>
    
    <!-- Adding Bootstrap CSS -->
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    
    <!-- Adding Custom CSS -->
    
    <link rel="stylesheet" href="css/main.css">
  </head>
  <body>
  
    <!-- Adding the Navigation Bar -->
    
    <nav class="navbar navbar-toggleable navbar-inverse">
		<button class="navbar-toggler" data-toggle="collapse"
			data-target="#mainNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="gatepass_status.jsp">HOME <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="gatepass_raise.jsp">RAISE GATE PASS</a></li>
				<li class="nav-item dropdown active"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> VIEW </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="gatepass_approved.jsp">Approved</a>
						<a class="dropdown-item" href="gatepass_closed.jsp">Closed</a> 
						<a class="dropdown-item" href="gatepass_pending.jsp">Pending</a> 
						 <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="gatepass_cancelled.jsp">Cancelled</a>
						<a class="dropdown-item" href="gatepass_inDraft.jsp">In Draft</a>
						 <div class="dropdown-divider"></div>
						<a class="dropdown-item" href="gatepass_approval_portal.jsp">Approve Pending Requests</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="gatepass_print.jsp">PRINT</a></li>
				<li class="nav-item"><a class="nav-link"
					href="gatepass_help.jsp">HELP</a></li>
			
			</ul>
		</div>
		
		<form name="logout_button" action="<%=request.getContextPath()%>/logout"  method="get" align="right">
    <input class="btn btn-sign-out" type="submit" value="Sign Out">
    </form>
	</nav>
    
    <% String userlabel=(String)request.getAttribute("printval"); %>
    <h3 class="text-center">
			<b>Your Gate Pass Number is:  <%=userlabel%>
				!
			</b>
		</h3>
    
    
    
    
    
    
    
    
    
 <!-- Importing tether,jQuery,Bootstrap javaScripts -->

    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  
  </body>
</html>
    