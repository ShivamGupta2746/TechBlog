/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author s
 */

@MultipartConfig
public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          int cid =Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pic");
             
            // Getting current user id 
            
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            
            
           // out.println("Your post title is :" + pTitle);
          //  out.println(part.getSubmittedFileName());
            
          
//          herev 
          
          //  Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
          //  PostDao dao = new PostDao(ConnectionProvider.getConnection());
//            if(dao.savePost(p)){   
//              String path = request.getRealPath("/")+"blog_pics"+File.separator + part.getSubmittedFileName();
//
//              Helper.saveFile(part.getInputStream(), path);
//              
//              
//              File imageFile = new File(path);
//
//System.out.println("Image path: " + path);
//System.out.println("Image exists: " + imageFile.exists());
//System.out.println("Image size: " + imageFile.length());
//              
//              
//               out.println("Done");
//                
//            }else{
//                out.println("Error");
//            }
            

        String fileName = java.nio.file.Paths
        .get(part.getSubmittedFileName())
        .getFileName()
        .toString();

String realPath = request.getServletContext().getRealPath("/");

if (realPath == null) {
    throw new ServletException(
        "Application ka real path available nahi hai."
    );
}

File uploadDir = new File(realPath, "blog_pics");

if (!uploadDir.exists() && !uploadDir.mkdirs()) {
    throw new IOException("blog_pics folder create nahi hua.");
}

File imageFile = new File(uploadDir, fileName);

try (java.io.InputStream in = part.getInputStream()) {
    java.nio.file.Files.copy(
        in,
        imageFile.toPath(),
        java.nio.file.StandardCopyOption.REPLACE_EXISTING
    );
}

System.out.println("Image path: " + imageFile.getAbsolutePath());
System.out.println("Image exists: " + imageFile.exists());
System.out.println("Image size: " + imageFile.length());

if (imageFile.length() == 0) {
    throw new IOException("Image file empty hai.");
}

Post p = new Post(
    pTitle, pContent, pCode, fileName,
    null, cid, user.getId()
);

PostDao dao = new PostDao(ConnectionProvider.getConnection());

if (dao.savePost(p)) {
    out.println("Done");
} else {
    out.println("Error");
}

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
