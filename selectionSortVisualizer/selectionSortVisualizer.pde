long[] arr;
int i;
int j;
int w;
int h;

long[] generate(int N, long a, long b) {
        long[] randomArray = new long[N];
        for (int i = 0; i < N; i++) {
            randomArray[i] = (long) random(a, b);
            System.out.print(randomArray[i] + " ");
        }
        return randomArray;
  }
 
  void setup()
  {
    fullScreen();
    //initialize variables
    arr = generate(100,0,100);

    i = 0;
    w = width / arr.length;
    h = (height-50) / arr.length;
     
      //run the insertion sort in a separate thread
    thread("selectionSort");
  }
  
  //selection sort
  void selectionSort() {
   for (int i = 0; i < arr.length - 1; i++) {
     int index = i;
     for (int j = i + 1; j < arr.length; j++)
       if (arr[j] < arr[index]) {
         index = j;
       }
       swap(arr, index, i);

       delay(50);
     }
   }

void draw() {
    background(0);
 
    //show the blocks
    for(int i = 0; i < arr.length; i++) {
      //if its the counter make it red
      if(i == j) {
        fill(255,0,0);
        rect(i * w, height, w, -(arr[i] * h + h));
      }
      //if its in the correct spot make it green
      else if(arr[i] == i) {
        fill(0,255,0);
        rect(i * w, height, w, -(arr[i] * h + h));
      }
      //else make it white
      else {
        fill(255);
        rect(i * w, height, w, -(arr[i] * h + h));
      }
    }
}
 
void swap(long[] a, int i, int j) {
    long temp = a[i];
    a[i] = a[j];
    a[j] = temp;
}
