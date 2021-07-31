/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;
import com.Model.Cust;
import com.util.DBConnection;

public class custDAO {
  private Connection connection;
    
    public custDAO() throws ClassNotFoundException {
        connection = DBConnection.getConnection();
    }
    
       
    public void addCust(Cust cust) {
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("INSERT INTO cust(custID, IcNo, Name, Contact, emailAdd) VALUES (?,?,?,?,?)");
            preparedStatement.setString(1, cust.getCustid());
            preparedStatement.setString(2, cust.getIcno());
            preparedStatement.setString(3, cust.getName());
            preparedStatement.setString(4, cust.getContact());
            preparedStatement.setString(5, cust.getEmail());
            preparedStatement.executeUpdate();           
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     public void deleteCust(String custid){
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("DELETE FROM cust WHERE custID=?");
            preparedStatement.setString(1, custid);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
    public String updateCust(Cust cust){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE cust SET IcNO=?, Name=?, Contact=?, emailAdd=? WHERE custID=?");
            
            preparedStatement.setString(1, cust.getIcno());
            preparedStatement.setString(2, cust.getName());
            preparedStatement.setString(3, cust.getContact());
            preparedStatement.setString(4, cust.getEmail());
            preparedStatement.setInt(5, Integer.parseInt(cust.getCustid()));
            
          int row =  preparedStatement.executeUpdate();
          return "line 66";
        }
      
            catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e);
            return e.toString();
        }
    }
    
     public List<Cust> getAllCusts() {
        List<Cust> custs = new ArrayList<Cust>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM cust");
            while (rs.next()){
               Cust cust= new Cust();
                cust.setCustid(rs.getString("custID"));
                cust.setIcno(rs.getString("IcNo"));
                cust.setName(rs.getString("Name"));
                cust.setContact(rs.getString("Contact"));
                cust.setEmail(rs.getString("emailAdd"));
                custs.add(cust);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return custs;
    }

    
    public Cust getCustById(String custid){
        Cust cust = new Cust();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM cust WHERE custID=?");
            
            preparedStatement.setString(1, custid);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                cust.setCustid(rs.getString("custID"));
                cust.setIcno(rs.getString("IcNo"));
                cust.setName(rs.getString("Name"));
                cust.setContact(rs.getString("Contact"));
                cust.setEmail(rs.getString("emailAdd"));
               
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cust;
    }
}