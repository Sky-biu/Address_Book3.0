package com.example.demo.service;

import com.example.demo.bean.User;
import com.example.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public List<User> getUserList() {
        return userMapper.getUserList();
    }

    public StringBuffer selectUser(String Name){
        List<User> users = userMapper.selectUser(Name);
        StringBuffer strb = new StringBuffer();
        strb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        strb.append("<persons>");
        for (int i = 0;i<users.size();i++) {
            User s = users.get(i);
            strb.append("<person>");
            strb.append("<pid>"+s.getID()+"</pid>");
            strb.append("<pname>"+s.getName()+"</pname>");
            strb.append("<phone>"+s.getPhone_number()+"</phone>");
            strb.append("</person>");
        }
        strb.append("</persons>");
        return strb;
    }

    public void addUser(String Name,String Phone_number){
        userMapper.addUser(Name,Phone_number);
    }

    public void delUser(int ID){
        userMapper.delUser(ID);
    }

    public void updateUser(int ID, String Name, String Phone_number){
        userMapper.updateUser(ID,Name,Phone_number);
    }

}

