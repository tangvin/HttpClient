package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/screen")
@Controller
public class RequestController {

	@RequestMapping("/request")
	public String requestController(){	
		return "/screen/standScreen";
	}
	
}
