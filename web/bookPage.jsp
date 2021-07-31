<%-- 
    Document   : bookPage
    Created on : Jun 15, 2021, 1:16:03 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="com.Model.Book" %>
<%@page import="com.Model.Cust" %>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="cust.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	
	<div id="header">
		<img src="images/rentme.png" alt="Company Logo">
		<h2>Your drive with our care</h2>
	</div>

<div id="wrapper">
		<div id="nav">
			<ul>
				<li id="profile"><i class="fas fa-user-cog"></i><br>STAFF</li>
				<li><a href="index.jsp"><i class="fas fa-home"></i> Home </a></li>
				<li><a href="cust.jsp"><i class="fas fa-customer"></i> Customer</a></li>
				<li>
				<a href="car.jsp"> <i class="fas fa-carrental"></i> Car Rental</a>
				</li>
				<li><a href="book.jsp" style="color: #ffffff; background-color:#918479"><i class="fas fa-booking"></i> Booking</a></li>
			</ul>
		</div>

<div id="content">
	<h2><b>Booking</b></h2>
	<p style="font-size: 20px;">Booking Information</p>

<table>
    
<c:out value="Customer ID:" /> 
<c:forEach items="${custs}" var="cust">
<c:out value="${cust.custid}" /></c:forEach>
<br>
<c:out value="Car ID:" />
<c:forEach items="${cars}" var="car">
<c:out value="${car.carid}" /></c:forEach>
<br>

  <tr>  
    <th id="th">BOOKING ID</th> 
    <th id="th">CUSTOMER ID</th>
    <th id="th">CAR ID</th>
    <th id="th">BOOKING DATE</th>
    <th id="th">RETURN DATE</th>
    <th id="th" colspan="2">ACTION</th>
  </tr>

  <c:forEach items="${books}" var="book">
  <tr>
    <td><c:out value="${book.bookid}" /></td>
    <td><c:out value="${book.custid}" /></td>
    <td><c:out value="${book.carid}" /></td>
    <td><c:out value="${book.bookingdate}" /></td>
    <td><c:out value="${book.returndate}" /> </td> 
    <td><button type="submit" class="button" data-toggle="modal" data-target="#edit">
    <a href="bookController?action=edit&bookid=<c:out value="${book.bookid}" />">Edit</a></button>&nbsp</td>
            <td><button><a href="bookController?action=delete&bookid=<c:out value="${book.bookid}" />">Delete</a></button>&nbsp</td>  
  </tr>
</c:forEach>
  
</table>

<br><br>

 <div class="modal fade" id="edit" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        
          <h4 class="modal-title">Edit Booking Information </h4>
        </div>

        <div class="modal-body">
                 <form id="formEditBook" action="bookController?action=edit" method="post">
                    <div class="form-group">
                    	<label>CUSTOMER ID</label>
                        <input type="hidden" name="bookid" value="<c:out value="${book.bookid}" />" />
                       <input type="text" class="form-control" name="custid" value="<c:out value="${book.custid}" />" />
                    </div>
 			<div class="form-group">
                    	<label>CAR ID</label>
                       <input type="text" class="form-control" autocomplete="off" name="carid"  value="<c:out value="${book.carid}" />"/>
                    </div>

                    <div class="form-group">
                    	<label>BOOKING DATE</label>
                       <input type="date" class="form-control" autocomplete="off" name="bookingdate" value="<c:out value="${book.bookingdate}" />"/>
                    </div>
                    <div class="form-group">
                    	<label>RETURN DATE</label>
                        <input type="date" class="form-control" autocomplete="off" name="returndate" value="<c:out value="${book.returndate}" />" />
                    </div>
                    
                  
     

                       <button type="submit" id="myBtn" class="btn btn-primary">Save</button>
                </form>
</div>

      </div>
     </div>
   </div>


<button type="button" class="button" data-toggle="modal" data-target="#add">Add</button>


  <div class="modal fade" id="add" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add New Booking Information </h4>
        </div>

         <div class="modal-body">
               
         <form onsubmit="return Validate()" name="formAddCar" action="bookController" method="post">

                    <div class="form-group">
                    	<label>CUSTOMER ID</label>
                        <input type="text" class="form-control" name="custid" required />
                    </div>
                   
		    <div class="form-group">
                    	<label>CAR ID</label>
                       <input type="text" class="form-control" autocomplete="off" name="carid" required />
                    </div>

                    <div class="form-group">
                    	<label>BOOKING DATE</label>
                        <input type="date" class="form-control" autocomplete="off" name="bookingdate" required />
                    </div>
                    <div class="form-group">
                    	<label>RETURN DATE</label>
                        <input type="date" class="form-control" autocomplete="off" name="returndate" required />
                    </div>
                  
 <input type="hidden" name="action" value="insert" />
                    
                       <button type="submit" id="myBtn" class="btn btn-primary">Save</button>
                </form>
        </div> 

      </div>
     </div>
   </div>
</div>
                    </div>



	<div id="footer">
		<i> &copy;2021 CAR RENTAL MANAGEMENT SYSTEM RentMe </i>
	</div>
		
</body>
</html>