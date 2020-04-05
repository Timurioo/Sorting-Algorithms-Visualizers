long[] arr = generate(100, 0, 100);
boolean done = false;
int max, a, w, h;

long[] generate(int N, long a, long b) {
        long[] randomArray = new long[N];
        for (int i = 0; i < N; i++) {
            randomArray[i] = (long) random(a, b);
            System.out.print(randomArray[i] + " ");
        }
        return randomArray;
}

void setup() {
  fullScreen();
  fill(0);
  w = (width / arr.length);
  h = (height-50)/arr.length;
  max = arr.length - 1;
}

void draw() {
  if (done) { 
    return;
  }
  background(0);
  translate(1, 0);
  if (a >= max) {
    a = 0;
    max--;
  }
  if (arr[a] > arr[a + 1]) {
    swap(arr, a, a + 1);
    fill(255,0,0);
    rect(w * a, height, w, -(arr[a] * h + h));
    fill(0);
    rect(w * a, height, w, -(arr[a] * h + h));
  }
  
  a++;
  
  for (int i = 0; i < arr.length; i++) {
    fill(255);
    
    if (i == a) { 
      fill(255, 0, 0);
    }
    
    if (i > max) { 
      fill(0, 255, 0);
    }
    
    rect((width / arr.length) * i, (height - 4 * arr[i]), 10, 20 * arr[i]);
  }
  
  if (max == -1) {
    done = true;
  }
}

void swap(long[] a, int i, int j) {
    long temp = a[i];
    a[i] = a[j];
    a[j] = temp;
}
