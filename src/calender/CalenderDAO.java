package calender;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CalenderDAO {

	private Connection conn;
	private ResultSet rs;
	 
	public CalenderDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/bbs?serverTimezone=Asia/Seoul&useSSL=false";
			String dbID="root";
			String dbPassword="asdfqwer";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL ="SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //오류 
	}
	
	
	
}
