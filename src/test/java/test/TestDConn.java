package test;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

import cn.bobozz.util.JdbcConnection;

public class TestDConn {

	@Test
	public void testconn() throws SQLException {
		Connection c = JdbcConnection.getConn();
		System.out.println(c);
	}
}
