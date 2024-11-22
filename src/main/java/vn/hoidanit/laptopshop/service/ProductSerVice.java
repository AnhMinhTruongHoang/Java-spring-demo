package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.Model.Cart;
import vn.hoidanit.laptopshop.Model.CartDetail;
import vn.hoidanit.laptopshop.Model.Product;
import vn.hoidanit.laptopshop.Model.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;


@Service
public class ProductSerVice {
    
private final ProductRepository productRepository;
private final CartRepository cartRepository;
private final CartDetailRepository cartDetailRepository;
private final UserService userService;
private HttpSession session;

public ProductSerVice(ProductRepository productRepository, CartDetailRepository cartDetailRepository, CartRepository cartRepository,UserService userService) {
    
    this.productRepository = productRepository;
    this.cartDetailRepository = cartDetailRepository;
    this.cartRepository = cartRepository;
    this.userService =userService;
}
////////////////////// get product

public List<Product> getAllProducts(){
    return this.productRepository.findAll();
}

////////////////////// save product
public Product createProduct(Product pr){
    
 return this.productRepository.save(pr);

}

/////////////////////////

public Product getProductById(Long id){
        return this.productRepository.findProductById(id);
}
////////////////////// delete pr

public void deleteAProduct(Long id){
    this.productRepository.deleteById(id);
}

public Optional<Product> fetchProductById(Long id){
    return this.productRepository.findById(id);
}

public void handleAddProductToCart(String email,Long productId, HttpSession httpSession){

    User user = this.userService.getUserByEmail(email);
    if (user != null) {

        Cart cart = this.cartRepository.findByUser(user);

        if (cart == null) {

            Cart newCart = new Cart();
            newCart.setUser(user);
            newCart.setSum(0);

            cart=this.cartRepository.save(newCart);
        
        }
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {

                Product realProduct = productOptional.get();

                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);

                if (oldDetail == null) {

                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1);
                    this.cartDetailRepository.save(cd);
                    
                   
                  

                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);

                    
                } else{
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldDetail);
                }

              
                
            }   

            public Cart fetchByUser (User user) {
                return this.cartRepository.findByUser(user);
            }

            
        
    }



}


    
}
