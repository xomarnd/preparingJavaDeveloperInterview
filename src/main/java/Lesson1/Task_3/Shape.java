package Lesson1.Task_3;

public abstract class Shape {
    private int centerX;
    private int centerY;

    public int getCenterX() {
        return centerX;
    }

    public void setCenterX(int centerX) {
        this.centerX = centerX;
    }

    public int getCenterY() {
        return centerY;
    }

    public void setCenterY(int centerY) {
        this.centerY = centerY;
    }

    public abstract void draw();

    public void myName(){
        System.out.println("Это фигура");
    }
}