makeScript {
  name = "process-compose-tenzir";
  searchPaths.bin = [
    tenzir-devops.packages.ps-tenzir
  ];
  searchPaths.source = [
    ./env
  ];
  entrypoint = ''
    # automatically export all variables
    set -a
    ${nixpkgs.lib.getExe tenzir-devops.packages.ps-tenzir}
  '';
}
