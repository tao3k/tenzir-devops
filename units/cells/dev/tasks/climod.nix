climod {
  name = "demo";
  description = "Demo CLI generated";
  action.bash = ''
    echo Hello, world
  '';
  target.bash.prelude = ''
    echo "This is a prelude"
  '';
  allowExtraArguments = true;
  subcommands.tasks.description = "Print args";
  subcommands.tasks.allowExtraArguments = true;
  subcommands.tasks.action.bash = ''
    # glow ${./climod.md}
    echo Hello
  '';
  subcommands.eoq.description = "Eoq subcommand";
  subcommands.tasks.subcommands.makeScript.description = "makes::fun => make a script";
  subcommands.tasks.subcommands.makeScript.action.bash =
    let
      md = ''
        # example

         ```nix
         ${builtins.readFile ./makes-test.nix}
         ```
      '';
    in
    ''
      echo '${md}' | glow -
    '';
}
