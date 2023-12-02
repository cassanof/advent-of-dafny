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

function toStr(iores: FileIO.Wrappers.Result<seq<bv8>, string> ): string {
    match iores {
        case Success(value) => seq(|value|, i requires 0 <= i < |value| => value[i] as char)
        case Failure(e) => e
    }
}

method Main() {
  var x := Abs(-5);
  // read file "input"
  print x;
  var f := FileIO.ReadBytesFromFile("input");
  var s := toStr(f);
}

