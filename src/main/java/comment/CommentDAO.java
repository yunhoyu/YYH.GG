package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;

public class CommentDAO {
	
    private Connection conn;           
    private ResultSet rs; 
    
    public CommentDAO(){ 
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
    public Comment getComment(int bbsID)
    {
            String SQL = "SELECT * FROM COMMENT WHERE bbsID = ?"; 
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setInt(1, bbsID);
                rs = pstmt.executeQuery();
                if (rs.next())
                {
                    Comment comment = new Comment();
                    comment.setBoardID(rs.getInt(1));
                    comment.setCommentID(rs.getInt(2));
                    comment.setBbsID(rs.getInt(3));
                    comment.setUserID(rs.getString(4));
                    comment.setCommentDate(rs.getString(5));
                    comment.setCommentText(rs.getString(6));
                    comment.setCommentAvailable(rs.getInt(7));
                    return comment;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null; 
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
    public int write(String commentText, String userID) {
        String SQL = "INSERT INTO COMMENT VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            int commentID = 1;
            pstmt.setInt(1, 1);
            pstmt.setInt(2, commentID);
            pstmt.setInt(3, getNext());
            pstmt.setString(4, userID);
            pstmt.setString(5, getDate());
            pstmt.setString(6, commentText);
            pstmt.setInt(7, 1);
            commentID ++;
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    public ArrayList<Comment> getList()
    {
        String SQL = "SELECT * FROM COMMENT WHERE bbsID < ? AND commentAvailable = 1 ORDER BY bbsID"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다

        ArrayList<Comment> list = new ArrayList<Comment>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	Comment comment = new Comment();
                comment.setBoardID(rs.getInt(1));
                comment.setCommentID(rs.getInt(2));
                comment.setBbsID(rs.getInt(3));
                comment.setUserID(rs.getString(4));
                comment.setCommentDate(rs.getString(5));
                comment.setCommentText(rs.getString(6));
                comment.setCommentAvailable(rs.getInt(7));
                list.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; 
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
