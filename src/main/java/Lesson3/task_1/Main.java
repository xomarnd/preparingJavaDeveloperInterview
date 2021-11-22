package Lesson3.task_1;

public class Main {
    public static Object mon = new Object();
    public static volatile boolean flag = false;

    public static void main(String[] args) {

        Thread t1 = new Thread(new Runnable() {
            @Override
            public void run() {
                synchronized (mon){
                    while (true) {
                        System.out.println("ping");
                        while (!flag) {
                            try {
                                mon.wait();
                            } catch (InterruptedException e) {
                                e.printStackTrace();
                            }
                        }
                        flag = false;
                        mon.notify();
                    }
                }
            }
        });

        Thread t2 = new Thread(new Runnable() {
            @Override
            public void run() {
                synchronized (mon){
                    while (true) {
                        System.out.println("pong");
                        while (flag) {
                            try {
                                mon.wait();
                            } catch (InterruptedException e) {
                                e.printStackTrace();
                            }
                        }
                        flag = true;
                        mon.notify();
                    }
                }
            }
        });

        t1.start();
        t2.start();
    }
}
