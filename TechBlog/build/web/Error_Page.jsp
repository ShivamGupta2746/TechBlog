

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something went wrong</title>
        
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="CSS/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
            <!--This is the currently not working in my project--> 
                             
        <style>
            .banner-background{
              clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 96%, 78% 96%, 50% 98%, 20% 96%, 0 98%, 0% 35%, 0 0);
            }         
         </style>
    </head>
    <body>
        <div class="container text-center">
            <img src="img/computer.png" class="img-fluid">
            <h4 class="display-3"> Sorry ! Something went wrong..</h4>
            <br>
            <%= exception %>
            <br>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
                
        </div>
    </body>
</html>
