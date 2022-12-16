package cdu.zch.controller;

import cdu.zch.service.NewsService;
import cdu.zch.service.impl.NewsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/news/delete")
public class NewsDeleteServlet extends HttpServlet {

    NewsService newsService = new NewsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");;
//        newsService.del(Integer.parseInt(req.getParameter("id")));
        newsService.deleteNews(sid);

        System.out.println("修改完成");
//        req.getRequestDispatcher("latestComicInfo").forward(req,resp);
    }
}