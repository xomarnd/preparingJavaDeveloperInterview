package Lesson1.task_2;

//для оптимизации имплементировать интерфейс Moveable
//public abstract class Car {
public abstract class Car implements Moveable {

    //у полей класса Car разные модификаторы доступа
    //public Engine engine;
    private Engine engine;
    private String color;
    private String name;

    //start можно вынести в отдельный интерфейс или логичнее было бы сделать его public
    protected void start() {
        System.out.println("Car starting");
    }

    abstract void open();

    public Engine getEngine() {
        return engine;
    }

    public void setEngine(Engine engine) {
        this.engine = engine;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}