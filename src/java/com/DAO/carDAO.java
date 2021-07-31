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
import com.Model.Car;
import com.Model.Book;
import com.util.DBConnection;

/**
 *
 * @author user
 */
public class carDAO {
    private Connection connection;
    
    public carDAO() throws ClassNotFoundException {
        connection = DBConnection.getConnection();
    }
    
       
    public void addCar(Car car) {
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("INSERT INTO car(carID, platNo, carType, seatCapacity, brand, status) VALUES (?,?,?,?,?,?)");
            preparedStatement.setString(1, car.getCarid());
            preparedStatement.setString(2, car.getPlatno());
            preparedStatement.setString(3, car.getCartype());
            preparedStatement.setString(4, car.getSeatcapacity());
            preparedStatement.setString(5, car.getCarbrand());
            preparedStatement.setString(6, car.getCarstatus());
            preparedStatement.executeUpdate();           
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     public void deleteCar(String carid){
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("DELETE FROM car WHERE carID=?;");
            preparedStatement.setString(1, carid);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
    public String updateCar(Car car){
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("update car set platNo=?, carType=?, seatCapacity=?, brand=?, status=? where carid=?");
            
            preparedStatement.setString(1, car.getPlatno());
            preparedStatement.setString(2, car.getCartype());
            preparedStatement.setString(3, car.getSeatcapacity());
            preparedStatement.setString(4, car.getCarbrand());
            preparedStatement.setString(5, car.getCarstatus());
            preparedStatement.setInt(6, Integer.parseInt(car.getCarid()));
            
          int row=  preparedStatement.executeUpdate();
          return "line 73";
        }
        catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e);
            return e.toString();
        }
    }
    
    public String updateCarStatus(Car car){
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("update car set status=? where carid=?");
            
            preparedStatement.setString(1, car.getCarstatus());
            preparedStatement.setInt(2, Integer.parseInt(car.getCarid()));
            
          int row=  preparedStatement.executeUpdate();
          return "line 128";
        }
        catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e);
            return e.toString();
        }
    }
    
     public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<Car>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM car");
            while (rs.next()){
                Car car = new Car();
                car.setCarid(rs.getString("carID"));
                car.setPlatno(rs.getString("platNo"));
                car.setCartype(rs.getString("carType"));
                car.setSeatcapacity(rs.getString("seatCapacity"));
                car.setCarbrand(rs.getString("brand"));
                car.setCarstatus(rs.getString("status")); 
                cars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }
     
    public Car getCarById(String carid){
        Car car = new Car();
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("SELECT * FROM car WHERE carID=?");
            
            preparedStatement.setString(1, carid);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                car.setCarid(rs.getString("carID"));
                car.setPlatno(rs.getString("platNo"));
                car.setCartype(rs.getString("carType"));
                car.setSeatcapacity(rs.getString("seatCapacity"));
                car.setCarbrand(rs.getString("brand"));
                car.setCarstatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return car;
    }
    
}
