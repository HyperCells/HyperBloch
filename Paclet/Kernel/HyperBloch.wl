(* ::Package:: *)

(* ::Section:: *)
(*Package Header*)


BeginPackage["PatrickMLenggenhager`HyperBloch`"];


HCCellGraph::usage = "HCCellGraph[assoc] represents a cell graph with its properties defined by the Association assoc";
HCModelGraph::usage = "HCModelGraph[assoc] represents a model graph with its properties defined by the Association assoc";
HCSupercellModelGraph::usage = "HCSupercellModelGraph[assoc] represents a supercell model graph with its properties defined by the Association assoc";

HBDisclinationModelGraph::usage = "HBDisclinationModelGraph[assoc] represents a model graph with disclinations with its properties defined by the Association assoc";
HBDisclinationSupercellModelGraph::usage = "HBDisclinationSupercellModelGraph[assoc] represents a supercell model graph with disclinations with its properties defined by the Association assoc";

HCQuotientSequencesStructure::usage = "HCQuotientSequencesStructure[assoc] represents a quotient sequences structure adjacency matrix specifying normal subgroup relations of translation groups with its properties defined by the Association assoc";


ImportCellGraphString::usage = "ImportCellGraphString[\"string\"] imports a cell graph from a string and returns an HCCellGraph";
ImportModelGraphString::usage = "ImportModelGraphString[\"string\"] imports a model graph from a string and returns an HCModelGraph";
ImportSupercellModelGraphString::usage = "ImportSupercellModelGraphString[\"string\"] imports a supercell model graph from a string and returns an HCSupercellModelGraph";
ImportQuotientSequencesStructureString::usage = "ImportQuotientSequencesStructureString[\"string\"] import a quotient sequences structure adjacency matrix specifying normal subgroup relations of translation groups from a string and returns a HCQuotientSequencesStructure";

HCExampleData::usage = "HCExampleData[\"name\"] imports and returns the specified HCC/HCM/HCS/HCQS example file from \"PatrickMLenggenhager/HyperBloch/ExampleData/\".";

IntroduceDisclination::usage = "IntroduceDisclination[mgraph, FrankAngleIncrement, ReferenceAngleIncrement] introduces a disclination in a finite (supercell) model graph mgraph specified by a Frank angle \!\(\*SubscriptBox[\(\[Alpha]\), \(F\)]\)=FrankAngleIncrement*\[Pi]/m and a normal vector of the disclination \!\(\*OverscriptBox[\(n\), \(\[RightVector]\)]\)=RotationMatrix[ReferenceAngleIncrement*\[Pi]/m]\[CenterDot]{1, 0}, with m\[Element]{r,q,p} specified by the cell center.";

ShowTriangles::usage = "ShowTriangles[tg] constructs the Schwarz triangles of the triangle group with signature tg in the Poincar\[EAcute] disk representation";

ResolveVertex;
ResolveEdge;
ResolveTranslation;

GetWyckoffPosition::usage = "GetWyckoffPosition[tg, {w,\"g\"}] returns the Cartesian coordinates of the maximally-symmetric Wyckoff position of type w and label g of the triangle group tg";
GetSchwarzTriangle::usage = "GetSchwarzTriangle[tg, \"g\"] returns a Polygon representing the Schwarz triangle labeled by g of the triangle group tg";
GetVertex::usage = "GetVertex[tg, {w,\"g\"}] returns a Point representing a vertex at the position of the maximally-symmetric Wyckoff position of type w and label g of the triangle group tg";
GetEdge::usage = "GetEdge[tg,{{w1, g1},{w2, g2},...}] returns a Line representing the edge (or succession of edges) specified by vertices {wi, gi} of the triangle group tg";
GetCellGraphVertex::usage = "GetCellGraphVertex[cgraph, vertex] returns a Point representing the position of vertex of the HCCellGraph, HCModelGraph, or HCSupercellModelGraph cgraph in the Poincar\[EAcute] disk";
GetCellGraphEdge::usage = "GetCellGraphEdge[cgraph, edge] returns a Line representing edge of the HCCellGraph, HCModelGraph, or HCSupercellModelGraph cgraph in the Poincar\[EAcute] disk";
GetTranslatedCellGraphEdge::usage = "GetTranslatedCellGraphEdge[cgraph, edge, \"\[Gamma]\"] returns a Line representing edge of the HCCellGraph, HCModelGraph, or HCSupercellModelGraph cgraph in the Poincar\[EAcute] disk, translated by the translation \[Gamma]";
GetCellGraphFace::usage = "GetCellGraphFace[cgraph, face] constructs a polygon and list of arrows representing the face face of the cell, model, or supercell model graph cgraph with head HCCellGraph, HCModelGraph, or HCSupercellModelGraph, respectively, and its boundary in the Poincar\[EAcute] disk, respectively";

GetCellBoundary::usage = "GetCellBoundary[cgraph] constructs the cell boundary of the HCCellGraph cgraph";

ShowCellGraph::usage = "ShowCellGraph[cgraph] shows the cell, model, or supercell model graph cgraph with head HCCellGraph, HCModelGraph, or HCSupercellModelGraph, respectively, in the Poincar\[EAcute] disk";
ShowCellSchwarzTriangles::usage = "ShowCellSchwarzTriangles[cgraph] shows the Schwarz triangles making up the cell underlying the cell, model, or supercell model graph cgraph with head HCCellGraph, HCModelGraph, or HCSupercellModelGraph, respectively";
ShowCellGraphFlattened::usage = "ShowCellGraphFlattened[cgraph] shows a flattened, i.e., not compactified, version of the cell, model, or supercell model graph cgraph with head HCCellGraph, HCModelGraph, or HCSupercellModelGraph, respectively, in the Poincar\[EAcute] disk";
ShowCellBoundary::usage = "ShowCellBoundary[cgraph] shows the boundary and boundary identification of the cell on which the cell graph cgraph with head HCCellGraph is defined";

VisualizeCellGraph::usage = "VisualizeCellGraph[cgraph] visualizes the cell graph cgraph with head HCCellGraph in the Poincar\[EAcute] disk with the Schwarz triangles in the background";
VisualizeModelGraph::usage = "VisualizeModelGraph[mgraph] visualizes the (supercell) model graph mgraph with head HCModelGraph (HCSupercellModelGraph) in the Poincar\[EAcute] disk with the Schwarz triangles in the background";
VisualizeQuotientSequences::usage = "VisualizeQuotientSequences[qsStructure] visualizes the quotient sequences structure adjacency matrix in qsStructure with head HCAdjacencyMatrix as a tree graph as a LayeredDigraphEmbedding";

AbelianBlochHamiltonianExpression::usage = "AbelianBlochHamiltonianExpression[mgraph, norb, onsite, hoppings, k] constructs the Abelian Bloch Hamiltonian \[ScriptCapitalH](k) of the HCModelGraph or HCSupercellModelGraph mgraph with the number of orbitals at each site specified by norb, the onsite term by onsite, and the hopping along an edge by hoppings in terms of momenta k[i]";
AbelianBlochHamiltonian::usage = "AbelianBlochHamiltonian[mgraph, norb, onsite, hoppings] returns the Abelian Bloch Hamiltonian \[ScriptCapitalH](k) of the HCModelGraph or HCSupercellModelGraph mgraph with the number of orbitals at each site specified by norb, the onsite term by onsite, and the hopping along an edge by hoppings as a function k :> \[ScriptCapitalH](k)";

NonReciprocalAbelianBlochHamiltonianExpression::usage = "NonReciprocalAbelianBlochHamiltonianExpression[mgraph, norb, onsite, hoppingsCanonical, hoppingsOpposite, k] constructs the non-reciprocal Abelian Bloch Hamiltonian \[ScriptCapitalH](k) of the HCModelGraph or HCSupercellModelGraph mgraph with the number of orbitals at each site specified by norb, the onsite term by onsite, and the hopping along an edge in the canonical direction by hoppingsCanonical and opposite direction by hoppingsOpposite in terms of momenta k[i]";
NonReciprocalAbelianBlochHamiltonian::usage = "NonReciprocalAbelianBlochHamiltonian[mgraph, norb, onsite, hoppingsCanonical, hoppingsOpposite] returns the non-reciprocal Abelian Bloch Hamiltonian \[ScriptCapitalH](k) of the HCModelGraph or HCSupercellModelGraph mgraph with the number of orbitals at each site specified by norb, the onsite term by onsite, and the hopping along an edge in the canonical direction by hoppingsCanonical and opposite direction by hoppingsOpposite as a function k :> \[ScriptCapitalH](k)";

TBHamiltonian::usage = "TBHamiltonian[mgraph, norb, onsite, hoppings] or TBHamiltonian[mgraph, HCPCmgraph, norb, onsite, hoppingsPC, hoppingsGluedEdges] constructs the tight-binding Hamiltonian H of the finite HCModelGraph, HCSupercellModelGraph or HBDisclinationModelGraph, HBDisclinationSupercellModelGraph mgraph, respectively. The number of orbitals at each site specified by norb, the onsite term by onsite, and the hopping along an edge and possibly a glued edge by hoppings and hoppingsGluedEdges, respectively.";
NonReciprocalTBHamiltonian::usage = "NonReciprocalTBHamiltonian[mgraph, norb, onsite, hoppingsCanonical, hoppingsOpposite] or NonReciprocalTBHamiltonian[mgraph, HCPCmgraph, norb, onsite, hoppingsCanonicalPC, hoppingsOppositePC, hoppingsCanonicalGluedEdges, hoppingsOppositeGluedEdges] constructs the non-reciprocal tight-binding Hamiltonian H of the HCModelGraph, HCSupercellModelGraph or HBDisclinationModelGraph, HBDisclinationSupercellModelGraph mgraph, respectively. The number of orbitals at each site specified by norb, the onsite term by onsite, and the hopping along an edge and possibly a glued edge in the canonical or opposite direction by hoppingsCanonical, hoppingsOpposite or hoppingsCanonicalPC, hoppingsOppositePC and hoppingsCanonicalGluedEdges or hoppingsOppositeGluedEdges, respectively.";


RasterizeGraphics;
NumberOfGenerations;
DiskCenter;
ColorFill;
ColorBoundary;
LineThickness;

SchwarzTriangleOrientation;

ShowEquivalentEdge;

StartingVertex;

CellBoundaryStyle;
EdgeColorFunction;
ShowEdgeIdentification;
ShowTranslatedCells;
ShowTranslationIndices;
ShowTranslationLabels;
ShowTranslations;
TranslatedCellBoundaryStyle;
TranslationLabelStyle;

CellVertexStyle;
EdgeArrowSize;
EdgeFilter;
InterCellEdgeStyle;
IntraCellEdgeStyle;
ShowEdgeTranslations;
ShowInterCellEdges;
ShowIntraCellEdges;
ShowVertexLabels;

CellEdgeStyle;

ShowTriangleLabels;
TriangleLabelStyle;
TriangelRange;
TriangleStyle;

Elements;
CellGraph;
IndicateDisclination;
DisclinationLineStyle;

EdgeArrowPosition;
HighlightMirrorSymmetries;
HighlightMirrorSymmetriesVertexStyle;
HighlightSubgraph;
HighlightSubgraphEdgeStyle;
LayerDistributionFunction;
ShowVertexLabels;
VertexFilter;
VertexLabelPlacement;
VertexLabelFunction;

SymmetrizeFlake;

PCModel;
ReturnSparseArray;
CompileFunction;
Parameters;
PBCCluster;


Begin["`Private`"];


(* ::Section::Closed:: *)
(*Initialization*)


(* print banner *)
Print["HyperBloch - Version 0.9.1\nMain author: Patrick M. Lenggenhager\n\nThis package loads the following dependencies:\n\t- L2Primitives by Srdjan Vukmirovic\n\t- NCAlgebra by J. William Helton and Mauricio de Oliveira"];


Needs["PatrickMLenggenhager`HyperBloch`L2Primitives`"];


(* check NCAlgebra *)
HyperBloch::NCAlgebra = "`1`";
If[Not[Or@@((Count[ToExpression/@StringCases[#["Version"],
		RegularExpression["(\\d)\\.\\d\\.\\d"]:>"$1"],m_/;m>=6]>0)&/@
		PacletFind["NCAlgebra"])
	],
	Message[HyperBloch::NCAlgebra,
		"No paclet version of NCAlgebra with version >= 6 was found. Version 6 or later is required. Custom installations should work but might lead to problems."
	];
];


(* load NCAlgebra *)
Quiet[Get["NCAlgebra`"], {NCAlgebra`NCAlgebra::SmallCapSymbolsNonCommutative}];
SetOptions[inv, Distribute->True];
SetCommutative[a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z];
ClearAll[a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z];


(* ::Section:: *)
(*Definitions*)


(* ::Subsection::Closed:: *)
(*Type Definitions*)


HCCellGraph[cgraph_][key_] := cgraph[key]
HCModelGraph[mgraph_][key_] := mgraph[key]
HCSupercellModelGraph[scmgraph_][key_] := scmgraph[key]

HBDisclinationModelGraph[mgraph_][key_] := mgraph[key]
HBDisclinationSupercellModelGraph[scmgraph_][key_] := scmgraph[key]

HCQuotientSequencesStructure[qsStructure_][key_] := qsStructure[key]


(* ::Subsection::Closed:: *)
(*Helper Functions*)


GetFullGraph[graph_] := Graph[
	VertexList@graph,
	EdgeList@DirectedGraph[EdgeList@graph /. DirectedEdge -> UndirectedEdge],
	Evaluate@Sequence@@AbsoluteOptions[graph, VertexCoordinates] 
]


GetUndirectedGraph[graph_] := Graph[
	VertexList@graph,
	EdgeList@Graph[EdgeList@graph /. DirectedEdge -> UndirectedEdge],
	Evaluate@Sequence@@AbsoluteOptions[graph, VertexCoordinates]
]


CyclicallyPermuteList[list_, n_] := Permute[list, PermutationPower[Cycles[{Range[Length[list]]}], n]]


CyclicallyPermuteFaceEdges[face_, n_]:=Graph[VertexList[face], CyclicallyPermuteList[EdgeList[face], n], Sequence@@AbsoluteOptions[face]]


(* ::Subsection::Closed:: *)
(*Group Elements and Vertex Positions*)


InterpretGroupElementString[str_, rules_] := NCExpand@ToExpression@StringReplace[
	str,
	Join[{RegularExpression["\\^([\\-0-9]+)"]->"^($1)","*"->"**"}, (#[[1]] -> ToString[#[[2]]])&/@ rules]
];


Options[GetSitePosition] = {SchwarzTriangleOrientation -> "Default", DiskCenter -> 3};
GetSitePosition[tg_, w_, expr_, OptionsPattern[]] := Module[
	{p, q, r, P, Q, R, ops, triangle, op, i, rules},
	(* triangle group signature *)
	{r, q, p} = Sort[tg];
	
	(* position of sites of fundamental triangle *)
	{R, Q, P} = Switch[OptionValue[SchwarzTriangleOrientation],
		"Default", Block[{pp, qq, rr, pts}, 
			{rr, qq, pp} = CyclicallyPermuteList[{r, q, p}, Mod[-OptionValue[DiskCenter], 3]];
			pts = {
				PDPoint[\[Sqrt]((Cos[\[Pi] * (1/pp+1/rr)]+Cos[\[Pi]/qq])/(Cos[\[Pi] * (1/pp-1/rr)]+Cos[\[Pi]/qq])){Cos[Pi/pp], Sin[Pi/pp]}],
				PDPoint[\[Sqrt]((Cos[\[Pi] * (1/pp+1/qq)]+Cos[\[Pi]/rr])/(Cos[\[Pi] * (1/pp-1/qq)]+Cos[\[Pi]/rr])){1,0}],
				PDPoint[{0,0}]
			};
			CyclicallyPermuteList[pts, -Mod[-OptionValue[DiskCenter], 3]]
		]
	];
	
	Block[{x, y, z, a, b, c},
		SetNonCommutative[x, y, z, a, b, c];
		rules = {"x" -> x, "y" -> y, "z" -> z, "a" -> a, "b" -> b, "c" -> c};
		((NCExpand[InterpretGroupElementString[expr, rules]^-1]) /. NonCommutativeMultiply -> Composition /. {
			1 -> (#&),
			x -> Function[{s}, L2Rotation[R, 2Pi/r][s]],
			y -> Function[{s}, L2Rotation[Q, 2Pi/q][s]],
			z -> Function[{s}, L2Rotation[P, 2Pi/p][s]],
			a -> Function[{s}, L2Reflection[LLine[{P, R}]][s]],
			b -> Function[{s}, L2Reflection[LLine[{Q, R}]][s]],
			c -> Function[{s}, L2Reflection[LLine[{P, Q}]][s]],
			Power[x, e_] :> Function[{s}, L2Rotation[R, 2Pi e/r][s]],
			Power[y, e_] :> Function[{s}, L2Rotation[Q, 2Pi e/q][s]],
			Power[z, e_] :> Function[{s}, L2Rotation[P, 2Pi e/p][s]],
			Power[a, e_] :> If[Mod[e, 2] == 1, Function[{s}, L2Reflection[LLine[{P,R}]][s]], (#&)],
			Power[b, e_] :> If[Mod[e, 2] == 1, Function[{s}, L2Reflection[LLine[{Q,R}]][s]], (#&)],
			Power[c, e_] :> If[Mod[e, 2] == 1, Function[{s}, L2Reflection[LLine[{P,Q}]][s]], (#&)]
		})[{R, Q, P}[[w]]]
	]
]


(* ::Subsection::Closed:: *)
(*Import of Cell Graphs*)


ImportCellGraphString[str_]:=Module[{
		version, tg, specs, rels, center, \[CapitalGamma]gens, TD\[CapitalGamma], TGGw, vlbls, vcoords,
		vertices, edges, etransls, facesstr, faces, faceedges, boundary
	},
	If[StringStartsQ[str, "HyperCells"],
		{version, tg, specs, \[CapitalGamma]gens, TD\[CapitalGamma], TGGw, vertices, edges, etransls, facesstr, boundary} =
			StringSplit[StringReplace[str,{"["->"{","]"->"}"}], "\n"];
		version = StringReplace[version, RegularExpression["HyperCells HCC version ([0-9.]+)"] -> "$1"];,
		{tg, specs, \[CapitalGamma]gens, TD\[CapitalGamma], TGGw, vertices, edges, etransls, facesstr, boundary} =
			StringSplit[StringReplace[str,{"["->"{","]"->"}"}], "\n"];
		version = "";
	];

	(* info *)
	tg = ToExpression@tg; (* triangle group signature *)
	{rels, center} = StringTrim[#, {"{", "}"}]&/@ StringSplit[specs, "},"];
	rels = StringSplit[rels, ", "]; (* cell relators *)
	center = ToExpression@center; (* cell center *)
	
	(* graph *)
	vertices = ToExpression@vertices;
	edges = DirectedEdge[vertices[[#1]], vertices[[#2]], #3]&@@@ToExpression[edges];
	faces = Table[
		Graph[
			Table[
				If[e[[2]] == 1,
					edges[[e[[1]]]],
					DirectedEdge[edges[[e[[1]], 2]], edges[[e[[1]], 1]], -edges[[e[[1]], 3]]]
				],
				{e, face}
			]
		],
		{c, 1, 3}, {face, ToExpression[facesstr][[c]]}
	];
	faceedges = Map[edges[[#[[1]]]]&,ToExpression[facesstr][[center]], {2}];
	
	(* algebra *)
	\[CapitalGamma]gens = "(" <> # <> ")" &/@(AssociationThread@@(StringTrim[StringSplit[StringTrim[#, {"{", "}"}], ","], " "]&/@StringSplit[\[CapitalGamma]gens, " -> "]));
	TD\[CapitalGamma] = StringTrim[StringSplit[StringTrim[TD\[CapitalGamma], {"{", "}"}], ","], " "];
	vlbls = (StringSplit[StringTrim[#, {"{ ", " }"}], ", "]&/@StringSplit[StringTrim[TGGw, {"{ ", " }"}], " }, { "])[[#[[1]], #[[2]]]]&/@vertices;
	
	(* translations *)
	etransls = StringTrim[StringSplit[StringTrim[etransls,{"{","}"}],","]," "];
	boundary = If[boundary=="{ }", {},
		{#1, #2, ToExpression@#3, ToExpression@#4, ToExpression@#5, #6}&@@@(
			StringTrim[StringSplit[#, ","], " "]&/@StringTrim[StringSplit[StringTrim[boundary, {"{", "}"}], "}, {"], {" { ", " } ", " "}]
		)
	];
	
	(* coordinates *)
	vcoords = Table[
		LToGraphics[GetSitePosition[tg, vertices[[i,1]], vlbls[[i]], DiskCenter -> center], Model->PoincareDisk][[1]],
		{i, Length[vertices]}
	];
	
	HCCellGraph[<|
		"TriangleGroup" -> tg,
		"CellCenter" -> center,
		"Genus" -> Length[\[CapitalGamma]gens]/2,
		"Graph"-> Graph[vertices, edges, VertexCoordinates -> vcoords],
		"VertexLabels" -> vlbls,
		"SchwarzTriangleLabels" -> TD\[CapitalGamma],
		"EdgeTranslations" -> etransls,
		"BoundaryEdges" -> boundary,
		"TranslationGenerators" -> \[CapitalGamma]gens,
		"Faces" -> faces[[center]],
		"FaceEdges" -> faceedges,
		"AllFaces" -> faces
	|>]
]


(* ::Subsection::Closed:: *)
(*Import of Model Graphs*)


ImportModelGraphString[str_]:=Module[{
		version, tg, specs, \[CapitalGamma]gens, TD\[CapitalGamma], TGGw, model, vertices, edges, etransls, facesstr,
		rels, center, vlbls, vcoords, graph, faces, faceedges
	},
	If[StringStartsQ[str, "HyperCells"],
		{version, tg, specs, \[CapitalGamma]gens, TD\[CapitalGamma], TGGw, model, vertices, edges, etransls, facesstr} =
			StringSplit[StringReplace[str, {"["->"{", "]"->"}"}], "\n"];
		version = StringReplace[version, RegularExpression["HyperCells HCM version ([0-9.]+)"] -> "$1"];,
		{tg, specs, \[CapitalGamma]gens, TD\[CapitalGamma], TGGw, model, vertices, edges, etransls, facesstr} =
			StringSplit[StringReplace[str, {"["->"{", "]"->"}"}], "\n"];
		version = "";
	];

		
	(* info *)
	tg = ToExpression@tg; (* triangle group signature *)
	{rels, center} = StringTrim[#, {"{", "}"}]&/@ StringSplit[specs, "},"];
	rels = StringSplit[rels, ", "]; (* cell relators *)
	center = ToExpression@center; (* cell center *)
	
	(* algebra *)
	\[CapitalGamma]gens = "(" <> # <> ")" &/@(AssociationThread@@(StringTrim[StringSplit[StringTrim[#, {"{", "}"}], ","], " "]&/@StringSplit[\[CapitalGamma]gens, " -> "]));
	TD\[CapitalGamma] = StringTrim[StringSplit[StringTrim[TD\[CapitalGamma], {"{", "}"}], ","], " "];
	
	(* graph *)
	vertices = ToExpression@vertices;
	edges = DirectedEdge[vertices[[#1]], vertices[[#2]], #3]&@@@ToExpression[edges];
	faces = Table[
		Graph[
			Table[
				If[e[[2]] == 1,
					edges[[e[[1]]]],
					DirectedEdge[edges[[e[[1]], 2]], edges[[e[[1]], 1]], -edges[[e[[1]], 3]]]
				],
				{e, face}
			]
		],
		{face, ToExpression[facesstr]}
	];
	
	faceedges = Map[edges[[#[[1]]]]&, ToExpression[facesstr], {2}];
	
	(* vertex labels and coordinates *)
	vlbls = (StringSplit[StringTrim[#, {"{ ", " }"}], ", "]&/@StringSplit[StringTrim[TGGw, {"{ ", " }"}], " }, { "])[[#[[1]], #[[2]]]]&/@vertices;	
	vcoords = Table[
		LToGraphics[GetSitePosition[tg, vertices[[i,1]], vlbls[[i]], DiskCenter -> center], Model->PoincareDisk][[1]],
		{i, Length[vertices]}
	];
	
	(* edge translations *)
	etransls = StringTrim[StringSplit[StringTrim[etransls,{"{", "}"}], ","], " "];
	
	(* graph *)
	graph = Graph[vertices, edges, VertexCoordinates -> vcoords];
	
	HCModelGraph[<|
		"TriangleGroup" -> tg,
		"CellCenter" -> center,
		"Genus" -> Length[\[CapitalGamma]gens]/2,
		"Graph" -> graph,
		"UndirectedGraph" -> GetUndirectedGraph@graph,
		"FullGraph" -> GetFullGraph@graph,
		"VertexLabels" -> vlbls,
		"SchwarzTriangleLabels" -> TD\[CapitalGamma],
		"EdgeTranslations" -> etransls,
		"TranslationGenerators" -> \[CapitalGamma]gens,
		"Faces" -> faces,
		"FaceEdges" -> faceedges
	|>]
]


(* ::Subsection::Closed:: *)
(*Import of Supercell Model Graphs*)


ImportSupercellModelGraphString[str_]:=Module[{
		version, tg, specs, \[CapitalGamma]0gens, TD\[CapitalGamma]0, TG0Gw, \[CapitalGamma]gens, \[CapitalGamma]\[CapitalGamma]0, T\[CapitalGamma]0\[CapitalGamma], TD\[CapitalGamma], TGGw,
		model, vertices, vertexpos, edges, etransls, facesstr,
		rels0, rels, center, vlbls, vcoords, graph, faces, faceedges
	},
	
	If[StringStartsQ[str, "HyperCells"],
		{version, tg, specs, \[CapitalGamma]0gens, TD\[CapitalGamma]0, TG0Gw, \[CapitalGamma]gens, \[CapitalGamma]\[CapitalGamma]0, T\[CapitalGamma]0\[CapitalGamma], TD\[CapitalGamma], TGGw, model, vertices, vertexpos, edges, etransls, facesstr} =
			StringSplit[StringReplace[str, {"["->"{", "]"->"}"}], "\n"];
		version = StringReplace[version, RegularExpression["HyperCells HCS version ([0-9.]+)"] -> "$1"];,
		{tg, specs, \[CapitalGamma]0gens, TD\[CapitalGamma]0, TG0Gw, \[CapitalGamma]gens, \[CapitalGamma]\[CapitalGamma]0, T\[CapitalGamma]0\[CapitalGamma], TD\[CapitalGamma], TGGw, model, vertices, vertexpos, edges, etransls, facesstr} =
			StringSplit[StringReplace[str, {"["->"{", "]"->"}"}], "\n"];
		version = "";
	];

	(* info *)
	tg = ToExpression@tg; (* triangle group signature *)
	{rels0, rels, center} = StringTrim[#, {"{", "}"}]&/@ StringSplit[specs, "},"];
	rels0 = StringSplit[rels0, ", "]; (* primitive cell relators *)
	rels = StringSplit[rels, ", "]; (* supercell relators *)
	center = ToExpression@center; (* cell center *)
	
	(* algebra *)
	\[CapitalGamma]0gens = "(" <> # <> ")" &/@(AssociationThread@@(StringTrim[StringSplit[StringTrim[#, {"{", "}"}], ","], " "]&/@StringSplit[\[CapitalGamma]0gens, " -> "]));
	TD\[CapitalGamma]0 = StringTrim[StringSplit[StringTrim[TD\[CapitalGamma]0, {"{", "}"}], ","], " "];
	\[CapitalGamma]gens = "(" <> # <> ")" &/@(AssociationThread@@(StringTrim[StringSplit[StringTrim[#, {"{", "}"}], ","], " "]&/@StringSplit[\[CapitalGamma]gens, " -> "]));
	\[CapitalGamma]\[CapitalGamma]0 = "(" <> # <> ")" &/@(AssociationThread@@(StringTrim[StringSplit[StringTrim[#, {"{", "}"}], ","], " "]&/@StringSplit[\[CapitalGamma]\[CapitalGamma]0, " -> "]));
	T\[CapitalGamma]0\[CapitalGamma] = StringTrim[StringSplit[StringTrim[T\[CapitalGamma]0\[CapitalGamma], {"{", "}"}], ","], " "];
	TD\[CapitalGamma] = StringTrim[StringSplit[StringTrim[TD\[CapitalGamma], {"{", "}"}], ","], " "];
	
	(* graph *)
	vertices = ToExpression@vertices;
	vertexpos = StringTrim[StringSplit[StringTrim[vertexpos, {"{", "}"}], ","], " "];
	edges = DirectedEdge[vertices[[#1]], vertices[[#2]], #3]&@@@ToExpression[edges];
	faces = Table[
		Graph[
			Table[
				If[e[[2]] == 1,
					edges[[e[[1]]]],
					DirectedEdge[edges[[e[[1]], 2]], edges[[e[[1]], 1]], -edges[[e[[1]], 3]]]
				],
				{e, face}
			]
		],
		{face, ToExpression[facesstr]}
	];
	faceedges = Map[edges[[#[[1]]]]&, ToExpression[facesstr], {2}];
	
	(* vertex labels and coordinates *)
	vlbls = vertexpos;(*(StringSplit[StringTrim[#, {"{ ", " }"}], ", "]&/@StringSplit[StringTrim[TGGw, {"{ ", " }"}], " }, { "])[[#[[1]], #[[2]]]]&/@vertices;	*)
	vcoords = Table[
		LToGraphics[GetSitePosition[tg, vertices[[i,1]], vlbls[[i]], DiskCenter -> center], Model->PoincareDisk][[1]],
		{i, Length[vertices]}
	];
	
	(* edge translations *)
	etransls = StringTrim[StringSplit[StringTrim[etransls,{"{", "}"}], ","], " "];
	
	(* graph *)
	graph = Graph[vertices, edges, VertexCoordinates -> vcoords];
	
	HCSupercellModelGraph[<|
		"TriangleGroup" -> tg,
		"CellCenter" -> center,
		"PCGenus" -> Length[\[CapitalGamma]0gens]/2,
		"Genus" -> Length[\[CapitalGamma]gens]/2,
		"Graph" -> graph,
		"UndirectedGraph"->GetUndirectedGraph@graph,
		"FullGraph" -> GetFullGraph@graph,
		"VertexLabels" -> vlbls,
		"SchwarzTriangleLabels" -> TD\[CapitalGamma],
		"EdgeTranslations" -> etransls,
		"PCTranslationGenerators" -> \[CapitalGamma]0gens,
		"TranslationGenerators" -> \[CapitalGamma]gens,
		"TranslationGroupEmbedding" -> \[CapitalGamma]\[CapitalGamma]0,
		"InternalSupercellTranslations" -> T\[CapitalGamma]0\[CapitalGamma],
		"Faces" -> faces,
		"FaceEdges" -> faceedges
	|>]
]


(* ::Subsection::Closed:: *)
(*Import of quotient sequences structure adjacency matrices:*)


Options[ImportQuotientSequencesStructureString] = {	
	ToDense -> False
};

ImportQuotientSequencesStructureString[str_, opts:OptionsPattern[{ImportQuotientSequencesStructureString}]]:=Module[
	{version, tg, bg, tgQuotientNames, mspLst, sparse, adjMat, genusLst, dim},
	 
	If[StringStartsQ[str, "HyperCells"],    
		{version, tg, bg, tgQuotientNames, mspLst, sparse, adjMat} = 
			StringSplit[StringReplace[str, {"["->"{", "]"->"}"}], "\n"];
		version = StringReplace[version, RegularExpression["HyperCells HCS version ([0-9.]+)"] -> "$1"];,
		{tg, bg, tgQuotientNames, mspLst, sparse, adjMat} = 
			StringSplit[StringReplace[str, {"["->"{", "]"->"}"}], "\n"];
		version = "";
	];

	(* info *)
	tg = ToExpression@tg; (* triangle group signature *) 
	tgQuotientNames = ToExpression@tgQuotientNames; 
	bg = ToExpression@bg; (* bound by genus *)
	mspLst = ToExpression@mspLst; (* binary list of mirror symmetries *)
	adjMat = ToExpression@adjMat; (* adjacency matrix *)
	
	(* for sparse rep., adjust format *)
	sparse = If[sparse == "true", True, False];
	dim = Length[tgQuotientNames];
	If[sparse, adjMat = SparseArray[#[[1]] -> #[[2]]&/@adjMat, {dim, dim}]; If[OptionValue[ToDense], adjMat = Normal@adjMat]];

	HCQuotientSequencesStructure[<|
	 "TriangleGroup" -> tg,
	 "BoundByGenus" -> bg,
	 "TGQuotientNames" -> tgQuotientNames,
	 "MirrorSymmetries" -> mspLst,
	 "AdjacencyMatrix" -> adjMat
	|>]
]


(* ::Subsection::Closed:: *)
(*Example Data*)


HCExampleData[filename_] := Module[{
	content = Import["PatrickMLenggenhager/HyperBloch/ExampleData/"<>filename]
},
	Switch[StringSplit[filename, "."][[-1]],
		"hcc", ImportCellGraphString[content],
		"hcm", ImportModelGraphString[content],
		"hcs", ImportSupercellModelGraphString[content],
		"hcqs", ImportQuotientSequencesStructureString[content]
	]
]


(* ::Subsection::Closed:: *)
(*Introduce disclination defects*)


NegativeIntegerQ[x_]:= x \[Element] NonPositiveIntegers;
PositiveIntegerQ[x_]:= x \[Element] NonNegativeIntegers;


IntroduceDisclination::InvalidFrankAngle="The absolute Frank angle increment can neither be 0, `2` or larger then `2`, but `1` was provided.";
IntroduceDisclination::InvalidReferenceAngle="The reference angle increment must be smaller than `2`, but `1` was provided.";
IntroduceDisclination::NotImplemented="Unfortunately, the current implementation does not support the introduction of disclination defects in next-nearest neighbor model graphs.";


syntacticSign = (-1)^Boole[Internal`SyntacticNegativeQ@#]&; (* get the sign of an expression regardless if it is a symbol or a numerical value *)
syntacticAbs = (-1)^Boole[Internal`SyntacticNegativeQ@#]#&; 


VertexCoordinatesInSymmetrizedFlake[angles_, vcoords_, wedgeAngle_, referenceAngle_, FrankAngleSign_] := Module[{anglesTilde},
	anglesTilde = angles - (angles - wedgeAngle)(\[Pi]/(\[Pi] - wedgeAngle)); (* new angles *)
	(RotationMatrix[FrankAngleSign syntacticSign[(RotationMatrix[2\[Pi] - referenceAngle] . vcoords[[#]])[[2]]]anglesTilde[[#]]] . vcoords[[#]])&/@Range[Length@vcoords]
]


(* TODO: finish PBCClusters, implement positive Frank angles, NNN-graphs and multiple disclinations by repeated function calls *)
Options[IntroduceDisclination] = {
	SymmetrizeFlake -> False
}; 

IntroduceDisclination[mgraph_HCModelGraph|mgraph_HCSupercellModelGraph, FrankAngleIncrement_?NegativeIntegerQ, referenceAngleIncrement_?PositiveIntegerQ, 
	opts : OptionsPattern[{IntroduceDisclination}]]:= 		
	Catch[Module[
		{tg, center, vertices, edges, edgesOld, etransls, vlbls, vcoords, graph, faces, facesstr, faceedges, angles,
		 edgesRemoved, idxInterCellRemove, glueByRadius, reattachByRadius, idxgluedEdges, gluedEdges, anglesTilde, 
		 idxIntraInterCellRemove, IsLieb, tagIndices, verticesPC, edgesReattached, wedgeConnectivtyGraph, idxRemove, 
		 wedgeAngle, referenceAngle, connectedVertices, enumGluedEdges, RemoveVertexAtOrigin, dropVertices, cellIdx,
		 reattachedEdgesRaw, enumReattchedEdges, reattchedEdges, IsPC, NNOrNNN, radiusTolerance, angleTolerance,
		 AllGluedEdges, PBCEdgesEtransls, PBCCluster},
	
	(* Check input and format it: *)
	(* ------------------------ *)
	
	tg = mgraph["TriangleGroup"];
	center = mgraph["CellCenter"];
	
	If[0 < Abs[FrankAngleIncrement] < tg[[center]], 0, 
		Throw@Message[IntroduceDisclination::InvalidFrankAngle, Abs[FrankAngleIncrement], tg[[center]]]];
	If[referenceAngleIncrement < 2*tg[[center]], 0,
		Throw@Message[IntroduceDisclination::InvalidReferenceAngle, referenceAngleIncrement, 2*tg[[center]]]]; 	
	
	wedgeAngle = Abs[FrankAngleIncrement]*\[Pi]/tg[[center]]; 
	referenceAngle = referenceAngleIncrement*\[Pi]/tg[[center]];
	
	(* ----------------- *)
	(* Define tolerances: *)
	(* ----------------- *)
	
	(* bug fixes, needed due to rounding inaccuracies in L2Primitives.wl *)
	angleTolerance = 10^-8; (* used in the cutting procedure *)
	radiusTolerance = 10^-8; (* used in the glueing procedure *)
			
	(* ------------------------------------- *)
	(* Get needed objects from the model graph: *)
	(* ------------------------------------- *)
	
	IsPC = Head[mgraph] === HCModelGraph;	
	cellIdx = If[IsPC, {}, {3}]; (* adjust indexing (primitive cell or supercell) *)
	graph = mgraph["Graph"];

	vertices = VertexList@graph;
	vlbls = mgraph["VertexLabels"];	
	vcoords = GraphEmbedding[graph]; 
	
	(* vertices in the primitive cell *)
	verticesPC = If[IsPC, VertexList@graph, Sort[DeleteDuplicates[(VertexList@graph)[[;;, {1, 2}]]]]];
	
	edgesOld = EdgeList@mgraph["Graph"]; (* to be kept for indexing *)
	edges = {Position[vertices, #[[1]]][[1, 1]], Position[vertices, #[[2]]][[1, 1]], #[[3]]}&/@edgesOld; (* will be overwritten *)
	etransls = mgraph["EdgeTranslations"]; 
	
	(* throw error for NNN-graphs *)
	NNOrNNN = PositionIndex[edges[[;;, 3, Sequence@@cellIdx, 1]]]; 
	If[KeyExistsQ[NNOrNNN, 2],
		Throw@Message[IntroduceDisclination::NotImplemented], 0]; 	
	
	faces = mgraph["Faces"];
	facesstr = Table[
		Table[
			{Position[edgesOld, (mgraph["FaceEdges"])[[i, j]]][[1, 1]], (* index in cell graph edge list *)
			 Sign[(EdgeList/@faces)[[i, j, 3, 1]]]}, (* orientation *)
		 {j, Length[EdgeList@faces[[i]]]}],
	 {i, Length[faces]}]; (* facesstr is a misnomer ("inherited") *)
	
	(* Check if the model graph describes a Lieb lattice: *)
	IsLieb = Length[edgesOld[[1, 3, Sequence@@cellIdx, 2]]] == 0;
	tagIndices = If[IsLieb, {{3, 2}, {3, 2}}, {{3, 2, 2}, {3, 2, 3}}]; (* indices for tagging edges (for the glueing procedure) *)
	
	(* --------------------------------------------------- *)
	(* Identify indices of vertices/edges that will be removed: *)
	(* --------------------------------------------------- *)

	(* inter-cell edges that will be removed *)
	idxInterCellRemove = Flatten[Position[mgraph["EdgeTranslations"], _?(# != "1"&)]];
	PBCEdgesEtransls = If[False, Transpose[{edgesOld[[idxInterCellRemove]], etransls[[idxInterCellRemove]]}], {}]; (* currently inactive *)
	
	(* vertex angles relative to some reference *)
	RemoveVertexAtOrigin = False; (* private option *)
	angles = Which[ Norm[#] == 0. && RemoveVertexAtOrigin, 0, 
					Norm[#] == 0. && RemoveVertexAtOrigin == False, 2\[Pi], (* ensure that the origin will not be removed *)
					Norm[#] != 0., Module[{item = Re@ArcSin[(#/Norm[#]) . RotationMatrix[referenceAngle] . {0, 1}]},
									     If[item == 0., 1, Sign@item] * VectorAngle[#, RotationMatrix[referenceAngle] . {1, 0}]] ] &/@ vcoords; (* signed angles relative to vector RotationMatrix[referenceAngle].{1, 0} *)
									     
	(* Vertices for removal; of the form: idx -> {AtCut, signAngle} where idx is the index of the
	   vertex to be removed, AtCut is a boolean which indicates that the vertex is located at the
	   cut( True) or not (False) and signAngle is the sign of the angle in the list of angles (see
	   further description in the section glueing procedure below). *)
	idxRemove = Join[
		Association[# -> {True, Sign@angles[[#[[1]]]]} &/@Position[angles, n_ /; wedgeAngle - angleTolerance <= Abs@n <= wedgeAngle + angleTolerance]],  (* \[PlusMinus] angleTolerance (bug fix see the above comment) *)
		Association[# -> {False, False} &/@Position[angles, n_ /; Abs@n < wedgeAngle - angleTolerance] ]]; 
	
	(* "edgesReattched" are edges which connect any vertex located anywhere including at the cut
	    with a vertex located at a cut, "edgesRemoved" are intra-cell + inter-cell edges that will
	    be removed and "edges" are the remaining edges *)
	(* Elements in edgesReattached are of the form: 
	   {edge, idxEdge, {{boolVertex1Removed, AtCut1, signAngle1}, {boolVertex2Removed, AtCut2, signAngle2}}},
	   where edge is a list of the form {vertex1, vertex2, tag} and idxEdge is the index of the 
	   edge in the list of old edges. The third entry is a pair of tuples where boolVertex1Removed, 
	   boolVertex2Removed are booleans indicating whether the vertices connected by the edge "edge"
	   are "removed" (see further description below), AtCut1, AtCut2 are booleans iff boolVertex1Removed,
	   boolVertex2Removed are True indicating if vertex1, vertex2 are located at the cut or not,
	   respectively, or they are empty lists {} iff boolVertex1Removed, boolVertex2Removed are False,
	   respectively, and signAngle1, signAngle2 are the signs of the angles in list of angles. *)
	(* Elements in edgesRemoved are of the reduced form: 
	   {edge, idxEdge, {boolVertex1Removed, boolVertex2Removed}}. *)
	(* Note: boolVertex1Removed, boolVertex2Removed are somewhat misleading names. If anyone of 
			 them is True the corresponding vertex will not necessarily be removed (see the 
			 conditions in the glueing procedure). *)
	{edgesReattached, edgesRemoved, edges} = Module[
		{lst1 = {}, lst2 = {}, lst3 = {}, item1, item2, AtCut1, AtCut2,
		 signAngle1, signAngle2, boolVertex1Removed, boolVertex2Removed}, 
			
		If[ MemberQ[idxInterCellRemove, Position[edges, {#1, #2, #3}][[1, 1]]], ##&[],
			If[ 
				boolVertex1Removed = KeyExistsQ[idxRemove, {#1}];
				boolVertex2Removed = KeyExistsQ[idxRemove, {#2}];
				
				Or[ boolVertex1Removed, boolVertex2Removed ],
				If[ 
					{AtCut1, signAngle1} = If[boolVertex1Removed, idxRemove[{#1}], {{}, {}}];
					{AtCut2, signAngle2} = If[boolVertex2Removed, idxRemove[{#2}], {{}, {}}];
					item1 = {{#1, #2, #3}, Position[edges, {#1, #2, #3}][[1, 1]]}; (* edge, idxEdge *)
					item2 = {{{boolVertex1Removed, AtCut1, signAngle1}, {boolVertex2Removed, AtCut2, signAngle2}}};
					
					MemberQ[item2[[1, ;;, 2]], True],
					AppendTo[lst1, Join[item1, item2]], (* reattched edges *)
					AppendTo[lst2, Join[item1, item2[[;;, ;;, 1]]]] (* removed edges *)
				   ];,
				AppendTo[lst3, DirectedEdge[vertices[[#1]], vertices[[#2]], #3]] (* unchanged edges *)
			  ]
			]&@@@edges;
		{lst1, lst2, lst3}]; 

	(* all intra-, inter-cell edges that will be removed (potential reintroduction further below) *)
	idxIntraInterCellRemove = If[MemberQ[edges, edgesOld[[#]]], ## &[], {#}]&/@Range[Length@edgesOld];
	etransls = Delete[mgraph["EdgeTranslations"], idxIntraInterCellRemove]; (* new edge translations *)
	
	(* list of connected vertices remaining, used to delete possible duplicates *)
	connectedVertices = Flatten[{{#1, #2}, {#2, #1}}&@@@edges, 1];
	
	(* --------------- *)
	(* Construct wedge: *)
	(* --------------- *)
	
	(* wedge graph, used to check vertex connectivity *)
	wedgeConnectivtyGraph = GetUndirectedGraph@Graph[
		If[ Or[#[[3, 1]] == #[[3, 2]] && #[[3, 1]] == True, #[[3, 1]] != #[[3, 2]]] && MemberQ[idxInterCellRemove, #[[2]]] == False, 
			DirectedEdge[vertices[[#[[1, 1]]]], vertices[[#[[1, 2]]]], #[[1, 3]]],
			## &[] 
		]&/@edgesRemoved ];
	
	(* ---------------------------------------- *)
	(* Start glueing procedure (Volterra process): *)
	(* ---------------------------------------- *)
	
	(* The glueing procedure is split in two sub-procedures denoted as:
	
	   1. Glueing procedure
	   2. Reattachment procedure
	
	   1. Glue vertices together within the remaining graph:
	   -------------------------------------------------
	
	   1.0. Collect edges that have been cut through.
	   1.1. Determine the (euclidean) radial distance of vertices to the origin (see further
	        comments in the code),and collect other needed informations of the cut out edges.
	   1.2. Find vertex pairs to be glued together, provided:
	   1.3. 3 connectivity checks are passed:
	        1.3.1. check for potential pairs of vertices and discard single vertices ,
	        1.3.2. remove glued pairs that already exist in the remaining graph
	        1.3.3. and check if glued vertices were perviously connected by a path in the 
	               cut out wedge.
	         
	   2.  Fuse vertices together located at the two cuts:
	   -----------------------------------------------
	   	         
	   2.0. Collect edges that have vertices at the cuts.
	   2.1. Determine the (euclidean) radial distance of vertices to the origin (see further 
	        comments in the code), and collect other needed informations of the cut out edges.
	   2.2. Find vertex pairs at opposite cuts through the signed angles.
	   2.3. Fuse the vertex pairs and potentially reattache edges.  
	    
	    The following rules are enforced:
	     1. Canonical choice: If a vertex pair has been found, keep the vertex at the "upper" cut
	        (postitive signed angle) and remove the vertex at the "bottom" cut (negative signed angle).
	     2. Single vertices will be preserved regardless of the sign of the angles. 
	
	   Note: the procedure also tries to make an (educated) guess for the edge orientation. Signs
			 are assigned to the canonical oriented edges {v1, v2} -> {-, +} in the list edgesOld.
			 In the construction of glued/reattached edges it is first tested whether the first 
	         entry is v1 (of an old edge) and if so the orientation is assumed to be canonical 
	         regardless if the second entry is a vertex w1 or w2 (of an old edge). 
	         TODO: find informed approach *)
	   
		(* 1. Glueing procedure: *)
		(* ------------------- *)
		
		(* necessary indicators for glueing vertices *)
		(* "glueByRadius" is of the form: {gv, rad, {rv, {tag[[1]], s1 or s2}}} where gv is the 
		   vertex to be glued to another vertex (potentialy), rad the radial distance to the 
		   origin (not hyperbolic distance!) rounded to the radiusTolerance (potential bug for
		   very large flakes as well as very large p and q), rv is the vertex that will be re-
		   moved, tag is the edge tage of the removed edge in the primitive cell and s1, s2 are 
		   the positions of the Schwarz triangles associated with the cell-graph edges in the 
		   primitive cell. *)
		glueByRadius = If[ Xor[#3[[1]], #3[[2]]], 
						   {(1 - Boole[#3[[1]]])vertices[[#1[[1]]]] + (1 - Boole[#3[[2]]])vertices[[#1[[2]]]], (* vertex that will be glued *)
						    (1 - Boole[#3[[1]]])Round[Norm[vcoords[[#1[[1]]]]], radiusTolerance] + (1 - Boole[#3[[2]]])Round[Norm[vcoords[[#1[[2]]]]], radiusTolerance], (* radius *)
							{Sign[1/2 - Boole[#3[[2]]]](Boole[#3[[1]]]vertices[[#1[[1]]]] + Boole[#3[[2]]]vertices[[#1[[2]]]]), (* signed vertex that will be removed, sign -> orientation *)
								{#1[[3, Sequence@@cellIdx, 1]], (1 - Boole[#3[[1]]])#1[[Sequence@@cellIdx, Sequence@@tagIndices[[1]]]] + (1 - Boole[#3[[2]]])#1[[Sequence@@cellIdx, Sequence@@tagIndices[[2]]]]}}}, (*{tag[[1]], s1 or s2} *)
						  ## &[]
					]&@@@edgesRemoved;

		(* new edges that glue separated parts together *)
		(* find matching partner, (check 1.3.1.) *)              								          						               								          						                 
		idxgluedEdges = Module[{VeRad, partner}, 
			VeRad = PositionIndex[glueByRadius[[;;, {1, 2}]]]; (* unique tuples {vertex, radius} -> {idx1, idx2, ...} *)
			Table[ partner = Position[SubsetReplace[Keys[VeRad], {k} -> {0, 0}][[;;, 2]], k[[2]]];
				   If[partner === {} , ## &[],
					  If[ VeRad[k][[1]] < VeRad[[partner[[1, 1]]]][[1]], (* avoid potential duplicates *)
						 {VeRad[k][[1]], VeRad[[partner[[1, 1]]]][[1]]}, ##&[]]
					  ],
				{k, Keys[VeRad]}] 
			];

		(* delete pairs which already exist, and or check if there 
		   exists a path in the cut out wedge that connects them *)
		idxgluedEdges = If[MemberQ[connectedVertices, {glueByRadius[[#[[1]], 1]], glueByRadius[[#[[2]], 1]]}] == False,  (* check 1.3.2. *)
			If[FindPath[wedgeConnectivtyGraph, glueByRadius[[#[[1]], 1]], glueByRadius[[#[[2]], 1]]] != {}, #, ## &[]], (* check 1.3.3. *)
			## &[]
			]&/@idxgluedEdges;
			
		(* enumerate entries *)
		enumGluedEdges = Transpose[{idxgluedEdges, Range[Length@idxgluedEdges]}];  
		
		(* construct glued edges *)
		gluedEdges = Module[{i, j, tagPC, tag},
			(*  Primitive cells:
				The edge tags are of the form {1, {{"g", gi}, s1, s2}}, the first entry, 1, 
				indicates a nearest-neighbor edge, {"g", gi} a tuple, with string "g" indicating 
				that the vertices have been glued together and gi an integer between 1 and the 
				total number of glued edges indicating the position of the glued edge in the list 
				AllGluedEdges and s1, s2 are the positions of the Schwarz triangles associated 
				with the cell-graph edges in the primitive cell. *)
		    (*  Supercells:
				The edge tags are of the form {vpc1, vpc2, {1 ,{{"g", gi}, spc1, spc2}}}, with 
				vpc1, vpc2 the positions of the vertices in the primitive cell and spc1, spc2 are
				the positions of the Schwarz triangles associated with the cell-graph edges in 
				the primitive cell. *)
		    Table[
				Append[connectedVertices, {glueByRadius[[e[[1, 2]], 1]], glueByRadius[[e[[1, 1]], 1]]}]; 
				Append[connectedVertices, {glueByRadius[[e[[1, 1]], 1]], glueByRadius[[e[[1, 2]], 1]]}];
				{i, j} = If[Sign[Total@glueByRadius[[e[[1, 1]], 3, 1]]] == 1, {2, 1}, {1, 2}]; (* try to preserve the orientation *)
				tagPC = {glueByRadius[[e[[1, i]], 3, 2, 1]], {{"g", e[[2]]}, glueByRadius[[e[[1, i]], 3, 2, 2]], glueByRadius[[e[[1, j]], 3, 2, 2]]}}; (* {1, {{"g", gi}, spc1, spc2}} *)
				tag = If[IsPC, tagPC, Join[{Position[verticesPC, glueByRadius[[e[[1, i]], 1, {1, 2}]]][[1, 1]], Position[verticesPC, glueByRadius[[e[[1, j]], 1, {1, 2}]]][[1, 1]]}, {tagPC}]]; (* {vpc1, vpc2, tagPC} *)
				{DirectedEdge[glueByRadius[[e[[1, i]], 1]], glueByRadius[[e[[1, j]], 1]], tag], Sign[Total@glueByRadius[[e[[1, 1]], 3, 1]]]}, (* {edge, orientation} *)
				{e, enumGluedEdges}]
		  ];						 				
					
		(* 2. Reattachment procedure: *)
		(* ------------------------ *)

		(* necessary indicators for reattching vertices *)
		(* "reattachByRadius" is of the form: {edge, {vertex1, s1, radius1, signAngle1}, {vertex2, s2, radius2, signAngle2}}. *)
		reattachByRadius = {#1, (* edge *)
							{vertices[[#1[[1]]]], #1[[Sequence@@cellIdx, Sequence@@tagIndices[[1]]]], Round[Norm[vcoords[[#1[[1]]]]], radiusTolerance], #3[[1, 3]]}, (* {vertex1, s1, radius1, signAngle1} *)
							{vertices[[#1[[2]]]], #1[[Sequence@@cellIdx, Sequence@@tagIndices[[2]]]], Round[Norm[vcoords[[#1[[2]]]]], radiusTolerance], #3[[2, 3]]}  (* {vertex2, s2, radius2, signAngle2} *)
						   }&@@@edgesReattached;		
		
		dropVertices = {};  (* if a pair of vertices has been fused add the vertex index that will be removed, (the index is the position of the vertex in the list of (old) vertices) *)
		
		(* find vertex pairs to be fused, and reattache edges accoringly *)
		(* "reattachedEdgesRaw" is of the form: {1, {vertex1, s1}, {vertex2, s2}} where the first
		   entry, 1, indicates a nearest-neighbor edge, vertex1, vertex2 are the vertices (labels)
		   that will be reattached and s1, s2 the are the positions of the Schwarz triangles 
		   associated with the cell-graph edges in the primitive cell. *)          								          						               								          						                            								          						               								          						                 
		reattachedEdgesRaw = Module[{VeRad, partnerV1, partnerV2, vertexPair, lst = {}}, 
			(* zero padding {0, 0, 0, 0} used to preserve formatting (called by vertices that are in the remaining flake) *) 
			VeRad =  DeleteDuplicates[Join[{{0, 0, 0, 0}}, reattachByRadius[[;;, 2]], reattachByRadius[[;;, 3]]]]; (* {vertex, s, radius, signAngle} *)
			Table[
				If[ edge[[2, 4]] === {}, partnerV1 = 1;,
					partnerV1 = Position[SubsetReplace[VeRad, {edge[[2]]} -> {0, 0, 0, 0}][[;;, {3, 4}]], {edge[[2, 3]], -edge[[2, 4]]}];
					partnerV1 = If[partnerV1 === {}, 1, partnerV1[[1, 1]]]];
				If[ edge[[3, 4]] === {}, partnerV2 = 1;,
					partnerV2 = Position[SubsetReplace[VeRad, {edge[[3]]} -> {0, 0, 0, 0}][[;;, {3, 4}]], {edge[[3, 3]], -edge[[3, 4]]}];
					partnerV2 = If[partnerV2 === {}, 1, partnerV2[[1, 1]]]];
				Which[ 
					(* 3. *)
					Xor[edge[[2, 4]] === {}, edge[[3, 4]] === {}], 
						If[ Xor[edge[[2, 4]] === 1, edge[[3, 4]] === 1], 
							If[ MemberQ[connectedVertices, {edge[[2, 1]], edge[[3, 1]]}], ##&[], 							
							    AppendTo[edges, DirectedEdge[edge[[2, 1]], edge[[3, 1]], edge[[1, 3]]]]; AppendTo[etransls, "1"];
							    AppendTo[connectedVertices, {edge[[2, 1]], edge[[3, 1]]}]; AppendTo[connectedVertices, {edge[[3, 1]], edge[[2, 1]]}];],
							If[ partnerV1 === partnerV2 && partnerV1 === 1,
								If[ MemberQ[connectedVertices, {edge[[2, 1]], edge[[3, 1]]}], ##&[], 							
									AppendTo[edges, DirectedEdge[edge[[2, 1]], edge[[3, 1]], edge[[1, 3]]]];
									AppendTo[connectedVertices, {edge[[2, 1]], edge[[3, 1]]}]; AppendTo[connectedVertices,  {edge[[3, 1]], edge[[2, 1]]}];],
								vertexPair = {(1 - Boole[IntegerQ[edge[[2, 4]]]])edge[[2, {1, 2}]] + (1 - Boole[IntegerQ[edge[[3, 4]]]])edge[[3, {1, 2}]], 
											  Boole[IntegerQ[edge[[2, 4]]]]VeRad[[partnerV1, {1, 2}]] + Boole[IntegerQ[edge[[3, 4]]]]VeRad[[partnerV2, {1, 2}]]};
								vertexPair = If[IntegerQ[edge[[2, 4]]], Reverse[vertexPair], vertexPair]; (* try to preserve the orientation *)					 
								If[ MemberQ[connectedVertices, vertexPair[[;;, 1]]], ##&[],
									AppendTo[connectedVertices, vertexPair[[;;, 1]]]; AppendTo[connectedVertices, Reverse[vertexPair[[;;, 1]]]];								
									If[ MemberQ[dropVertices, {Boole[IntegerQ[edge[[2, 4]]]]edge[[1, 1]] + Boole[IntegerQ[edge[[3, 4]]]]edge[[1, 2]]}], ##&[],
										AppendTo[dropVertices, {Boole[IntegerQ[edge[[2, 4]]]]edge[[1, 1]] + Boole[IntegerQ[edge[[3, 4]]]]edge[[1, 2]]}]];
									AppendTo[lst, {edge[[1, 3, Sequence@@cellIdx, 1]], vertexPair[[1]], vertexPair[[2]], Sign[1/2 - Boole[IntegerQ[edge[[2, 4]]]]]}]; (* {1, {vertex1, s1}, {vertex2, s2}, orientation} *)
								  ]
							  ]
						  ];,
					
					(* 5. *)
					Xor[edge[[2, 4]] === False, edge[[3, 4]] === False] && Xor[edge[[2, 4]] === -1, edge[[3, 4]] === -1],
						If[ MemberQ[dropVertices, {Boole[edge[[2, 4]] === -1]edge[[1, 1]] + Boole[edge[[3, 4]] === -1]edge[[1, 2]]}], ##&[],
							AppendTo[dropVertices, {Boole[edge[[2, 4]] === -1]edge[[1, 1]] + Boole[edge[[3, 4]] === -1]edge[[1, 2]]}]];,
						
					(* 6.1. *)
					VeRad[[partnerV1, 1]] === edge[[3, 1]], 
						If[ MemberQ[dropVertices, {1/2(1 - edge[[2, 4]])edge[[1, 1]] + 1/2(1 - edge[[3, 4]])edge[[1, 2]]}], ##&[],
							AppendTo[dropVertices, {1/2(1 - edge[[2, 4]])edge[[1, 1]] + 1/2(1 - edge[[3, 4]])edge[[1, 2]]}]];,
					
					(* 6.3. *)
					edge[[2, 4]] === -edge[[3, 4]] && VeRad[[partnerV1, 1]] != edge[[3, 1]],					
						If[ Or[partnerV1 === partnerV2 && partnerV1 === 1,
							   edge[[2, 4]] == 1 && partnerV1 != 1 && partnerV2 === 1, 
							   edge[[3, 4]] == 1 && partnerV2 != 1 && partnerV1 === 1],
							AppendTo[edges, DirectedEdge[edge[[2, 1]], edge[[3, 1]], edge[[1, 3]]]]; AppendTo[etransls, "1"];, (* leave unchanged *)
							vertexPair = {1/2(1 + edge[[2, 4]])edge[[2, {1, 2}]] + 1/2(1 + edge[[3, 4]])edge[[3, {1, 2}]], 
										  1/2(1 - edge[[2, 4]])VeRad[[partnerV1, {1, 2}]] + 1/2(1 - edge[[3, 4]])VeRad[[partnerV2, {1, 2}]]};
							vertexPair = If[Sign[edge[[3, 4]]] == 1, Reverse[vertexPair], vertexPair]; (* try to preserve the orientation *)	
							If[ MemberQ[connectedVertices, vertexPair[[;;, 1]]], ##&[],
							    AppendTo[connectedVertices, vertexPair[[;;, 1]]]; AppendTo[connectedVertices, Reverse[vertexPair[[;;, 1]]]];
							    AppendTo[lst, {edge[[1, 3, Sequence@@cellIdx, 1]], vertexPair[[1]], vertexPair[[2]], -Sign[edge[[3, 4]]]}]; (* {1, {vertex1, s1}, {vertex2, s2}, orientation} *)
							   ]
						  ],
						
					(* 6.2. *)
					edge[[2, 4]] === edge[[3, 4]] && edge[[2, 4]] === 1,					
						If[ MemberQ[connectedVertices, {edge[[2, 1]], edge[[3, 1]]}], ##&[], 
							AppendTo[edges, DirectedEdge[edge[[2, 1]], edge[[3, 1]], edge[[1, 3]]]]; AppendTo[etransls, "1"];
							AppendTo[connectedVertices, {edge[[2, 1]], edge[[3, 1]]}]; AppendTo[connectedVertices, {edge[[3, 1]], edge[[2, 1]]}]; 
						  ],
					
					(* 6.4. *)	
					edge[[2, 4]] === edge[[3, 4]] && edge[[2, 4]] === -1, 					
						If[ Xor[partnerV1 === 1, partnerV2 === 1],
							If[ MemberQ[dropVertices, {(1 - Boole[partnerV1 === 1])edge[[1, 1]] + (1 - Boole[partnerV2 === 1])edge[[1, 2]]}], ##&[],
								AppendTo[dropVertices, {(1 - Boole[partnerV1 === 1])edge[[1, 1]] + (1 - Boole[partnerV2 === 1])edge[[1, 2]]}]];
							vertexPair = {Boole[partnerV1 === 1]edge[[2, {1, 2}]] + Boole[partnerV2 === 1]edge[[3, {1, 2}]], 
										  (1 - Boole[partnerV1 === 1])VeRad[[partnerV1, {1, 2}]] + (1 - Boole[partnerV2 === 1])VeRad[[partnerV2, {1, 2}]]};
							vertexPair = If[partnerV1 === 1, Reverse[vertexPair], vertexPair]; (* try to preserve the orientation *)			 
							AppendTo[lst, {edge[[1, 3, Sequence@@cellIdx, 1]], vertexPair[[1]], vertexPair[[2]], Sign[1/2 - Boole[partnerV1 === 1]]}];, (* {1, {vertex1, s1}, {vertex2, s2}, orientation} *)		
							If[ MemberQ[dropVertices, {edge[[1, 1]]}], ##&[], AppendTo[dropVertices, {edge[[1, 1]]}]]; 
							If[ MemberQ[dropVertices, {edge[[1, 2]]}], ##&[], AppendTo[dropVertices, {edge[[1, 2]]}]]; 
							If[ MemberQ[connectedVertices, {VeRad[[partnerV1, 1]], VeRad[[partnerV2, 1]]}], ##&[], 
								AppendTo[lst, {edge[[1, 3, Sequence@@cellIdx, 1]], VeRad[[partnerV1, {1, 2}]], VeRad[[partnerV2, {1, 2}]], 1}]; (* {1, {vertex1, s1}, {vertex2, s2}, orientation} *)
								AppendTo[connectedVertices, {VeRad[[partnerV1, 1]], VeRad[[partnerV2, 1]]}]; AppendTo[connectedVertices, {VeRad[[partnerV2, 1]], VeRad[[partnerV1, 1]]}]; 
							  ];
						 ];
					];,
				{edge, reattachByRadius}];
			lst];
			
		(* enumerate entries *)
		enumReattchedEdges = Transpose[{reattachedEdgesRaw, Range[Length@idxgluedEdges + 1, Length@idxgluedEdges + Length@reattachedEdgesRaw]}]; 
		
		(* construct reattached edges *)
		reattchedEdges = Module[{tagPC, tag},
			Table[
				tagPC = {e[[1, 1]], {{"g", e[[2]]}, e[[1, 2, 2]], e[[1, 3, 2]]}}; (* {1, {{"g", gi}, s1, s2 }} *)
				tag = If[IsPC, tagPC, Join[{Position[verticesPC, e[[1, 2, 1, {1, 2}]]][[1, 1]], Position[verticesPC, e[[1, 3, 1, {1, 2}]]][[1, 1]]}, {tagPC}]]; (* {vpc1, vpc2, tagPC} *) 
				{DirectedEdge[e[[1, 2, 1]], e[[1, 3, 1]], tag], e[[1, 4]]}, (* {edge, orientation} *)	
			{e, enumReattchedEdges}]
		 ];						

	(* ---------------------------------------- *)
	(* Finalize the cutting and glueing procedure: *)
	(* ---------------------------------------- *)

	(* Adjust vertices and edges: *)
	(* ------------------------ *)
	
	(* remove vertices *)
	vertices = Delete[vertices, Join[Pick[Keys[idxRemove], Not/@ (Values[idxRemove][[;;,1]])], dropVertices]];
	vlbls = Delete[vlbls, Join[Pick[Keys[idxRemove], Not/@ (Values[idxRemove][[;;,1]])], dropVertices]];
	vcoords = Delete[vcoords, Join[Pick[Keys[idxRemove], Not/@ (Values[idxRemove][[;;,1]])], dropVertices]];

	(* complete list of edges *)
	AllGluedEdges = Join[gluedEdges, reattchedEdges]; (* {edge, orientation} *)
	edges = Join[edges, AllGluedEdges[[;;, 1]]];	
	etransls = Join[etransls, ConstantArray["1", Length@idxgluedEdges], ConstantArray["1", Length@reattachedEdgesRaw]]; 

	(* Enforce periodic boundary conditions (currently inactive): *)
	(* ------------------------------------------------------ *)
	
	If[False,
		Table[ 
			If[ Or[MemberQ[vertices, etuple[[1, 1]]] == False, MemberQ[vertices, etuple[[1, 2]]] == False], ##&[],
				AppendTo[edges, etuple[[1]]]; AppendTo[etransls, etuple[[2]]]];,
			{etuple, PBCEdgesEtransls}],
		##&[]
	];

	(* Adjust faces: *)
	(* ------------ *)

	(* Assumption: the cut faces of the flakes have at most two dangling bonds that can be 
				   connected by a chain of glued/reattached edges. Disconnected and other 
				   acyclic graphs will be discarded. *)			
	faces = Module[{faceEdges, looseEnds, newFaceEdges, glueGraph, indexFinder, edgeOrientationGuide},
		indexFinder = Flatten[{{#[[1, 1]], #[[1, 2]], #[[2]]}, {#[[1, 2]], #[[1, 1]], #[[2]]}}&/@Transpose[{AllGluedEdges[[;;, 1]], Range[Length@AllGluedEdges]}], 1];
		glueGraph = GetUndirectedGraph@Graph[AllGluedEdges[[;;, 1]]];
		Table[
			faceEdges = {}; newFaceEdges = {};
			Table[
				If[ MemberQ[edges, edgesOld[[e[[1]]]]],
					If[ e[[2]] == 1,
						AppendTo[faceEdges, edgesOld[[e[[1]]]]];,
						AppendTo[faceEdges, DirectedEdge[edgesOld[[e[[1]], 2]], edgesOld[[e[[1]], 1]], -edgesOld[[e[[1]], 3]]]];
					   ];, 
					##&[]
				  ];,
				{e, face}];
			looseEnds = Cases[Tally[Join[faceEdges[[;;, 1]], faceEdges[[;;, 2]]]],{x_, 1} :> x]; (* find dangling bonds *)
			Which[looseEnds === {}, ##&[],
				  Length@looseEnds == 2, (* ignore disconnected graphs *)
				  	newFaceEdges = EdgeList@Subgraph[glueGraph, Quiet@FindShortestPath[glueGraph, looseEnds[[1]], looseEnds[[2]]]];
				  	newFaceEdges = AllGluedEdges[[Table[Select[indexFinder, #[[{1, 2}]] == {e[[1]], e[[2]]} &][[1, 3]], {e, newFaceEdges}]]];
					  Table[
							edgeOrientationGuide = {faceEdges[[;;, 1]], faceEdges[[;;, 2]]};
							AppendTo[faceEdges, If[
								MemberQ[edgeOrientationGuide[[1]], ne[[1, 1]]] == False && MemberQ[edgeOrientationGuide[[2]], ne[[1, 1]]] == False,
								If[MemberQ[edgeOrientationGuide[[1]], ne[[1, 2]]], ne[[1]], DirectedEdge[ne[[1, 2]], ne[[1, 1]], -ne[[1, 3]]]],
								If[MemberQ[edgeOrientationGuide[[2]], ne[[1, 1]]], ne[[1]], DirectedEdge[ne[[1, 2]], ne[[1, 1]], -ne[[1, 3]]]]
								]
					    	];,
					   {ne, newFaceEdges}];
				 ];
			Graph[faceEdges],
		{face, facesstr}]
	 ];

	(* pick cyclic, connected graphs *)
	faces = If[AcyclicGraphQ[#], ## &[], #]&/@faces;
	faceedges = DirectedEdge[#1, #2, Map[syntacticAbs, #3, {-1}]] &@@@ # &/@(EdgeList/@faces); (* change negative sign in tags if needed *)							
	
	(* ----------------------- *)
	(* Symmetrize the new flake: *)
	(* ----------------------- *)
	
	If[OptionValue[SymmetrizeFlake],
		angles = Abs@Delete[angles, Join[Pick[Keys[idxRemove], Not/@ (Values[idxRemove][[;;,1]])], dropVertices]]; (* old absolute angles *)
		vcoords = VertexCoordinatesInSymmetrizedFlake[angles, vcoords, wedgeAngle, referenceAngle, Sign[FrankAngleIncrement]];,
	0];
	
	(* --------- *)
	(* New graph: *)
	(* --------- *)

	graph = Graph[vertices, edges, VertexCoordinates -> vcoords];
	
	(* ----------------------------------- *)
	(* Return new model graph of finite size: *)
	(* ----------------------------------- *)
	
	If[IsPC,
	   HBDisclinationModelGraph[<|
		"TriangleGroup" -> tg,
		"CellCenter" -> center,
		"Genus" -> mgraph["Genus"],
		"Graph" -> graph,
		"UndirectedGraph" -> GetUndirectedGraph@graph,
		"FullGraph" -> GetFullGraph@graph,
		"VertexLabels" -> vlbls,
		"SchwarzTriangleLabels" -> mgraph["SchwarzTriangleLabels"],
		"EdgeTranslations" -> etransls,
		"TranslationGenerators" -> mgraph["TranslationGenerators"],
		"Faces" -> faces,
		"FaceEdges" -> faceedges,
		"GluedEdges" -> AllGluedEdges[[;;, 1]],
		"FrankAngle" -> Sign[FrankAngleIncrement]2*wedgeAngle,
		"ReferenceAngle" -> referenceAngle,
		"SymmetrizedFlake" -> OptionValue[SymmetrizeFlake],
		"PBCCluster" -> False
	   |>],
	   HBDisclinationSupercellModelGraph[<|
		"TriangleGroup" -> tg,
		"CellCenter" -> center,
		"PCGenus" -> mgraph["PCGenus"],
		"Genus" -> mgraph["Genus"],
		"Graph" -> graph,
		"UndirectedGraph" -> GetUndirectedGraph@graph,
		"FullGraph" -> GetFullGraph@graph,
		"VertexLabels" -> vlbls,
		"SchwarzTriangleLabels" -> mgraph["SchwarzTriangleLabels"],
		"EdgeTranslations" -> etransls,
		"PCTranslationGenerators" -> mgraph["PCTranslationGenerators"],
		"TranslationGenerators" -> mgraph["TranslationGenerators"],
		"TranslationGroupEmbedding" -> mgraph["TranslationGroupEmbedding"],
		"InternalSupercellTranslations" -> mgraph["InternalSupercellTranslations"],
		"Faces" -> faces,
		"FaceEdges" -> faceedges,	
		"GluedEdges"-> AllGluedEdges[[;;, 1]],
		"FrankAngle" -> Sign[FrankAngleIncrement]2*wedgeAngle,
		"ReferenceAngle" -> referenceAngle,
		"SymmetrizedFlake" -> OptionValue[SymmetrizeFlake],
		"PBCCluster" -> False
	   |>]
	]
]]


(* ::Subsection::Closed:: *)
(*Graphical Visualization*)


(* ::Subsubsection::Closed:: *)
(*Triangle Tessellations*)


(* Tomas' code *)
ClearAll[GetTriangleTessellation];
Options[GetTriangleTessellation]={ColorBoundary->RGBColor[{0,0,0,0}],ColorFill->LightGray,LineThickness->0};
(* Specify (p,q,r) of the triangle group \[CapitalDelta](p,q,r). *)
(* The p-fold symmetric point is placed at the center, and *)
(* the q-fold symmetric point is placed on the horizontal axis. *)
GetTriangleTessellation[{r_,q_,p_},gens_,opts:OptionsPattern[]]:=GetTriangleTessellation[{r,q,p},gens,opts]=Module[{
(* Specify how many times to iterate the triangle generation. *)
(* Note that the number of triangles grows exponentially with this parameter! *)
Generations=gens,
(* Specify coloring of the triangle tessellation *)
ColorBoundary=OptionValue[ColorBoundary],
ColorFill=OptionValue[ColorFill],
LineThickness=OptionValue[LineThickness],

P,Q,R,tr,TriangleLength,TriangleList,cc,temp0,aa,temp1,bb,
temp2,TempLen,boundaries,ToFill,triangles,absolut
},

(* Some analytic results for the initial triangle. *)
P=PDPoint[{0,0}];
Q=PDPoint[Sqrt[(Cos[\[Pi] * (1/p+1/q)]+Cos[\[Pi]/r])/(Cos[\[Pi] * (1/p-1/q)]+Cos[\[Pi]/r])]*{1,0}];
R=PDPoint[Sqrt[(Cos[\[Pi] * (1/p+1/r)]+Cos[\[Pi]/q])/(Cos[\[Pi] * (1/p-1/r)]+Cos[\[Pi]/q])]*{Cos[Pi/p],Sin[Pi/p]}];



(* Specify first triangle. *)
tr=LLine[{P,Q,R,P}];
TriangleLength={0};
TriangleList={tr};



(* First iteration of the algorithm. *)
cc=1;

temp0=TriangleList[[1]];
For[aa=1,aa<p,aa++,
temp1=Chop@L2Rotation[P,aa*(2*Pi/p)][temp0];
TriangleList=AppendTo[TriangleList,temp1];
];

TriangleLength=AppendTo[TriangleLength,Length[TriangleList]];

(* All subsequent iterations of the algorithm. *)
For[cc=2,cc<Generations+1,cc++,

For[bb=TriangleLength[[cc-1]]+1,bb<TriangleLength[[cc]]+1,bb++,
temp1=TriangleList[[bb]];
For[aa=1,aa<p,aa++,
temp2=Chop@L2Rotation[temp1[[1,1]],aa*(2*Pi/p)][temp1];
TriangleList=AppendTo[TriangleList,temp2]
];
For[aa=1,aa<q,aa++,
temp2=Chop@L2Rotation[temp1[[1,2]],aa*(2*Pi/q)][temp1];
TriangleList=AppendTo[TriangleList,temp2]
];
For[aa=1,aa<r,aa++,
temp2=Chop@L2Rotation[temp1[[1,3]],aa*(2*Pi/r)][temp1];
TriangleList=AppendTo[TriangleList,temp2]
];
];

TempLen=Length[TriangleList];
For[aa=TempLen,aa>TriangleLength[[1]],aa--,
For[bb=1,bb<aa,bb++,
If[TriangleList[[aa]]==TriangleList[[bb]],{
TriangleList=Delete[TriangleList,aa];
Break[];
}
];
];
];

TriangleLength=AppendTo[TriangleLength,Length[TriangleList]];
];



(* All triangles have been generated. The remainder of *)
(* the code has to do with simple data manipulation and plotting. *)

boundaries = Graphics[{ColorBoundary,Thickness[LineThickness],LToGraphics[{Flatten@TriangleList}, Model->PoincareDisk]}];

ToFill=Table[LPolygon[{
TriangleList[[aa,1,1]],
TriangleList[[aa,1,2]],
TriangleList[[aa,1,3]]
}],{aa,1,TriangleLength[[-1]]}];

triangles= Graphics[{ColorFill,LToGraphics[{Flatten@ToFill}, Model->PoincareDisk]}];

Show[{triangles,boundaries}, PlotRange->{{-1,1}, {-1,1}}, AspectRatio->Automatic]
]


ClearAll[ShowTriangles]
Options[ShowTriangles] = {
	RasterizeGraphics -> True,
	NumberOfGenerations -> 2,
	DiskCenter -> 3
};
ShowTriangles[tg_, opts:OptionsPattern[{ShowTriangles, Graphics, Rasterize, GetTriangleTessellation}]] := ShowTriangles[tg, opts] = Graphics[
	{
		If[OptionValue[RasterizeGraphics],
			Inset[Rasterize[
					Show[
						GetTriangleTessellation[CyclicallyPermuteList[Sort@tg, Mod[-OptionValue[DiskCenter], 3]], OptionValue[NumberOfGenerations],
							Sequence@@FilterRules[{opts}, Options[GetTriangleTessellation]]
						],
						Sequence@@FilterRules[{opts}, {ImageSize, PlotRange}],
						PlotRange -> 1.1{{-1, 1}, {-1, 1}},
						ImageSize -> 500
					],
					Sequence@@FilterRules[{opts}, Options[Rasterize]],
					ImageSize -> 500
				], Scaled[{0.5,0.5}], Scaled[{0.5,0.5}], Scaled[1]
			],
			GetTriangleTessellation[CyclicallyPermuteList[Sort@tg, Mod[-OptionValue[DiskCenter], 3]], OptionValue[NumberOfGenerations],
				Sequence@@FilterRules[{opts}, Options[GetTriangleTessellation]]
			][[1]]
		],
		Circle[]
	},
	Sequence@@FilterRules[{opts}, Options[Graphics]],
	PlotRange -> 1.1{{-1, 1}, {-1, 1}},
	ImageSize -> 500
]


(* ::Subsubsection::Closed:: *)
(*Cell Graph Elements*)


GetWyckoffPosition[tg_, {w_, g_}, opts:OptionsPattern[{GetSitePosition}]] := LToGraphics[
	GetSitePosition[tg, w, g, Sequence@@FilterRules[{opts}, Options[GetSitePosition]]],
	Model -> PoincareDisk
][[1]]
GetSchwarzTriangle[tg_, g_, opts:OptionsPattern[{GetSitePosition}]] := LToGraphics[
	LPolygon[GetSitePosition[tg, #, g, Sequence@@FilterRules[{opts}, Options[GetSitePosition]]]&/@{1, 2, 3}],
	Model -> PoincareDisk
]
GetVertex[tg_, v_, opts:OptionsPattern[{GetSitePosition}]] := LToGraphics[
	GetSitePosition[tg, v[[1]], v[[2]], Sequence@@FilterRules[{opts}, Options[GetSitePosition]]],
	Model -> PoincareDisk
]
GetEdge[tg_, e_, opts:OptionsPattern[{GetSitePosition}]] := LToGraphics[
	LLine[GetSitePosition[tg, #[[1]], #[[2]], Sequence@@FilterRules[{opts}, Options[GetSitePosition]]]&/@e],
	Model -> PoincareDisk
]
(* GetEdgeByCoords[{{x1, y1}, {x2, y2},...}] returns a Line representing the edge (or 
   succession of edges) specified by coordinates of vertices {xi, yi} in the poincare disk. *)
GetEdgeByCoords[e_] := LToGraphics[
	LLine[PDPoint[#]&/@e],
	Model -> PoincareDisk
]


ResolveVertex[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph, vertex_] := {
	vertex[[1]],
	cgraph["VertexLabels"][[Position[VertexList@cgraph["Graph"], vertex][[1, 1]]]]
}


ResolveTranslation[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph, transl_] := StringReplace[transl,
	RegularExpression["g(\\d+)"] :> cgraph["TranslationGenerators"]["g$1"]
]


ResolveEdge[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph, edge_] := Module[{\[Gamma], v1, v2},
	If[MemberQ[EdgeList@cgraph["Graph"], edge],
		(* edge with default orientation *)
		\[Gamma] = ResolveTranslation[cgraph,
			cgraph["EdgeTranslations"][[Position[EdgeList@cgraph["Graph"], edge][[1, 1]]]]
		];
	
		v1 = ResolveVertex[cgraph, edge[[1]]];
		v2 = ResolveVertex[cgraph, edge[[2]]];,
		
		(* edge with inverted orientation *)
		\[Gamma] = "(" <> ResolveTranslation[cgraph,
			cgraph["EdgeTranslations"][[Position[EdgeList@cgraph["Graph"], edge[[{2, 1, 3}]]][[1, 1]]]]
		] <> ")^(-1)";
	
		v1 = ResolveVertex[cgraph, edge[[1]]];
		v2 = ResolveVertex[cgraph, edge[[2]]];
	];
	
	{v1, {v2[[1]], v2[[2]]<>"*"<>\[Gamma]}}
]


ResolveEquivalentEdge[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph, edge_] := Module[{\[Gamma]inv, v1, v2},
	If[MemberQ[EdgeList@cgraph["Graph"], edge],
		(* edge with default orientation *)
		\[Gamma]inv = "(" <> ResolveTranslation[cgraph,
			cgraph["EdgeTranslations"][[Position[EdgeList@cgraph["Graph"], edge][[1, 1]]]]
		] <> ")^(-1)";
	
		v1 = ResolveVertex[cgraph, edge[[1]]];
		v2 = ResolveVertex[cgraph, edge[[2]]];,
		
		(* edge with inverted orientation *)
		\[Gamma]inv = ResolveTranslation[cgraph,
			cgraph["EdgeTranslations"][[Position[EdgeList@cgraph["Graph"], edge[[{2, 1, 3}]]][[1, 1]]]]
		];
	
		v1 = ResolveVertex[cgraph, edge[[1]]];
		v2 = ResolveVertex[cgraph, edge[[2]]];
	];
	
	{{v1[[1]], v1[[2]] <> "*" <> \[Gamma]inv}, v2}
]


GetCellGraphVertex[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph, vertex_] := Module[{IsSymmetrizedDisclinationGraph},
	IsSymmetrizedDisclinationGraph = If[Head[cgraph] === HBDisclinationModelGraph || Head[cgraph] === HBDisclinationSupercellModelGraph, cgraph["SymmetrizedFlake"], False];
	If[IsSymmetrizedDisclinationGraph, 
		Point[GraphEmbedding[cgraph["Graph"]][[Position[VertexList@cgraph["Graph"], vertex][[1,1]]]]],
		GetVertex[
			cgraph["TriangleGroup"],
			ResolveVertex[cgraph, vertex],
			DiskCenter -> cgraph["CellCenter"]
		]
	]
]
	
Options[GetCellGraphEdge] = { ShowEquivalentEdge -> False };
GetCellGraphEdge[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph, edge_, OptionsPattern[]] :=Module[
	{IsSymmetrizedDisclinationGraph, vertices, vcoords},
	IsSymmetrizedDisclinationGraph = If[Head[cgraph] === HBDisclinationModelGraph || Head[cgraph] === HBDisclinationSupercellModelGraph, cgraph["SymmetrizedFlake"], False];
	If[IsSymmetrizedDisclinationGraph, 
		vcoords = GraphEmbedding@cgraph["Graph"];
		vertices = VertexList@cgraph["Graph"];
		GetEdgeByCoords[{vcoords[[Position[vertices, edge[[1]]][[1,1]]]], vcoords[[Position[vertices, edge[[2]]][[1,1]]]]}],
		If[OptionValue[ShowEquivalentEdge],
			GetEdge[
				cgraph["TriangleGroup"],
				ResolveEquivalentEdge[cgraph, edge],
				DiskCenter -> cgraph["CellCenter"]
			],
			GetEdge[
				cgraph["TriangleGroup"],
				ResolveEdge[cgraph, edge],
				DiskCenter -> cgraph["CellCenter"]
			]
		]
	]
]


ResolveTranslatedEdge[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph, edge_, \[Gamma]0_] := Module[{\[Gamma], v1, v2},
	If[NumericQ@edge[[3]] && edge[[3]] > 0 || ListQ@edge[[3]] && edge[[3, 1]] > 0,
		(* edge with default orientation *)
		\[Gamma] = ResolveTranslation[cgraph,
			cgraph["EdgeTranslations"][[Position[EdgeList@cgraph["Graph"], edge][[1, 1]]]]
		];
	
		v1 = ResolveVertex[cgraph, edge[[1]]];
		v2 = ResolveVertex[cgraph, edge[[2]]];,
		(* edge with inverted orientation *)
		\[Gamma] = "(" <> ResolveTranslation[cgraph,
			cgraph["EdgeTranslations"][[Position[EdgeList@cgraph["Graph"],
				DirectedEdge[edge[[2]], edge[[1]], -edge[[3]]]	
			][[1, 1]]]]
		] <> ")^(-1)";
	
		v1 = ResolveVertex[cgraph, edge[[1]]];
		v2 = ResolveVertex[cgraph, edge[[2]]];
	];
	
	{{{v1[[1]], v1[[2]]<>"*"<>\[Gamma]0}, {v2[[1]], v2[[2]]<>"*"<>\[Gamma]<>"*"<>\[Gamma]0}}, \[Gamma]<>"*"<>\[Gamma]0}
]

GetTranslatedCellGraphEdge::IncompatibleModelGraph="Only edges in non-symmetrized `1` model graphs can be translated.";
GetTranslatedCellGraphEdge[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph, edge_, \[Gamma]_] := Catch[Module[
	{IsSymmetrizedDisclinationGraph},
	IsSymmetrizedDisclinationGraph = If[Head[cgraph] === HBDisclinationModelGraph || Head[cgraph] === HBDisclinationSupercellModelGraph, cgraph["SymmetrizedFlake"], False];
	If[IsSymmetrizedDisclinationGraph == False, ##&[], 
		If[cgraph["FrankAngle"] == 0, ##&[], Throw@Message[GetTranslatedCellGraphEdge::IncompatibleModelGraph, Head[cgraph]]]]; 
	GetEdge[
		cgraph["TriangleGroup"],
		ResolveTranslatedEdge[cgraph, edge, ResolveTranslation[cgraph, \[Gamma]]][[1]],
		DiskCenter -> cgraph["CellCenter"]
	]
]]


ResolveFace[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph, face_] := Module[{\[Gamma] = "1", re},
	Table[
		re = ResolveTranslatedEdge[cgraph, e, \[Gamma]];
		\[Gamma] = re[[2]];
		re[[1]],
		{e, EdgeList[face]}
	]
]
Options[GetCellGraphFace] = {
	StartingVertex -> "LowestSchwarzTriangleIndex"
};
GetCellGraphFace[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph, face_, opts:OptionsPattern[]] := GetCellGraphFace[cgraph, face, opts] = Module[{
		pos, index, IsSymmetrizedDisclinationGraph, vertices, vcoords
	},
	IsSymmetrizedDisclinationGraph = If[Head[cgraph] === HBDisclinationModelGraph || Head[cgraph] === HBDisclinationSupercellModelGraph, cgraph["SymmetrizedFlake"], False];

	index = If[ListQ@OptionValue[StartingVertex],
		Switch[OptionValue[StartingVertex][[1]],
		"Index", OptionValue[StartingVertex][[2]],
		"VertexCriterion", FirstPosition[EdgeList[face][[;;,1]], Select[EdgeList[face][[;;,1]], OptionValue[StartingVertex][[2]]][[1]]][[1]],
		"EdgeCriterion", FirstPosition[EdgeList[face], Select[EdgeList[face], OptionValue[StartingVertex][[2]]][[1]]][[1]],
		"VertexPattern", FirstPosition[EdgeList[face][[;;,1]], OptionValue[StartingVertex][[2]]][[1]],
		"EdgePattern", FirstPosition[EdgeList[face], OptionValue[StartingVertex][[2]]][[1]],
		_, 1
		],
		Switch[OptionValue[StartingVertex],
		"LowestSchwarzTriangleIndex", FirstPosition[EdgeList[face][[;;,1]], Min[EdgeList[face][[;;, 1, 2]]]][[1]],
		_, 1
		]
	];
	If[ IsSymmetrizedDisclinationGraph,
		vertices = VertexList@cgraph["Graph"]; 
		vcoords = GraphEmbedding[cgraph["Graph"]];
		pos = PDPoint[vcoords[[Position[vertices, #[[1]]][[1,1]]]]]&/@
			EdgeList@CyclicallyPermuteFaceEdges[face, -(index-1)];,
		pos = GetSitePosition[cgraph["TriangleGroup"], #[[1,1]], #[[1,2]], DiskCenter -> cgraph["CellCenter"]]&/@
			ResolveFace[cgraph, CyclicallyPermuteFaceEdges[face, -(index-1)]];
	  ];
	{
		LToGraphics[LPolygon[pos], Model -> PoincareDisk],
		Arrow@LToGraphics[LLine[{pos[[#]], pos[[Mod[# + 1, Length@pos, 1]]]}], Model -> PoincareDisk]&/@Range[1, Length@pos]
	}
]


(* ::Subsubsection::Closed:: *)
(*Cell Boundary*)


GetCellBoundary[cgraph_HCCellGraph] := GetCellBoundary[cgraph] = {
	#[[4]],
	LToGraphics[LLine[{
		GetSitePosition[cgraph["TriangleGroup"], EdgeList[cgraph["Graph"]][[#[[3]]]][[1, 1]], #[[1]], DiskCenter -> cgraph["CellCenter"]],
		GetSitePosition[cgraph["TriangleGroup"], EdgeList[cgraph["Graph"]][[#[[3]]]][[2, 1]], #[[2]], DiskCenter -> cgraph["CellCenter"]]
	}], Model -> PoincareDisk],
	LToGraphics[GetSitePosition[cgraph["TriangleGroup"], 3,
		ResolveTranslation[cgraph, #[[6]]],
		DiskCenter -> cgraph["CellCenter"]
	], Model -> PoincareDisk],
	#[[6]]
}&/@cgraph["BoundaryEdges"]


(* ::Subsubsection::Closed:: *)
(*Cell Graph*)


Options[ShowCellGraph] = {
	CellVertexStyle -> Directive[Black, AbsolutePointSize[5]],
	ShowVertexLabels -> True,
	EdgeArrowSize -> .015,
	ShowIntraCellEdges -> True,
	ShowInterCellEdges -> True,
	IntraCellEdgeStyle -> Blue,
	InterCellEdgeStyle -> Red,
	ShowEdgeTranslations -> False,
	EdgeFilter -> (True&)
};
ShowCellGraph[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph,
	opts:OptionsPattern[{ShowCellGraph, Graph}]] := ShowCellGraph[cgraph, opts] = Module[
	{format\[Gamma]},
	format\[Gamma][expr_]:=StringReplace[expr,{RegularExpression["g(\\d+)(\\^(\\-?\\d+))?"]->ToString[StringForm[\!\(\*
TagBox[
StyleBox["\"\<\\!\\(\\*SuperscriptBox[SubscriptBox[\\(\\[Gamma]\\), \\(`1`\\)], \\(`2`\\)]\\)\>\"",
ShowSpecialCharacters->False,
ShowStringCharacters->True,
NumberMarks->True],
FullForm]\),"$1","$3"],StandardForm],"*"->""}];
	
	Show[
		Graph[
			cgraph["Graph"],
			Sequence@@FilterRules[{opts}, Options[Graph]],
			
			(* default options for vertices *)
			VertexSize -> 0,
			VertexStyle -> Directive[EdgeForm[Opacity[0]],FaceForm[Opacity[0]]],
			VertexLabels -> If[OptionValue[ShowVertexLabels], "Name", None],
			
			(* default options for edges *)
			EdgeLabels -> If[OptionValue[ShowEdgeTranslations],
				Select[Thread[EdgeList@cgraph["Graph"] -> format\[Gamma]/@cgraph["EdgeTranslations"]][[
					Position[cgraph["EdgeTranslations"],#][[1, 1]]&/@Select[cgraph["EdgeTranslations"], #!="1"&]
				]], OptionValue[EdgeFilter][#[[1]]]&], None],
			EdgeStyle -> Join[
				Select[Thread[EdgeList@cgraph["Graph"] -> (If[#=="1",
				If[OptionValue[ShowIntraCellEdges], OptionValue[IntraCellEdgeStyle], Opacity[0]],
				If[OptionValue[ShowInterCellEdges], OptionValue[InterCellEdgeStyle], Opacity[0]]]&/@cgraph["EdgeTranslations"])
			], OptionValue[EdgeFilter][#[[1]]]&],
				Select[Thread[EdgeList@cgraph["Graph"] -> Opacity[0]], Not@OptionValue[EdgeFilter][#[[1]]]&]
			],
			EdgeShapeFunction -> GraphElementData[{"FilledArcArrow", "ArrowSize" -> OptionValue[EdgeArrowSize]}],
			Sequence@@FilterRules[{opts}, Options[Graph]]
		],
		Graphics[{OptionValue[CellVertexStyle],
			Point/@(VertexCoordinates/.AbsoluteOptions[cgraph["Graph"]])
		}]
	]
]


Options[ShowCellSchwarzTriangles] = {
	TriangleStyle -> Directive[FaceForm[Black], EdgeForm[None]],
	ShowTriangleLabels -> False,
	TriangleLabelStyle -> White,
	TriangleRange -> All
};
ShowCellSchwarzTriangles[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph,
	opts:OptionsPattern[{ShowCellSchwarzTriangles, Graphics}]] := ShowCellSchwarzTriangles[cgraph, opts] = Module[
{format},
	format[expr_] := StringReplace[expr,{RegularExpression["([xyz\\)])(\\^(\\-?\\d+))?"]
		-> ToString[StringForm[\!\(\*
TagBox[
StyleBox["\"\<\\!\\(\\*SuperscriptBox[\\(`1`\\), \\(`2`\\)]\\)\>\"",
ShowSpecialCharacters->False,
ShowStringCharacters->True,
NumberMarks->True],
FullForm]\), "$1", "$3"],StandardForm], "*"->""}];
	Show[
		Graphics[{
			{OptionValue[TriangleStyle],
				With[{st = GetSchwarzTriangle[cgraph["TriangleGroup"], #, DiskCenter -> cgraph["CellCenter"]]},
					{st, If[OptionValue[ShowTriangleLabels],
						Text[Style[format@#, OptionValue[TriangleLabelStyle]], RegionCentroid@st], {}]}
				]&/@cgraph["SchwarzTriangleLabels"][[OptionValue[TriangleRange]]]}
			},
			Sequence@@FilterRules[{opts}, Options[Graphics]]
		]
	]
]


Options[ShowCellGraphFlattened] = {	
	CellVertexStyle -> Directive[Black, AbsolutePointSize[5]],
	ShowVertexLabels -> True,
	CellEdgeStyle -> Arrowheads[{{Small,0.5}}],
	ShowIntraCellEdges -> True,
	ShowInterCellEdges -> True,
	IntraCellEdgeStyle -> Blue,
	InterCellEdgeStyle -> Red,
	EdgeFilter -> (True&)
 }


ShowCellGraphFlattened::WarningIntercellEdges="Edges in `1` model graphs associated with a translation are not shown as geodesics from the initial vertex in the PBC-cluster to the appropriately \!\(\*
StyleBox[\"translated\",\nFontSlant->\"Italic\"]\) version of the final vertex, i.e., outside the cluster.";
ShowCellGraphFlattened[cgraph_HCCellGraph|cgraph_HCModelGraph|cgraph_HCSupercellModelGraph|cgraph_HBDisclinationModelGraph|cgraph_HBDisclinationSupercellModelGraph,
	opts:OptionsPattern[{ShowCellGraphFlattened, Graphics, Graph}]] := ShowCellGraphFlattened[cgraph, opts] = Module[
	{intracedges, intercedges, IsDisclinationGraph, vertices, vcoords},
	intracedges = Select[Transpose[{EdgeList@cgraph["Graph"], cgraph["EdgeTranslations"]}], OptionValue[EdgeFilter][#[[1]]]&&#[[2]]=="1"&][[;;,1]];
	intercedges = Select[Transpose[{EdgeList@cgraph["Graph"], cgraph["EdgeTranslations"]}], OptionValue[EdgeFilter][#[[1]]]&&#[[2]]!="1"&][[;;,1]];
	IsDisclinationGraph = Head[cgraph] === HBDisclinationModelGraph || Head[cgraph] === HBDisclinationSupercellModelGraph;
	
	Show[
		(* edges *)
		Graphics[{OptionValue[CellEdgeStyle],
			If[IsDisclinationGraph,
				vertices = VertexList@cgraph["Graph"];
				vcoords = GraphEmbedding[cgraph["Graph"]];
				{
				If[OptionValue[ShowIntraCellEdges],
					{OptionValue[IntraCellEdgeStyle], 
						Table[Arrow@GetEdgeByCoords[{vcoords[[Position[vertices, edge[[1]]][[1, 1]]]], vcoords[[Position[vertices, edge[[2]]][[1, 1]]]]}],
							{edge, intracedges}]
					}, {}],
				If[OptionValue[ShowInterCellEdges],
					If[cgraph["PBCCluster"], Message[ShowCellGraphFlattened::WarningIntercellEdges, Head[cgraph]], 0];
					{OptionValue[InterCellEdgeStyle], 
						vcoords = GraphEmbedding[cgraph["Graph"]];
						Table[Arrow@GetEdgeByCoords[{vcoords[[Position[vertices, edge[[1]]][[1, 1]]]], vcoords[[Position[vertices, edge[[2]]][[1, 1]]]]}],
							{edge, intercedges}]
				   },{}]
				},
				{
				If[OptionValue[ShowIntraCellEdges],
					{OptionValue[IntraCellEdgeStyle],
						Table[Arrow@GetEdge[cgraph["TriangleGroup"], ResolveEdge[cgraph, edge], DiskCenter -> cgraph["CellCenter"]],
							{edge, intracedges}
						]
					}, {}],
				If[OptionValue[ShowInterCellEdges],
					{OptionValue[InterCellEdgeStyle],
						Table[Arrow@GetEdge[cgraph["TriangleGroup"], ResolveEdge[cgraph, edge], DiskCenter -> cgraph["CellCenter"]],
							{edge, intercedges}
					]
					},{}]
				}
			]	
		}, Sequence@@FilterRules[{opts}, Options[Graphics]]], 
		(* vertices *)
		Graph[cgraph["Graph"],
			Sequence@@FilterRules[{opts}, Options[Graph]],
			VertexSize -> 0,
			VertexStyle -> Directive[EdgeForm[Opacity[0]],FaceForm[Opacity[0]]],
			VertexLabels -> If[OptionValue[ShowVertexLabels], "Name", None],
			EdgeStyle -> Opacity[0]
		],
		Graphics[{OptionValue[CellVertexStyle],
			Point/@(VertexCoordinates/.AbsoluteOptions[cgraph["Graph"]])
		}],
		Sequence@@FilterRules[{opts}, {ImageSize}]
	]
]


Options[ShowCellBoundary] = {
	CellBoundaryStyle -> Directive[Darker@Red, AbsoluteThickness[2]],
	ShowEdgeIdentification -> False,
	EdgeColorFunction -> (ColorData[97,"ColorList"][[Mod[#,15,1]]]&),
	ShowTranslations -> False,
	ShowTranslationLabels -> True,
	ShowTranslationIndices -> False,
	ShowTranslatedCells -> False,
	TranslatedCellBoundaryStyle -> Directive[Black, AbsoluteThickness[1]],
	TranslationLabelStyle -> {}
};
ShowCellBoundary[cgraph_HCCellGraph, opts:OptionsPattern[]] := ShowCellBoundary[cgraph, opts] = Module[{format\[Gamma], gcellbd},
	(* translation label formatting *)
	format\[Gamma][expr_] := StringReplace[expr, {
		RegularExpression["g(\\d+)(\\^(\\-?\\d+))?"] -> ToString[StringForm[\!\(\*
TagBox[
StyleBox[
RowBox[{"\n", "\t\t\t", "\"\<\\!\\(\\*SuperscriptBox[SubscriptBox[\\(\\[Gamma]\\), \\(`1`\\)], \\(`2`\\)]\\)\>\""}],
ShowSpecialCharacters->False,
ShowStringCharacters->True,
NumberMarks->True],
FullForm]\),
			"$1", "$3"
		], StandardForm],
		"*" -> ""
	}];
	
	(* get cell boundary *)
	gcellbd = GetCellBoundary[cgraph];
	
	(* graphics *)
	Graphics[{
		If[OptionValue[ShowEdgeIdentification],
			{OptionValue[CellBoundaryStyle],
				{OptionValue[EdgeColorFunction][#[[1]]],
					#[[2]],
					With[{
						pt = #[[3]]
					},{
						If[OptionValue[ShowTranslations], pt, {}],
						If[OptionValue[ShowTranslationLabels], Text[Style[format\[Gamma]@#[[4]],OptionValue[TranslationLabelStyle]],pt[[1]]], {}],
						If[OptionValue[ShowTranslationIndices], Text[#[[1]],pt[[1]]],{}] 
					}]}&/@gcellbd
			},
			{{OptionValue[CellBoundaryStyle],
				LToGraphics[LLine[{
					GetSitePosition[cgraph["TriangleGroup"], EdgeList[cgraph["Graph"]][[#[[3]]]][[1,1]], #[[1]], DiskCenter -> cgraph["CellCenter"]],
					GetSitePosition[cgraph["TriangleGroup"], EdgeList[cgraph["Graph"]][[#[[3]]]][[2,1]], #[[2]], DiskCenter -> cgraph["CellCenter"]]
				}]&/@cgraph["BoundaryEdges"], Model -> PoincareDisk]
			}, With[{
				pt = LToGraphics[GetSitePosition[cgraph["TriangleGroup"], 3,
					ResolveTranslation[cgraph, #[[6]]],
					DiskCenter -> cgraph["CellCenter"]],
					Model->PoincareDisk
				]},{
					If[OptionValue[ShowTranslations], pt, {}],
					If[OptionValue[ShowTranslationLabels], Text[Style[format\[Gamma]@#[[6]],OptionValue[TranslationLabelStyle]],pt[[1]]], {}]
				}]&/@cgraph["BoundaryEdges"]
			}
		],
		If[OptionValue[ShowTranslatedCells],
			{OptionValue[TranslatedCellBoundaryStyle],
				LToGraphics[Table[LLine[{
						GetSitePosition[cgraph["TriangleGroup"],
							EdgeList[cgraph["Graph"]][[#[[3]]]][[1,1]],
							#[[1]]<>"*"<>ResolveTranslation[cgraph, \[Gamma]],
							DiskCenter -> cgraph["CellCenter"]
						],
						GetSitePosition[cgraph["TriangleGroup"],
							EdgeList[cgraph["Graph"]][[#[[3]]]][[2,1]],
							#[[2]]<>"*"<>ResolveTranslation[cgraph, \[Gamma]],
							DiskCenter -> cgraph["CellCenter"]
						]
					}]&/@cgraph["BoundaryEdges"],
					{\[Gamma], cgraph["BoundaryEdges"][[;;,6]]}],
					Model -> PoincareDisk
				]
			},
		{}]
	}, Sequence@@FilterRules[{opts}, Options[Graphics]]]
]


Options[VisualizeCellGraph] = {
	Elements -> <|
		ShowCellBoundary -> {},
		ShowCellGraph -> {}
	|>
};
VisualizeCellGraph[cgraph_HCCellGraph, opts:OptionsPattern[{VisualizeCellGraph, ShowTriangles, GetTriangleTessellation, Graphics, Rasterize}]] := Module[{
		sel = KeySelect[MemberQ[{
			ShowCellSchwarzTriangles,
			ShowCellBoundary,
			ShowCellGraph,
			ShowCellGraphFlattened
		},#]&]
	},
	
	Show[
		ShowTriangles[cgraph["TriangleGroup"], DiskCenter -> cgraph["CellCenter"],
			Sequence@@FilterRules[{opts},Join@@(Options/@{
				ShowTriangles,
				GetTriangleTessellation,
				Graphics,
				Rasterize
			})]
		],
		KeyValueMap[#1[cgraph, Sequence@@#2]&, sel[OptionValue[Elements]]],
		Sequence@@FilterRules[{opts}, {ImageSize}]
	]
]


(* ::Subsubsection::Closed:: *)
(*Model Graph*)


Options[VisualizeModelGraph] = {
	Elements -> <|
		ShowCellGraphFlattened -> {}
	|>,
	CellGraph -> None,
	IndicateDisclination -> False,
	DisclinationLineStyle -> Directive[Black, Dashed, Thickness[0.003], Opacity[0.8]]
};
VisualizeModelGraph[mgraph_HCModelGraph|mgraph_HCSupercellModelGraph|mgraph_HBDisclinationModelGraph|mgraph_HBDisclinationSupercellModelGraph,
	opts:OptionsPattern[{VisualizeModelGraph, ShowTriangles, GetTriangleTessellation, Graphics, Rasterize}]] :=
Module[{
		sel = KeySelect[MemberQ[{
			ShowCellSchwarzTriangles,
			ShowCellGraph,
			ShowCellGraphFlattened
		}, #]&],
		IsDisclinationGraph,
		IsSymmetrizedDisclinationGraph 
	},
	
	IsDisclinationGraph = Head[mgraph] === HBDisclinationModelGraph || Head[mgraph] === HBDisclinationSupercellModelGraph;
	IsSymmetrizedDisclinationGraph = If[IsDisclinationGraph, mgraph["SymmetrizedFlake"], False];
	
	Show[If[IsSymmetrizedDisclinationGraph,
			Graphics[{Circle[]}, 	
				Sequence@@FilterRules[{opts}, Options[Graphics]],
				PlotRange -> 1.1{{-1, 1}, {-1, 1}},
				ImageSize -> 500],
			ShowTriangles[mgraph["TriangleGroup"], DiskCenter -> mgraph["CellCenter"],
				Sequence@@FilterRules[{opts}, Join@@(Options/@{
					ShowTriangles,
					GetTriangleTessellation,
					Graphics,
					Rasterize
				})]
			]
		],
		If[IsSymmetrizedDisclinationGraph && OptionValue[IndicateDisclination], 
			Graphics[{OptionValue[DisclinationLineStyle], Line[{{0, 0}, RotationMatrix[mgraph["ReferenceAngle"]] . {1, 0}}]}], 
		{}],
		If[IsDisclinationGraph, ##&[],
			If[MemberQ[Keys@OptionValue[Elements], ShowCellBoundary] &&
					Not[OptionValue[CellGraph] === None],
				ShowCellBoundary[OptionValue[CellGraph],
					Sequence@@(OptionValue[Elements][ShowCellBoundary])
			],
		{}]],
		KeyValueMap[#1[mgraph, Sequence@@#2]&, sel[OptionValue[Elements]]],
		Sequence@@FilterRules[{opts}, {ImageSize}]
	]
]


(* ::Subsubsection::Closed:: *)
(*Quotient sequences*)


TreeGraphVertexLabelAlternatePlacement[graph_] := Module[
	{vertxPositions, vertxPositionLayered, startPlacement},
	startPlacement = {Above, Below}; (* private option *)
	vertxPositions = AssociationThread[VertexList@graph, GraphEmbedding[graph]]; (* of the form vertex -> coordinates *)
	vertxPositionLayered = Reverse@KeySort[GroupBy[SortBy[vertxPositions, First], Last]]; (* of the form layerYCoord -> SubsetVertxPositions *)
	<|AssociationThread[#, Flatten[ConstantArray[startPlacement, Round[Length[#]/2]+1]][[;;Length[#]]]]&/@Keys[Values[vertxPositionLayered]]|> (* of the form vertex -> Placement *)
]


TreeGraphVertexLabel[tgQuotientNames_, Vlabel_, Vplace_, mspLst_, frame_, opts:OptionsPattern[{VisualizeQuotientSequences}]] := 	
	If[OptionValue[HighlightMirrorSymmetries],
		Table[q -> Placed[{"", "T" <> ToString[q[[1]]] <> "." <> ToString[q[[2]]] <> Vlabel[q]}, Vplace[q]{1, 1}, frame], {q, tgQuotientNames}],
		Table[q -> Placed[{"", "T" <> ToString[q[[1]]] <> "." <> ToString[q[[2]]] <> "\n\!\(\*SubscriptBox[\(S\), \(m\)]\):" <> If[mspLst[[Position[tgQuotientNames, q][[1, 1]]]] == 1, " \[Checkmark]", " \[Times]"] <> Vlabel[q]}, Vplace[q]{1, 1}, frame], {q, tgQuotientNames}]
	]


Options[VisualizeQuotientSequences] = {
	EdgeArrowSize -> 0.025,
	EdgeArrowPosition -> 0.5,
	EdgeFilter -> (True&),
	EdgeStyle -> Directive[Darker[Blue, 0.25], AbsoluteThickness[2]],
	HighlightMirrorSymmetries -> True,
	HighlightMirrorSymmetriesVertexStyle -> Darker[Red, 0.25],
	HighlightSubgraph -> False,
	HighlightSubgraphEdgeStyle -> Directive[Darker[Red, 0.25], AbsoluteThickness[3], Opacity[1]],
	LayerDistributionFunction -> (#^0.98&),
	ShowVertexLabels -> True,
	VertexFilter -> (True&),
	VertexLabelPlacement -> (Below&),
	VertexLabelStyle -> Directive[TextAlignment -> Left, 10, Black],
	VertexLabelFunction -> (""&)
};

VisualizeQuotientSequences[qsStructure_HCQuotientSequencesStructure, opts:OptionsPattern[{VisualizeQuotientSequences, Graph, AdjacencyGraph, Subgraph, HighlightGraph, Framed, Style, Graphics, Rectangle}]]:=Module[
	{version, tg, bg, tgQuotientNames,  mspLst, genusLst, vertexLabels, Mat, NNMat, frame, rawGraph,
	 vertexLayerPosition, distinctGenera, highlights, distL, FullTreeGraph, SubTreeGraph, Vlabel, Vplace,
	 keptVerticesIdx, keptVertices, keptVerticesLayers, keptVerticesLabels, keptVerticesHighlights, keptEdges, 
	 LowestGenusLayerPosition},
	     	     
	(* Get needed objects: *)
	(* ------------------ *)
	
	(* infos *)
	tg = qsStructure["TriangleGroup"]; (* triangle group signature *) 
	bg = qsStructure["BoundByGenus"]; (* boundByGenus *) 
	tgQuotientNames = qsStructure["TGQuotientNames"];
	genusLst = tgQuotientNames[[;;,1]];
	mspLst = qsStructure["MirrorSymmetries"];
	
	(* adjacency matrix *)
	Mat = qsStructure["AdjacencyMatrix"];
	NNMat = Mat - Sign[MatrixPower[Mat, 2]];

	(* ---------------------------------- *)
	(* Construct tree graph specifications : *)
	(* ---------------------------------- *)

	(* highlight the mirror symmetries *)
	highlights = If[OptionValue[HighlightMirrorSymmetries], 
		Flatten[Table[If[mspLst[[i]] == 1, {tgQuotientNames[[i]]}, {}], {i, Length@mspLst}], 1], {}]; 

	(* Construct vertex layer position.*)
	distL = OptionValue[LayerDistributionFunction];
	distinctGenera = Values[Counts@genusLst];
	LowestGenusLayerPosition = 0; (* privat option *)
	vertexLayerPosition = Join[{LowestGenusLayerPosition},
					Flatten[Table[Table[-distL[i], {j, distinctGenera[[i]]}], {i, CountDistinct@genusLst}], 1][[2;;]]]; 

	(* ------------------------------------ *)
	(* Construct vertex labels and edge shape: *)
	(* ------------------------------------ *)
 
	(* construct function for framed vertex labels *)
	frame = Framed[
		Style[#, OptionValue[VertexLabelStyle], Sequence@@FilterRules[{opts}, {Style}]], 
		ImageSize -> Automatic,
		Sequence@@FilterRules[{opts}, Join@@(Options/@{Framed, Graphics, Rectangle})], 
		Background -> Lighter[Gray, 0.9], RoundingRadius -> 4, FrameMargins -> 2, ContentPadding -> False
	]&;
	
	(* --------------- *)
	(* Construct graph: *)
	(* --------------- *)
	(* Note: adjust vertex names with VertexReplace *)	

	rawGraph = VertexReplace[
		AdjacencyGraph[NNMat, 
			GraphLayout -> {
				"LayeredDigraphEmbedding", 
				"RootVertex" -> 1,
				"Tolerance" -> 0.01,
				"VertexLayerPosition" -> vertexLayerPosition}], 
		Thread[Range[Length@tgQuotientNames] -> tgQuotientNames]
	];
		
	(* vertex labels *)
	Vplace = OptionValue[VertexLabelPlacement];
	Vplace = If[Vplace === "Alternate", TreeGraphVertexLabelAlternatePlacement[rawGraph], Vplace];
	Vlabel = OptionValue[VertexLabelFunction]; (* supplements Tg.n labels *)
	vertexLabels = TreeGraphVertexLabel[tgQuotientNames, Vlabel, Vplace, mspLst, frame, HighlightMirrorSymmetries -> OptionValue[HighlightMirrorSymmetries]];
	
	(* complete graph *)
	FullTreeGraph = Graph[rawGraph,
		Sequence@@FilterRules[{opts}, {Graph, AdjacencyGraph, VertexStyle, VertexSize, AspectRatio}],
		VertexLabels -> If[OptionValue[ShowVertexLabels], vertexLabels, {}],
		GraphHighlight -> highlights,
		GraphHighlightStyle -> (# -> VertexStyle -> OptionValue[HighlightMirrorSymmetriesVertexStyle]&/@ highlights),
		VertexStyle -> Black,
		VertexSize -> {"Scaled", 0.01},
		EdgeShapeFunction -> {GraphElementData[{"FilledArcArrow", "ArrowSize" -> OptionValue[EdgeArrowSize], "ArrowPositions" -> OptionValue[EdgeArrowPosition]}]},
		EdgeStyle -> If[ Head[OptionValue[EdgeStyle]] === List, 
						Join[{Directive[Darker[Blue, 0.25], AbsoluteThickness[2]]}, OptionValue[EdgeStyle]],
						{Directive[Darker[Blue, 0.25], AbsoluteThickness[2]], OptionValue[EdgeStyle]}
						],	
		AspectRatio -> 0.5, 
		Sequence@@FilterRules[{opts}, {ImageSize}]
	];

	(* ------------------------- *)
	(* High-level visualizations : *)
	(* ------------------------- *)
	
	If[OptionValue[EdgeFilter] === (True&) && OptionValue[VertexFilter] === (True&), FullTreeGraph, 
	
		(* filter through quotients *)
		Which[
			OptionValue[EdgeFilter] === (True&) && OptionValue[VertexFilter] =!= (True&),
				keptVertices = Select[VertexList@FullTreeGraph, OptionValue[VertexFilter][#]&];
				keptEdges = Select[EdgeList@FullTreeGraph, MemberQ[keptVertices, #[[1]]] && MemberQ[keptVertices, #[[2]]]&];,
			
			OptionValue[EdgeFilter] =!= (True&) && OptionValue[VertexFilter] === (True&),
				keptEdges = Select[EdgeList@FullTreeGraph, OptionValue[EdgeFilter][#]&];
				keptVertices = DeleteDuplicates[Join[keptEdges[[;;, 1]], keptEdges[[;;, 2]]]];,
				
			OptionValue[EdgeFilter] =!= (True&) && OptionValue[VertexFilter] =!= (True&),
				keptEdges = Select[EdgeList@FullTreeGraph, OptionValue[EdgeFilter][#]&];
				keptVertices = DeleteDuplicates[Join[keptEdges[[;;, 1]], keptEdges[[;;, 2]]]];
				keptVertices = Select[keptVertices, OptionValue[VertexFilter][#]&];
				keptEdges = Select[EdgeList@FullTreeGraph, MemberQ[keptVertices, #[[1]]] && MemberQ[keptVertices, #[[2]]]&];
			];
		keptVerticesIdx = Position[tgQuotientNames, #][[1, 1]]&/@keptVertices;
		keptVerticesLayers = vertexLayerPosition[[keptVerticesIdx]];
			
		(* ------------------ *)
		(* Construct subgraph: *)
		(* ------------------ *)
		(* construct subgraph, note that using the function Subgraph instead, returns unwanted results *)

		rawGraph = Graph[keptVertices, keptEdges, 
			GraphLayout -> {
				"LayeredDigraphEmbedding", 
				"RootVertex" -> keptVertices[[1]],
				"Tolerance" -> 0.01,
				"VertexLayerPosition" -> keptVerticesLayers} 
		];
		
		(* vertex labels and highlights *)
		Vplace = OptionValue[VertexLabelPlacement];
		Vplace = If[Vplace === "Alternate", TreeGraphVertexLabelAlternatePlacement[rawGraph], Vplace];
		keptVerticesLabels = TreeGraphVertexLabel[keptVertices, Vlabel, Vplace, mspLst, frame, HighlightMirrorSymmetries -> OptionValue[HighlightMirrorSymmetries]];
		keptVerticesHighlights = If[OptionValue[HighlightMirrorSymmetries], 
			Flatten[Table[If[mspLst[[i]] == 1, {tgQuotientNames[[i]]}, {}], {i, keptVerticesIdx}], 1], {}]; 
		
		SubTreeGraph = Graph[rawGraph,
			Sequence@@FilterRules[{opts}, {Graph, AdjacencyGraph, VertexStyle, VertexSize, AspectRatio}],
			VertexLabels -> If[OptionValue[ShowVertexLabels], keptVerticesLabels, {}],
			GraphHighlight -> keptVerticesHighlights,
			GraphHighlightStyle -> (# -> VertexStyle -> OptionValue[HighlightMirrorSymmetriesVertexStyle]&/@ keptVerticesHighlights),
			VertexStyle -> Black,
			VertexSize -> {"Scaled", 0.01}, 
			EdgeShapeFunction -> {GraphElementData[{"FilledArcArrow", "ArrowSize" -> OptionValue[EdgeArrowSize], "ArrowPositions" -> OptionValue[EdgeArrowPosition]}]},
			EdgeStyle -> If[ Head[OptionValue[EdgeStyle]] === List, 
							Join[{Directive[Darker[Blue, 0.25], AbsoluteThickness[2]]}, OptionValue[EdgeStyle]],
							{Directive[Darker[Blue, 0.25], AbsoluteThickness[2]], OptionValue[EdgeStyle]}
						],	
			AspectRatio -> 0.5, 
			Sequence@@FilterRules[{opts}, {ImageSize}]
		];

		If[OptionValue[HighlightSubgraph] == False || VertexList@SubTreeGraph == tgQuotientNames, SubTreeGraph, 
			HighlightGraph[FullTreeGraph, 
				If[Head[OptionValue[HighlightSubgraphEdgeStyle]] === List || Head[OptionValue[HighlightSubgraphEdgeStyle]] === Rule,
					OptionValue[HighlightSubgraphEdgeStyle],
					Style[#, OptionValue[HighlightSubgraphEdgeStyle]]&/@EdgeList[SubTreeGraph]
				  ],
				Sequence@@FilterRules[{opts}, {Graph, HighlightGraph, VertexStyle, VertexSize, AspectRatio, ImageSize}]
			]
		]
	]
]


(* ::Subsection::Closed:: *)
(*Construct Bloch Hamiltonians*)


MakeHermitian[H_] := H + ConjugateTranspose@H


ZeroMatrix[n_] := ConstantArray[0, {n, n}]


Options[AbelianBlochHamiltonianExpression] = {
	PCModel -> None,
	ReturnSparseArray -> False
};
AbelianBlochHamiltonianExpression[model_HCModelGraph|model_HCSupercellModelGraph, norb_, onsite_, hoppings_, k_Symbol,
	OptionsPattern[AbelianBlochHamiltonianExpression]] :=
Module[{dimk, verts, Nverts, edges, htest, Hexpr, PCVertex, PCEdge, H, assumptions},
	(* dimension of Abelian Brillouin zone *)
	dimk = 2*model["Genus"];
	
	(* extract vertices *)
	verts = VertexList@model["Graph"];
	Nverts = Length@verts;
	
	(* extract edges *)
	edges = Transpose[{
		EdgeList@model["Graph"],
		ToExpression@StringReplace[#, RegularExpression["g(\\d+)"] -> "(E^(\[ImaginaryI] " <> ToString[k] <> "[$1]))"]&/@
			model["EdgeTranslations"]
	}];
	
	(* mapping to primitive cell *)
	If[OptionValue[PCModel] === None,
		PCVertex[pcvertex_] := pcvertex;
		PCEdge[pcedge_] := pcedge;,
		PCVertex[scvertex_] := scvertex[[{1, 2}]];
		PCEdge[scedge_] := scedge[[0]][
			VertexList[OptionValue[PCModel]["Graph"]][[scedge[[3, 1]]]],
			VertexList[OptionValue[PCModel]["Graph"]][[scedge[[3, 2]]]],
			scedge[[3,3]]
		];
	];
	
	H = If[norb === 1,
		MakeHermitian@Total[SparseArray[{
			{Position[verts, #1[[2]]][[1, 1]], Position[verts, #1[[1]]][[1, 1]]} -> hoppings[PCEdge@#1]#2
		}, Nverts]&@@@edges] + Total[SparseArray[{
			{Position[verts, #][[1, 1]], Position[verts, #][[1, 1]]} -> onsite[PCVertex@#]
		}, Nverts]&/@verts],
		MakeHermitian@Total[SparseArray`SparseBlockMatrix[Join[
			{{Position[verts, #1[[2]]][[1, 1]], Position[verts, #1[[1]]][[1,1]]} -> hoppings[PCEdge@#1]#2},
			Table[{i, i} -> ZeroMatrix[norb[PCVertex@verts[[i]]]], {i, 1, Length@verts}]
		]]&@@@edges] + SparseArray`SparseBlockMatrix[
			{Position[verts, #][[1, 1]], Position[verts, #][[1, 1]]} -> onsite[PCVertex@#]&/@verts
		]
	];
	assumptions = And@@Table[k[i]\[Element]Reals, {i, 1, dimk}];
	H = Map[Simplify[#, assumptions]&, H, {2}];
	
	If[OptionValue[ReturnSparseArray], SparseArray@H, Normal@H]
]


Options[AbelianBlochHamiltonian] = {
	CompileFunction -> False,
	Parameters -> {},
	PBCCluster -> False
};
AbelianBlochHamiltonian[model_HCModelGraph|model_HCSupercellModelGraph, norb_, onsite_, hoppings_,
	opts:OptionsPattern[{AbelianBlochHamiltonianExpression, AbelianBlochHamiltonian, Compile}]] :=
If[OptionValue[PBCCluster],
	Evaluate[
		AbelianBlochHamiltonianExpression[model, norb, onsite, hoppings, k,
			ReturnSparseArray -> False,
			Evaluate@FilterRules[{opts}, Options[AbelianBlochHamiltonianExpression]]]/.
		Join[Table[k[i] -> 0, {i, 1, 2*model["Genus"]}], OptionValue[Parameters]]
	],
	If[OptionValue[CompileFunction],
		Block[{k},
			Compile[Evaluate@Table[{k[i], _Real}, {i, 1, 2*model["Genus"]}],
				Evaluate[
					AbelianBlochHamiltonianExpression[model, norb, onsite, hoppings, k,
						ReturnSparseArray -> False,
						Evaluate@FilterRules[{opts}, Options[AbelianBlochHamiltonianExpression]]
					]/. OptionValue[Parameters]
				],
				Evaluate@FilterRules[{opts}, Options[Compile]]
			]
		],
		Block[{k},
			Function[Evaluate@Table[Symbol["k" <> ToString@i], {i, 1, 2*model["Genus"]}],
				Evaluate[
					AbelianBlochHamiltonianExpression[model, norb, onsite, hoppings, k,
						ReturnSparseArray -> False,
						Evaluate@FilterRules[{opts}, Options[AbelianBlochHamiltonianExpression]]]/.
					Join[
						Table[k[i] -> Symbol["k" <> ToString@i], {i, 1, 2*model["Genus"]}],
						OptionValue[Parameters]
					]
				]
			]
		]
	]
]


(* ::Subsection::Closed:: *)
(*Construct non-reciprocal Bloch Hamiltonians*)


Options[NonReciprocalAbelianBlochHamiltonianExpression] = {
	PCModel -> None,
	ReturnSparseArray -> False
};
NonReciprocalAbelianBlochHamiltonianExpression[model_HCModelGraph|model_HCSupercellModelGraph, norb_, onsite_, hoppingsCanonical_, hoppingsOpposite_, k_Symbol,
	OptionsPattern[NonReciprocalAbelianBlochHamiltonianExpression]] :=
Module[{dimk, verts, Nverts, edges, htest, Hexpr, PCVertex, PCEdge, H, assumptions},
	(* dimension of Abelian Brillouin zone *)
	dimk = 2*model["Genus"];
	
	(* extract vertices *)
	verts = VertexList@model["Graph"];
	Nverts = Length@verts;
	
	(* extract edges *)
	edges = Transpose[{
		EdgeList@model["Graph"],
		ToExpression@StringReplace[#, RegularExpression["g(\\d+)"] -> "(E^(\[ImaginaryI] " <> ToString[k] <> "[$1]))"]&/@
			model["EdgeTranslations"]
	}];
	
	(* mapping to primitive cell *)
	If[OptionValue[PCModel] === None,
		PCVertex[pcvertex_] := pcvertex;
		PCEdge[pcedge_] := pcedge;,
		PCVertex[scvertex_] := scvertex[[{1, 2}]];
		PCEdge[scedge_] := scedge[[0]][
			VertexList[OptionValue[PCModel]["Graph"]][[scedge[[3, 1]]]],
			VertexList[OptionValue[PCModel]["Graph"]][[scedge[[3, 2]]]],
			scedge[[3,3]]
		];
	];
	
	H = If[norb === 1,
		Total[Normal@SparseArray[{
			{Position[verts, #1[[2]]][[1, 1]], Position[verts, #1[[1]]][[1, 1]]} -> hoppingsCanonical[PCEdge@#1]#2
		}, Nverts]&@@@edges] + ConjugateTranspose@Total[Normal@SparseArray[{
			{Position[verts, #1[[2]]][[1, 1]], Position[verts, #1[[1]]][[1, 1]]} -> Conjugate@hoppingsOpposite[PCEdge@#1]#2
		}, Nverts]&@@@edges] + Total[Normal@SparseArray[{
			{Position[verts, #][[1, 1]], Position[verts, #][[1, 1]]} -> onsite[PCVertex@#]
		}, Nverts]&/@verts],
		Total[Normal@SparseArray`SparseBlockMatrix[Join[
			{{Position[verts, #1[[2]]][[1, 1]], Position[verts, #1[[1]]][[1,1]]} -> hoppingsCanonical[PCEdge@#1]#2},
			Table[{i, i} -> ZeroMatrix[norb[PCVertex@verts[[i]]]], {i, 1, Length@verts}]
		]]&@@@edges] + ConjugateTranspose@Total[Normal@SparseArray`SparseBlockMatrix[Join[
			{{Position[verts, #1[[2]]][[1, 1]], Position[verts, #1[[1]]][[1,1]]} -> Conjugate@hoppingsOpposite[PCEdge@#1]#2},
			Table[{i, i} -> ZeroMatrix[norb[PCVertex@verts[[i]]]], {i, 1, Length@verts}]
		]]&@@@edges] + Normal@SparseArray`SparseBlockMatrix[
			{Position[verts, #][[1, 1]], Position[verts, #][[1, 1]]} -> onsite[PCVertex@#]&/@verts
		]
	];
	assumptions = And@@Table[k[i]\[Element]Reals, {i, 1, dimk}];
	H = Map[Simplify[#, assumptions]&, H, {2}];
	
	If[OptionValue[ReturnSparseArray], SparseArray@H, Normal@H]
]


Options[NonReciprocalAbelianBlochHamiltonian] = {
	CompileFunction -> False,
	Parameters -> {},
	PBCCluster -> False
};
NonReciprocalAbelianBlochHamiltonian[model_HCModelGraph|model_HCSupercellModelGraph, norb_, onsite_,  hoppingsCanonical_, hoppingsOpposite_,
	opts:OptionsPattern[{NonReciprocalAbelianBlochHamiltonianExpression, NonReciprocalAbelianBlochHamiltonian, Compile}]] :=
If[OptionValue[PBCCluster],
	Evaluate[
		NonReciprocalAbelianBlochHamiltonianExpression[model, norb, onsite,  hoppingsCanonical, hoppingsOpposite, k,
			Evaluate@FilterRules[{opts}, Options[NonReciprocalAbelianBlochHamiltonianExpression]]]/.
		Join[Table[k[i] -> 0, {i, 1, 2*model["Genus"]}], OptionValue[Parameters]]
	],
	If[OptionValue[CompileFunction],
		Block[{k},
			Compile[Evaluate@Table[{k[i], _Real}, {i, 1, 2*model["Genus"]}],
				Evaluate[
					NonReciprocalAbelianBlochHamiltonianExpression[model, norb, onsite, hoppingsCanonical, hoppingsOpposite, k,
						Evaluate@FilterRules[{opts}, Options[NonReciprocalAbelianBlochHamiltonianExpression]]
					]/. OptionValue[Parameters]
				],
				Evaluate@FilterRules[{opts}, Options[Compile]]
			]
		],
		Block[{k},
			Function[Evaluate@Table[Symbol["k" <> ToString@i], {i, 1, 2*model["Genus"]}],
				Evaluate[
					NonReciprocalAbelianBlochHamiltonianExpression[model, norb, onsite,  hoppingsCanonical, hoppingsOpposite, k,
						Evaluate@FilterRules[{opts}, Options[NonReciprocalAbelianBlochHamiltonianExpression]]]/.
					Join[
						Table[k[i] -> Symbol["k" <> ToString@i], {i, 1, 2*model["Genus"]}],
						OptionValue[Parameters]
					]
				]
			]
		]
	]
]


(* ::Subsection::Closed:: *)
(*Construct Hamiltonians for clusters*)


(* ::Subsubsection::Closed:: *)
(*Reciprocal*)


(* for (supercell) model graphs *)
(* Note: not PBCCluster compatible, handled in the main function *)
TBHamiltonian[mgraph_HCModelGraph|mgraph_HCSupercellModelGraph, norb_, onsite_, hoppings_, opts:OptionsPattern[AbelianBlochHamiltonianExpression]]:=Module[
	{mg = mgraph, idxInterCell, cellIdx},
	
	(* inter-cell edges positions *)
	idxInterCell = Flatten[Position[mgraph["EdgeTranslations"], _?(# != "1"&)]];	
	
	(* adjust hoppings *)
	cellIdx = If[Head[mgraph] === HCModelGraph, {1, 9}, {1, 10}]; 
	mg[[Sequence@@cellIdx, idxInterCell]] = "0"; (* set inter-cell hoppings to zero through edge translations *)

	(* construct the Hamiltonian *)
	AbelianBlochHamiltonianExpression[mg, norb, onsite, hoppings, Symbol["k"], ReturnSparseArray -> OptionValue[ReturnSparseArray], PCModel -> OptionValue[PCModel]]
	]


(* for (supercell) model graphs with disclination defects *)
(* Note: PBCCluster compatible *)
TBHamiltonian[mgraph_HBDisclinationModelGraph|mgraph_HBDisclinationSupercellModelGraph, HCPCmgraph_HCModelGraph, norb_, onsitePC_, hoppingsPC_, hoppingsGluedEdges_, opts:OptionsPattern[AbelianBlochHamiltonianExpression]]:= Module[
	{pcmodel, os, hoppingsRE, hoppingsGE, hoppings, mgraphBeheaded},
	
	(* adjust option PCModel for AbelianBlochHamiltonianExpression *)	
	pcmodel = If[Head@mgraph === HBDisclinationModelGraph, None, HCPCmgraph];
	
	(* adjust format *)
	os = If[Head[onsitePC]=== Function, Association[# -> onsitePC[#] &/@VertexList[HCPCmgraph["Graph"]]], onsitePC];
	hoppingsRE = If[Head[hoppingsPC] === Function, Association[# -> hoppingsPC[#] &/@EdgeList[HCPCmgraph["Graph"]]], hoppingsPC];
	hoppingsGE = If[Head@mgraph === HBDisclinationModelGraph, 
		If[ Head[hoppingsGluedEdges] === Function, Association[# -> hoppingsGluedEdges[#] &/@mgraph["GluedEdges"]], hoppingsGluedEdges],
		If[ Head[hoppingsGluedEdges] === Function, 
			Association[DirectedEdge[#[[1, {1, 2}]], #[[2, {1, 2}]], #[[3, 3]]] -> hoppingsGluedEdges[#]&/@mgraph["GluedEdges"]],
			Association[DirectedEdge[#[[1, 1, {1, 2}]], #[[1, 2, {1, 2}]], #[[1, 3, 3]]] -> #[[2]]&/@Transpose[{Keys[hoppingsGluedEdges], Values[hoppingsGluedEdges]}]]]
		];
	hoppings = Join[hoppingsRE, hoppingsGE];
	
	(* replace heads *)
	mgraphBeheaded = If[Head@mgraph === HBDisclinationModelGraph, HCModelGraph[mgraph[[1]]], HCSupercellModelGraph[mgraph[[1]]]];
	
	AbelianBlochHamiltonianExpression[mgraphBeheaded, norb, os, hoppings, Symbol["k"], ReturnSparseArray -> OptionValue[ReturnSparseArray], PCModel -> pcmodel]/.{If[mgraph["PBCCluster"], E^__:>1, ##&[]]}
]


(* ::Subsubsection::Closed:: *)
(*Non-reciprocal*)


(* for (supercell) model graphs *)
(* Note: not PBCCluster compatible, handled in the main function *)
NonReciprocalTBHamiltonian[mgraph_HCModelGraph|mgraph_HCSupercellModelGraph, norb_, onsite_, hoppingsCanonical_,  hoppingsOpposite_, opts:OptionsPattern[NonReciprocalAbelianBlochHamiltonianExpression]]:=Module[
	{mg = mgraph, idxInterCell, cellIdx},
	
	(* inter-cell edges positions *)
	idxInterCell = Flatten[Position[mgraph["EdgeTranslations"], _?(# != "1"&)]];	
	
	(* adjust hoppings *)
	cellIdx = If[Head[mgraph] === HCModelGraph, {1, 9}, {1, 10}]; 
	mg[[Sequence@@cellIdx, idxInterCell]] = "0"; (* set inter-cell hoppings to zero through edge translations *)

	NonReciprocalAbelianBlochHamiltonianExpression[mg, norb, onsite, hoppingsCanonical, hoppingsOpposite, Symbol["k"], ReturnSparseArray -> OptionValue[ReturnSparseArray], PCModel -> OptionValue[PCModel]]
]


(* for (supercell) model graphs with disclination defects *)
(* Note: PBCCluster compatible *)
NonReciprocalTBHamiltonian[mgraph_HBDisclinationModelGraph|mgraph_HBDisclinationSupercellModelGraph, HCPCmgraph_HCModelGraph, norb_, onsitePC_, hoppingsCanonicalPC_,  hoppingsOppositePC_, hoppingsCanonicalGluedEdges_, hoppingsOppositeGluedEdges_, opts:OptionsPattern[NonReciprocalAbelianBlochHamiltonianExpression]]:= Module[
	{pcmodel, os, hoppings1PC, hoppings2PC, hoppings1GE, hoppings2GE, hoppings1, hoppings2, mgraphBeheaded},
	
	(* adjust option PCModel for NonReciprocalAbelianBlochHamiltonianExpression *)
	pcmodel = If[Head@mgraph === HBDisclinationModelGraph, None, HCPCmgraph];
		
	(* adjust format *)
	os = If[Head[onsitePC]=== Function, Association[# -> onsitePC[#] &/@VertexList[HCPCmgraph["Graph"]]], onsitePC];		
	hoppings1PC = If[Head[hoppingsCanonicalPC] === Function, Association[# -> hoppingsCanonicalPC[#]&/@EdgeList[HCPCmgraph["Graph"]]], hoppingsCanonicalPC];
	hoppings2PC = If[Head[hoppingsOppositePC] === Function, Association[# -> hoppingsOppositePC[#]&/@EdgeList[HCPCmgraph["Graph"]]], hoppingsOppositePC];
	hoppings1GE = If[Head@mgraph === HBDisclinationModelGraph, 
		If[ Head[hoppingsCanonicalGluedEdges] === Function, Association[# -> hoppingsCanonicalGluedEdges[#] &/@mgraph["GluedEdges"]], hoppingsCanonicalGluedEdges],
		If[ Head[hoppingsCanonicalGluedEdges] === Function, 
			Association[DirectedEdge[#[[1, {1, 2}]], #[[2, {1, 2}]], #[[3, 3]]] -> hoppingsCanonicalGluedEdges[#]&/@mgraph["GluedEdges"]],
			Association[DirectedEdge[#[[1, 1, {1, 2}]], #[[1, 2, {1, 2}]], #[[1, 3, 3]]] -> #[[2]]&/@Transpose[{Keys[hoppingsCanonicalGluedEdges], Values[hoppingsCanonicalGluedEdges]}]]]
		];
	hoppings2GE = If[Head@mgraph === HBDisclinationModelGraph, 
		If[ Head[hoppingsOppositeGluedEdges] === Function, Association[# -> hoppingsOppositeGluedEdges[#] &/@mgraph["GluedEdges"]], hoppingsOppositeGluedEdges],
		If[ Head[hoppingsOppositeGluedEdges] === Function, 
			Association[DirectedEdge[#[[1, {1, 2}]], #[[2, {1, 2}]], #[[3, 3]]] -> hoppingsOppositeGluedEdges[#]&/@mgraph["GluedEdges"]],
			Association[DirectedEdge[#[[1, 1, {1, 2}]], #[[1, 2, {1, 2}]], #[[1, 3, 3]]] -> #[[2]]&/@Transpose[{Keys[hoppingsOppositeGluedEdges], Values[hoppingsOppositeGluedEdges]}]]]
		];
	hoppings1 = Join[hoppings1PC, hoppings1GE];
	hoppings2 = Join[hoppings2PC, hoppings2GE];
		
	(* replace heads *)
	mgraphBeheaded = If[Head@mgraph === HBDisclinationModelGraph, HCModelGraph[mgraph[[1]]], HCSupercellModelGraph[mgraph[[1]]]];
	
	NonReciprocalAbelianBlochHamiltonianExpression[mgraphBeheaded, norb, os, hoppings1, hoppings2, Symbol["k"], ReturnSparseArray -> OptionValue[ReturnSparseArray], PCModel -> pcmodel]/.{If[mgraph["PBCCluster"], E^__:>1, ##&[]]}
]


(* ::Section:: *)
(*Package Footer*)


End[];
EndPackage[];
