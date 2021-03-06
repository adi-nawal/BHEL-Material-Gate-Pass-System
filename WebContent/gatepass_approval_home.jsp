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

if (staffid == 101|| staffid == 102 || staffid == 103 || staffid == 104 ) {
	try {
		response.sendRedirect("gatepass_invalidUser.jsp");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" type="image/png" href="./img_src/favicon.jpg" />
    <title>Material Gate Pass - Approvals</title>
    
    <!-- Adding Bootstrap CSS -->
    
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" 
    integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
    <!-- Adding Custom CSS -->
    
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/navbar-side.css">
    
    <!-- Font Awesome JS -->
    
    <script src="https://kit.fontawesome.com/2828a76884.js" crossorigin="anonymous"></script>
    
  </head>
  <body>
  
    <!-- Creating the Navigation Menu -->

	<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Material Gate Pass System</h3>
                <strong>GS</strong>
            </div>

            <ul class="list-unstyled components">
                <li>
                    <a href="gatepass_status.jsp">
                        <i class="fas fa-home" aria-hidden="true"></i>
                        Home
                    </a>
                </li>
                <li>
                    <a href="gatepass_raise.jsp">
                        <i class="fas fa-file-upload"></i>
                        Raise
                    </a>
                    </li>
                    <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="far fa-eye"></i>
                        View
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="gatepass_approved.jsp">Approved</a>
                        </li>
                        <li>
                            <a href="gatepass_pending.jsp">Pending</a>
                        </li>
                        <li>
                            <a href="gatepass_inDraft.jsp">In Draft</a>
                        </li>
                        <li>
                            <a href="gatepass_closed.jsp">Closed</a>
                        </li>
                        <li>
                            <a href="gatepass_cancelled.jsp">Cancelled</a>
                        </li>
                    </ul>
                </li>
                <li class="active">
                    <a href="gatepass_approval_home.jsp">
                    <i class="fas fa-check"></i>
                            Approve
                    </a>
                </li>
                <li>
                    <a href="gatepass_print.jsp">
                        <i class="fas fa-print"></i>
                        Print
                    </a>
                </li>
                <li>
                    <a href="gatepass_help.jsp">
                        <i class="fas fa-question"></i>
                        Help
                    </a>
                </li>
                <li>
                    <a href="gatepass_contact.jsp">
                        <i class="fas fa-paper-plane"></i>
                   Contact
              </a>
                </li>
            </ul>

           <ul class="list-unstyled components">
            <li>
                <a href="#" id="logout">
                <i class="fas fa-sign-out-alt"></i>
                Logout
                </a>
            </li>
            </ul>
        </nav>
        
        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-justify"></i>
                        <span></span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>
                </div>
            </nav>
            
    <!-- Creating the table for To Be Approved Gate Passes -->
    
    <div class="container">
      <table align="center" class="table table-striped">
       <%
		try {
			String driver = Database.getdriver();
			String connectionUrl = Database.getConnectionUrl();
			String database = Database.getDatabase();
			String userid = Database.getUserId();
			String password = Database.getPassword();
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

</div>
</div>

 <!-- Importing tether,jQuery,Bootstrap javaScript -->


	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
		
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
		
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" 
	    integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	    crossorigin="anonymous"></script>

    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" 
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" 
        crossorigin="anonymous"></script>

<!-- jQuery for collapsing Sidebar -->

<script type="text/javascript">
       $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
       $("#logout").on('click', function() {
     	  window.location = "<%=request.getContextPath()%>/logout" 
     	});
    </script>
    
  </body>
</html>
