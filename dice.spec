Summary: Roll some dice. 
Name: dice-gui
Version: 2.0
Release: 1%{?dist}
License: GPL
URL: https://git.sr.ht/~elagost/dice
Source: https://git.sr.ht/~elagost/dice/archive/%{version}.tar.gz

BuildRequires:  gcc
BuildRequires:  make
BuildRequires:  vala
BuildRequires:  gtk4-devel
BuildRequires:  python3

Requires: gtk4
Requires: python3
Requires: desktop-file-utils

%global debug_package %{nil}

%description
A GUI and Python CLI to roll dice.

%prep
%setup

%build
make

%install
PREFIX=%{buildroot}%{_prefix} make install

%files
%doc README.md
%license LICENSE
%{_bindir}/dice
%{_bindir}/dice-cli
%{_datadir}/icons/hicolor/apps/dice.png
%{_datadir}/icons/hicolor/*/*
%{_datadir}/applications/dice.desktop

%changelog
* Wed Jul 7 2021 Elagost <mail@elagost.com>
- Created spec file
