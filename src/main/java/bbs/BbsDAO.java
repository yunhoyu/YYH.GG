package bbs;
 
import java.sql.*;
import java.util.*;
 
public class BbsDAO {
    private Connection conn;           
    private ResultSet rs; 
    
    public BbsDAO(){ 
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
    public String getDate() // 현재시간을 넣어주기위해
    {
        String SQL = "SELECT NOW()"; // 현재시간을 나타내는 mysql
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getString(1);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ""; // 데이터베이스 오류
    }
    
    public int getNext()
    {
        String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
        try {     
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getInt(1) + 1; // 그 다음 게시글의 번호
            }
            return 1; // 첫 번째 게시물인 경우
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    public int write(String bbsTitle, String userID, String bbsContent) {
        String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?,?)";
        String SQL_LIKE = "INSERT INTO RECO VALUES (?,?,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            PreparedStatement pstmt3 = conn.prepareStatement(SQL_LIKE);
            
            pstmt3.setInt(1, getNext());
            pstmt3.setInt(2, 0);
            pstmt3.setInt(3, 0);
            pstmt3.setString(4, userID);
            pstmt3.executeUpdate();
            
            pstmt.setInt(1, getNext());
            pstmt.setString(2, bbsTitle);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, bbsContent);
            pstmt.setInt(6, 1);
            pstmt.setString(7, userID);
            pstmt.executeUpdate();
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    public ArrayList<Bbs> getList(int pageNumber)
    {
        String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다

        ArrayList<Bbs> list = new ArrayList<Bbs>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Bbs bbs = new Bbs();
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(6));
                bbs.setUser_nick(rs.getString(7));
                list.add(bbs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; 
    }
    
    public ArrayList<Bbs> POPgetList(int pageNumber)
    {
        String SQL = "SELECT * FROM BBS INNER JOIN RECO ON BBS.bbsID = RECO.bbsID  WHERE BBS.bbsID < ? AND bbsAvailable = 1 AND like_no > 5 ORDER BY BBS.bbsID DESC LIMIT 10";

        ArrayList<Bbs> list = new ArrayList<Bbs>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Bbs bbs = new Bbs();
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(6));
                bbs.setUser_nick(rs.getString(7));
                list.add(bbs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; 
    }
    public ArrayList<Bbs> TOPgetList(int pageNumber)
    {
        String SQL = "SELECT * FROM BBS INNER JOIN RECO ON BBS.bbsID = RECO.bbsID  WHERE BBS.bbsID < ? AND bbsAvailable = 1 AND like_no > 5 ORDER BY like_no DESC LIMIT 10"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다

        ArrayList<Bbs> list = new ArrayList<Bbs>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Bbs bbs = new Bbs();
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(6));
                bbs.setUser_nick(rs.getString(7));
                list.add(bbs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; 
    }
  
//    페이징 처리를 위한 함수
    public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1"; 
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
            
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; 
    }
    
    public Bbs getBbs(int bbsID)
    {
            String SQL = "SELECT * FROM BBS WHERE bbsID = ?"; 
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setInt(1, bbsID);
                rs = pstmt.executeQuery();
                if (rs.next())
                {
                    Bbs bbs = new Bbs();
                    bbs.setBbsID(rs.getInt(1));
                    bbs.setBbsTitle(rs.getString(2));
                    bbs.setUserID(rs.getString(3));
                    bbs.setBbsDate(rs.getString(4));
                    bbs.setBbsContent(rs.getString(5));
                    bbs.setBbsAvailable(rs.getInt(6));
                    return bbs;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null; 
        }
public int update(int bbsID, String bbsTitle, String bbsContent)
{
        String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, bbsTitle);
            pstmt.setString(2, bbsContent);
            pstmt.setInt(3, bbsID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
public int delete(int bbsID)
{
        String SQL = "UPDATE BBS SET bbsAvailable = 0 where bbsID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,bbsID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}
 