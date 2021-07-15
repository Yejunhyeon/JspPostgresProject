package user;

import java.sql.*;

import user.*;

public class UserDAO {
	
	private Connection conn;  //연결
	private PreparedStatement pstmt;  //설정 및 실행
	private ResultSet rs; //결과값
	
	public UserDAO() {
		try {
			Class.forName("org.postgresql.Driver");
			
			String dbURL = "jdbc:postgresql://localhost/jsppostgres";
			String dbID = "postgres";
			String dbPassword = "4593";
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//회원가입 영역
			public int join(User user) { 								//users클래스 인스턴스를 생성하여 한 명의 회원정보를 담는다
				String sql = "insert into users values(?, ?, ?, ?)";  //users 테이블안에 데이터를 입력
				try {
					pstmt = conn.prepareStatement(sql);					//sql 쿼리문을 대기시킨다
					pstmt.setString(1, user.getUserID());				//1번째 물음표에 실제 입력한 userid를 셋팅
					pstmt.setString(2, user.getUserPassword());
					pstmt.setString(3, user.getUserName());
					pstmt.setString(4, user.getUserEmail());
					return pstmt.executeUpdate(); 						//db에서 insert라고 뜨면 query 1 ok라는
																		// 숫자를 받아온다. 즉 정상적으로 입력 시 1이라는 숫자가 리턴
				}catch (Exception e) {
					e.printStackTrace();
				}
				return -1;
			}

}
