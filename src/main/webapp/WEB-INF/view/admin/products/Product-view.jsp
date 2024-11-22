<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Hỏi Dự án laptopshop" />
    <meta name="author" content="Hỏi Dân IT" />
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp"></jsp:include>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin/user">Dashboard</a></li>
                        <li class="breadcrumb-item active">View Product</li>
                    </ol>
                    <div class="container mt-5">
                        <div class="text-center mb-3">
                            <h2>Product Details</h2>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th colspan="2" class="text-center">Product Information</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>ID</strong></td>
                                    <td>${product.id}</td>
                                </tr>
                                <tr>
                                    <td><strong>Name</strong></td>
                                    <td>${product.name}</td>
                                </tr>
                              
                                <tr>
                                    <td><strong>Price</strong></td>
                                     <td>
                                        <fmt:formatNumber value="${product.price}" type="currency" currencyCode="VND"/>
                                    </td>
                               
                                </tr>
                              
                                <tr>
                                    <td><strong>Image</strong></td>
                                    <td> <img class="card-img-top" src="/images/product/${product.image}"/> </td>
                                </tr>
                                <tr>
                                    <td><strong>Detailed Description</strong></td>
                                    <td>${product.detailDesc}</td>
                                </tr>
                                <tr>
                                    <td><strong>Short Description</strong></td>
                                    <td>${product.shortDesc}</td>
                                </tr>
                                <tr>
                                    <td><strong>Quantity</strong></td>
                                    <td>${product.quantity}</td>
                                </tr>
                                <tr>
                                    <td><strong>Sold</strong></td>
                                    <td>${product.sold}</td>
                                </tr>
                                <tr>
                                    <td><strong>Target</strong></td>
                                    <td>${product.target}</td>
                                </tr>
                                <tr>
                                    <td><strong>Factory</strong></td>
                                    <td>${product.factory}</td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div style="display: flex; justify-content: center;">
                            <a href="/admin/products" class="btn btn-success">BACK</a>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp"></jsp:include>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="js/chart-area-demo.js"></script>
    <script src="js/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>

</html>
