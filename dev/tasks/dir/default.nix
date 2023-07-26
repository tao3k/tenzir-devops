makeScript {
  name = "runScriptDir";
  searchPaths.bin = [nixpkgs.hello];
  entrypoint = ''
    hello
  '';
}
