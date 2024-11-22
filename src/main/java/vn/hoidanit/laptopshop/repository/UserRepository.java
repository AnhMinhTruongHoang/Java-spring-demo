package vn.hoidanit.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.hoidanit.laptopshop.Model.User;
import java.util.List;


@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User userdata);
    
    void deleteById(Long id);
    
    List<User> findOneByEmail(String email); 

    List<User> findAll();
    
    User findUserById(Long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);

  
       
    
}
