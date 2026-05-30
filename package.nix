# @path: ~/projects/nixproj/derivations/trae/package.nix
# @anthor: redskaber
# @datetime: 2026-05-31
# @description: nix derivation build for trae

{ pkgs, system, sources }:

let
  srcInfo = sources.${system} or (throw "Unsupported system: ${system}");
  version = sources.version;
in pkgs.stdenv.mkDerivation rec {
  pname = "trae";
  inherit version;

  src = pkgs.fetchurl {
    url = srcInfo.url;
    sha256 = srcInfo.sha256;
  };

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    dpkg
    makeWrapper
  ];

  buildInputs = with pkgs; [
    # Electron
    libxkbfile
    libkrb5
    libxscrnsaver
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gtk3
    libGL
    libX11
    libXcomposite
    libXcursor
    libXdamage
    libXext
    libXfixes
    libXi
    libXrandr
    libXrender
    libXtst
    libdrm
    libnotify
    libsecret
    libuuid
    libxcb
    libxshmfence
    mesa
    nss
    pango
    systemd
    zlib

    webkitgtk_4_1    # libwebkit2gtk-4.1.so.0
    libsoup_3        # libsoup-3.0.so.0
    libvncserver     # other
  ];

  # autoPatchelf huu musl version bin
  # Alpine Linux，in'not NixOS
  autoPatchelfIgnoreMissingDeps = [
    "libc.musl-x86_64.so.1"
  ];

  unpackPhase = ''
    ar x $src
    tar -xvf data.tar.* --no-same-permissions --no-same-owner
  '';

  installPhase = ''
    mkdir -p $out/bin $out/share/trae

    # 1. auto install path
    if [ -d "opt/Trae" ]; then
      cp -av opt/Trae/* $out/share/trae/
    elif [ -d "opt/trae" ]; then
      cp -av opt/trae/* $out/share/trae/
    elif [ -d "usr/share/trae" ]; then
      cp -av usr/share/trae/* $out/share/trae/
    fi

    # 2. remove maby fix lib
    rm -rf $out/share/trae/resources/app/extensions/*-musl-* 

    # 3. install resource
    mkdir -p $out/share/icons/hicolor/scalable/apps $out/share/applications
    if [ -d "usr/share/icons" ]; then
      cp -av usr/share/icons/* $out/share/icons/ 2>/dev/null || true
    fi
    if [ -d "usr/share/applications" ]; then
      cp -av usr/share/applications/* $out/share/applications/ 2>/dev/null || true
    fi

    # 4. Desktop execute path
    find $out/share/applications -name "*.desktop" -exec sed -i "s|Exec=.*|Exec=$out/bin/trae %U|g" {} +

    # 5. wrapper
    makeWrapper $out/share/trae/trae $out/bin/trae \
      --prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath buildInputs}" \
      --add-flags "--no-sandbox" \
      --add-flags "--enable-features=UseOzonePlatform" \
      --add-flags "--ozone-platform-hint=auto" \
      --set DOT_QODER_PATH "$HOME/.trae" 
  '';


  meta = with pkgs.lib; {
    homepage = "https://www.trae.ai/";
    description = "Trae Agentic Coding IDE";
    platforms = [ "x86_64-linux" "aarch64-linux" ]; 
    license = licenses.unfree;
    mainProgram = "trae";
    maintainers = with lib.maintainers; [ redskaber ];
  };
}



