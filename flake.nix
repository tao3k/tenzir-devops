{
  description = "The users' interface to the Tenzir platform";
  outputs = { self, tenzir-devops}@inputs: {
    devShells.default = {};
    # devShells.default = tenzir-devops.x86_64-linux.users.lib.mkDevShell ./.;
  };
  inputs = {
    tenzir-devops.url = "github:gtrunsec/vast/devops?dir=nix/devops";
  };
}
