package Lesson1.task_2;

//нельзя расширять Интерфейс, его можно только имплементировать
//Можно убрать имплементацию Moveable
//public class Lorry extends Car, Moveable, Stopable{
public class Lorry extends Car implements Stopable{

    //требуется реализовать метод open
    @Override
    void open() {
        System.out.println("Car is open");
    }

    @Override
    public void move() {
        System.out.println("Car is moving");
    }

    @Override
    public void stop() {
        System.out.println("Car is stop");
    }
}