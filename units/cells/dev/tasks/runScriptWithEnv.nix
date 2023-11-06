makeScript {
  name = "runScriptWithEnv";
  searchPaths.bin = [ nixpkgs.hello ];
  searchPaths.source = [
    (makeEnvVars {
      name = "firstEnvVarsOutput";
      mapping = {
        a = "1";
        b = "2";
        VAR_NAME = "test";
      };
    })
  ];
  entrypoint = ''
    hello --help
    echo $a
  '';
}
