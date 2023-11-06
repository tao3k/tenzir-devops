makeScript {
  name = "process-compose-tenzir";
  searchPaths.bin = [ ];
  searchPaths.source = [
    ./env
    (makeEnvVars {
      name = "configs";
      mapping = {
        tenzirConfig = ./tenzir.yaml;
        tenzirWebFlag = "--mode=dev --bind=127.0.0.1";
      };
    })
  ];
  entrypoint = ''
    # keep the running directory in the top-level of git
    (cd $PRJ_ROOT && ${nixpkgs.lib.getExe tenzir-devops.packages.ps-tenzir-users})
  '';
}
