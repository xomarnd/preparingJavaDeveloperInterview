package Lesson1.Task_3;

public class Square extends Shape{
    @Override
    public void draw() {
        System.out.println("Рисуем квадрат");
    }

    @Override
    public void myName() {
        System.out.println("Это квадрат");
    }
}