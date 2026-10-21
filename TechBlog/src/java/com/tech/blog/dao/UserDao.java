
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {
    
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveUser(User user){
        boolean f = false;
        try{
            
            
            String q = "insert into user1(name, email, password, gender, about) values(?, ?, ?, ?, ?)";
            PreparedStatement psmt = this.con.prepareStatement(q);
            psmt.setString(1, user.getName());
            psmt.setString(2, user.getEmail());
            psmt.setString(3, user.getPassword());
            psmt.setString(4, user.getGender());
            psmt.setString(5, user.getAbout());
            
            
            psmt.executeUpdate();
            f= true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
        
    }
    
//      This is the for login page get user email and passwoord for login 
    
    public User getUserByEmailAndPassword(String email , String password){
        User user = null;
        
        try{
            String query1 = "select * from user1 where email =? and password =?";
            PreparedStatement psmt = con.prepareStatement(query1);
            psmt.setString(1,email);
            psmt.setString(2,password);
            
            ResultSet set = psmt.executeQuery();
            if(set.next()){
                user = new User();
                String name = set.getString("name");
                user.setName(name);
                
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        return user;
    }

    public boolean updateUser(User user){
        boolean f = false;
        try{
            
            String query2 = "update user1 set name=? , email=? , password=? , gender=? , about=? , profile=? where id=?";
            PreparedStatement p = con.prepareStatement(query2);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
           
            p.executeUpdate();
            f = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int userId){
       
        User user = null;
         try{
        String q ="select * from user1 where id=?";
        PreparedStatement ps = this.con.prepareStatement(q);
        ps.setInt(1,userId);
        ResultSet set = ps.executeQuery();
        
            if(set.next()){
                user = new User();
                String name = set.getString("name");
                user.setName(name);
                
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        
         }catch(Exception e){
             e.printStackTrace();
         }
        return user;
    }
}
