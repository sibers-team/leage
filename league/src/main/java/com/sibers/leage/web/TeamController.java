package com.sibers.leage.web;

import com.sibers.leage.domain.Team;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "teams", formBackingObject = Team.class)
@RequestMapping("/teams")
@Controller
public class TeamController {
}
