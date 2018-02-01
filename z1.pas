program z1;

const
  MAX = 500;
  MINID = 1;
  MAXID = 500;

type
  par = record
    id1, id2: 1..500;
    slicnost: real;
  end;

  niz = array[1..MAX] of par;

var
  ulaz: text;
  ime: string;
  parovi: niz;
  n: integer;

procedure ucitajParove(var ulaz: text; var parovi: niz; var n: integer);
begin
  n:=1;
  while not eof(ulaz) do
  begin
    read(ulaz, parovi[n].id1, parovi[n].id2, parovi[n].slicnost);
    n:=n+1;
  end;
  n:=n-1;
end;

procedure ispisiParove(var parovi: niz; n: integer);
var
  i: integer;
begin
  for i:=1 to n do
  begin
    writeln(parovi[i].id1, ' ', parovi[i].id2, ' ', parovi[i].slicnost:2:2);
  end;
end;

procedure obrada(var parovi: niz; n: integer);
var
  id, i, maxPar, poj: integer;
  maxSlicnost: real;
begin
  for id:=MINID to MAXID do
  begin
    poj:=0;
    maxSlicnost:=-1;
    maxPar:=-1;

    for i:=1 to n do
    begin
      if (parovi[i].id1=id) then
        begin
          poj:=poj+1;
          if (parovi[i].slicnost>maxSlicnost) then
          begin
            maxSlicnost:=parovi[i].slicnost;
            maxPar:=parovi[i].id2;
          end;
        end
      else if (parovi[i].id2=id) then
        begin
          poj:=poj+1;
          if (parovi[i].slicnost>maxSlicnost) then
          begin
            maxSlicnost:=parovi[i].slicnost;
            maxPar:=parovi[i].id1;
          end;
        end

    end;

    if (poj>0) then
    begin
      writeln('ID: ', id);
      writeln('  pojavljivanja: ', poj);
      writeln('  najveca slicnost sa ', maxPar, ': ', maxSlicnost:2:2);
    end;

  end;
end;

begin

  readln(ime);
  assign(ulaz, ime);
  reset(ulaz);

  ucitajParove(ulaz, parovi, n);

  ispisiParove(parovi, n);

  obrada(parovi, n);

  close(ulaz);

  readln(n);

end.

