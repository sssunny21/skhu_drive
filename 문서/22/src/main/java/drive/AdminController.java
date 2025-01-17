package drive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
	@Autowired UserMapper userMapper;
	@Autowired UserService userService;

	@RequestMapping("/admin/list.pd") 
	public String list(Model model) { 
		model.addAttribute("list", userMapper.selectAll()); 
		return "admin/list"; 
	} 
	
	@RequestMapping(value="/admin/edit.pd", method = RequestMethod.GET)
	public String edit(@RequestParam("id") Integer id, Model model) {
		User user = userMapper.selectById(id);
		model.addAttribute("user", user);
		return "admin/edit";
	}

	@RequestMapping(value="/admin/edit.pd", method = RequestMethod.POST)
	public String edit(User user, Model model) throws Exception{
		String message = userService.validateBeforeUpdate(user);
		if (message == null){
			userMapper.update(user);
			//model.addAttribute("successMsg", "저장했습니다.");
			return "redirect:/admin/list.pd";
		}else{
			model.addAttribute("errorMsg", message);
			return "admin/edit";
		}

	}
}
