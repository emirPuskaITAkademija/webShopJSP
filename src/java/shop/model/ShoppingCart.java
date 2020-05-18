package shop.model;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {

    private final List<ShoppingCartItem> shoppingCartItems = new ArrayList<>();

    public void addItem(Product product, int quantity) {
        for (ShoppingCartItem item : shoppingCartItems) {
            if (item.getProduct().getId() == product.getId()) {
                int newQuantiyy = item.getQuantity() + quantity;
                item.setQuantity(newQuantiyy);
                return;
            }
        }
        ShoppingCartItem shoppingCartItem = new ShoppingCartItem(product, quantity);
        shoppingCartItems.add(shoppingCartItem);
    }

    public List<ShoppingCartItem> getShoppingCartItems() {
        return shoppingCartItems;
    }

}
