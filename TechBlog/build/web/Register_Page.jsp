

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
        <!--This is the css page--> 
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
        
        <%@include file="Normal_Navbar.jsp" %>
        
        <main class="primary-background p-5 banner-background" style="padding-bottom: 80px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <p> Register Here</p>
                        </div>
                        
                        <div class="card-body">
                            
                            <form id="reg-form" action="RegisterSrevlets" method="POST">
                                
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
                                   
                                </div>
                                
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                
                                
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                
                               
                                 <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender" value="male"> Male
                                    <input type="radio" id="gender" name="gender" value="female"> Female 
                                </div>
                                
                                
                                
                                <div class="form-group">
                                    <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter Something bout Yourself"></textarea>
                                    
                                </div>
                                
                                
                                <div class="form-group form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms And Conditions</label>
                                </div>
                                
                                <br>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-2x"></span>
                                    <h4>Please Wait..</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                
                                
                            </form>

                        </div>
                        
                      
                        
                        
                    </div>
                    
                    
                    
                </div>
            </div>
        </main>
        
        
        
        
        
        
        <!--This is the Java script page int my website--> 
         <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
       
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js">
            </script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
            
        <script>
            
            $(document).ready(function (){
                console.log("Loaded...")
                $('#reg-form').on('submit', function (event){
                   event.preventDefault();
                   let form = new FormData(this);
                   
                  $("#submit-btn").hide();
                  $("#loader").show();
                  
                  
//                  This is send register button 

                       $.ajax({
                       url: "RegisterSrevlets",
                       type: 'POST',
                       data: form,
                      
                      success: function (data, textStatus, jqXHR){
                          console.log(data)
                          $("#submit-btn").show();
                          $("#loader").hide();
                          
                          if(data.trim()==='Done'){
                          swal("Register Successfully..We are going to redirect to login page")
                                  .then((value) => {
                                      window.location = "Login_Page.jsp"
                          });
                      }else{
                          swal(data);
                      }
                      },
                      error: function (jqXHR, textStatus, errorThrown){
                          $("#submit-btn").show();
                          $("#loader").hide();
                          swal("Something went wrong..Try Again")
                                  .then((value) => {
                                      window.location = "Login_Page.jsp"
                          });
                      },
                      processData: false,
                      contentType: false
                       });
                   
                   
                });
                
            });
            
            
        </script>
        
        
    </body>
</html>
