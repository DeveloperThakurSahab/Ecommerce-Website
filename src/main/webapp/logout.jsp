<%
	session.removeAttribute("u");
	session.removeAttribute("wishlist_count");
	session.removeAttribute("cart_count");
	session.invalidate();
	request.getRequestDispatcher("login.jsp").forward(request, response);
%>