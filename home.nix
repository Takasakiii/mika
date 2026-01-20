{ config, pkgs, lib, ... }:
{
  imports = [
#$    ./services/colima.nix
  ];
  home = {
    username = "lucasmendescampos";
    stateVersion = "25.11";
    homeDirectory = lib.mkForce "/Users/lucasmendescampos";
    packages = with pkgs; [
      xcodes
    ];
  };
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "direnv"
        ];
        theme = "robbyrussell";
      };
      initContent = ''
        export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin"
        if ! colima status > /dev/null 2>&1; then
          colima start --mount-type virtiofs
        fi
      '';
    };

    mise = {
      enable = true;
      enableZshIntegration = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    git = {
      enable = true;
      settings = {
        user = {
          email = "lucasmc2709@live.com";
          name = "Takasakiii";
        };
        init.defaultBranch = "main";
      };
    };
  };
}
