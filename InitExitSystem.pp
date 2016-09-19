unit InitExitSystem;


interface


  Procedure Add2Init(Proc: TProcedure);
  Procedure Add2Exit(Proc: TProcedure);

  Procedure ProcessInit;
  Procedure ProcessExit;


implementation

var
  InitProcs : array of TProcedure;
  ExitProcs : array of TProcedure;


Procedure Add2Init(Proc: TProcedure);
begin
  SetLength(InitProcs, Length(InitProcs) + 1);
  InitProcs[High(InitProcs)] := Proc;
end;


Procedure Add2Exit(Proc: TProcedure);
begin
  SetLength(ExitProcs, Length(ExitProcs) + 1);
  ExitProcs[High(ExitProcs)] := Proc;
end;


Procedure ProcessInit;
var
  i : Integer;
begin
  for i := Low(InitProcs) to High(InitProcs) 
    do InitProcs[i];
  SetLength(InitProcs, 0);
end;


Procedure ProcessExit;
var
  i : Integer;
begin
  for i := High(ExitProcs) downto Low(ExitProcs) 
    do ExitProcs[i];
  SetLength(ExitProcs, 0);
end;


end.
