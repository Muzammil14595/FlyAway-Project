<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Final page</title>
</head>
<body>
<center>
<h1>Booking Confirmed!</h1>
<%!
Connection con;
Statement stmt;
PreparedStatement pstmt;
%>
<%
	
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
	
	String source=request.getParameter("source");
	String dest= request.getParameter("dest");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","root");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from available_flights");
		while(rs.next()){
			if(source.equalsIgnoreCase(rs.getString(1)) && dest.equalsIgnoreCase(rs.getString(2)))
			{
				out.println("Source: "+rs.getString(1));
				out.print("<br/>");
				out.println("Destination: "+rs.getString(2));
				out.print("<br/>");
				out.println("Airline: "+rs.getString(3));
				out.print("<br/>");
				out.println("Ticket Price: "+rs.getInt(4));
			}
				
			}
		}
		catch(Exception e)
		{
			System.out.println(e);

		}
	
%>

</center>
</html>