<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

  <head>

  </head>
    
    <body>
    
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
	<%@ include file="header.jsp" %>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->
    <div class="page-heading" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-content">
                        <h2>Product Details</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->


    <!-- ***** Product Area Starts ***** -->
    <section class="section" id="product">
        <div class="container">
            <div class="row">
            <%
            	int pid=Integer.parseInt(request.getParameter("pid"));
            	Product p=ProductDao.getProductsByPid(pid);
            %>
                <div class="col-lg-8">
                	<div class="left-images">
                    	<img src="product_image/<%=p.getProduct_image()%>" alt="">
                	</div>
            	</div>
            	<div class="col-lg-4">
	                <div class="right-content">
	                    <h4><%=p.getProduct_name()%></h4>
	                    <span class="price">Price: <%=p.getProduct_price() %></span>
	                    <ul class="stars">
	                        <li><i class="fa fa-star"></i></li>
	                        <li><i class="fa fa-star"></i></li>
	                        <li><i class="fa fa-star"></i></li>
	                        <li><i class="fa fa-star"></i></li>
	                        <li><i class="fa fa-star"></i></li>
	                    </ul>
	                    <span><%=p.getProduct_desc() %></span>
	                    <div class="quote">
	                        <i class="fa fa-quote-left"></i><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiuski smod.</p>
	                    </div>
	                    <%
							if(u==null)
							{
							%>	
							<div class="quantity-content">
	                    		<div class="total">
	                        		<div class="main-border-button"><a href="login.jsp">Login</a></div>
	                    		</div>
	                    	</div>
							<%	
							}
							else
							{
							%>
								<%
		                    		boolean cart_flag=CartDao.checkCart(u.getId(), p.getPid());
		                    		if(cart_flag==true)
		                    		{
		                    		%>
		                    		<div class="quantity-content">
		                    			<div class="total">
		                    				<h4><i class="fa fa-trash"></i></h4>
		                        			<div class="main-border-button"><a href="remove_from_cart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId() %>">Remove From Cart</a></div>
		                    			</div>
		                    		</div>
		                    		<%
		                    		}
		                    		else
		                    		{
		                    		%>
		                    		<div class="quantity-content">
		                    			<div class="total">
		                    				<h4><i class="fa fa-shopping-cart"></i></h4>
		                        			<div class="main-border-button"><a href="add_to_cart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId() %>">Add To Cart</a></div>
		                    			</div>
		                    		</div>
		                    		<%
		                    		}
		                    	%>
		                    	<%
		                    		boolean wishlist_flag=WishlistDao.checkWishlist(u.getId(), p.getPid());
		                    		if(wishlist_flag==true)
		                    		{
		                    		%>
		                    		<div class="quantity-content">
		                    			<div class="total">
		                    				<h4><i class="fa fa-trash"></i></h4>
		                        			<div class="main-border-button"><a href="remove_from_wishlist.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId() %>">Remove From Wishlist</a></div>
		                    			</div>
		                    		</div>
		                    		<%
		                    		}
		                    		else
		                    		{
		                    		%>
		                    		<div class="quantity-content">
		                     			<div class="total">
		                    				<h4><i class="fa fa-heart"></i></h4>
		                        			<div class="main-border-button"><a href="add_to_wishlist.jsp?pid=<%=p.getPid()%>& uid=<%= u.getId()%>">Add To Wishlist</a></div>
		                    			</div>
		                    		</div>
		                    		<%
		                    		}
		                    	%>
						<% } %>
	                </div>
            	</div>

            </div>
        </div>
    </section>
    <!-- ***** Product Area Ends ***** -->
    
    <!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="first-item">
                        <div class="logo">
                            <img src="assets/images/white-logo.png" alt="hexashop ecommerce templatemo">
                        </div>
                        <ul>
                            <li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</a></li>
                            <li><a href="#">hexashop@company.com</a></li>
                            <li><a href="#">010-020-0340</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <h4>Shopping &amp; Categories</h4>
                    <ul>
                        <li><a href="#">Men’s Shopping</a></li>
                        <li><a href="#">Women’s Shopping</a></li>
                        <li><a href="#">Kid's Shopping</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><a href="#">Homepage</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Help &amp; Information</h4>
                    <ul>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">FAQ's</a></li>
                        <li><a href="#">Shipping</a></li>
                        <li><a href="#">Tracking ID</a></li>
                    </ul>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. 
                        
                        <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a>

                        <br>Distributed By: <a href="https://themewagon.com" target="_blank" title="free & premium responsive templates">ThemeWagon</a></p>
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    

    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/accordions.js"></script>
    <script src="assets/js/datepicker.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script> 
    <script src="assets/js/slick.js"></script> 
    <script src="assets/js/lightbox.js"></script> 
    <script src="assets/js/isotope.js"></script> 
    <script src="assets/js/quantity.js"></script>
    
    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>

    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>

  </body>

</html>
    