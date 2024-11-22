package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.Model.Role;
import vn.hoidanit.laptopshop.Model.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;
import java.util.List;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class UserController {

     private final UserService userService;
     private final UploadService uploadService;
     private final PasswordEncoder  passwordEncoder;
   
    public UserController( UploadService uploadService, UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        return "hello";
    }

    ///////////////////////////////////// table user
    @RequestMapping("/admin/user")
    public String UserList(Model model) {
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users", users);
        
        return "admin/user/Table-User";
    }
    
    //////////////////////// save date create form
    @GetMapping("/admin/user/create")
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }
    //////////////////////// create button
   @RequestMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
       
        @ModelAttribute("newUser") 
        @Valid User userdata,
        BindingResult newUserBindingResult,
        @RequestParam("imageFile") 
        MultipartFile file) {

        List<FieldError> errors = newUserBindingResult.getFieldErrors(); /////////validate
        for (FieldError error : errors ) {
        System.out.println (">>>>" + error.getField() + " - " + error.getDefaultMessage());
        }
        
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
            
        }
       
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(userdata.getPassword());
      

        userdata.setAvatar(avatar);
        userdata.setPassword(hashPassword);
        userdata.setRole(this.userService.getRoleByName(userdata.getRole().getName()));
        

        this.userService.handleSaveUser(userdata);
        return "redirect:/admin/user";
    }
    
    //////////////// view user
    @RequestMapping(value = "/admin/user/{id}", method = RequestMethod.GET)
    public String GetUserDetail(Model model, @PathVariable Long id) {
        User user = this.userService.getUserById(id);
        
        model.addAttribute("user", user);
        model.addAttribute("id", id);
       
        return "admin/user/User-View";
    }
    
   // Update user details
    @RequestMapping(value = "/admin/user/User-Update/{id}")
    public String UpdateUser(Model model, @PathVariable Long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        
        return "admin/user/User-Update";
}
    /////Update button
    @PostMapping("/admin/user/User-Update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User userdata) {
       
        User currentUser = this.userService.getUserById(userdata.getId());
       
        if(currentUser != null){
           currentUser.setFullName(userdata.getFullName());
           currentUser.setAddress(userdata.getAddress());
           currentUser.setPhone(userdata.getPhone());
          
           Role userRole = this.userService.getRoleByName(userdata.getRole().getName()); 
           currentUser.setRole(userRole);
           
           this.userService.handleSaveUser(currentUser);
        }
        
        return "redirect:/admin/user";
}   
    ///////////////////Delete user
    @GetMapping(value = "/admin/user/User-Delete/{id}")
    public String DeleteUser(Model model, @PathVariable Long id) {

        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        
        return "admin/user/User-Delete";
}   
    //////////////delete button
    @PostMapping("/admin/user/User-Delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User deleteUser) {
            this.userService.deleteAUser(deleteUser.getId());
        
        return "redirect:/admin/user";
}

}