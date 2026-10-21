<%-- 
    Document   : show_blog_page
    Created on : Dec 19, 2024, 4:23:20 PM
    Author     : s
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage ="Error_Page.jsp" %>
<% 
     User user = (User)session.getAttribute("currentUser");
     if(user== null){
     response.sendRedirect("Login_Page.jsp");
    }
%>
    
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    Post p = d.getPostByPostId(postId);
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> || Tech Blog learn by Shivam Gupta </title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="CSS/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
        
        
        
            <!--This is the currently not working in my project--> 
            <script type="text/javascript">
                
function doLike(pid,uid){
    console.log(pid);
    console.log(uid);
    
    const d ={
        uid:uid,
        pid:pid,
        operation:'like'
    };
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim()=='true'){
                let c = $(".like-counter").html();
                c++;
                $('.like-counter').html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });
}

                
            </script>
            
            
            
            
            <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v21.0"></script>
            
            
            
            
            
                             
        <style>
            .banner-background{
              clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 96%, 78% 96%, 50% 98%, 20% 96%, 0 98%, 0% 35%, 0 0);
            }   
            
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight:  100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px; 
                
            }
            body{
                background:url(img/nat.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }
            
            
         </style>
         
        
    </head>
    <body>
        
        <!--NavBar Starting--> 
        
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="#"><span class="fa fa-bug"></span> TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><span class="fa fa-bell-o"></span> Learn Code With Shivam <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
            <span class="fa fa-check-square"></span>  Category
        </a>
          <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Programming Implementation </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure </a>
        </div>
      </li>
       <li class="nav-item">
           <a class="nav-link" href="#"><span class="fa fa-phone"></span> Contact</a>
      </li>
      
      <li class="nav-item">
           <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-phone"></span> Do Post</a>
      </li>
      
      
       
      
    </ul>
    
       <ul class="navbar-nav mr-right">
          <li class="nav-item">
              <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
      </li>
      </ul>
      
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
           <a class="nav-link" href="LogoutServlets"><span class="fa fa-user-plus"></span> Logout</a>
      </li>
      </ul>
      
  </div>
</nav>
        
        <!--NavBar Ending--> 
        
        <!--Main Content of Body Start--> 
        <div class="container">
            
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= p.getpTitle() %></h4>
                                 
                        </div>
                            
                            <div class="card-body">
                                <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
                                
                                <div class="row my-3 row-user">
                                    <div class="col-md-8">
                                        <%  UserDao ud = new UserDao(ConnectionProvider.getConnection());   %>
                                        <p class="post-user-info"><a href="#!"><%= ud.getUserByUserId(p.getUserId()).getName()  %></a> has posted </p>   
                                    </div>
                                    <div class="col-md-4">
                                        <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                                    </div>
                                    
                                    
                                    
                                    
                                </div>
                                
                                
                                
                                <p class="post-content"><%= p.getpContent() %></p>
                                <br>
                                <br>
                                <div class="post-code">
                                <pre><%= p.getpCode() %></pre>
                                </div>
                            </div>
                                
                                <div class="card-footer primary-background">
                                    
                                    <%
                                        LikeDao lkd = new LikeDao(ConnectionProvider.getConnection());
                                        %>
                                    
                                        <a href="#!" onclick="doLike(<%=p.getPid() %>, <%=user.getId() %>)" class="btn  btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%=lkd.countLikeOnPost(p.getPid()) %></span></a>
                                       <a href="#!" class="btn  btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i> <span>20</span></a>
                                </div>
                                  
                                       <div class="card-footer">
                                           <div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_blog_page.jsp?post_id=<%=p.getPid() %>" data-width="" data-numposts="5"></div>
                                           
                                       </div>
                        
                        
                    </div>
                    
                    
                </div>
                
            </div>
            
        </div>
        
        
        <!--End of the main Content the the body-->
        
        
        <!--Start of the profile modal--> 

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width: 150px;">
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
                            
                            <!--Other biodata in table--> 
                            
                            <div id="profile-details">
                            <table class="table">
                                
                                <tbody>
                                    <tr>
                                        <th scope="row">ID : </th>
                                        <td><%= user.getId() %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email :</th>
                                        <td><%= user.getEmail() %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender :</th>
                                        <td><%= user.getGender() %></td>
                                    </tr>
                                    
                                     <tr>
                                        <th scope="row">Status :</th>
                                        <td><%= user.getAbout()%></td>
                                    </tr>
                                    
                                     <tr>
                                        <th scope="row">Registered On : :</th>
                                        <td><%= user.getDateTime() %></td>
                                    </tr>
                                    
                                </tbody>
                            </table>

                            </div>            
                            <!--This is the end of the table in biodata--> 
                            
                            <!--This is the start profile edit coding--> 
                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit CareFully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td> <%= user.getId() %></td> 
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"</td> 
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"</td> 
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"</td> 
                                        </tr>
                                         <tr>
                                            <td>Gender :</td>
                                            <td> <%= user.getGender().toUpperCase() %></td> 
                                        </tr>
                                         <tr>
                                            <td>About :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%></textarea>
                                            </td> 
                                        </tr>
                                         <tr>
                                            <td>Profile pic:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control">
                                            </td> 
                                        </tr>
                                    </table>
                                                <div class="container">
                                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                                </div>
                                    
                                </form>
                            </div>
                            
                            <!--This is the end  profile edit coding--> 
                            
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn btn-primary"> EDIT</button>
                    </div>
                </div>
            </div>
        </div>

        <!--End of the proofile modal-->
        
        
        <!--Start of the post modal here-->

      

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select category---</option>
                                    
                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for(Category c:list){
                                        %>
                                    
                                        <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                                
                                <%
                                    }
                                %>
                            </select>
                            </div>
                            
                            
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
                            </div>
                            
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 150px;" placeholder="Enter Your Content"></textarea>
                            </div>
                            
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 150px;" placeholder="Enter Your Program(If Any)"></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label>Select File</label>
                                <br>
                                <input type="file" name="pic"/>
                            </div>
                            
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                            
                        </form>
                        
                        
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!--End of the post modal here--> 
        
        
        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
       
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"> </script>
        
        <script>
            $(document).ready(function(){
                
                let editStatus = false;
                
                $('#edit-profile-btn').click(function(){
                    if(editStatus == false){
                        $('#profile-details').hide()
                    $('#profile-edit').show();
                    editStatus = true;
                    $(this).text("Back")
                    }else{
                        $('#profile-details').show()
                    $('#profile-edit').hide();
                    editStatus = false;
                    $(this).text("EDIT")
                    }
                    
                })
            });
        </script>
        
                <!--Now add post java Script-->
                
                <script>
                    $(document).ready(function(e){
                        //alert ("Loaded...")
                        
                        $("#add-post-form").on("submit", function(event){
                         // this code gets called when form is submitted..
                         event.preventDefault();
                         console.log("You clicked on submit");
                         
                         let form = new FormData(this);
                         // Now requestion to server
                         
                         $.ajax({
                             url: "AddPostServlet",
                             type: 'POST',
                             data: form,
                             success: function(data , textStatus, jqXHR){
                                 //success.....
                                 console.log(data);
                                 if(data.trim()== 'Done'){
                                     swal("Good Job!","Saved Successfully","success");
                                 }else{
                                  swal("Not Good!","Something Went Wrong","error");
                                 }  
                             },
                             error: function (jqXHR, textStatus, errorThrown){
                                 // error
                                 swal("Not Good!","Something Went Wrong","error");   
                             },
                             processData: false,
                             contentType: false
                         })
                        })
                    })
                </script>   
                
        
    </body>
</html>

