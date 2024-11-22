package vn.hoidanit.laptopshop.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import vn.hoidanit.laptopshop.Model.Product;
import vn.hoidanit.laptopshop.Model.User;
import vn.hoidanit.laptopshop.Model.DTO.RegisterDTO;
import vn.hoidanit.laptopshop.service.ProductSerVice;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;



@Controller
public class HomePageController {

    private final ProductSerVice productSerVice;
    private final UserService userService;
    private final PasswordEncoder  passwordEncoder;

    public HomePageController(ProductSerVice productSerVice, UserService userService, PasswordEncoder passwordEncoder ){

        this.productSerVice = productSerVice;
        this.userService = userService;
        this.passwordEncoder =passwordEncoder;
    }
    
    
    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productSerVice.getAllProducts(); 
        model.addAttribute("products", products);
         
        return "client/homepage/show";
    }

    //////////////////////////// register

    @GetMapping("/client/auth/register")
    public String getRegister(Model model) {
        model.addAttribute("registers", new RegisterDTO());
        return "client/auth/register";
    }


    @PostMapping("/register")
    
    public String handleRegister(@ModelAttribute("registers") @Valid RegisterDTO registerDTO, BindingResult bindingResult) {

        List<FieldError> errors = bindingResult.getFieldErrors(); /////////validate
        for (FieldError error : errors ) {
        System.out.println (">>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        
        
        User user = this.userService.registerDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(user.getPassword());
      

        
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        

        this.userService.handleSaveUser(user);
        return "redirect:/login";

        
    }


    @GetMapping("/login")
    public String getLoginPage(Model model) {
       
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
       
        return "client/auth/deny";
    }

    


    
    
}
