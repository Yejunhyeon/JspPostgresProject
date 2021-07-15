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
	
	//로그인 영역
		public int login(String userID, String userPassword) {
			String sql = "select userPassword from users where userID = ?";
			try {
				pstmt = conn.prepareStatement(sql); //sql쿼리문을 대기 시킨다
				pstmt.setString(1, userID); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
				rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) {
						return 1; //로그인 성공
					}else
						return 0; //비밀번호 틀림
				}
				return -1; //아이디 없음
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -2; //오류
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
