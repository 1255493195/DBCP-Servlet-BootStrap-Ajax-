package cn.bobozz.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;

public class JdbcConnection {

	private static BasicDataSource bs = null;
	
	static {
		Properties p = new Properties();
		try {
			p.load(JdbcConnection.class.getClassLoader().getResourceAsStream("db.properties"));
			String url=p.getProperty("url");
			String driver = p.getProperty("driver");
			String user = p.getProperty("user");
			String password = p.getProperty("password");
			
			bs = new BasicDataSource();
			bs.setUrl(url);
			bs.setDriverClassName(driver);
			bs.setUsername(user);
			bs.setPassword(password);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static Connection getConn() throws SQLException {
		return bs.getConnection();
	}
	
	public static void closeConn(Connection conn) {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
