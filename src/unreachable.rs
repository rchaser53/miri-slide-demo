fn unreachable() {
  let a = Some(1);
  match a {
    _ => unreachable!()
  };
}