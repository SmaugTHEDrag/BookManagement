package com.example.BookManagement.service;

import com.example.BookManagement.entity.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;

public interface IUserService extends UserDetailsService {
    List<User> getAllUsers();

    User getUserById(int id);

    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;
}
