package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.hoidanit.laptopshop.Model.Product;
import vn.hoidanit.laptopshop.service.ProductSerVice;
import vn.hoidanit.laptopshop.service.UploadService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PostMapping;





@Controller
public class ProductController {
   
    private final ProductSerVice productSerVice;
    private final UploadService uploadService;



    public ProductController(ProductSerVice productSerVice, UploadService uploadService) {
        
        this.productSerVice = productSerVice;
        this.uploadService = uploadService;
    
    }

    ////////////////////////////////// lay list product
    @RequestMapping("/admin/products")
    public String ProductList(Model model) {
        List <Product> products = this.productSerVice.getAllProducts();
        model.addAttribute("products", products);
        System.out.println(">>>"+ products);
        return "admin/products/showProduct";
    }
    //////////////////////////////// lay data tao new

    @GetMapping("/admin/products/createProduct")
    public String getProduct(Model model) {
        
        model.addAttribute("newProduct", new Product());

        return ("admin/products/createProduct");
    }

    //////////////////////////// luu data tao new 
    
    @PostMapping("/admin/products/createProduct")
    public String handleCreateProduct(
        
    @ModelAttribute ("newProduct") @Valid Product pr,
    BindingResult newProductBindingResult,
    @RequestParam("imageFile") MultipartFile file){
        
        if (newProductBindingResult.hasErrors()) {
            return "admin/products/createProduct";  
        }

        String image = this.uploadService.handleSaveUploadFile(file, "products");

        pr.setImage(image);
     
        this.productSerVice.createProduct(pr);

        return "redirect:/admin/products";
    }

    // view product details

    @RequestMapping(value = "/admin/products/{id}", method = RequestMethod.GET)
    public String getProductDetail(Model model, @PathVariable Long id) {
    
    Product product = this.productSerVice.getProductById(id);
    
    model.addAttribute("product", product);
    model.addAttribute("id", id);
    
    return "admin/products/Product-view";
}

    // model update product

    @RequestMapping(value = "/admin/products/Product-Update/{id}")
    public String UpdateProduct(Model model, @PathVariable Long id) {
        
        Optional<Product> currentProduct = this.productSerVice.fetchProductById(id);
        model.addAttribute("newProduct", currentProduct.get());

    
         return "admin/products/Product-Update" ;
    
}
    // update button logic
    @PostMapping("/admin/products/Product-Update")
    public String handleUpdateProduct(@ModelAttribute("newProduct") @Valid Product pr,
            BindingResult newProductBindingResult,
            @RequestParam("imageFile") MultipartFile file) {

        // validate
        if (newProductBindingResult.hasErrors()) {
            return "/admin/products/Product-Update";
        }

        Product currentProduct = this.productSerVice.fetchProductById(pr.getId()).get();
        if (currentProduct != null) {
            // update new image
            if (!file.isEmpty()) {
                String img = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(img);
            }

            currentProduct.setName(pr.getName());
            currentProduct.setPrice(pr.getPrice());
            currentProduct.setQuantity(pr.getQuantity());
            currentProduct.setDetailDesc(pr.getDetailDesc());
            currentProduct.setShortDesc(pr.getShortDesc());
            currentProduct.setFactory(pr.getFactory());
            currentProduct.setTarget(pr.getTarget());

            this.productSerVice.createProduct(currentProduct);
        }

        return "redirect:/admin/products";
    }

 
    
    /////////// delete 
    
    @GetMapping(value = "/admin/products/Product-Delete/{id}")
    public String deleteProduct(Model model, @PathVariable Long id) {

        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        
        return "/admin/products/Product-Delete";
    }

      //////////////delete button
      @PostMapping("/admin/products/Product-Delete")
      public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product deleteProduct) {
             
          this.productSerVice.deleteAProduct(deleteProduct.getId());
          
          return "redirect:/admin/products";
  }


  @GetMapping("/admin/product/{id}")
  public String getProductDetailPage(Model model, @PathVariable Long id) {
      Product pr = this.productSerVice.fetchProductById(id).get();
      model.addAttribute("product", pr);
      model.addAttribute("id", id);
      return "admin/product/detail";
  }

    






}
    



    

    
    

    
