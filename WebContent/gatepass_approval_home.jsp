<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="login.database.*"%>
<%@page import="login.web.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>	
<%@page import="login.web.Security"%>
<%@page import="java.io.IOException"%>
	
<%@page import="login.web.Security"%>
<%
Security security = new Security();
security.enable(session, response);
Integer staffid = (Integer) session.getAttribute("staffid");

if (staffid == 101|| staffid == 102 || staffid == 104 ) {
	try {
		response.sendRedirect("gatepass_invalidUser2.jsp");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}

%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Material Gate Pass - Closed</title>
    
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
						<a class="dropdown-item" href="gatepass_approval_home.jsp">Approve Pending Requests</a>
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
    
   
    
    <!-- Creating the table for Approval of Gate passes -->
        
    
    <div class="container">
      <table align="center" class="table table-striped">
       <%
		try {
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/";
		String database = "zvp0njb2yauy3fgk";
		String userid = "pjyaoyeilkkbtjg8";
		String password = "ejzn69wchxp2bv6j";
		Class.forName(driver);
		Connection connection = null;
		Statement statement = null;
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();

		String loggedInUser = "select * from ApprovalView";
		ResultSet rs = statement.executeQuery(loggedInUser);
	%>
      
      
      
      <thead class="thead-dark">
        <tr>
        <th scope="col" colspan="7" id="tableTitle">APPROVALS TO BE MADE</th>
      </tr>
      </thead>
      
      
<tbody>
    <tr>
    <th>Name of the Indentor</th>
    <th>Staff ID</th>
    <th>Gate Pass Number</th>
    <th> Number of Items </th>
    <th>Take Action</th>
    </tr>
    <%
				while (rs.next()) {
			%>
    <tr>
   <td><%=rs.getString("Name Of Intendor")%></td>
    <td><%=rs.getString("Staff ID")%></td>
    <td><%=rs.getString("Pass Number")%></td>
    <td><%=rs.getString("Numberofitems")%></td>
    <td><a href="gatepass_approval_portal.jsp?id=<%=rs.getString("Pass Number")%>" class="badge badge-primary">View</a></td>
    </tr>
    <%
	  }
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
   %>
     </tbody>
  </table>
</div>
	
    <!-- Importing tether,jQuery,Bootstrap javaScripts -->

    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  
  </body>
</html>
