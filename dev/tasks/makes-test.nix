makeScript {
  name = "runScriptWithEnv";
  searchPaths.bin = [
    nixpkgs.hello
  ];
  searchPaths.source = [
    (makeEnvVars {
      name = "firstEnvVarsOutput";
      mapping = {
        a = "1";
        b = "2";
      };
    })
    (makeEnvVars {
      name = "secondEnvVarsOutput";
      mapping = {
        c = "3";
        d = "4";
      };
    })
  ];
  entrypoint = ''
    hello --help
    echo $a
  '';
}
