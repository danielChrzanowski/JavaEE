package rest;

import dao.StudentDAO;
import java.sql.SQLException;
import java.util.List;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import models.Student;

@Path("studentREST")
public class StudentREST {

    public StudentREST() {
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Student> getJSON() throws SQLException {

        return StudentDAO.getAll();
    }

}
