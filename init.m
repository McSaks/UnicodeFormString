BeginPackage["UnicodeFormString`"];

Unprotect[Evaluate @ Names[Context[] <> "*"]];

UnicodeFormString::usage = "\!\(\*StyleBox[RowBox[{\"UnicodeFormString\", \
\"[\", StyleBox[\"string\",\"TI\"], \",\", StyleBox[\"dataform\",\"TI\"], \
\"]\"}],\"MR\"]\) \
Formats a string with Unicode symbols with minimal glyph substitution. \
\!\(\*StyleBox[\"dataform\",\"TI\"]\) must be either \
\!\(\*StyleBox[\"TextData\",\"MR\"]\) (default) or \
\!\(\*StyleBox[\"BoxData\",\"MR\"]\).";

Begin["`Private`"];


UnicodeFormString[s_String, BoxData] := "\!\(\*StyleBox[\""<>StringReplace[s, {"\""->"\\\"","\\"->"\\\\"}]<>"\",\
  PrivateFontOptions->{\"OperatorSubstitution\"->False},\
  CharacterEncoding->\"Unicode\"]\)";
UnicodeFormString[s_String, BoxData, opts__] := "\!\(\*StyleBox[\""<>StringReplace[s, {"\""->"\\\"","\\"->"\\\\"}]<>"\",\
  PrivateFontOptions->{\"OperatorSubstitution\"->False},\
  CharacterEncoding->\"Unicode\","<>ToString[{opts},InputForm]<>"]\)";
UnicodeFormString[s_String, TextData] := "\*Cell[\""<>StringReplace[s, {"\""->"\\\"","\\"->"\\\\"}]<>"\",\
  PrivateFontOptions->{\"OperatorSubstitution\"->False},\
  CharacterEncoding->\"Unicode\"]";
UnicodeFormString[s_String, TextData, opts__] := "\*Cell[\""<>StringReplace[s, {"\""->"\\\"","\\"->"\\\\"}]<>"\",\
  PrivateFontOptions->{\"OperatorSubstitution\"->False},\
  CharacterEncoding->\"Unicode\","<>ToString[{opts},InputForm]<>"]";
UnicodeFormString[s_String] := UnicodeFormString[s, TextData];
UnicodeFormString[s_String,data_,opts___] :=
  (Message[UnicodeFormString::baddata, data]; "$Failed");
UnicodeFormString[s_,_,opts___] :=
  (Message[UnicodeFormString::nonstr, s]; "$Failed");
UnicodeFormString[] :=
  (Message[UnicodeFormString::argm, UnicodeFormString, 0, 1]; "$Failed");
(*UnicodeFormString[_,_,l__] :=
  (Message[UnicodeFormString::argt, UnicodeFormString, Length[{l}]+2, 1, 2]; "$Failed");*)
Options[UnicodeFormString] = Options[Cell];

UnicodeFormString::nonstr = "Arrgument `1` must be a string.";
UnicodeFormString::baddata = "Second argument (if exists) must be TextData or BoxData, recieved `1`.";

End[];

Protect[Evaluate @ Names[Context[] <> "*"]];

EndPackage[];
