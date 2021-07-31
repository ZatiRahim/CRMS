package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;
import com.Model.Book;
import com.util.DBConnection;
/**
 *
 * @author user
 */
public class bookDAO {
     private Connection connection;
    
    public bookDAO() throws ClassNotFoundException {
        connection = DBConnection.getConnection();
    }
    
       
    public void addBook(Book book) {
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("INSERT INTO book(bookID, custID, carID, BookingDate, ReturnDate) VALUES (?,?,?,?,?)");
            preparedStatement.setString(1, book.getBookid());
            preparedStatement.setString(2, book.getCustid());
            preparedStatement.setString(3, book.getCarid());
            preparedStatement.setString(4, book.getBookingdate());
            preparedStatement.setString(5, book.getReturndate());
            preparedStatement.executeUpdate();           
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     public void deleteBook(String bookid){
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("DELETE FROM book WHERE bookID=?");
            preparedStatement.setString(1, bookid);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
    public String updateBook(Book book){
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("UPDATE book SET custID=?, carID=?, BookingDate=?, ReturnDate=? WHERE bookID=?");
           
            
            preparedStatement.setString(1, book.getCustid());
            preparedStatement.setString(2, book.getCarid());
            preparedStatement.setString(3, book.getBookingdate());
            preparedStatement.setString(4, book.getReturndate());
            preparedStatement.setInt(5, Integer.parseInt(book.getBookid()));
            
           int row=  preparedStatement.executeUpdate();
          return "line 67";
        }
         catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e);
            return e.toString();
        }
    }
    
     public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<Book>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM book");
            while (rs.next()){
                Book book = new Book();
                book.setBookid(rs.getString("bookID"));
                book.setCustid(rs.getString("custID"));
                book.setCarid(rs.getString("carID"));
                book.setBookingdate(rs.getString("BookingDate"));
                book.setReturndate(rs.getString("ReturnDate")); 
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }
     
  
    
    public Book getBookById(String bookid){
        Book book = new Book();
        try {
            PreparedStatement preparedStatement = 
                    connection.prepareStatement("SELECT * FROM book WHERE bookID=?");
            
            preparedStatement.setString(1, bookid);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                book.setBookid(rs.getString("bookID"));
                book.setCustid(rs.getString("custID"));
                book.setCarid(rs.getString("carID"));
                book.setBookingdate(rs.getString("BookingDate"));
                book.setReturndate(rs.getString("ReturnDate")); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }
}