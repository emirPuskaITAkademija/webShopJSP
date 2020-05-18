<%@page import="shop.model.ProductReader"%>
<%@page import="shop.model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="shop.model.User" scope="session"/>
<jsp:setProperty name="user" property="username" param="korisnickoIme"/>
<jsp:setProperty name="user" property="password" param="lozinka"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web shop</title>
    </head>
    <body>


        <%if (user.login()) {%>
        <h3>Dostupni proizvodi</h3>
        <table border='1'>
            <tr bgcolor='lightgray'><th>Naziv</th><th>Cijena</th><th>U korpu</th></tr>
                    <% List<Product> products = new ProductReader().readProducts(application.getRealPath("products.txt"));
                        for (Product product : products) {
                            %><tr>
                <td><%=product.getProductName()%></td>
                <td><%=product.getPrice()%></td>
                <td>
                    <form action="shoppingCart.jsp" method="get">
                        <input type="number" name="quantity" size="3">
                        <input type="hidden" name="productId" value="<%=product.getId()%>">
                        <input type="submit" value="Dodaj"/>
                    </form>
                </td>
            </tr>    <%}%>
        </table>
        <%}%>
        <%if (!user.login()) {
                //response.sendRedirect("index.html");
        %>
        <h3>Molim vas ulogujte se kako bi kupovali na našem web shopu</h3>
        <%@include file="index.html" %>
        <%}%>
    </body>
</html>
