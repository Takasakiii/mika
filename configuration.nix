{ pkgs, ... }:
{
  imports = [
  #  ./services/colima.nix
  ];

  system.primaryUser = "lucasmendescampos";

  nix.extraOptions = ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  programs = {
    zsh = {
      enable = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      helix
      mkalias
      nh
      nvd
      zed-editor
      nil
      nixd
    ];
    shells = [
      pkgs.zsh
    ];
    variables = {
      NH_FLAKE = "/Users/lucasmendescampos/mika";
    };
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    brews = [
      "mas"
      "copyparty"
      "node"
      "libyaml"
      "ruby"
      "cocoapods"
      "fastlane"
      "colima"
      "docker"
    ];
    masApps = {
      "Xcode" = 497799835;
    };
  };

  users.users.lucasmendescampos = {
    home = "/Users/lucasmendescampos";
    shell = pkgs.zsh;
  };

  system.activationScripts.postActivation.text = ''
    if [ -d "/Applications/Xcode.app" ]; then
      sudo xcodebuild -license accept || true
    fi
  '';

}
