{
  description = "The users' interface to the Tenzir platform";
  outputs = {
    self,
    tenzir-devops,
  } @ inputs:
    (tenzir-devops.lib.mkStd ./.)
    // {
      devShells = inputs.tenzir-devops.inputs.std.harvest inputs.self [["users" "shells"]];
    };
  inputs = {
    tenzir-devops.url = "github:gtrunsec/vast/devops?dir=nix/devops";
    # tenzir-devops.url = "/home/guangtao/ghq/github.com/tenzir/vast/nix/devops";
  };
}
