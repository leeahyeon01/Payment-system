package basic;

public class gugudan { 
	
public static void main(String[] args) {
	 
	for(int i = 1; i<6; i++) {
		for(int j=2; j<10; j++) {
			if(j%2 ==0) {
				System.out.print(j +"*" + i + "=" + i*j +"\t");
			}else {
				if(i == 5) {
					System.out.print("\t");
				}else {
					System.out.print(j+"*"+(i+5)+"="+(i+5)* j + "\t");
				}
			}
		}
		System.out.println();
	}
}
}
