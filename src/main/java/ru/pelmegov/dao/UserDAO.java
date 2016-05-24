package ru.pelmegov.dao;

import ru.pelmegov.model.User;

import java.util.List;

/**
 * @author modkomi
 * @since 25.05.16
 */
public interface UserDAO {

    public void addUser(User user);

    public void updateUser(User user);

    public void removeUser(int id);

    public User getUserById(int id);

    public List<User> listUsers();

}
