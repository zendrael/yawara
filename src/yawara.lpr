//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
// Yawara static site generator
//   main unit
// create application for console or web with cgi
// @author : Zendrael <zendrael@gmail.com>
// @date   : 2013/10/20
//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
program yawara;

{$mode objfpc}{$H+}

uses
	{$IFDEF UNIX}{$IFDEF UseCThreads}
	cthreads,
	{$ENDIF}{$ENDIF}
	Classes, SysUtils,
	// units do sistema
	untConsoleYawara, untWebYawara;

var
	ConsoleApp: TYawaraConsole;
	WebApp: TYawaraWeb;

begin
    // check which type of app to start
	if( GetEnvironmentVariable('HTTP_HOST') = '' ) then
	begin
		// Running Console Mode
		ConsoleApp := TYawaraConsole.Create(nil);
		ConsoleApp.Title := 'Yawara';
		ConsoleApp.Run;
		ConsoleApp.Free;
	end else
	begin
        // Running Web Mode
		WebApp := TYawaraWeb.Create(nil);
        WebApp.Title := 'Yawara';
        WebApp.Initialize;
		WebApp.Run;
		WebApp.Free;
	end;
end.


