makeScript {
  name = "process-compose-tenzir";
  searchPaths.bin = [];
  searchPaths.source = [
    ./env
    (makeEnvVars {
      name = "configs";
      mapping = {
        tenzirConfig = ./tenzir.yaml;
        extraWebFlags = "--bind=127.0.0.1";
      };
    })
  ];
  entrypoint = ''
    # automatically export all variables
    set -a
    ${nixpkgs.lib.getExe tenzir-devops.packages.ps-tenzir}
  '';
}
