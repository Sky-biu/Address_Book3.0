package com.example.demo.bean;

public class User {
    public int ID;
    public String Name;
    public String Phone_number;

    public int getID(){
        return ID;
    }
    public void setID(int ID){
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }
    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPhone_number() {
        return Phone_number;
    }
    public void setPhone_number(String Phone_number) {
        this.Phone_number = Phone_number;
    }
}