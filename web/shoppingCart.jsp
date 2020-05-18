<%@page import="shop.model.ShoppingCartItem"%>
<%@page import="shop.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.model.ProductReader"%>
<%@page import="shop.model.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ProductReader productReader = new ProductReader();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping korpa</title>
        <style>
            table,th,td{
                border: 1px solid black;
                border-collapse: collapse;
            }
        </style>
    </head>
    <body>
        <h1>Proizvodi u korpi</h1>
        <%
            if (request.getSession().getAttribute("korpa") == null) {
                request.getSession().setAttribute("korpa", new ShoppingCart());
            }
            ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("korpa");
            //int quantiy; productId
            List<Product> products = (List<Product>) productReader.readProducts(application.getRealPath("products.txt"));
            String productIdParameter = request.getParameter("productId");
            for (Product product : products) {
                if (productIdParameter.equals(product.getId() + "")) {
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    shoppingCart.addItem(product, quantity);
                    break;
                }
            }
        %>
        <table>
            <tr><th>Naziv</th><th>Jedinična cijena</th><th>Količina</th><th>Ukupna cijena</th></tr>
                    <% for (ShoppingCartItem item : shoppingCart.getShoppingCartItems()) {
                    %>
            <tr>
                <td><%=item.getProduct().getProductName()%></td>
                <td><%=item.getProduct().getPrice()%></td>
                <td><%=item.getQuantity()%></td>
                <td><%=item.getTotalPrice()%></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
