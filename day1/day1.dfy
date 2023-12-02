include "../libraries/src/FileIO/FileIO.dfy"

method Abs(x: int) returns (y: int)
  ensures y >= 0
{
  if x < 0 {
    y := -x;
  } else {
    y := x;
  }
}

method Main() {
  var x := Abs(-5);
  print x;
}

