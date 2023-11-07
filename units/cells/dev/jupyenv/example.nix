{ config }:
{
  kernel.r.tenzir-web = {
    enable = true;
    extraRPackages =
      ps:
      with ps; [
        dplyr
        ggplot2
        lubridate
        readr
        rmarkdown
        ggrepel
        tidyr
      ];
  };
}
