<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <style>
      body {
        font-family: Calibri, Helvetica, sans-serif;
        background-color: #f8f9fa;
      }
      .login-container {
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
      }
      .login-title {
        margin-bottom: 20px;
        font-size: 24px;
        font-weight: bold;
        text-align: center;
        color: #495057;
      }
      .form-control:focus {
        border-color: #6c757d;
        box-shadow: 0 0 0 0.2rem rgba(108, 117, 125, 0.25);
      }
      .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
      }
      .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004085;
      }
      .forgot-password {
        font-size: 0.9rem;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <div class="login-container">
      <h1 class="login-title">Laptopshop Login</h1>
      <form action="/login" method="post" >

        <c:if test="${param.error != null}">
          <div class="my-2" style="color: red;">Invalid email or password.</div>
        </c:if>

        <c:if test="${param.logout != null}">
          <div class="my-2" style="color: greenyellow;">Logout success !</div>
        </c:if>



        <div class="mb-3">
          <label for="username" class="form-label">Email</label>
          <input
            type="text"
            name="username"
            class="form-control"
            placeholder="Enter Email"
            required
          />
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input
            type="password"
            class="form-control"
            name="password"
            placeholder="Enter Password"
            required
          />
        </div>

        <div>
          
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </div>
       
       
        <div class="mb-3 form-check">
          <input
            type="checkbox"
            class="form-check-input"
            id="rememberMe"
            name="remember-me"
            checked
          />
          <label class="form-check-label" for="rememberMe">Remember Me</label>
       
        </div>
        
        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-primary">Login</button>
          <button type="button" class="btn btn-secondary">Cancel</button>
        </div>
        <p class="forgot-password mt-3">
          No account ? Register here ! <a href="/client/auth/register">Click here</a>
        </p>
      </form>
    </div>
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>