function FindProxyForURL(url, host) {
  if (shExpMatch(host, "*.test")) {
    return "PROXY mercury";
  }
  if (shExpMatch(host, "test")) {
    return "PROXY mercury";
  }
  return "DIRECT";
}
