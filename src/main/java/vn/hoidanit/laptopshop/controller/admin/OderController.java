package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class OderController {

    @GetMapping("/admin/order")
    public String getDashBoardController() {
        return "/admin/order/showOrder";
    }
    

    
}