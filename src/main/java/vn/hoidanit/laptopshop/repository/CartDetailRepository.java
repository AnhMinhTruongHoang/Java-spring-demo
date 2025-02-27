package vn.hoidanit.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.Model.Cart;
import vn.hoidanit.laptopshop.Model.CartDetail;
import vn.hoidanit.laptopshop.Model.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    
    
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);
}
