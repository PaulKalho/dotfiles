{ pkgs, ... }:

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

    go
    sops
  ];

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "philips";
      plugins = [
        "git"
      ];
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      dc = "docker compose";
      dp = "docker ps";
      c = "clear";
      dot = "cd ~/.config/dotfiles";
      pp = "pwd";
      ga = "git add";
      gc = "git commit";
      gd = "git diff";
      gp = "git push";
      gch = "git checkout";
    };

    initContent = ''
      # start tmux automatically (safe version)
      if command -v tmux >/dev/null && [ -z "$TMUX" ] && [ "$TERM" != "dumb" ]; then
        tmux new-session -A -s main
      fi
    '';
  };

  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "xterm-256color";
      };

      font.normal.family = "JetBrains Mono NF";

      window = {
        decorations = "none";
        dimensions = {
          columns = 90;
          lines = 30;
        };
      };

      colors = {
        primary = {
          background = "0x1b182c";
          foreground = "0xcbe3e7";
        };

        normal = {
          black = "0x100e23";
          red = "0xff8080";
          green = "0x95ffa4";
          yellow = "0xffe9aa";
          blue = "0x91ddff";
          magenta = "0xc991e1";
          cyan = "0xaaffe4";
          white = "0xcbe3e7";
        };

        bright = {
          black = "0x565575";
          red = "0xff5458";
          green = "0x62d196";
          yellow = "0xffb378";
          blue = "0x65b2ff";
          magenta = "0x906cff";
          cyan = "0x63f2f1";
          white = "0xa6b3cc";
        };
      };
    };
  };

  programs.tmux = {
    enable = true;

    plugins = [
      {
        plugin = pkgs.tmuxPlugins.minimal-tmux-status;

        extraConfig = ''
          set -g @minimal-tmux-fg "#000000"
          set -g @minimal-tmux-bg "#698DDA"
          set -g @minimal-tmux-justify "centre"
          set -g @minimal-tmux-indicator-str "  tmux  "
          set -g @minimal-tmux-indicator true
          set -g @minimal-tmux-status "top"

          # Enables or disables the left and right status bar
          set -g @minimal-tmux-right true
          set -g @minimal-tmux-left true

          # expanded icon (fullscreen icon)
          set -g @minimal-tmux-expanded-icon "󰊓 "

          # on all tabs (default is false)
          # false will make it visible for the current tab only
          set -g @minimal-tmux-show-expanded-icon-for-all-tabs true

          # To add or remove extra text in status bar
          set -g @minimal-tmux-status-right-extra ""
          set -g @minimal-tmux-status-left-extra ""

          set -g @minimal-tmux-use-arrow false

          # Not recommended to change these values
          set -g @minimal-tmux-status-right ""
          set -g @minimal-tmux-status-left "#S"

          # If getting strings cut in left status or right
          # Here 20 is the length of the characters in the string
          set -g status-right-length 20
          set -g status-left-length 20        
        '';
      }
    ];

    extraConfig = ''
      # general behavior
      set-option -g history-limit 25000
      set -g mouse on

      set -g status-position top
      set -g status-interval 1
      set -g status-left ""

      # indexing
      set -g base-index 1
      setw -g pane-base-index 1

      # reload config
      bind-key -r r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

      # splits keep cwd
      bind '"' split-window -c "#{pane_current_path}"
      bind '%' split-window -h -c "#{pane_current_path}"

      set -g default-terminal "screen-256color"
      set -ga terminal-overrides ",*256col*:Tc"
    '';
  };

  home.sessionPath = [
    "$HOME/go/bin"
  ];
}
