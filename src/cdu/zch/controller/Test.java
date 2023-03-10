package cdu.zch.controller;

import cdu.zch.model.User;
import cdu.zch.service.UserService;
import cdu.zch.service.impl.UserServiceImpl;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/test")
public class Test extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        User user = userService.selectByUserId(Integer.parseInt(req.getParameter("id")));

        Map<String, Object> map = new HashMap<>();
        map.put("user", user);
        map.put("status", "200");
        String json = new Gson().toJson(map);
        System.out.println(json);

        if(user != null){
//            System.out.println(user);
            out.write(json);
        }else{
            out.write("false");
        }
    }
}
