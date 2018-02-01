//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
// Yawara static site generator
//   web unit
//   create web application
// @author : Zendrael <zendrael@gmail.com>
// @date   : 2013/10/20
//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
unit untWebYawara;

{$mode objfpc}{$H+}

interface

uses
	Classes, SysUtils, HTTPDefs, custcgi, custweb,
    //prepare for password reading/writing
    md5,
    //the Content Management System
    untSSG;

type

	TYawaraWeb = Class( TCustomCGIApplication )
		protected
			function InitializeWebHandler: TWebHandler; override;
		public
            //
	end;

	TYawaraCGIHandler = class(TCGIHandler)
		public
			procedure HandleRequest(ARequest: TRequest; AResponse: TResponse); override;
	end;

implementation

{ TYawaraWeb }

function TYawaraWeb.InitializeWebHandler: TWebHandler;
begin
    Result := TYawaraCGIHandler.Create( Self );
end;


{ TYawaraCGIHandler }

procedure TYawaraCGIHandler.HandleRequest(ARequest: TRequest;
	AResponse: TResponse);
begin
	//handle requests
    AResponse.ContentType := 'text/html; charset=utf-8';

    //testing page
    AResponse.Contents.Add('<h1>Yawara Web</h1>');

    //show header and menu

    //handle actions via GET
    case ARequest.QueryFields.Values['action'] of
		'list' : begin
			//get a list of all posts from
		end;

    	'new' : begin
			//
		end;

        'publish' : begin
			//
		end;

        'update' : begin
			//
		end;

        'help' : begin
			//
		end;

        else
			//AResponse.Contents.Add('Welcome!');
            AResponse.Contents.LoadFromFile('../testes/yawara/webinterface/index.html');
	end;

end;

end.

