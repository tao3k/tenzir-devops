{
  description = "The users' interface to the Tenzir platform";
  outputs =
    { self, tenzir-devops, ... }@inputs:
    (tenzir-devops.lib.mkStd {
      inherit inputs;
      projectDir = ./.;
    })
    // {
      devShells = inputs.tenzir-devops.inputs.std.harvest inputs.self [
        [
          "dev"
          "shells"
        ]
      ];
      templates =
        (inputs.tenzir-devops.inputs.std.harvest inputs.self [
          "dev"
          "lib"
        ]).x86_64-linux.templates;
    };
  inputs = {
    tenzir-devops.url = "github:gtrunsec/vast/devops?dir=nix/devops";
    nixpkgs.follows = "tenzir-devops/nixpkgs";
  };
  nixConfig = {
    extra-substituters = [
      "https://tenzir.cachix.org"
      "https://vast.cachix.org"
    ];
    extra-trusted-public-keys = [
      "tenzir.cachix.org-1:+MLwldLx9GLGLsi9mDr5RrVYyI64iVobWpntJaPM50E="
      "vast.cachix.org-1:0L8rErLUuFAdspyGYYQK3Sgs9PYRMzkLEqS2GxfaQhA="
    ];
    allow-import-from-derivation = "true";
  };
}
