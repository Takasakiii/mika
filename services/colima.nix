{ pkgs, colimaStartFg, ... }:
{
  launchd.agents.colima = {
    enable = true;
    config = {
      Label = "org.nixos.colima";
      RunAtLoad = true;
      KeepAlive = false;
      Program = "${colimaStartFg}/bin/colima-start-fg";
      StandardOutPath = "/tmp/colima.out.log";
      StandardErrorPath = "/tmp/colima.err.log";
    };
  };
}
