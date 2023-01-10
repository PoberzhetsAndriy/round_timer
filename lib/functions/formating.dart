durationFormat(Duration d) {
  if (d.inHours > 0) {
    return d.toString().split('.').first.padLeft(8, "0");
  } else {
    return d.toString().substring(2, 7);
  }
}
