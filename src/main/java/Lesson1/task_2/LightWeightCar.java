package Lesson1.task_2;

//Можно убрать имплементацию Moveable
//public class LightWeightCar extends Car implements Moveable{
public class LightWeightCar extends Car{

    @Override
    void open() {
        System.out.println("Car is open");
    }

    @Override
    public void move() {
        System.out.println("Car is moving");
    }
}