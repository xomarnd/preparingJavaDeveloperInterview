package Lesson1.Task_3;

public class Circle extends Shape{
    @Override
    public void draw() {
        System.out.println("Рисуем круг");
    }

    @Override
    public void myName() {
        System.out.println("Это круг");
    }
}