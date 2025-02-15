
@cd /d "%~dp0"

@mkdir "releases"
@if exist "releases\fmtconv-rnew.zip" del "releases\fmtconv-rnew.zip"
@rmdir /s /q "reltmp"

@mkdir "reltmp"
@mkdir "reltmp\src"
@mkdir "reltmp\build\unix\m4"
@mkdir "reltmp\build\win\common"
@mkdir "reltmp\build\win\fmtconv"
@mkdir "reltmp\build\win\test"
@mkdir "reltmp\win32"
@mkdir "reltmp\win64"
@xcopy /I "doc"                                        "reltmp\doc"
@xcopy /I "src\avs"                                    "reltmp\src\avs"
@xcopy /I "src\avsutl"                                 "reltmp\src\avsutl"
@xcopy /I "src\conc"                                   "reltmp\src\conc"
@xcopy /I "src\ffft"                                   "reltmp\src\ffft"
@xcopy /I "src\fmtc"                                   "reltmp\src\fmtc"
@xcopy /I "src\fmtcavs"                                "reltmp\src\fmtcavs"
@xcopy /I "src\fmtcl"                                  "reltmp\src\fmtcl"
@xcopy /I "src\fstb"                                   "reltmp\src\fstb"
@xcopy /I "src\test"                                   "reltmp\src\test"
@xcopy /I "src\vsutl"                                  "reltmp\src\vsutl"
@copy     "src\*.cpp"                                  "reltmp\src"
@copy     "src\*.h"                                    "reltmp\src"
@copy     "src\*.hpp"                                  "reltmp\src"
@copy     "build\unix\autogen.sh"                      "reltmp\build\unix"
@copy     "build\unix\configure.ac"                    "reltmp\build\unix"
@copy     "build\unix\Makefile.am"                     "reltmp\build\unix"
@copy     "build\unix\m4\ax_*.m4"                      "reltmp\build\unix\m4"
@copy     "build\win\*.sln"                            "reltmp\build\win"
@copy     "build\win\*.vcxproj"                        "reltmp\build\win"
@copy     "build\win\*.vcxproj.filters"                "reltmp\build\win"
@copy     "build\win\*.props"                          "reltmp\build\win"
@copy     "build\win\common\*.vcxproj"                 "reltmp\build\win\common"
@copy     "build\win\common\*.vcxproj.filters"         "reltmp\build\win\common"
@copy     "build\win\fmtconv\*.vcxproj"                "reltmp\build\win\fmtconv"
@copy     "build\win\fmtconv\*.vcxproj.filters"        "reltmp\build\win\fmtconv"
@copy     "build\win\fmtconv\ReleaseWin32\fmtconv.dll" "reltmp\win32"
@copy     "build\win\fmtconv\Releasex64\fmtconv.dll"   "reltmp\win64"
@copy     "build\win\test\*.vcxproj"                   "reltmp\build\win\test"
@copy     "build\win\test\*.vcxproj.filters"           "reltmp\build\win\test"
@copy     "*.md"                                       "reltmp"
@copy     "COPYING"                                    "reltmp"

@cd reltmp

del /S *.lo *.o *.dirstamp *.deps

@echo fmtconv - Format conversion tools for Vapoursynth and Avisynth+ | "C:\Program Files (x86)\Infozip\zip.exe" -r -o -9 -z "..\releases\fmtconv-rnew.zip" "*.*"
@cd ..

@rmdir /s /q "reltmp"

@pause
