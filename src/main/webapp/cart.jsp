<%@page import="java.util.Random"%>
<%@page import="com.bean.Cart"%>
<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
 %>
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
                        <h2>Cart</h2>
                        <span>Awesome &amp; Creative HTML CSS layout by TemplateMo</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->


    <!-- ***** Products Area Starts ***** -->
    <section class="section" id="products">
        <div class="container">
            <div class="row">
            <%
            	int net_price=0;
            	List<Cart> list = CartDao.getCartByUser(u.getId());
            	if(list.size()<=0)
            	{
            		%>
            			<div class="col-lg-12">
                    		<div class="section-heading">
                        		<h2>No Products in Cart</h2>
                    		</div>
                		</div>
            		<%
            	}
            	else
            	{
            		%>
            			<div class="col-lg-12">
                    		<div class="section-heading">
                        		<h2>Cart Products</h2>
                    		</div>
                		</div>
            		<%
            	}
            %>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <%
				for (Cart c: list) {
					net_price=net_price+c.getTotal_price();
					Product p=ProductDao.getProductsByPid(c.getPid());
                %>
                <div class="col-lg-4">
                    <div class="item">
                        <div class="thumb">
                            <img src="product_image/<%=p.getProduct_image()%>" alt="">
                        </div>
                        <div class="down-content">
                            <h4><%=p.getProduct_category()%></h4>
                            <h4><%=p.getProduct_name() %></h4>
                            <span>Price: <%=c.getProduct_price() %></span>
                            <form name="change_qty" method="post" action="CartController">
                        		<input type="hidden" name="cid" value="<%=c.getCid() %>">
                        		<span>Product Quantity:<input type="number" min="1" max="10" name="product_qty" value="<%=c.getProduct_qty() %>" onchange="this.form.submit();"></span>
                        	</form>
                        	<span>Total Price: <%=c.getTotal_price() %></span>
                            <ul class="stars">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
            <%
            	if(list.size()>0)
            	{
            		%>
            			<h3>Net Price To Pay: <%= net_price %></h3>
	        			<form method="post" action="pgRedirect.jsp">
							<table border="1">
								<tbody>
									<tr>
										<th>S.No</th>
										<th>Label</th>
										<th>Value</th>
									</tr>
									<tr>
										<td>1</td>
										<td><label>ORDER_ID::*</label></td>
										<td><input id="ORDER_ID" tabindex="1" maxlength="20" size="20"
											name="ORDER_ID" autocomplete="off"
											value="ORDS_<%= randomInt %>">
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td><label>CUSTID ::*</label></td>
										<td><input id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST001"></td>
									</tr>
									<tr>
										<td>3</td>
										<td><label>INDUSTRY_TYPE_ID ::*</label></td>
										<td><input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail"></td>
									</tr>
									<tr>
										<td>4</td>
										<td><label>Channel ::*</label></td>
										<td><input id="CHANNEL_ID" tabindex="4" maxlength="12"
											size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
										</td>
									</tr>
									<tr>
										<td>5</td>
										<td><label>txnAmount*</label></td>
										<td><input title="TXN_AMOUNT" tabindex="10"
											type="text" name="TXN_AMOUNT"
											value="<%=net_price%>">
										</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td><input value="CheckOut" type="submit"	onclick=""></td>
									</tr>
							</tbody>
						</table>
						* - Mandatory Fields
					</form>
            		<%	
            	}
            %>
        </div>
    </section>
    <!-- ***** Products Area Ends ***** -->
    
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
    