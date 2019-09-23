package cn.bobozz.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Jdbc {

	private static final String url = "jdbc:mysql://localhost:3306/mavenpro?useUnicode=true&characterEncoding=UTF-8";
	private static final String user = "root";
	private static final String password = "zhaojianbo";
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
}
