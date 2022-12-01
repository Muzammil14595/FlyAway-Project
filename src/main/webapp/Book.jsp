<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Page</title>
</head>
<body>
<center>
<h1>Booking Confirmed</h1>
<%!
Connection con;
PreparedStatement pstmt;
%>
<%
	String source=request.getParameter("source");
	String dest= request.getParameter("dest");
	String fname=request.getParameter("fname");
	String lname= request.getParameter("lname");
	int mobile= Integer.parseInt(request.getParameter("mobile"));
	String email= request.getParameter("email");
	int persons= Integer.parseInt(request.getParameter("persons"));
	String date= request.getParameter("date");
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","root");
		pstmt=con.prepareStatement("insert into user values(?,?,?,?,?)");
		pstmt.setString(1, fname);
		pstmt.setString(2, lname);
		pstmt.setInt(3, mobile);
		pstmt.setString(4, email);
		pstmt.setInt(5, persons);
		
		pstmt.execute();
		System.out.println("Added user details...");
	}
	catch(Exception e)
	{
		System.out.println(e);

	}
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","root");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("Select * from available_flights");
			while(rs.next()){
				if(source.equalsIgnoreCase(rs.getString(1)) && dest.equalsIgnoreCase(rs.getString(2)))
				{
				
					out.println("Source: "+rs.getString(1));
					out.print("<br/>");
					out.println("Destination: "+rs.getString(2));
					out.print("<br/>");
					out.println("Airline: "+rs.getString(3));
					out.print("<br/>");
					out.println("Total Ticket Price: "+(rs.getInt(4))*persons);
					out.print("<br/>");
					out.println("Date: "+date);
					out.print("<br/>");
					out.println("Airline: "+rs.getString(5));
					out.print("<br/>"); 
					out.println("First Name: "+ fname); 
					out.print("<br/>");
					out.println("Last Name: "+ lname);
					out.print("<br/>");
					out.println("Mobile no: "+ mobile);
					out.print("<br/>");
					out.println("Email id: "+ email);
					out.print("<br/>");
				}
			 }
		}
		catch(Exception e)
		{
			System.out.println(e);
		} 
		
		int card= Integer.parseInt(request.getParameter("card"));
		String holder= request.getParameter("holder");
		int month= Integer.parseInt(request.getParameter("month"));
		int year= Integer.parseInt(request.getParameter("year"));
		int cvv= Integer.parseInt(request.getParameter("cvv"));
		
		 try{
			Class.forName("com.mysql.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","root");
			pstmt=con.prepareStatement("insert into payment values(?,?,?,?,?)");
			pstmt.setInt(1, card);
			pstmt.setString(2, holder);
			pstmt.setInt(3, month);
			pstmt.setInt(4, year);
			pstmt.setInt(5, cvv);
			
			pstmt.execute();
			System.out.println("Payment done");
		}
		catch(Exception e)
		{
			System.out.println(e);
		} 
%>

<!-- <h1>Payment</h1>
<form action="Finalpage2.jsp">
Card No.<input type="text" name="card"><br>
Card Holder's Name:<input type="text" name="holder"><br>
Month: <input type="text" name="month"><br>
Year: <input type="text" name="year"><br>
CVV no. <input type="text" name="cvv"><br><br>
Source: <input type="text" name="source"><br><br>
Destination: <input type="text" name="dest"><br><br>


<input type="submit" value="Confirm">
</form> -->
</center>
</body>
</html>