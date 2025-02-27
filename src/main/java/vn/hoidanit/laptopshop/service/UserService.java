package vn.hoidanit.laptopshop.service;

import java.util.List;



import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.Model.Role;
import vn.hoidanit.laptopshop.Model.User;
import vn.hoidanit.laptopshop.Model.DTO.RegisterDTO;
import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.repository.RoleRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    
    
    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
       
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

        public String handleHello(){
            return "hello service";
        }

    public List<User> getAllUser(){
        return this.userRepository.findAll();
    }
    
    public User handleSaveUser(User user){
        User allUser = this.userRepository.save(user);
        return allUser;
       
    }

    public void deleteAUser(Long id){
         this.userRepository.deleteById(id);;
    }
    
    public Role getRoleByName(String name){
        return this.roleRepository.findByName(name);
    }

    public List<User> getAllUsersByEmail(String email){
        return this.userRepository.findOneByEmail(email);
    }
    public User getUserById(Long id){
        return this.userRepository.findUserById(id);
    }

    
    public User registerDTOtoUser(RegisterDTO registerDTO){
       
        User user = new User();

        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        
        
        return user;

    }

    public boolean checkEmailExist(String email){

        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email){
        return this.userRepository.findByEmail(email);
    }
       
}
