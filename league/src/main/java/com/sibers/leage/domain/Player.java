package com.sibers.leage.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Min;
import javax.validation.constraints.Max;
import com.sibers.leage.domain.Team;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class Player {

    @NotNull
    @Size(min = 1, max = 50)
    private String firstName;

    @NotNull
    @Size(min = 1, max = 50)
    private String lastName;

    @Min(1L)
    @Max(10L)
    private int speed;

    @Min(1L)
    private int weight;

    @Min(1L)
    private int height;

    @Min(1L)
    @Max(10L)
    private int kickingPower;

    @Min(1L)
    @Max(10L)
    private int kickingAccuracy;

    @ManyToOne
    private Team team;
}
