package com.example.service;

import com.example.lab.Users;
import com.example.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UsersService {

    @Autowired
    private UsersRepository repository;

    public List<Users> getAllUsers(){
        return repository.getAllUsers();
    }

    public List<Users> getNewUser(){
        return repository.getNewUser();
    }

    public Users getUsersById(int id) {
        return repository.getUsersById(id);
    }

    public Users getUsersByEmail(Users user) {
        return repository.getUsersByEmail(user.getEmail(),user.getPassword());
    }

    public Users save(Users user) {
        return repository.save(user);
    }

    public Users addTeacher(Users user) {
        return repository.addTeacher(user.getName(),user.getLastname(),user.getEmail(),user.getPassword());
    }


}
