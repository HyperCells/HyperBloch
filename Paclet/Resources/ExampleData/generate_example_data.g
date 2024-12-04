# load the HyperCells package (https://github.com/HyperCells/HyperCells)
LoadPackage( "HyperCells" );

# {8,8} lattice

# set up (proper) triangle group
tg := ProperTriangleGroup( [ 2, 8, 8 ] );

# specify the quotient defining the primitive cell
qpc := TGQuotient( [ 2, 6 ] );

# construct symmetric primitive cell
cgpc := TGCellGraph( tg, qpc, 3 : simplify := 5 );
Export( cgpc, "(2,8,8)_T2.6_3.hcc" ); # export

# elementary nearest-neighbor model
model := TessellationModelGraph( cgpc, true : simplify := 5 );
Export( model, "{8,8}-tess_T2.6_3.hcm" ); # export

# construct symmetric supercell
sc := TGCellSymmetric( tg, TGQuotient( [ 3, 11 ] ), 3 );

# extend the model defined on the primitive cell to the supercell
scmodel := TGSuperCellModelGraph( model, sc : simplify := 0 );
Export( scmodel, "{8,8}-tess_T2.6_3_sc-T3.11.hcs" ); # export

# Point-group matrices

# construct point-group matrices for the triangle group generators
fulltg := TriangleGroup( [ 2, 8, 8 ] );
pgMatGs := PGMatricesOfGenerators(fulltg, tg, qpc : sparse := true);

# symmetries, i.e., generators of the proper triangle group
D := FpGroup(tg);
symmetries := GeneratorsOfGroup(D);

# construct and export the PGMatrices
pgMat_T2_6 := PGMatrices(symmetries, pgMatGs);
Export(pgMat_T2_6, "(2,8,8)_T2.6-pgMat_xyz_sparse.hcpgm");

# {8,3} lattice

# set up (proper) triangle group
tg := ProperTriangleGroup( [ 2, 3, 8 ] );

# specify the quotient defining the primitive cell
qpc := TGQuotient( [ 2, 1 ] );

# construct symmetric primitive cell
cgpc := TGCellGraph( tg, qpc, 3 : simplify := 5 );
Export( cgpc, "(2,3,8)_T2.1_3.hcc" ); # export

# elementary nearest-neighbor model
model := TessellationModelGraph( cgpc, false : simplify := 5 );
Export( model, "{8,3}-tess_T2.1_3.hcm" ); # export

# construct symmetric supercell
sc := TGCellSymmetric( tg, TGQuotient( [ 5, 1 ] ), 3 );

# extend the model defined on the primitive cell to the supercell
scmodel := TGSuperCellModelGraph( model, sc : simplify := 0 );
Export( scmodel, "{8,3}-tess_T2.1_3_sc-T5.1.hcs" ); # export

# Quotient sequences structures, {6,4} lattice

tg := ProperTriangleGroup( [ 2, 4, 6 ] );
tgQSS := TGQuotientSequencesStructure(tg : sparse := true, boundByGenus := 35);
Export(tgQSS, "(2,4,6)-QSS-BBG_35_sparse.hcqs");

tgQSS := TGQuotientSequencesStructure(tg : sparse := true, boundByGenus := 102);
Export(tgQSS, "(2,4,6)-QSS-BBG_102_sparse.hcqs");


