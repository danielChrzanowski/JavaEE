package dao;

import services.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Student;

public class StudentDAO {

    public void addStudent(Student student) {
        try {
            Connection conn = DBConnection.getDBConnectionFromContext();
            Statement statement = conn.createStatement();
            statement.executeUpdate("insert into tss_students(imie, nazwisko, email) VALUES ('" + student.getImie() + "', '" + student.getNazwisko() + "', '" + student.getEmail() + "')");

        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<Student> getAll() {
        List<Student> list = new LinkedList<>();

        try {
            Connection conn = DBConnection.getDBConnectionFromContext();
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select * from tss_students");

            while (rs.next()) {
                Student student = new Student(rs.getInt("id"), rs.getString("imie"), rs.getString("nazwisko"), rs.getString("email"));
                list.add(student);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public static Student getStudentById(int id) {
        String sql = "select * from tss_students where id = " + id;
        Student student = null;

        try {
            Connection conn = DBConnection.getDBConnectionFromContext();
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);

            if (rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString("imie"), rs.getString("nazwisko"), rs.getString("email"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return student;
    }

    public void edit(int id, String imie, String nazwisko, String email) {
        try {
            String sql = "update tss_students SET imie='" + imie + "', nazwisko='" + nazwisko + "', email='" + email + "' where id=" + id;
            Connection conn = DBConnection.getDBConnectionFromContext();
            Statement statement = conn.createStatement();
            statement.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void delete(int id) {
        try {
            String sql = "delete from tss_students where id=" + id;
            Connection conn = DBConnection.getDBConnectionFromContext();
            Statement statement = conn.createStatement();
            statement.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
