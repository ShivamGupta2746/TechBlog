
package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.*;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
            
           if(con==null){
               
                // Add Driver method 
            Class.forName("com.mysql.jdbc.Driver");
            
            // craete connection 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","");
            
           }  
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    
}
