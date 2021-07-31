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

import com.DAO.custDAO;
import com.Model.Cust;

public class custController extends HttpServlet {
    

    private static String INSERT = "/custPage.jsp";
    private static String EDIT = "/custPage.jsp";
    private static String LIST_CUST = "/custPage.jsp";
    private custDAO dao;
    
    public custController() throws ClassNotFoundException {
        super();
        dao = new custDAO();
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
            String custid = request.getParameter("custid");
            dao.deleteCust(custid);
            forward = LIST_CUST;
            session.setAttribute("custs", dao.getAllCusts());
        }
        else if (action.equalsIgnoreCase("edit")){
            forward = EDIT;
            String custid = request.getParameter("custid");
            Cust cust = dao.getCustById(custid);
            session.setAttribute("cust", cust);
        }
        else if (action.equalsIgnoreCase("listCust")){
            forward = LIST_CUST;
            session.setAttribute("custs", dao.getAllCusts());
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
         
        Cust cust = new Cust();
        cust.setCustid(request.getParameter("custid"));
        cust.setIcno(request.getParameter("icno"));
        cust.setName(request.getParameter("name"));
        cust.setContact(request.getParameter("contact"));
        cust.setEmail(request.getParameter("email"));
    
        
        if (action.equalsIgnoreCase("edit")){
          String row =  dao.updateCust(cust);
               RequestDispatcher view = request.getRequestDispatcher(LIST_CUST);
        session.setAttribute("custs", dao.getAllCusts());
        view.forward(request, response);
        } else {
            dao.addCust(cust);
             RequestDispatcher view = request.getRequestDispatcher(LIST_CUST);
        session.setAttribute("custs", dao.getAllCusts());
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
