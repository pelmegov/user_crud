package ru.pelmegov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.pelmegov.model.User;
import ru.pelmegov.service.UserService;

/**
 * @author modkomi
 * @since 25.05.16
 */

@Controller
public class UserController {
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listUsers(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers());

        return "index";
    }

    @RequestMapping(value = "/index/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        if(user.getId() == 0){
            this.userService.addUser(user);
        }else {
            this.userService.updateUser(user);
        }

        return "redirect:/";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.userService.removeUser(id);

        return "redirect:/";
    }

    @RequestMapping("edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());

        return "index";
    }

    @RequestMapping("userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));

        return "userinfo";
    }
}
