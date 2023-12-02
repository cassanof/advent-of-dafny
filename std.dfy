datatype Optional<T> = None | Some(value: T)

method stringSplit(s: string, c: char) returns (splits: seq<string>) {
  splits := [];
  var i := 0;
  var buf := "";
  while i < |s| {
    if s[i] == c {
      splits := splits + [buf];
      buf := "";
    } else {
      buf := buf + [s[i]];
    }

    i := i + 1;
  }
  splits := splits + [buf];
  return splits;
}


method Map<T, R>(l: seq<T>, f: (T) -> R)
  returns (res: seq<R>) 
{
  res := [];
  var i := 0;
  while i < |l| {
    res := res + [f(l[i])];
    i := i + 1;
  }
}

method Fold<T, R>(l: seq<T>, f: (T, R) -> R, def: R)
  returns (acc: R) 
{
  acc := def;
  var i := 0;
  while i < |l| {
    acc := f(l[i], acc);
    i := i + 1;
  }
}
