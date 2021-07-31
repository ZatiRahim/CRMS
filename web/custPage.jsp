<%-- 
    Document   : custPage
    Created on : Jun 15, 2021, 1:17:37 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="com.Model.Cust" %>

<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="custValidation.js"></script>
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
				<li><a href="custPage.jsp" style="color: #ffffff; background-color:#918479"><i class="fas fa-customer"></i> Customer</a></li>
				<li><a href="carPage.jsp"> <i class="fas fa-carrental"></i> Car Rental</a>
				</li>
				<li><a href=" bookPage.jsp"><i class="fas fa-booking"></i> Booking</a></li>
			</ul>
		</div>

<div id="content">
	<h2><b>Customer</b></h2>
	<p style="font-size: 20px;">Customer Information</p>

<table>
  <tr>  
    <th id="th">CUSTOMER ID</th> 
    <th id="th">IC NUMBER</th> 
    <th id="th">NAME</th>
    <th id="th">CONTACT NO</th>
    <th id="th">EMAIL ADDRESS</th>
    <th id="th" colspan="2">ACTION</th>
  </tr>

 <c:forEach items="${custs}" var="cust">
  <tr>
    <td><c:out value="${cust.custid}" /></td>
    <td><c:out value="${cust.icno}" /></td>
    <td><c:out value="${cust.name}" /></td>
    <td><c:out value="${cust.contact}" /></td>
    <td><c:out value="${cust.email}" /></td> 
    <td><button type="submit" class="button" data-toggle="modal" data-target="#edit">
            <a href="custController?action=edit&custid=<c:out value="${cust.custid}" />">Edit</a></button>&nbsp</td>
    <td><button><a href="custController?action=delete&custid=<c:out value="${cust.custid}" />">Delete</a></button>&nbsp</td>   
  </tr>
 </c:forEach>

</table>

<br><br>

 <div class="modal fade" id="edit" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit Customer Information </h4>
        </div>

        <div class="modal-body">
                <form id = "formEditCust" action="custController?action=edit" method="post">
                    <div class="form-group">
                    	<label>IC No</label>
                        <input type="hidden" name="custid" value="<c:out value="${cust.custid}" />" />
                        <input type="text"   class="form-control" name="icno" placeholder="Eg: 970518081234" value="<c:out value="${cust.icno}" />"  />
                       
                    </div>
                    <div class="form-group">
                    	<label>Name</label>
                       <input type = "text" class="form-control" name="name" placeholder="Eg:Name" value="<c:out value="${cust.name}" />" />
                    </div>
                    <div class="form-group">
                    	<label> Contact No </label>
                       <input type="text" class="form-control" name="contact" placeholder="Eg:0111436802" value="<c:out value="${cust.contact}" />"/>
                    </div>
                    <div class="form-group">
                    	<label>Email Address</label>
                       <input type="text" class="form-control"  name="email" placeholder="Eg:abc@gmail.com" value="<c:out value="${cust.email}" />"/>
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
          <h4 class="modal-title">Add Customer Information </h4>
        </div>

        <div class="modal-body">
            <form onsubmit="return Validate()" name="formAddCust" action="custController" method="post">
            
                    <div class="form-group">
                    	<label>IC No</label>
                       <input type="text" id="icno" class="form-control" name="icno" placeholder="Eg: 970518081234" required/>
                    </div>
                    <div class="form-group">
                    	<label>Name</label>
                       <input type = "text" id="name" class="form-control" name="name" placeholder="Eg: Name" required />
                    </div>
                    <div class="form-group">
                    	<label>Contact No </label>
                       <input type="text" id="contact" class="form-control" name="contact" placeholder="Eg: 0111436802"  required/>
                    </div>
                    <div class="form-group">
                    	<label>Email Address</label>
                       <input type="text" class="form-control"  id="email" name="email" placeholder="Eg: abc@gmail.com" required />
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