include "../libraries/src/FileIO/FileIO.dfy"
include "../std.dfy"

function toStr(iores: FileIO.Wrappers.Result<seq<bv8>, string> ): string {
    match iores {
        case Success(value) => seq(|value|, i requires 0 <= i < |value| => value[i] as char)
        case Failure(e) => e
    }
}

method charToDigit(c: char) returns (digit: Optional<int>) {
  match c
  case '0' =>
    digit := Some(0);
  case '1' =>
    digit := Some(1);
  case '2' =>
    digit := Some(2);
  case '3' =>
    digit := Some(3);
  case '4' =>
    digit := Some(4);
  case '5' =>
    digit := Some(5);
  case '6' =>
    digit := Some(6);
  case '7' =>
    digit := Some(7);
  case '8' =>
    digit := Some(8);
  case '9' =>
    digit := Some(9);
  case _ =>
    digit := None;
}

method firstDigit(s: string) returns (digit: int) {
  digit := 0;
  var i := 0;
  while i < |s| {
    var chr := s[i];
    i := i + 1;
    var maybeDigit := charToDigit(chr);
    match maybeDigit
    case None =>
    case Some(n) =>
      digit := n;
      break;
  }
}

method lastDigit(s: string) returns (digit: int) {
  digit := 0;
  var i := |s| - 1;
  while i >= 0 {
    var chr := s[i];
    i := i - 1;
    var maybeDigit := charToDigit(chr);
    match maybeDigit
    case None =>
    case Some(n) =>
      digit := n;
      break;
  }
}

method problem1() {
  var f := FileIO.ReadBytesFromFile("input");
  var s := toStr(f);
  var lines := stringSplit(s, '\n');
  lines := Filter(lines, (s: string) => |s| > 0);
  var sums := Map(lines, (s: string) => { 
      var f := firstDigit(s);
      var l := lastDigit(s);
      f + l
  });
  //var sum := Fold(sums, 0, (x: int, y: int) => x + y);
  //print sum;
}


method Test() {
  // read file "input"
  // var f := FileIO.ReadBytesFromFile("input");
  // var s := toStr(f);
  var s := "1abc2\n";
  s := s + "pqr3stu8vwx\n";
  s := s + "a1b2c3d4e5f\n";
  s := s + "treb7uchet\n";
  print s;
  print |s|;
  var dig := charToDigit('1');
  print dig;
  print "\n";
  var f := firstDigit("aaaaaa2fffffff5");
  print f;
  var l := lastDigit("aaaaaa2fffffff5");
  print l;
  print "\n";
  var s1 := stringSplit("a", 'b');
  print s1;
  print "\n";
  var s2 := stringSplit("abla", 'b');
  print s2;
  print "\n";
  var s3 := stringSplit("ablaba", 'b');
  print s3;
  print "\n";
  var s4 := stringSplit("ablabab", 'b');
  print s4;
  print "\n";
}

method Main() {
  problem1();
}

