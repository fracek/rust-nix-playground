# This file was @generated by cargo2nix 0.11.0.
# It is not intended to be manually edited.

args@{
  release ? true,
  rootFeatures ? [
    "mycrate/default"
  ],
  rustPackages,
  buildRustPackages,
  hostPlatform,
  hostPlatformCpu ? null,
  hostPlatformFeatures ? [],
  target ? null,
  codegenOpts ? null,
  profileOpts ? null,
  cargoUnstableFlags ? null,
  rustcLinkFlags ? null,
  rustcBuildFlags ? null,
  mkRustCrate,
  rustLib,
  lib,
  workspaceSrc,
  ignoreLockHash,
}:
let
  nixifiedLockHash = "f25a81edc7487582235fdb28af53e7c6ceef3896f325490fc6c7f26d68e8ad68";
  workspaceSrc = if args.workspaceSrc == null then ./. else args.workspaceSrc;
  currentLockHash = builtins.hashFile "sha256" (workspaceSrc + /Cargo.lock);
  lockHashIgnored = if ignoreLockHash
                  then builtins.trace "Ignoring lock hash" ignoreLockHash
                  else ignoreLockHash;
in if !lockHashIgnored && (nixifiedLockHash != currentLockHash) then
  throw ("Cargo.nix ${nixifiedLockHash} is out of sync with Cargo.lock ${currentLockHash}")
else let
  inherit (rustLib) fetchCratesIo fetchCrateLocal fetchCrateGit fetchCrateAlternativeRegistry expandFeatures decideProfile genDrvsByProfile;
  profilesByName = {
  };
  rootFeatures' = expandFeatures rootFeatures;
  overridableMkRustCrate = f:
    let
      drvs = genDrvsByProfile profilesByName ({ profile, profileName }: mkRustCrate ({ inherit release profile hostPlatformCpu hostPlatformFeatures target profileOpts codegenOpts cargoUnstableFlags rustcLinkFlags rustcBuildFlags; } // (f profileName)));
    in { compileMode ? null, profileName ? decideProfile compileMode release }:
      let drv = drvs.${profileName}; in if compileMode == null then drv else drv.override { inherit compileMode; };
in
{
  cargo2nixVersion = "0.11.0";
  workspace = {
    mycrate = rustPackages.unknown.mycrate."0.1.0";
  };
  "registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "autocfg";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".bitflags."1.3.2" = overridableMkRustCrate (profileName: rec {
    name = "bitflags";
    version = "1.3.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".bytes."1.4.0" = overridableMkRustCrate (profileName: rec {
    name = "bytes";
    version = "1.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "89b2fd2a0dcf38d7971e2194b6b6eebab45ae01067456a7fd93d5547a61b70be"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" = overridableMkRustCrate (profileName: rec {
    name = "cfg-if";
    version = "1.0.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".hermit-abi."0.2.6" = overridableMkRustCrate (profileName: rec {
    name = "hermit-abi";
    version = "0.2.6";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
    dependencies = {
      libc = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.142" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".libc."0.2.142" = overridableMkRustCrate (profileName: rec {
    name = "libc";
    version = "0.2.142";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "6a987beff54b60ffa6d51982e1aa1146bc42f19bd26be28b0586f252fccf5317"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".lock_api."0.4.9" = overridableMkRustCrate (profileName: rec {
    name = "lock_api";
    version = "0.4.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"; };
    dependencies = {
      scopeguard = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".scopeguard."1.1.0" { inherit profileName; }).out;
    };
    buildDependencies = {
      autocfg = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" { profileName = "__noProfile"; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".log."0.4.17" = overridableMkRustCrate (profileName: rec {
    name = "log";
    version = "0.4.17";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"; };
    dependencies = {
      cfg_if = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".mio."0.8.6" = overridableMkRustCrate (profileName: rec {
    name = "mio";
    version = "0.8.6";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "5b9d9a46eff5b4ff64b45a9e316a6d1e0bc719ef429cbec4dc630684212bfdf9"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "net" ]
      [ "os-ext" ]
      [ "os-poll" ]
    ];
    dependencies = {
      ${ if hostPlatform.isUnix || hostPlatform.parsed.kernel.name == "wasi" then "libc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.142" { inherit profileName; }).out;
      log = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".log."0.4.17" { inherit profileName; }).out;
      ${ if hostPlatform.parsed.kernel.name == "wasi" then "wasi" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".wasi."0.11.0+wasi-snapshot-preview1" { inherit profileName; }).out;
      ${ if hostPlatform.isWindows then "windows_sys" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows-sys."0.45.0" { inherit profileName; }).out;
    };
  });
  
  "unknown".mycrate."0.1.0" = overridableMkRustCrate (profileName: rec {
    name = "mycrate";
    version = "0.1.0";
    registry = "unknown";
    src = fetchCrateLocal (workspaceSrc + "/mycrate");
    dependencies = {
      tokio = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".tokio."1.28.0" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".num_cpus."1.15.0" = overridableMkRustCrate (profileName: rec {
    name = "num_cpus";
    version = "1.15.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b"; };
    dependencies = {
      ${ if (hostPlatform.parsed.cpu.name == "x86_64" || hostPlatform.parsed.cpu.name == "aarch64") && hostPlatform.parsed.kernel.name == "hermit" then "hermit_abi" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".hermit-abi."0.2.6" { inherit profileName; }).out;
      ${ if !hostPlatform.isWindows then "libc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.142" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".parking_lot."0.12.1" = overridableMkRustCrate (profileName: rec {
    name = "parking_lot";
    version = "0.12.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
    dependencies = {
      lock_api = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".lock_api."0.4.9" { inherit profileName; }).out;
      parking_lot_core = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".parking_lot_core."0.9.7" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".parking_lot_core."0.9.7" = overridableMkRustCrate (profileName: rec {
    name = "parking_lot_core";
    version = "0.9.7";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "9069cbb9f99e3a5083476ccb29ceb1de18b9118cafa53e90c9551235de2b9521"; };
    dependencies = {
      cfg_if = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" { inherit profileName; }).out;
      ${ if hostPlatform.isUnix then "libc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.142" { inherit profileName; }).out;
      ${ if hostPlatform.parsed.kernel.name == "redox" then "syscall" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".redox_syscall."0.2.16" { inherit profileName; }).out;
      smallvec = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".smallvec."1.10.0" { inherit profileName; }).out;
      ${ if hostPlatform.isWindows then "windows_sys" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows-sys."0.45.0" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".pin-project-lite."0.2.9" = overridableMkRustCrate (profileName: rec {
    name = "pin-project-lite";
    version = "0.2.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.56" = overridableMkRustCrate (profileName: rec {
    name = "proc-macro2";
    version = "1.0.56";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "2b63bdb0cd06f1f4dedf69b254734f9b45af66e4a031e42a7480257d9898b435"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "proc-macro" ]
    ];
    dependencies = {
      unicode_ident = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.8" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".quote."1.0.26" = overridableMkRustCrate (profileName: rec {
    name = "quote";
    version = "1.0.26";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "proc-macro" ]
    ];
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.56" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".redox_syscall."0.2.16" = overridableMkRustCrate (profileName: rec {
    name = "redox_syscall";
    version = "0.2.16";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"; };
    dependencies = {
      bitflags = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".bitflags."1.3.2" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".scopeguard."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "scopeguard";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".signal-hook-registry."1.4.1" = overridableMkRustCrate (profileName: rec {
    name = "signal-hook-registry";
    version = "1.4.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d8229b473baa5980ac72ef434c4415e70c4b5e71b423043adb4ba059f89c99a1"; };
    dependencies = {
      libc = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.142" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".smallvec."1.10.0" = overridableMkRustCrate (profileName: rec {
    name = "smallvec";
    version = "1.10.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".socket2."0.4.9" = overridableMkRustCrate (profileName: rec {
    name = "socket2";
    version = "0.4.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "64a4a911eed85daf18834cfaa86a79b7d266ff93ff5ba14005426219480ed662"; };
    features = builtins.concatLists [
      [ "all" ]
    ];
    dependencies = {
      ${ if hostPlatform.isUnix then "libc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.142" { inherit profileName; }).out;
      ${ if hostPlatform.isWindows then "winapi" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".syn."2.0.15" = overridableMkRustCrate (profileName: rec {
    name = "syn";
    version = "2.0.15";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "a34fcf3e8b60f57e6a14301a2e916d323af98b0ea63c599441eec8558660c822"; };
    features = builtins.concatLists [
      [ "clone-impls" ]
      [ "default" ]
      [ "derive" ]
      [ "full" ]
      [ "parsing" ]
      [ "printing" ]
      [ "proc-macro" ]
      [ "quote" ]
    ];
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.56" { inherit profileName; }).out;
      quote = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.26" { inherit profileName; }).out;
      unicode_ident = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.8" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".tokio."1.28.0" = overridableMkRustCrate (profileName: rec {
    name = "tokio";
    version = "1.28.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "c3c786bf8134e5a3a166db9b29ab8f48134739014a3eca7bc6bfa95d673b136f"; };
    features = builtins.concatLists [
      [ "bytes" ]
      [ "default" ]
      [ "fs" ]
      [ "full" ]
      [ "io-std" ]
      [ "io-util" ]
      [ "libc" ]
      [ "macros" ]
      [ "mio" ]
      [ "net" ]
      [ "num_cpus" ]
      [ "parking_lot" ]
      [ "process" ]
      [ "rt" ]
      [ "rt-multi-thread" ]
      [ "signal" ]
      [ "signal-hook-registry" ]
      [ "socket2" ]
      [ "sync" ]
      [ "time" ]
      [ "tokio-macros" ]
      [ "windows-sys" ]
    ];
    dependencies = {
      bytes = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".bytes."1.4.0" { inherit profileName; }).out;
      ${ if hostPlatform.isUnix then "libc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.142" { inherit profileName; }).out;
      mio = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".mio."0.8.6" { inherit profileName; }).out;
      num_cpus = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".num_cpus."1.15.0" { inherit profileName; }).out;
      parking_lot = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".parking_lot."0.12.1" { inherit profileName; }).out;
      pin_project_lite = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".pin-project-lite."0.2.9" { inherit profileName; }).out;
      ${ if hostPlatform.isUnix then "signal_hook_registry" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".signal-hook-registry."1.4.1" { inherit profileName; }).out;
      ${ if !(hostPlatform.parsed.cpu.name == "wasm32" || hostPlatform.parsed.cpu.name == "wasm64") then "socket2" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".socket2."0.4.9" { inherit profileName; }).out;
      tokio_macros = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".tokio-macros."2.1.0" { profileName = "__noProfile"; }).out;
      ${ if hostPlatform.isWindows then "windows_sys" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows-sys."0.48.0" { inherit profileName; }).out;
    };
    buildDependencies = {
      autocfg = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" { profileName = "__noProfile"; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".tokio-macros."2.1.0" = overridableMkRustCrate (profileName: rec {
    name = "tokio-macros";
    version = "2.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "630bdcf245f78637c13ec01ffae6187cca34625e8c63150d424b59e55af2675e"; };
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.56" { inherit profileName; }).out;
      quote = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.26" { inherit profileName; }).out;
      syn = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."2.0.15" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.8" = overridableMkRustCrate (profileName: rec {
    name = "unicode-ident";
    version = "1.0.8";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".wasi."0.11.0+wasi-snapshot-preview1" = overridableMkRustCrate (profileName: rec {
    name = "wasi";
    version = "0.11.0+wasi-snapshot-preview1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" = overridableMkRustCrate (profileName: rec {
    name = "winapi";
    version = "0.3.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"; };
    features = builtins.concatLists [
      [ "handleapi" ]
      [ "ws2ipdef" ]
      [ "ws2tcpip" ]
    ];
    dependencies = {
      ${ if hostPlatform.config == "i686-pc-windows-gnu" then "winapi_i686_pc_windows_gnu" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-i686-pc-windows-gnu."0.4.0" { inherit profileName; }).out;
      ${ if hostPlatform.config == "x86_64-pc-windows-gnu" then "winapi_x86_64_pc_windows_gnu" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-x86_64-pc-windows-gnu."0.4.0" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi-i686-pc-windows-gnu."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi-x86_64-pc-windows-gnu."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows-sys."0.45.0" = overridableMkRustCrate (profileName: rec {
    name = "windows-sys";
    version = "0.45.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"; };
    features = builtins.concatLists [
      [ "Win32" ]
      [ "Win32_Foundation" ]
      [ "Win32_Networking" ]
      [ "Win32_Networking_WinSock" ]
      [ "Win32_Security" ]
      [ "Win32_Storage" ]
      [ "Win32_Storage_FileSystem" ]
      [ "Win32_System" ]
      [ "Win32_System_IO" ]
      [ "Win32_System_LibraryLoader" ]
      [ "Win32_System_Pipes" ]
      [ "Win32_System_SystemServices" ]
      [ "Win32_System_WindowsProgramming" ]
      [ "default" ]
    ];
    dependencies = {
      windows_targets = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows-targets."0.42.2" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows-sys."0.48.0" = overridableMkRustCrate (profileName: rec {
    name = "windows-sys";
    version = "0.48.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"; };
    features = builtins.concatLists [
      [ "Win32" ]
      [ "Win32_Foundation" ]
      [ "Win32_Security" ]
      [ "Win32_Security_Authorization" ]
      [ "Win32_Storage" ]
      [ "Win32_Storage_FileSystem" ]
      [ "Win32_System" ]
      [ "Win32_System_Console" ]
      [ "Win32_System_Pipes" ]
      [ "Win32_System_SystemServices" ]
      [ "Win32_System_Threading" ]
      [ "Win32_System_WindowsProgramming" ]
      [ "default" ]
    ];
    dependencies = {
      windows_targets = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows-targets."0.48.0" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows-targets."0.42.2" = overridableMkRustCrate (profileName: rec {
    name = "windows-targets";
    version = "0.42.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"; };
    dependencies = {
      ${ if hostPlatform.config == "aarch64-pc-windows-gnullvm" then "windows_aarch64_gnullvm" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_aarch64_gnullvm."0.42.2" { inherit profileName; }).out;
      ${ if hostPlatform.config == "aarch64-pc-windows-msvc" || hostPlatform.config == "aarch64-uwp-windows-msvc" then "windows_aarch64_msvc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_aarch64_msvc."0.42.2" { inherit profileName; }).out;
      ${ if hostPlatform.config == "i686-pc-windows-gnu" || hostPlatform.config == "i686-uwp-windows-gnu" then "windows_i686_gnu" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_i686_gnu."0.42.2" { inherit profileName; }).out;
      ${ if hostPlatform.config == "i686-pc-windows-msvc" || hostPlatform.config == "i686-uwp-windows-msvc" then "windows_i686_msvc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_i686_msvc."0.42.2" { inherit profileName; }).out;
      ${ if hostPlatform.config == "x86_64-pc-windows-gnu" || hostPlatform.config == "x86_64-uwp-windows-gnu" then "windows_x86_64_gnu" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_gnu."0.42.2" { inherit profileName; }).out;
      ${ if hostPlatform.config == "x86_64-pc-windows-gnullvm" then "windows_x86_64_gnullvm" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_gnullvm."0.42.2" { inherit profileName; }).out;
      ${ if hostPlatform.config == "x86_64-pc-windows-msvc" || hostPlatform.config == "x86_64-uwp-windows-msvc" then "windows_x86_64_msvc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_msvc."0.42.2" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows-targets."0.48.0" = overridableMkRustCrate (profileName: rec {
    name = "windows-targets";
    version = "0.48.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "7b1eb6f0cd7c80c79759c929114ef071b87354ce476d9d94271031c0497adfd5"; };
    dependencies = {
      ${ if false then "windows_aarch64_gnullvm" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_aarch64_gnullvm."0.48.0" { inherit profileName; }).out;
      ${ if hostPlatform.parsed.cpu.name == "aarch64" && hostPlatform.parsed.abi.name == "msvc" then "windows_aarch64_msvc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_aarch64_msvc."0.48.0" { inherit profileName; }).out;
      ${ if hostPlatform.parsed.cpu.name == "i686" && hostPlatform.parsed.abi.name == "gnu" then "windows_i686_gnu" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_i686_gnu."0.48.0" { inherit profileName; }).out;
      ${ if hostPlatform.parsed.cpu.name == "i686" && hostPlatform.parsed.abi.name == "msvc" then "windows_i686_msvc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_i686_msvc."0.48.0" { inherit profileName; }).out;
      ${ if hostPlatform.parsed.cpu.name == "x86_64" && hostPlatform.parsed.abi.name == "gnu" then "windows_x86_64_gnu" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_gnu."0.48.0" { inherit profileName; }).out;
      ${ if false then "windows_x86_64_gnullvm" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_gnullvm."0.48.0" { inherit profileName; }).out;
      ${ if hostPlatform.parsed.cpu.name == "x86_64" && hostPlatform.parsed.abi.name == "msvc" then "windows_x86_64_msvc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_msvc."0.48.0" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_aarch64_gnullvm."0.42.2" = overridableMkRustCrate (profileName: rec {
    name = "windows_aarch64_gnullvm";
    version = "0.42.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_aarch64_gnullvm."0.48.0" = overridableMkRustCrate (profileName: rec {
    name = "windows_aarch64_gnullvm";
    version = "0.48.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_aarch64_msvc."0.42.2" = overridableMkRustCrate (profileName: rec {
    name = "windows_aarch64_msvc";
    version = "0.42.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_aarch64_msvc."0.48.0" = overridableMkRustCrate (profileName: rec {
    name = "windows_aarch64_msvc";
    version = "0.48.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_i686_gnu."0.42.2" = overridableMkRustCrate (profileName: rec {
    name = "windows_i686_gnu";
    version = "0.42.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_i686_gnu."0.48.0" = overridableMkRustCrate (profileName: rec {
    name = "windows_i686_gnu";
    version = "0.48.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_i686_msvc."0.42.2" = overridableMkRustCrate (profileName: rec {
    name = "windows_i686_msvc";
    version = "0.42.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_i686_msvc."0.48.0" = overridableMkRustCrate (profileName: rec {
    name = "windows_i686_msvc";
    version = "0.48.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_gnu."0.42.2" = overridableMkRustCrate (profileName: rec {
    name = "windows_x86_64_gnu";
    version = "0.42.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_gnu."0.48.0" = overridableMkRustCrate (profileName: rec {
    name = "windows_x86_64_gnu";
    version = "0.48.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_gnullvm."0.42.2" = overridableMkRustCrate (profileName: rec {
    name = "windows_x86_64_gnullvm";
    version = "0.42.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_gnullvm."0.48.0" = overridableMkRustCrate (profileName: rec {
    name = "windows_x86_64_gnullvm";
    version = "0.48.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_msvc."0.42.2" = overridableMkRustCrate (profileName: rec {
    name = "windows_x86_64_msvc";
    version = "0.42.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".windows_x86_64_msvc."0.48.0" = overridableMkRustCrate (profileName: rec {
    name = "windows_x86_64_msvc";
    version = "0.48.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"; };
  });
  
}