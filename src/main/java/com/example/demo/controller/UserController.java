package com.example.demo.controller;

import com.example.demo.bean.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@Controller
public class UserController {
    @Autowired
    private UserService userServer;

    @RequestMapping("/ajaxtest")
    public void Queryx(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String Name = request.getParameter("Name");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml;charset=UTF-8");
        StringBuffer strs = userServer.selectUser(Name);
        response.getWriter().write(strs.toString());
    }

    @RequestMapping("/index")
    public String Index(Model model){
        return "index";
    }

    @RequestMapping("/addtest")
    public void addUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String Name = request.getParameter("Name");
        String Phone_number = request.getParameter("Phone_number");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml;charset=UTF-8");
        userServer.addUser(Name,Phone_number);
    }

    @RequestMapping("/deltest")
    public void delUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int ID = Integer.parseInt(request.getParameter("ID"));
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml;charset=UTF-8");
        userServer.delUser(ID);
    }

    @RequestMapping("/updatetest")
    public void updateUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int ID = Integer.parseInt(request.getParameter("ID"));
        String Name = request.getParameter("Name");
        String Phone_number = request.getParameter("Phone_number");
        userServer.updateUser(ID,Name,Phone_number);
    }
}
