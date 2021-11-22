package Lesson1.Task_3;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Shape> shapes = new ArrayList<>();
        shapes.add(new Square());
        shapes.add(new Triangle());
        shapes.add(new Circle());
        for (Shape shape : shapes) {
            shape.draw();
        }
    }
}