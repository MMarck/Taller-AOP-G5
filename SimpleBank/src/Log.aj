import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Log {

    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut success() : call(void moneyMakeTransaction());
    after() throws IOException : success(){
    	System.out.println("Realizado Transacción - " + cal.getTime().toString());
    	FileWriter writer= new FileWriter(file,true);
    	writer.write("Realizado Transacción - " + cal.getTime().toString()+"\n");
    	writer.close();
    }
    pointcut ends() : call(void moneyWithdrawal());
    after() throws IOException : ends() {
    	System.out.println("Realizado retiro - " + cal.getTime().toString());
    	FileWriter writer= new FileWriter(file,true);
    	writer.write("Realizado retiro - " + cal.getTime().toString()+"\n");
    	writer.close();
    }
}