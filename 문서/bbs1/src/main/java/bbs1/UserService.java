package bbs1;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserService {

		@Autowired
		UserMapper userMapper;
		
		public String validateBeforeInsert(User user)throws Exception{
			String s = user.getName();
			if(StringUtils.isBlank(s))
				return "이름을 입력해주세요.";
			
			s = user.getEmail();
			if (StringUtils.isBlank(s))
	            return "이메일 주소를 입력하세요.";

	        s = user.getUserType();
	        if (StringUtils.isBlank(s))
	            return "사용자 유형을 선택하세요.";

	        s = user.getLoginId();
	        if (StringUtils.isBlank(s))
	            return "로그인ID를 입력하세요.";

	        User user2 = userMapper.selectByLoginID(s);
	        if (user2 != null)
	            return "로그인ID가 중복됩니다.";

	        return null;
		}
		
		public String validateBeforeUpdate(User user) throws Exception {
			String s = user.getName();
			if (StringUtils.isBlank(s))
	            return "이름을 입력하세요.";

	        s = user.getEmail();
	        if (StringUtils.isBlank(s))
	            return "이메일 주소를 입력하세요.";

	        s = user.getUserType();
	        if (StringUtils.isBlank(s))
	            return "사용자 유형을 선택하세요.";

	        s = user.getLoginId();
	        if (StringUtils.isBlank(s))
	            return "로그인ID를 입력하세요.";

	        User user2 = userMapper.selectByLoginID(s);
	        if (user2 != null && user.getId() != user2.getId())
	            return "로그인ID가 중복됩니다.";
	        
	        return null;
		}
}
