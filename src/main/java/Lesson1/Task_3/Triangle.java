package Lesson1.Task_3;

public class Triangle extends Shape{
    @Override
    public void draw() {
        System.out.println("Рисуем треугольник");
    }

    @Override
    public void myName() {
        System.out.println("Это треугольник");
    }
}