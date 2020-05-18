package shop.model;

import java.io.Serializable;

/**
 * Ovo je taj FAMOZNI BEAN ili JavaBean
 * <p>
 * ManagedBean JSF
 *
 * @author Grupa2
 */
public class User implements Serializable {

    private String username;
    private String password;

    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean login() {
        return "admin".equals(username) && "admin".equals(password);
    }
}
