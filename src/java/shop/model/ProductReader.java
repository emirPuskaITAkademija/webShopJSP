
package shop.model;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;


public class ProductReader {
    public List<Product> readProducts(String productFilePath){
        try(BufferedReader reader = new BufferedReader(new FileReader(productFilePath))){
            List<Product> products = new ArrayList<>();
            String line;
            while((line = reader.readLine())!=null){
                StringTokenizer tokenizer = new StringTokenizer(line, ";");
                int id = Integer.parseInt(tokenizer.nextToken());
                String name = tokenizer.nextToken();
                double price = Double.parseDouble(tokenizer.nextToken());
                Product product = new Product(id, name, price);
                products.add(product);
            }
            return products;
        }catch(IOException exception){
            throw new RuntimeException(exception.getMessage());
        }
    }
}
