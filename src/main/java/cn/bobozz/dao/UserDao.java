package cn.bobozz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.bobozz.bean.User;
import cn.bobozz.bean.UserPro;
import cn.bobozz.util.JdbcConnection;

public class UserDao {

	private Connection conn = null;
	
	public boolean loginUser(User user) {
		
		PreparedStatement pstm = null;
		String sql = "select * from user where username=? and password=? limit 1";
		boolean b = false;
		try {
			conn = JdbcConnection.getConn();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, user.getUsername());
			pstm.setString(2, user.getPassword());
			ResultSet rs = pstm.executeQuery();
			if(rs.next()) {
				b = true;
				pstm.close();
				conn.close();
			}else {
				pstm.close();
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	
	public boolean reqUser(UserPro userpro) {
		
		PreparedStatement pstm = null;
		String sql = "insert into user_pro values(?,?,?,?,?,?)";
		String sql1 = "insert into user values(?,?,?)";
		boolean r = false;
		try {
			conn = JdbcConnection.getConn();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userpro.getUid());
			pstm.setString(2, userpro.getUsername());
			pstm.setString(3, userpro.getPassword());
			pstm.setString(4, userpro.getAddress());
			pstm.setString(5, userpro.getTel());
			pstm.setString(6, userpro.getEmail());
			PreparedStatement pstm1 = conn.prepareStatement(sql1);
			pstm1.setString(1, userpro.getUid());
			pstm1.setString(2, userpro.getUsername());
			pstm1.setString(3, userpro.getPassword());
			pstm1.executeUpdate();
			int rs = pstm.executeUpdate();
			if(rs != 0) {
				r = true;
				pstm.close();
				conn.close();
			}else {
				pstm.close();
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r;
	}
	
	
	public List<UserPro> queryUser(){
		PreparedStatement pstm = null;
		List<UserPro> userpros = new ArrayList<UserPro>();
		String sql = "select * from user_pro";
		try {
			conn = JdbcConnection.getConn();
			pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			userpros = new ArrayList<UserPro>();
			while(rs.next()) {
				UserPro userpro = new UserPro();
				userpro.setUid(rs.getString(1));
				userpro.setUsername(rs.getString(2));
				userpro.setPassword(rs.getString(3));
				userpro.setAddress(rs.getString(4));
				userpro.setTel(rs.getString(5));
				userpro.setEmail(rs.getString(6));
				userpros.add(userpro);
			}
			pstm.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userpros;
	}
	
	
	public boolean deleteUser(String uid) {
		PreparedStatement pstm = null;
		boolean d = false;
		String sql = "delete from user where uid=?";
		String sql1 = "delete from  user_pro where uid=?";
		try {
			conn = JdbcConnection.getConn();
			pstm = conn.prepareStatement(sql);
			PreparedStatement pstm1 = conn.prepareStatement(sql1);
			pstm.setString(1, uid);
			pstm1.setString(1, uid);
			int rs = pstm.executeUpdate();
			pstm1.executeUpdate();
			if(rs != 0) {
				d = true;
			}
			pstm.close();
			pstm1.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
		
	}
	
	
	public boolean editUser(UserPro userpro) {
		PreparedStatement pstm = null;
		String sql = "update user_pro set uid=?,username=?,password=?,address=?,tel=?,email=? where uid=?";
		String sql1 = "update user_pro set uid=?,username=?,password=? where uid=?";
		boolean eu = false;
		try {
			conn = JdbcConnection.getConn();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userpro.getUid());
			pstm.setString(2, userpro.getUsername());
			pstm.setString(3, userpro.getPassword());
			pstm.setString(4, userpro.getAddress());
			pstm.setString(5, userpro.getTel());
			pstm.setString(6, userpro.getEmail());
			pstm.setString(7, userpro.getUid());
			PreparedStatement pstm1 = conn.prepareStatement(sql1);
			pstm1.setString(1, userpro.getUid());
			pstm1.setString(2, userpro.getUsername());
			pstm1.setString(3, userpro.getPassword());
			pstm1.setString(4, userpro.getUid());
			pstm1.executeUpdate();
			int rs = pstm.executeUpdate();
			if(rs != 0) {
				eu = true;
				pstm.close();
				conn.close();
			}else {
				pstm.close();
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return eu;
	}
}
