{
  description = "The users' interface to the Tenzir platform";
  outputs = {
    self,
    tenzir-devops,
    ...
  } @ inputs:
    (
      tenzir-devops.lib.mkStd {inherit inputs;}
    )
    // {
      devShells = inputs.tenzir-devops.inputs.std.harvest inputs.self [["dev" "shells"]];
      templates = (inputs.tenzir-devops.inputs.std.harvest inputs.self ["dev" "lib"]).x86_64-linux.templates;
    };
  inputs = {
    tenzir-devops.url = "github:gtrunsec/vast/devops?dir=nix/devops";
    nixpkgs.follows = "tenzir-devops/nixpkgs";
  };
  nixConfig = {
    extra-substituters = [""];
    extra-trusted-public-keys = [""];
    allow-import-from-derivation = "true";
  };
}
