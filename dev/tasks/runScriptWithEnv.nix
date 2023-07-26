makeScript {
  name = "runScriptWithEnv";
  env = {
    a = "1";
    b = "2";
    VAR_NAME = "test";
  };
  searchPaths.bin = [nixpkgs.hello];
  searchPaths.source = [];
  entrypoint = ''
    hello --help
    echo $a
  '';
}
