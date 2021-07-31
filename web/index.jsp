<%-- 
    Document   : index
    Created on : Jun 15, 2021, 1:09:05 PM
    Author     : user
--%>
<%@page import="java.sql.*"%>
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
				<li><a href="index.jsp" style="color: #ffffff; background-color:#918479"><i class="fas fa-home"></i> Home </a></li>
				<li><a href="custPage.jsp"><i class="fas fa-customer"></i> Customer</a></li>
				<li><a href="carPage.jsp"> <i class="fas fa-carrental"></i> Car Rental</a>
				</li>
				<li><a href="bookPage.jsp"><i class="fas fa-booking"></i> Booking</a></li>
			</ul>
		</div>

<div id="content">
	<h2><b>Home</b></h2>
	<p style="font-size: 20px;">Car Availability</p>

<table>
  <tr>   
    <th id="th">PLAT NO</th>
    <th id="th">TYPE</th>
    <th id="th">SEAT CAPACITY</th>
    <th id="th">BRAND</th>
    <th id="th">STATUS</th>
  </tr>
  
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/crms";
    Connection con = DriverManager.getConnection(url, "root", "admin");
    Statement statement=con.createStatement();
    String sql ="select platNo, carType, seatCapacity, brand, status from car where status='Available'";
    ResultSet resultSet = statement.executeQuery(sql);
    while(resultSet.next()){

%>

  <tr>
    <td><%=resultSet.getString("platNo") %></td>
    <td><%=resultSet.getString("carType") %></td> 
    <td><%=resultSet.getString("seatCapacity") %></td>
    <td><%=resultSet.getString("brand") %></td>
    <td><%=resultSet.getString("status") %></td>
  </tr>

<%
    }
    con.close();
    } catch (Exception e) {
    e.printStackTrace();
    }
%>
</table>
        
</div>
     
</div>

	<div id="footer">
		<i> &copy;2021 CAR RENTAL MANAGEMENT SYSTEM RentMe </i>
	</div>
	
</body>
</html>
