package Lesson5.dao;

import Lesson5.entity.Student;

import java.util.List;

public interface StudentDAO {
    void save(Student student);

    void add(Student student);

    void del(Student student);

    void update(Student student);

    Student getStudent(Long id);

    List<Student> getStudents();

    void closeSession();
}