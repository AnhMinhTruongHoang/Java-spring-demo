<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> ${product.name} - Laptopshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
        rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">
</head>


    

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <!-- Brand Logo -->
                    <a href="/" class="navbar-brand">
                        <h1 class="text-primary display-6">laptopshop</h1>
                    </a>
                    <!-- Toggler button for mobile view -->
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    
                    <!-- Navbar Links and other content -->
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/products">Products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/about">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/contact">Contact</a>
                            </li>
                        </ul>
                        <!-- Include additional header content from JSP file -->
                     
                    </div>
                </nav>
            </div>
        </div>
        
        <!-- Navbar End -->


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->




        <!-- Single Product Start -->
        <div class="container-fluid py-5 mt-5">
            <div class="container py-5">
               
                <div class="container-fluid py-5 mt-5">
                    <div class="container py-5">
                        <div class="row g-4 mb-5">
                            <!-- Product Information Section -->
                            <div class="col-lg-8 col-xl-9">
                                <div class="row g-4">
                                    <!-- Product Image -->
                                    <div class="col-lg-6">
                                        <div class="border rounded">
                                            <a href="#">
                                                <img src="/images/product/${products.image}" class="img-fluid rounded" alt="Laptop Image"/>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Product Details -->
                                    <div class="col-lg-6">
                                        <h3 class="fw-bold mb-3 text-dark">
                                        
                                            ${products.name}
                                        
                                        </h3>
                                        
                                        <h4 class="text-danger mb-3">
                                            <fmt:formatNumber value="${products.price }"/> VND
                                        </h4>
                                        <hr/>
                                        <p class="mb-4 text-secondary">${products.shortDesc}</p>
                                        
                                        <!-- Quantity Selector -->
                                        <div class="input-group quantity mb-4" style="width: 120px;">
                                            <button class="btn btn-sm btn-outline-secondary rounded-circle" type="button">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                            <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                                            <button class="btn btn-sm btn-outline-secondary rounded-circle" type="button">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                        <a href="#" class="btn btn-primary rounded-pill px-4 py-2 mb-4">
                                            <i class="fa fa-shopping-cart me-2"></i> Add to Cart
                                        </a>
                                    </div>
                
                                    <!-- Tabs for Description and Reviews -->
                                    <div class="col-lg-12">
                                        <nav>
                                            <div class="nav nav-tabs mb-3" id="nav-tab" role="tablist">
                                                <button class="nav-link active" id="nav-desc-tab" data-bs-toggle="tab" data-bs-target="#nav-desc" type="button" role="tab" aria-controls="nav-desc" aria-selected="true">Description</button>
                                                <button class="nav-link" id="nav-reviews-tab" data-bs-toggle="tab" data-bs-target="#nav-reviews" type="button" role="tab" aria-controls="nav-reviews" aria-selected="false">Reviews</button>
                                            </div>
                                        </nav>
                                        <div class="tab-content mb-5" id="nav-tabContent">
                                            <!-- Product Description -->
                                            <div class="tab-pane fade show active" id="nav-desc" role="tabpanel" aria-labelledby="nav-desc-tab">
                                                <p>${products.detailDesc}</p>
                                            </div>
                                            <!-- Customer Reviews -->
                                            <div class="tab-pane fade" id="nav-reviews" role="tabpanel" aria-labelledby="nav-reviews-tab">
                                                <div class="d-flex mb-4">
                                                    <img src="/images/product/1711078092373-asus-01.png" class="img-fluid rounded-circle p-2" style="width: 60px; height: 60px;" alt="Avatar">
                                                    <div class="ms-3">
                                                        <h6 class="mb-1">Jason Smith</h6>
                                                        <small>April 12, 2024</small>
                                                        <div class="d-flex align-items-center">
                                                            <i class="fa fa-star text-warning"></i>
                                                            <i class="fa fa-star text-warning"></i>
                                                            <i class="fa fa-star text-warning"></i>
                                                            <i class="fa fa-star text-warning"></i>
                                                            <i class="fa fa-star text-muted"></i>
                                                        </div>
                                                        <p class="mb-0">Great performance and build quality.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                
                                    <!-- Leave a Review Form -->
                                    <form action="#">
                                        <h4 class="mb-4">Leave a Review</h4>
                                        <div class="row g-3">
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" placeholder="Your Name *" required>
                                            </div>
                                            <div class="col-lg-6">
                                                <input type="email" class="form-control" placeholder="Your Email *" required>
                                            </div>
                                            <div class="col-lg-12">
                                                <textarea class="form-control" rows="5" placeholder="Your Review *"></textarea>
                                            </div>
                                            <div class="col-lg-12 text-end">
                                                <button type="submit" class="btn btn-primary rounded-pill px-4 py-2">Submit Review</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                
                            <!-- Sidebar with Categories -->
                            <div class="col-lg-4 col-xl-3">
                                <div class="bg-light p-4 rounded">
                                    <h5 class="d-flex justify-content-center mb-2">Categories</h5>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                           ${products.target} <span class="badge bg-secondary rounded-pill">${products.quantity}</span>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </div>
                               <!-- Sidebar with Categories -->
                        </div>
                    </div>
                </div>


                 
                <div class="owl-carousel vegetable-carousel justify-content-center" style="cursor: pointer;" >
                    <c:forEach var="Allproducts" items="${Allproducts}">
                    
                            <div class="border border-primary rounded position-relative vegetable-item card-size">
                                <div class="vegetable-img">
                                  <a href="/products/${Allproducts.id}">
                                      
                                        <img src="/images/product/${Allproducts.image}" class="img-fluid w-100" alt="no image">
                                   
                                  </a>
                                
                                </div>
                                
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">
                                    ${Allproducts.target}
                                </div>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <a href="/products/${Allproducts.id}"><h4 class="product-title text-info">${Allproducts.name}</h4></a>
                                    
                                    <p >${Allproducts.shortDesc}</p>
                                    
                                    <div class="d-flex justify-content-center flex-wrap">
                                        <p class="text-dark fs-5 fw-bold">
                                            <fmt:formatNumber value="${Allproducts.price}" pattern="#,###"/> VND
                                        </p>
                                    </div>
                                    
    
                                    <a href="#" class="btn border border-secondary rounded-pill  text-primary d-flex justify-content-center mb-2">
                                        <i class="fa fa-shopping-bag me-2 text-primary"> Add to cart</i> 
                                    </a>
    
    
                                </div>
                            </div>
                     
                    </c:forEach>
               
                </div>
                
             
                <style>
                .vegetable-item.card-size {
                    width: 250px; /* Set a fixed width */
                    height: 400px; /* Set a fixed height */
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                }
                
                .vegetable-img {
                    height: 150px; /* Adjust height for images */
                    overflow: hidden;
                }
                
                .vegetable-img img {
                    object-fit: cover;
                    height: 100%;
                    width: 100%;
                }
                
                .product-title {
                    margin-top: 20px;
                    font-size: 1.1rem;
                }
                
                .owl-carousel .owl-item {
                    display: flex;
                    justify-content: center;
                }
                </style>

                  
               
                

            
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product End -->
    
        <jsp:include page="../layout/footer.jsp"></jsp:include>

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
            class="fa fa-arrow-up"></i></a>

        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>


    <!-- Template Javascript -->
        
    <script src="/client/js/main.js"></script>      
    </body>

</html>