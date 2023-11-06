{
  formatter.prettier = {
    command = "prettier";
    excludes = dmerge.append [ "generated-*.yaml" ];
  };
}
