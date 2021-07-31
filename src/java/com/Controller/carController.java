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

import com.DAO.carDAO;
import com.Model.Car;

/**
 *
 * @author user
 */
public class carController extends HttpServlet {

    private static String INSERT = "/carPage.jsp";
    private static String EDIT = "/carPage.jsp";
    private static String LIST_CAR = "/carPage.jsp";
    private carDAO dao;
    
    public carController() throws ClassNotFoundException {
        super();
        dao = new carDAO();
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
            String carid = request.getParameter("carid");
            dao.deleteCar(carid);
            forward = LIST_CAR;
            session.setAttribute("cars", dao.getAllCars());
        }
        else if (action.equalsIgnoreCase("edit")){
            forward = EDIT;
            String carid = request.getParameter("carid");
            Car car = dao.getCarById(carid);
            session.setAttribute("car", car);
        }
        else if (action.equalsIgnoreCase("listCar")){
            forward = LIST_CAR;
            session.setAttribute("cars", dao.getAllCars());
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
         
        Car car = new Car();
        car.setCarid(request.getParameter("carid"));
        car.setPlatno(request.getParameter("platno"));
        car.setCartype(request.getParameter("cartype"));
        car.setSeatcapacity(request.getParameter("seatcapacity"));
        car.setCarbrand(request.getParameter("carbrand"));
        car.setCarstatus(request.getParameter("carstatus"));
       
        
        if (action.equalsIgnoreCase("edit")){
          String row = dao.updateCar(car);
               RequestDispatcher view = request.getRequestDispatcher(LIST_CAR);
        session.setAttribute("cars", dao.getAllCars());
        view.forward(request, response);
        } else {
            dao.addCar(car);
             RequestDispatcher view = request.getRequestDispatcher(LIST_CAR);
        session.setAttribute("cars", dao.getAllCars());
        view.forward(request, response);
        }
        
 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
   
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
