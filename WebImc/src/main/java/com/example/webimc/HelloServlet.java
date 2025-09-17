package com.example.webimc;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loginServlet", value = "/login")
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String message = "Servlet executado por get";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + request.getParameter("login") + "</h1>");
        out.println("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login, senha;
        login=req.getParameter("login");
        senha=req.getParameter("senha");
        String emailRegex = "^[\\w-.]+@[\\w-]+\\.[a-zA-Z]{2,}$";
        if(login!=null && senha!=null){
            String email;
            if(login.matches(emailRegex)){
                if(senha.equals(login.split("@")[0])){
                    // armazenar os dados do usuário na session
                    Usuario usuario = new Usuario(login,senha);
                    HttpSession session=req.getSession();
                    session.setAttribute("usuario",usuario);
                    resp.sendRedirect("index.jsp"); return;
                }
            }
        }
        resp.sendRedirect("."); return;
    }
}