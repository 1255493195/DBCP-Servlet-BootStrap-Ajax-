package cn.bobozz.service;

import java.util.List;

import cn.bobozz.bean.User;
import cn.bobozz.bean.UserPro;
import cn.bobozz.dao.UserDao;

public class UserService {

	private UserDao userdao = new UserDao();
	public boolean loginUserService(User user) {
		return userdao.loginUser(user);
	}
	public boolean reqUserService(UserPro userpro) {
		return userdao.reqUser(userpro);
	}
	public List<UserPro> queryUserService(){
		return userdao.queryUser();
	}
	public boolean deleteUserService(String uid) {
		return userdao.deleteUser(uid);
	}
	public boolean editUserService(UserPro userpro) {
		return userdao.editUser(userpro);
	}
}
