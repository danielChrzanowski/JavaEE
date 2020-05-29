package servlets;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ImageServlet", urlPatterns = {"/ImageServlet"})
public class ImageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/jpg");
        OutputStream out = response.getOutputStream();
        ServletContext sc = getServletContext();

        InputStream is = sc.getResourceAsStream("/images/image.jpg");
        BufferedImage bufferedImage = ImageIO.read(is);

        Graphics g = bufferedImage.getGraphics();
        g.drawString("NAPIS", 520, 320);
        g.setColor(Color.YELLOW);
        g.fillOval(150, 150, 100, 100);
        g.setColor(Color.GREEN);
        g.fillRect(300, 50, 50, 50);
        ImageIO.write(bufferedImage, "jpg", out);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
