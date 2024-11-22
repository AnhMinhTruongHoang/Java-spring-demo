package vn.hoidanit.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.Model.Product;
import vn.hoidanit.laptopshop.service.ProductSerVice;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;







@Controller
public class ItemsController {

        private final ProductSerVice productSerVice;

        public ItemsController(ProductSerVice productSerVice){

                this.productSerVice = productSerVice;
        }
    
    @GetMapping("/products/{id}")
    public String getProduct(Model model, @PathVariable Long id) {
        Product products = this.productSerVice.fetchProductById(id).get();
        List<Product> Allproducts = this.productSerVice.getAllProducts();
        model.addAttribute("id", id);
        model.addAttribute("products", products);
        model.addAttribute("Allproducts", Allproducts);
        return "admin/products/detail";
    }


    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable Long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        
        Long productId = id;
      
        String email =(String) session.getAttribute("email");

        this.productSerVice.handleAddProductToCart(email,productId, session);



        
        return "redirect:/";

    
        
    }

    @GetMapping("/cart")
    public String getCartPage(Model model) {
       
       
    
        return "client/cart/show";
    }
    
    


    
    

   
    
}
