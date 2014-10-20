﻿namespace Sugar.Collections;

interface

uses
  {$IF ECHOES}
  System.Collections.Generic;
  {$ELSEIF COOPER}
  com.remobjects.elements.linq;
  {$ELSEIF NOUGAT}
  Foundation,
  RemObjects.Elements.Linq;
  {$ENDIF}

extension method ISequence<T>.Contains<T>(arg: T): Boolean; {$IF NOUGAT}where T is class; {$ENDIF}

{$IF NOUGAT}
extension method ISequence<T>.ToArray<T>: array of T;
extension method ISequence<T>.ToList<T>: List<T>;
{$ENDIF}

implementation

extension method ISequence<T>.Contains<T>(arg: T): Boolean;
begin
  if self is List<T> then
    exit (self as List<T>).Contains(arg);
  for each i in self do
    if i = arg then exit true;
end;

{$IF NOUGAT}
extension method ISequence<T>.ToArray<T>: array of T;
begin
  if self is List<T> then
    exit (self as List<T>).ToArray;
  exit self.ToList<T>.ToArray();
end;

extension method ISequence<T>.ToList<T>: List<T>;
begin
  result := self.array().mutableCopy();
end;
{$ENDIF}

end.
    