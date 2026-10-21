
// package com.tech.blog.helper;

// import java.sql.Connection;
// import java.sql.*;

// public class ConnectionProvider {
//     private static Connection con;
//     public static Connection getConnection(){
//         try{
            
//            if(con==null){
               
//                 // Add Driver method 
//             Class.forName("com.mysql.jdbc.Driver");
            
//             // craete connection 
//             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","");
            
//            }  
//         }catch(Exception e){
//             e.printStackTrace();
//         }
//         return con;
//     }
    
// }


        // This is for the railway deploy 


package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) {

                String host = System.getenv("MYSQLHOST");
                String port = System.getenv("MYSQLPORT");
                String database = System.getenv("MYSQLDATABASE");
                String username = System.getenv("MYSQLUSER");
                String password = System.getenv("MYSQLPASSWORD");

                if (host == null || port == null || database == null
                        || username == null || password == null) {
                    throw new SQLException(
                        "MySQL environment variables are missing"
                    );
                }

                Class.forName("com.mysql.cj.jdbc.Driver");

                String url = "jdbc:mysql://" + host + ":" + port
                        + "/" + database
                        + "?serverTimezone=UTC";

                con = DriverManager.getConnection(
                        url, username, password
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}





