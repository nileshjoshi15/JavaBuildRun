package com.Algo;
import com.Data.Student;
import com.Data.Sql.sqlConn;

public class App 
{
    public static void main( String[] args )
    {
        Person p=new Person();
        p.PrintName();

        Student s=new Student();
        s.PrintName();

        sqlConn con=new sqlConn();
        con.PrintName();


    }
}
