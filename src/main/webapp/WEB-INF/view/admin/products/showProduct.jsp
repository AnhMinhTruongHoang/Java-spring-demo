<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  

    <!DOCTYPE html>
    <html lang="en">
    
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
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
                            <li class="breadcrumb-item active"></li>
                        </ol>
                        <div class="d-flex justify-content-between">
                          <h2>Products List</h2>
                          <a href="products/createProduct" class="btn btn-success">Create New Product</a>
                      </div>
                        <table class="table table-bordered table-hover">
                          <thead>
                            <tr>
                              <th scope="col" style="text-align: center;">Id</th>
                              <th scope="col"  style="text-align: center;">Name</th>
                              <th scope="col"  style="text-align: center;">Price</th>
                              <th scope="col"  style="text-align: center;">Factory</th>
                              <th scope="col"  style="text-align: center;">Action</th>
                             
                            </tr>
                          </thead>
                          <hr/>
                          <tbody>
                           <c:forEach var="products" items="${products}"> 
                            <tr>
                              <th scope="row"  style="text-align: center;" >${products.id}</th>
                              <td  style="text-align: center;">${products.name}</td>
                              
                              <td style="text-align: center;">
                                <fmt:formatNumber value="${products.price}" type="currency" currencyCode="VND"/>
                              </td>
                            
                              
                              <td  style="text-align: center;">${products.factory}</td>
                              <td  style="text-align: center; gap: 5px;">
                                <a href="/admin/products/${products.id}" class="btn btn-info">view</a> 
                                <a href="/admin/products/Product-Update/${products.id}" class="btn btn-warning">update</a>
                                <a href="/admin/products/Product-Delete/${products.id}" class="btn btn-danger">delete</a>
                              </td>
                            </tr>
                           </c:forEach>
                          </tbody>
                        </table>
                         
                          
                        </div>
                    </div>
                </main>
               <jsp:include page="../layout/footer.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="js/chart-area-demo.js"></script>
        <script src="js/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
            crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
    
    </html>
    