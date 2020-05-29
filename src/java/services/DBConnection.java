package services;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

public class DBConnection {

    static Connection connection = null;

    private DBConnection() {
    }

    public static Connection getDBConnectionFromContext() {
        if (connection == null) {
            try {
                javax.naming.Context initContext = new javax.naming.InitialContext();
                javax.naming.Context envContext = (javax.naming.Context) initContext.lookup("java:/comp/env");
                javax.sql.DataSource ds_mysql = (javax.sql.DataSource) envContext.lookup("jdbc/sky-33_Daniel");

                connection = ds_mysql.getConnection();
            } catch (NamingException | SQLException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return connection;
    }

}
