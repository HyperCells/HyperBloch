# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2024-12-16

### Changed
- Allow for specification of import elements when importing HCS files using `ImportSupercellModelGraphString`.
- Optimize the construction of Bloch Hamiltonians in `(NonReciprocal)AbelianBlochHamiltonianExpression`.
  
### Fixed
- Fix undesired generation of duplicate triangles in `ShowTriangles`.
- Fix incorrect and incomplete description of edge tags in documentation of `HCModelGraph`.

## [1.0.0] - 2024-12-04

### Added
- Add option to style the translation labels in visualizations of the cell boundary (@marcelolooser).
- Add functions `NonReciprocalAbelianBlochHamiltonian` and
`NonReciprocalAbelianBlochHamiltonianEpression` for constructing non-reciprocal models (@marcelolooser).
- Add data types and functions to implement disclination defects in finite flakes (@marcelolooser).
- Add data types and functions to import and visualize `HCQuotientSequencesStructure`,
i.e., quotients of normal subgroups of the triangle group and their relationships (@marcelolooser).
- Add `HCPGMatrices` for importing and working with point-group matrices describing the
action of symmetries on hyperbolic momenta (@marcelolooser).
- Add `CITATION.cff` for easier citing of the software

### Changed
- Update references, URLs etc. to reflect transfer of repository to HyperCells organization and new website https://www.hypercells.net.

### Fixed
- Correct various typos in the documentation and instructions.

## [0.9.1] - 2024-03-05

### Added
- Add a change log (this file).
- Add link to getting-started guide and to Wolfram Community post to README.md.
- Add warning message if NCAlgebra paclet version 6+ is not installed.
- Add option for `AbelianBlochHamiltonianExpression` to return the Bloch Hamiltonian as a
`SparseArray`.

### Changed
- Improve performance of `AbelianBlochHamiltonianExpression`.
- Update references in readme.
- Load example data from files in example data directory instead of embedding the data
in the documentation notebooks.

### Fixed
- Fixed `Det::luc` error message being raised by an unnecessary check in `Det` for
showing triangle tessellations.


## [0.9.0] - 2023-11-29

Initial release.