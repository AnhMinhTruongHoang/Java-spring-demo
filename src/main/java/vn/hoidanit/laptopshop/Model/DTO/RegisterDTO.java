package vn.hoidanit.laptopshop.Model.DTO;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import vn.hoidanit.laptopshop.service.validator.RegisterChecked;

@RegisterChecked
public class RegisterDTO {
   
    @Size(min = 3, message = "At least 3 characters")
    private String  firstName;
    
    @Size(min =1, message = "At least 1 characters")
    private String  lastName;
   
    @Email(message = "Email not valid" , regexp = "^[a-zA-Z0-9._#%&'+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")
    private String  email;
    
    private String  password; 
    
    @Size(min = 3, message = "At least 3 characters")
    private String  repassword;
   
    public String getFirstName() {
        
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getRepassword() {
        return repassword;
    }
    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    
     
}
