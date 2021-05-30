import 'dart:math';

double speed = 5;
double score = 0;
enum Direction { up, down, left, right }

double randomNumber() {
  Random ran = Random();
  int myNum = ran.nextInt(101);
  return (50 + myNum) / 100;
}
