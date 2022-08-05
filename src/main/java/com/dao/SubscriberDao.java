package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.Subscriber;
import com.util.ProjectUtil;

public class SubscriberDao {
	public static void addToSubscriber(Subscriber s)
	{
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="insert into subscriber(name,email) values(?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getName());
			pst.setString(2, s.getEmail());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
