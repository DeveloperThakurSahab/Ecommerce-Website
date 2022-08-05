<%@page import="com.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Hexashop Ecommerce HTML CSS Template</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">
</head>
<body>
	<!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="seller_index.jsp" class="logo">
                            <img src="assets/images/logo.png">
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                            <li class="submenu">
                                <a href="javascript:;">Pages</a>
                                <ul>
                                    <li><a href="seller_add_product.jsp">Add Products</a></li>
                                    <li><a href="seller_view_product.jsp">View Products</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:;">Account</a>
                                <ul>
                                <%
                                	User u=null;
                                	if(session!=null)
                                	{
                                		if(session.getAttribute("u")!=null)
                                		{	
                                			u=(User)session.getAttribute("u");
                                			%>
                                			<li><a href="logout.jsp">Logout(<%=u.getFname() %>)</a></li>
                                    		<li><a href="seller_changepassword.jsp">Change Password</a></li>
                                			<%		
                                		}
                                		else
                                		{
                                			%>
                                			<li><a href="login.jsp">Login</a></li>
                                    		<li><a href="register.jsp">Register</a></li>
                                			<%
                                		}
                                	}
                                	else
                                	{
                                		%>
                                		<li><a href="login.jsp">Login</a></li>
                                    	<li><a href="register.jsp">Register</a></li>
                                		<%
                                	}
                                %>
                                </ul>
                            </li>
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
</body>
</html>