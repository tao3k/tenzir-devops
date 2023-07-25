{
  description = "The users' interface to the Tenzir platform";
  outputs = {
    self,
    tenzir-devops,
    ...
  } @ inputs:
    (
      tenzir-devops.lib.mkStd
      {
        inherit inputs;
        cellsFrom = ./cells;
      }
    )
    // {
      devShells = inputs.tenzir-devops.inputs.std.harvest inputs.self [["users" "shells"]];
      templates = (inputs.tenzir-devops.inputs.std.harvest inputs.self ["users" "lib"]).x86_64-linux.templates;
    };
  inputs = {
    # tenzir-devops.url = "github:gtrunsec/vast/devops?dir=nix/devops";
    nixpkgs.follows = "tenzir-devops/nixpkgs";
    tenzir-devops.url = "/home/guangtao/ghq/github.com/tenzir/vast/nix/devops";
  };
  nixConfig = {
    extra-substituters = [""];
    extra-trusted-public-keys = [""];
    allow-import-from-derivation = "true";
  };
}
