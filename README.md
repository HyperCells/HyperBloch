# HyperBloch

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.16356081.svg)](https://doi.org/10.5281/zenodo.16356081)

HyperBloch is a Mathematica package for constructing tight-binding models on
hyperbolic lattices and calculating their band structures using the supercell
method.

:book: We have a new website with detailed [instructions on the installation](https://www.hypercells.net/contents/Installation/installation.html) process, a [getting-started guide](https://www.hypercells.net/contents/GettingStarted/getting_started.html) and hands-on [tutorials](https://www.hypercells.net/contents/Tutorials/tutorials.html): https://www.hypercells.net.

An introduction to the underlying concepts can be found in the following publication

> P. M. Lenggenhager, J. Maciejko, and T. Bzdušek,
  *Non-Abelian hyperbolic band theory from supercells*,
  [Phys. Rev. Lett. 131, 226401](https://doi.org/10.1103/PhysRevLett.131.226401) (2023)
  
and the doctoral thesis

> P. M. Lenggenhager,
  *Emerging avenues in band theory: multigap topology and hyperbolic lattices*,
  [PhD thesis](https://doi.org/10.3929/ethz-b-000645370), ETH Zurich (2023)

If you use this package, please cite at least one of the above references in
addition to the package itself:
> P. M. Lenggenhager, J. Maciejko, and T. Bzdušek,
  *HyperBloch: A Mathematica package for hyperbolic tight-binding models and the
  supercell method*, [https://github.com/HyperCells/HyperBloch](https://github.com/HyperCells/HyperBloch),
  [10.5281/zenodo.10222865](https://doi.org/10.5281/zenodo.10222865) (2023)

This [post](https://community.wolfram.com/groups/-/m/t/3131734) in the Wolfram
Community forum demonstrates some of the core functionality of the package.


Please refer to [CONTRIBUTING.md](CONTRIBUTING.md) on how you can contribute to
the development of this package.

  #### Table of Contents  
- [HyperBloch](#hyperbloch)
      - [Table of Contents](#table-of-contents)
  - [Authors and developers](#authors-and-developers)
  - [Installation](#installation)
    - [Dependencies](#dependencies)
    - [HyperBloch](#hyperbloch-1)
  - [Documentation](#documentation)
  - [Limitations](#limitations)
  - [HyperCells package](#hypercells-package)
  - [How to cite](#how-to-cite)
  - [Contact](#contact)
  - [License and copyright](#license-and-copyright)

## Authors and developers

Main developer:\
&ensp;&ensp;**Patrick M. Lenggenhager**\
&ensp;&ensp;Email: plengg@pks.mpg.de\
&ensp;&ensp;Website: https://patrick-lenggenhager.github.io

Coauthors:\
&ensp;&ensp;**Joseph Maciejko** (maciejko@ualberta.ca)\
&ensp;&ensp;**Tomáš Bzdušek** (tomas.bzdusek@uzh.ch)

Code contributers:\
&ensp;&ensp;**Marcelo Looser** (marcelo.looser@outlook.com)

## Installation

### Dependencies

HyperBloch requires the `NCAlgebra` package, which is available from GitHub at
[https://github.com/NCAlgebra/NC](https://github.com/NCAlgebra/NC)
Please check the installation instructions there.

### HyperBloch

In the future, HyperBloch will be submitted to the
[Wolfram Language Paclet Repository](https://resources.wolframcloud.com/PacletRepository/).
Until then, it can be installed manually. For version 1.0.1, the following command
can be used:
```Mathematica
PacletInstall["https://github.com/HyperCells/HyperBloch/releases/download/v1.0.1/PatrickMLenggenhager__HyperBloch-1.0.1.paclet"]
```

Alternatively, you can download the latest release (as a `.paclet` file) from
https://github.com/HyperCells/HyperBloch/releases/latest,
open Mathematica and evaluate
```Mathematica
PacletInstall["path/to/PatrickMLenggenhager__HyperBloch-x.x.x.paclet"]
```
where `path/to/PatrickMLenggenhager__HyperBloch-x.x.x.paclet` is the path to the
downloaded `.paclet` file.

Then, load the package by evaluating
```Mathematica
<< PatrickMLenggenhager`HyperBloch`
```

Note that while most of the functionality of HyperBloch is available with Wolfram
Language 12.0, some of the visualization functions require Wolfram Language 13 or
later, such that updating to Wolfram Language 13 is recommended.

## Documentation

The documentation is distributed as part of the paclet and integrates into the
Wolfram Language documentation center. To access it, open Mathematica and press
`F1` or click on the `Help` menu and select `Wolfram Documentation`. Then, search
for "HyperBloch" in the search bar.
A good place to start is the Tech Note "Basic Usage", which is usually among the
first few results. Alternatively, you can access the documentation pages directly:
`PatrickMLenggenhager/HyperBloch/tutorial/BasicUsage`.

The Guide page (`PatrickMLenggenhager/HyperBloch/guide/HyperBlochPackage`) contains
an overview over the package and its functionality. The reference pages
contain detailed information about the package's functions and options.


## Limitations
Note that at this point *HyperBloch* is still under development and, because the
limitations have not yet been fully determined, released only as a beta version.
Further testing will be required before an official release. However, the package
is already fully functional and documented and can be used to reproduce the results
of the publication mentioned above.

In newer versions of Mathematica, the visualization functions may lead to warnings
about badly conditioned warnings. These warnings can, in most cases, be safely
ignored. For very large cells, the visualization of objects close to the boundary of
the Poincaré disk may be inaccurate. However, the deviations will most likely not
be visible. If you do encounter visible inaccuracies, please report them using the
issue tracker at
> https://github.com/HyperCells/HyperBloch/issues

## HyperCells package

The HyperCells [GAP](https://www.gap-system.org/) package is a companion package to
HyperBloch. The input HyperBloch requires, i.e., the graphs representing primitive
and supercells of hyperbolic lattices and models defined on them, can be generated
using HyperCells. It is available on Github at
> https://github.com/HyperCells/HyperCells


## How to cite

If you use this package, please cite the package repository
```BibTeX
@misc{HyperBloch,
  title           = {{HyperBloch}: {A} {M}athematica package for hyperbolic tight-binding models and the
  supercell method},
  author          = {Lenggenhager, Patrick M. and Maciejko, Joseph and Bzdu\v{s}ek, Tom\'{a}\v{s}},
  year            = {2023},
  doi             = {10.5281/zenodo.10222865},
  note            = {\url{https://github.com/HyperCells/HyperBloch}}
}
```
and at least one of the following references:
```BibTeX
@article{Lenggenhager:2023,
  title               = {Non-{A}belian hyperbolic band theory from supercells}, 
  author              = {Lenggenhager, Patrick M. and Maciejko, Joseph and Bzdu\v{s}ek, Tom\'{a}\v{s}},
  journal             = {Phys. Rev. Lett.},
  volume              = {131},
  issue               = {22},
  pages               = {226401},
  numpages            = {7},
  year                = {2023},
  month               = {Dec},
  publisher           = {American Physical Society},
  doi                 = {10.1103/PhysRevLett.131.226401}
}

@phdthesis{Lenggenhager:PhDThesis,
  title           = {Emerging avenues in band theory: multigap topology and hyperbolic lattices},
  author          = {Lenggenhager, Patrick M.}, 
  year            = {2023},
  school          = {ETH Zurich},
  doi             = {10.3929/ethz-b-000645370}
}
```

## Contact

To report issues, please use the issue tracker at
https://github.com/HyperCells/HyperBloch/issues.

Maintainer:\
&ensp;&ensp;**Patrick M. Lenggenhager**\
&ensp;&ensp;Email: plengg@pks.mpg.de\
&ensp;&ensp;Homepage: https://patrick-lenggenhager.github.io

## License and copyright

HyperBloch is free software; you can redistribute and/or modify it under the
terms of the CC BY-SA 4.0 license as described below. HyperBloch is distributed
in the hope that it will be useful, but WITHOUT ANY WARRANTY, see the CC BY-SA
4.0 license for more details.

This is a human-readable summary of (and not a substitute for) the license, see
the attached [LICENSE](LICENSE.txt) for the full legal text.

You are free to:
  Share — copy and redistribute the material in any medium or format for any purpose.
  Adapt — remix, transform, and build upon the material for any purpose.
  The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:
  Attribution - You must give appropriate credit (see [AUTHORS](AUTHORS.md) and
    [How to cite](#how-to-cite) above), provide a link to the license, and
    indicate if changes were made. You may do so in any reasonable manner, but
    not in any way that suggests the licensor endorses you or your use.
  ShareAlike - If you remix, transform, or build upon the material, you must
    distribute your contributions under the same license as the original.
  No additional restrictions - You may not apply legal terms or technological
    measures that legally restrict others from doing anything the license permits.

&copy; 2023-2024 Patrick M. Lenggenhager