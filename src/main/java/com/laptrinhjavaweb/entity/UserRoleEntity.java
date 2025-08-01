package com.laptrinhjavaweb.entity;

import javax.persistence.*;

@Entity
@Table(name = "user_role")
public class UserRoleEntity extends BaseEntity{
    @ManyToOne
    @JoinColumn(name = "roleid")
    private RoleEntity roleEntity;

    @ManyToOne
    @JoinColumn(name = "userid")
    private UserEntity userEntity;
}
