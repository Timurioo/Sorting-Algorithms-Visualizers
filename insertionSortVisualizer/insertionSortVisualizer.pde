  import java.util.Random;
  
  int[] arr;
  int N = 100;
  int i;
  int j;
  int w;
  int h;

  void setup() {
      fullScreen();
      //initialize variables
      //make the array and ititialize it with values
      arr = new int[N];
      for (int i = 0; i < N; i++) {
          arr[i] = i;
      }
      //make an instance of random
      Random random = new Random();
      random.nextInt();

      //shuffle the array
      for (int i = 0; i < N; i++) {
          int change = random.nextInt(N);
          swap(arr, i, change);
      }
      i = 0;
      w = width / arr.length;
      h = (height - 50) / arr.length;

      //run the insertion sort in a separate thread
      thread("insertionSort");
  }

  //insertion sort
  void insertionSort() {
      for (int i = 0; i < arr.length; i++) {
          for (int j = i; j > 0; j--) {
              this.j = j - 1;
              if (arr[j - 1] > arr[j])
                  swap(arr, j, j - 1);
              else
                  break;

              //delay after each step so draw has time to update the screen
              delay(10);
          }
      }
  }

  void draw() {
      background(0);

      //show the blocks
      for (int i = 0; i < arr.length; i++) {
          //if its the counter make it red
          if (i == j) {
              fill(255, 0, 0);
              rect(i * w, height, w, -(arr[i] * h + h));
          }
          //if its in the correct spot make it green
          else if (arr[i] == i) {
              fill(0, 255, 0);
              rect(i * w, height, w, -(arr[i] * h + h));
          }
          //else make it white
          else {
              fill(255);
              rect(i * w, height, w, -(arr[i] * h + h));
          }
      }
  }

  void swap(int[] a, int i, int j) {
      int temp = a[i];
      a[i] = a[j];
      a[j] = temp;
  }
