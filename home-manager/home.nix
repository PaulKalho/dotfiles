{ config, pkgs, ... }:

{
  home.stateVersion = "23.11";
  home.username = "paul";
  home.homeDirectory = "/home/paul";

  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      # Treesitter
      (nvim-treesitter.withPlugins (p: [
        p.bash
        p.css
        p.html
        p.json
        p.yaml
        p.toml
        p.dockerfile
        p.lua
        p.luadoc
        p.markdown
        p.markdown_inline
        p.nix
        p.python
        p.go
        p.gomod
        p.gosum
        p.terraform
        p.rust
      ]))

      # Core plugins
      telescope-nvim
      plenary-nvim

      kanagawa-nvim

      nvim-cmp
      cmp-nvim-lsp
      luasnip

      nvim-tree-lua
      nvim-web-devicons

      barbar-nvim
      autoclose-nvim

      go-nvim
      gitsigns-nvim

      conform-nvim
    ];

    extraPackages = with pkgs; [
      # CLI tools
      tree-sitter
      ripgrep
      fzf

      # formatters
      stylua
      nixfmt
      gofumpt

      # toolchains
      go
      cargo
      rustc
      dart
    ];

    initLua = ''
      require("config")
    '';
  };

  # your lua config folder
  xdg.configFile."nvim".source = ../nvim;

  home.packages = with pkgs; [
    # LSPs
    typescript-language-server
    lua-language-server
    nixd
    gopls
    pyright
    marksman
    terraform-ls
    zls

    nodePackages.vscode-langservers-extracted

    nodejs_24

    ruff
    nodePackages.markdownlint-cli
  ];
}
