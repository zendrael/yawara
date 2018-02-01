//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
// Yawara static site generator
//   console unit
//   create console application
// @author : Zendrael <zendrael@gmail.com>
// @date   : 2013/10/20
//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
unit untConsoleYawara;

{$mode objfpc}{$H+}

interface

uses
	Classes, SysUtils, CustApp,
    //the Content Management System
    untSSG;

type
	TYawaraConsole = class( TCustomApplication )
	protected
    	{Config: TSetupYawara;
    	strCatalogFiles, strCatalogTags: TStringList;  }
    	procedure DoRun; override;
	public
		constructor Create(TheOwner: TComponent); override;
		destructor Destroy; override;

        {procedure Draft( strFileName: string );
		procedure Publish;
		procedure Update( strFileName: string );
        }
        procedure Help; virtual;
        {

		function ProcessaTema(): WideString;
		function ProcessaPost( strDetail: string; strPost: TPost; criaLink: boolean): WideString;

		procedure ProcessaArquivo( strNomeArquivo: string; strCaminho: string; bolFinal: Boolean );

		procedure CriaIndexes;
		procedure CriaTags;
        }
		{
		procedure setCatalog( strTipo: string ); //tags ou posts
		procedure getCatalog( strTipo: string ); //tags ou posts
		}

	end;

implementation

procedure TYawaraConsole.DoRun;
var
  ErrorMsg: String;
  SSG : TSSG;
begin
    (*
		╔ = 201
		╚ = 200
		╗ = 187
		╝ = 188
		═ = 205
		║ = 186
	*)
	WriteLn('╔══════════════════════════════════════════════════════════════════════════════╗');
	WriteLn('║   YAWARA                                                                     ║');
	WriteLn('╚══════════════════════════════════════════════════════════════════════════════╝');
    WriteLn(' Static Site and Blog Generator                                           v0.7b ');
    WriteLn('--------------------------------------------------------------------------------');
    WriteLn('');

	//WriteLn('YAWARA - Static Site Generator - v0.6b');
    WriteLn('');

	{
		-d <filename> (draft/rascunho)
		-p (publica todos os posts e gera/atualiza o index, tags, sitemap e feed)
		-u (gera/atualiza o index, tags, sitemap e feed)
		-h (ajuda)
	}

	// quick check parameters
	ErrorMsg:= CheckOptions('dpu:h','draft publish update: help');

    if ErrorMsg<>'' then
    begin
		ShowException( Exception.Create( ErrorMsg ) );
		Terminate;
		Exit;
	end;

	// lendo parâmetros
	if HasOption('d','draft') then
    begin
		try
            SSG := TSSG.Create;
            SSG.Draft;//( GetOptionValue('d', 'draft') )
		finally
			FreeAndNil( SSG );
		end;

		Terminate;
		Exit;
	end;

	if HasOption('p','publish') then
    begin
		try
            SSG := TSSG.Create;
            SSG.Publish;//( GetOptionValue('p', 'publish') )
		finally
            FreeAndNil( SSG );
		end;

		Terminate;
		Exit;
	end;

	if HasOption('u','update') then
    begin
		{try
			Config:= TSetupYawara.Create;
			Config.getConfig;

			Atualizar( GetOptionValue('u', 'update') );

		finally
			Config.Destroy;
		end;
        }
		Terminate;
		Exit;
	end;

	if HasOption('h','help') then
    begin
		Help;

		Terminate;
		Exit;
	end;

    //nothing called, show help
    Help;

    //terminate app
	Terminate;
    Exit;
end;

procedure TYawaraConsole.Help;
begin
	WriteLn('Use as: ',ExeName,' [options]');
	WriteLn('');
	WriteLn('Commands:');
	WriteLn('  -d [file]' + #9 + ' Create drafs for all posts or single files');
	WriteLn('  -p' + #9#9 + ' Publish all posts');
	WriteLn('  -u [file]' + #9 + ' Update some file or post');
	WriteLn('  -h, --help' + #9 + ' Show this help message');
	WriteLn('');
	WriteLn('');
end;


constructor TYawaraConsole.Create(TheOwner: TComponent);
begin
	inherited Create(TheOwner);
	StopOnException:=True;
end;

destructor TYawaraConsole.Destroy;
begin
	inherited Destroy;
end;


end.

