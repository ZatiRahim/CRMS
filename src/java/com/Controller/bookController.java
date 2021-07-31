/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.bookDAO;
import com.Model.Book;

import com.DAO.carDAO;
import com.Model.Car;

import com.DAO.custDAO;
import com.Model.Cust;
/**
 *
 * @author user
 */
public class bookController extends HttpServlet {

    private static String INSERT = "/bookPage.jsp";
    private static String EDIT = "/bookPage.jsp";
    private static String LIST_BOOK = "/bookPage.jsp";
    private bookDAO dao;
    private carDAO dao1;
    private custDAO dao2;

    public bookController() throws ClassNotFoundException {
        super();
        dao = new bookDAO();
        dao1 = new carDAO();
        dao2 = new custDAO();
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
        String forward ="";
        String action = request.getParameter("action");
        
        HttpSession session = request.getSession();
        
        if (action.equalsIgnoreCase("delete")){
            String bookid = request.getParameter("bookid");
            dao.deleteBook(bookid);
            forward = LIST_BOOK;
            session.setAttribute("books", dao.getAllBooks());
        }
        else if (action.equalsIgnoreCase("edit")){
            forward = EDIT;
            String bookid = request.getParameter("bookid");
            Book book = dao.getBookById(bookid);
            session.setAttribute("book", book);
        }
        else if (action.equalsIgnoreCase("listBook")){
            forward = LIST_BOOK;
            session.setAttribute("books", dao.getAllBooks());
            session.setAttribute("custs", dao2.getAllCusts());
      
        }
        else if (action.equalsIgnoreCase("insert")){
            forward = INSERT;
        }
        
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
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
        String action = request.getParameter("action");
        
        HttpSession session = request.getSession();
        
        // Create a class to add a new Booking
        Book book = new Book();
        book.setBookid(request.getParameter("bookid"));
        book.setCustid(request.getParameter("custid"));
        book.setCarid(request.getParameter("carid"));
        book.setBookingdate(request.getParameter("bookingdate"));
        book.setReturndate(request.getParameter("returndate"));
        
        // Create a class to update the car status = Unavailable
        Car car = new Car();
        car.setCarid(request.getParameter("carid"));
        car.setCarstatus("Not Available");
        
        if (action.equalsIgnoreCase("edit")){
          String row =  dao.updateBook(book);
               RequestDispatcher view = request.getRequestDispatcher(LIST_BOOK);
        session.setAttribute("books", dao.getAllBooks());
        view.forward(request, response);
        } else {
            dao.addBook(book);
            String row=  dao1.updateCarStatus(car);
             RequestDispatcher view = request.getRequestDispatcher(LIST_BOOK); // List out the booking list in booking page
        session.setAttribute("books", dao.getAllBooks());
        view.forward(request, response);
        }
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