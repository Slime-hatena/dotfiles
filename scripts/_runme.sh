#!/bin/bash
set -u

. "$dotfilesDirectory/scripts/_functions.sh"

main() {
  if ! exists runme; then
    info "brew経由でrunmeをインストールします。"
    brew install runme
  else
    info "runmeはインストール済みのためスキップします。"
  fi

  if ! exists runme; then
    error "runmeが存在しません。何らかの不具合が起きている可能性があります。"
    exit 1
  fi

  info "各README.mdに記載されているインストールスクリプトを実行します。"

  info "Homebrew経由で最低限のパッケージをインストールします。"
  runme run brew-init
  runme run brew-add-min
  if isMac; then
    runme run brew-add-min-mac
  fi

  if ask_yes_or_no "開発環境などで使用されるアプリケーションをインストールしますか？"; then
    runme run brew-add-dev
    if isMac; then
      runme run brew-add-dev-mac
    fi
  fi

  if ask_yes_or_no "その他の趣味や遊びで使用するアプリケーションをインストールしますか？"; then
    runme run brew-add-extra
    if isMac; then
      runme run brew-add-extra-mac
    fi
  fi

  runme run brew-install

  info "bashの設定ファイルを配置します。"
  runme run bash-install

  info "ghosttyの設定ファイルを配置します。"
  runme run ghostty-install

  info "gitの設定ファイルを配置します。"
  runme run git-install

  info "nvimの設定ファイルを配置します。"
  runme run nvim-install

  info "sshの設定ファイルを配置します。"
  runme run ssh-install

  info "tmuxの設定ファイルを配置します。"
  runme run tmux-install

  info "weztermの設定ファイルを配置します。"
  runme run wezterm-install

  info "zshの設定ファイルを配置します。"
  runme run zsh-install
}

main
