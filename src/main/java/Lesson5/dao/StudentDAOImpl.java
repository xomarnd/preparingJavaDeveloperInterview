package Lesson5.dao;

import java.util.List;

import Lesson5.entity.Student;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class StudentDAOImpl implements StudentDAO {

    Session session;

    @Override
    public void save(Student student) {
        add(student);
    }


    @Override
    public void add(Student student) {
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(student);
        tx.commit();
    }

    @Override
    public void del(Student student) {
        Transaction tx = session.beginTransaction();
        session.remove(student);
        tx.commit();
    }

    @Override
    public void update(Student student) {
        add(student);
    }

    @Override
    public Student getStudent(Long id) {
        return session.get(Student.class, id);
    }

    @Override
    public List<Student> getStudents() {
        return (List<Student>) session.createQuery("from Student").list();
    }


    public StudentDAOImpl(Session session) {
        this.session = session;
    }


    @Override
    public void closeSession() {
        session.close();
    }
}