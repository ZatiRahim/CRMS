<%-- 
    Document   : carPage
    Created on : Jun 15, 2021, 1:17:00 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="com.Model.Car" %>

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
				<li><a href="custPage.jsp"><i class="fas fa-customer"></i> Customer</a></li>
				<li>
				<a href="carPage.jsp"style="color: #ffffff; background-color:#918479"> <i class="fas fa-carrental"></i> Car Rental</a>
				</li>
				<li><a href="bookPage.jsp"><i class="fas fa-booking"></i> Booking</a></li>
			</ul>
		</div>

<div id="content">
	<h2><b>Car Rental</b></h2>
	<p style="font-size: 20px;">Car Information</p>

<table>
    
  <tr>  
    <th id="th">CAR ID</th> 
    <th id="th">PLAT NO</th>
    <th id="th">TYPE</th>
    <th id="th">SEAT CAPACITY</th>
    <th id="th">BRAND</th>
    <th id="th">STATUS</th>
    <th id="th" colspan="2">ACTION</th>
  </tr>
  
<c:forEach items="${cars}" var="car">
  <tr>
    <td><c:out value="${car.carid}" /></td>
    <td><c:out value="${car.platno}" /></td>
    <td><c:out value="${car.cartype}" /></td>
    <td><c:out value="${car.seatcapacity}" /></td>
    <td><c:out value="${car.carbrand}" /></td>
    <td><c:out value="${car.carstatus}" /></td> 
    <td><button type="submit" class="button" data-toggle="modal" data-target="#edit">
            <a href="carController?action=edit&carid=<c:out value="${car.carid}" />">Edit</a></button>&nbsp</td>
    <td><button><a href="carController?action=delete&carid=<c:out value="${car.carid}" />">Delete</a></button>&nbsp</td>   
  </tr>
</c:forEach>
  
</table>

<br><br>

 <div class="modal fade" id="edit" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit Rental Car Information </h4>
        </div>

        <div class="modal-body">
                <form id="formEditCar" action="carController?action=edit" method="post">   
                    <div class="form-group">
                    	<label>Plat No</label>
                        <input type="hidden" name="carid" value="<c:out value="${car.carid}" />" />
                       <input type="text" class="form-control" name="platno" readonly="readonly" placeholder="Eg: VAX 8765" value="<c:out value="${car.platno}" />" />
                    </div>
                    <div class="form-group">  
                    	<label>Car Type</label>
                       <input list="cartypeList" id="cartype" class="form-control" name="cartype" readonly="readonly" value="<c:out value="${car.cartype}" />" />
                        <datalist id="cartypeList">
                            <option value="Hatchback">
                            <option value="Sedan"> 
                            <option value="MPV">   
                        </datalist>   
                    </div>
                    <div class="form-group">  
                    	<label>Seat Capacity</label>
                        <input list="seatcapacityList" id="seatcapacity" class="form-control" name="seatcapacity" readonly="readonly" value="<c:out value="${car.seatcapacity}" />" />
                        <datalist id="seatcapacityList">
                            <option value="5">
                            <option value="7">   
                        </datalist>     
                    </div>
                    <div class="form-group">   
                    	<label>Car Brand</label>
                       <input type="text" class="form-control" autocomplete="off" name="carbrand" readonly="readonly" placeholder="Eg: Myvi" value="<c:out value="${car.carbrand}" />" />   
                    </div>
                    <div class="form-group">
                        <c:set var="status" value="carstatus" />
                        <label>Car Status</label><br>
                        <div class="form-check">
                        <input class="form-check-input" type="radio" name="carstatus" value="Available"
                               <c:if test="${status.contains('Available')}"> checked="checked" </c:if> />
                            <label class="form-check-label" for="Radio1">Available</label> 
                        </div>
                        <div class="form-check">   
                        <input class="form-check-input" type="radio" name="carstatus" value="Not Available"
                               <c:if test="${status.contains('Not Available')}"> checked="checked" </c:if> />
                            <label class="form-check-label" for="Radio2">Not Available</label>
                        </div>
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
          <h4 class="modal-title">Add Rental Car Information </h4>
        </div>

        <div class="modal-body">
                <form name="formAddCar" action="carController" method="post">
                    <div class="form-group">
                    	<label>Plat No</label>
                        <input type="text" class="form-control" name="platno" placeholder="Eg: VAX 8765" required="required" />
                    </div>
                    <div class="form-group">
                    	<label>Car Type</label>
                       <input list="cartypeList" id="cartype" class="form-control" name="cartype" />
                        <datalist id="cartypeList">
                            <option value="Hatchback">
                            <option value="Sedan"> 
                            <option value="MPV">   
                        </datalist>
                    </div>
                    <div class="form-group">
                    	<label>Seat Capacity</label>
                         <input list="seatcapacityList" id="seatcapacity" class="form-control" name="seatcapacity" />
                        <datalist id="seatcapacityList">
                            <option value="5">
                            <option value="7">   
                        </datalist>      
                    </div>
                    <div class="form-group">
                    	<label>Car Brand</label>
                        <input type="text" class="form-control" autocomplete="off" id="carbrand" name="carbrand" placeholder="Eg: Myvi" required="required" />
                    </div>
                    <div class="form-group">
                        <label>Car Status</label><br>
                        <div class="form-check">
                        <input class="form-check-input" type="radio" name="carstatus" value="Available"/>
                            <label class="form-check-label" for="Radio1">Available</label>
                        </div>
                        <div class="form-check">
                        <input class="form-check-input" type="radio" name="carstatus" value="Not Available"/>
                            <label class="form-check-label" for="Radio2">Not Available</label>
                        </div>
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
	
<script>    
$(document).on('keypress', '#carbrand', function (event) {
    var regex = new RegExp("^[a-zA-Z ]+$");
    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
        alert('Only alphabets are allowed');
        event.preventDefault();
        return false;
    }
});
</script> 
</body>
</html>
