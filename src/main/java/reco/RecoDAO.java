package reco;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bbs.Bbs;

public class RecoDAO {

	private Connection conn;            // DB에 접근하는 객체
    private PreparedStatement pstmt;    // 
    private ResultSet rs;                // DB data를 담을 수 있는 객체  (Ctrl + shift + 'o') -> auto import
    
    public RecoDAO(){ 
        try {
            String dbURL = "jdbc:mysql://localhost:3306/BBS";
            String dbID = "root";
            String dbPassword = "root";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public Reco getReco(int bbsID)
    {
            String SQL = "SELECT * FROM RECO WHERE bbsID = ?"; 
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setInt(1, bbsID);
                rs = pstmt.executeQuery();
                if (rs.next())
                {
                    Reco reco = new Reco();
                    reco.setBbsID(rs.getInt(1));
                    reco.setLike_No(rs.getInt(2));
                    reco.setHate_No(rs.getInt(3));
                    return reco;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null; 
        }
    public int like(String bbsID, String userID) {

        try {
        	String SQL_like = "insert into recouser(like_user,bbsID) values(?,?)";
        	String SQL = "UPDATE RECO SET like_no = like_no + 1 WHERE bbsID = ?";
        	PreparedStatement pstmt = conn.prepareStatement(SQL);
        	PreparedStatement pstmt2 = conn.prepareStatement(SQL_like);
            pstmt.setInt(1, Integer.parseInt(bbsID));
            pstmt2.setString(1,userID);
            pstmt2.setInt(2, Integer.parseInt(bbsID));
            pstmt.executeUpdate();
            pstmt2.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    public int hate(String bbsID, String userID) {

        try {
        	String SQL_hate = "insert into recouser(hate_user,bbsID) values(?,?)";
        	String SQL = "UPDATE RECO SET hate_no = hate_no + 1 WHERE bbsID = ?";
        	PreparedStatement pstmt = conn.prepareStatement(SQL);
        	PreparedStatement pstmt2 = conn.prepareStatement(SQL_hate);
        	
            pstmt.setInt(1,Integer.parseInt(bbsID));
            pstmt2.setString(1,userID);
            pstmt2.setInt(2, Integer.parseInt(bbsID));
            pstmt.executeUpdate();
            pstmt2.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    public int check(String bbsID) {

        try {
        	String SQL = "select like_user, hate_user from recouser where  bbsID = ? ";
        	PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, bbsID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
            return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}
