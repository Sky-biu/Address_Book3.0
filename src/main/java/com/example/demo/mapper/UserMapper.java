package com.example.demo.mapper;

import com.example.demo.bean.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import java.util.List;

@Component
public interface UserMapper {
    //然后做一些数据库的对应操作，这次是查询操作
    @Select("select * from address_book3")
    List<User> getUserList();

    @Select("select * from address_book3 where Name like concat('%',#{Name},'%')")
    List<User> selectUser(String Name);

    @Insert("insert into address_book3(Name,Phone_number)values(#{Name},#{Phone_number})")
    void addUser(String Name,String Phone_number);

    @Delete("delete from address_book3 where ID =#{ID}")
    void delUser(int ID);

    @Update("update address_book3 set Name =#{Name}, Phone_number =#{Phone_number} where ID =#{ID}")
    void updateUser(int ID, String Name, String Phone_number);
}

