# Quantum alchemy data - Atoms

All PySCF calculation logs and JSON files for the atom study of quantum alchemy.
A cumulative JSON file is provided with all files organized by atom and state (i.e., charge and multiplicity).

## Data generation

A [generator Python script](https://github.com/keithgroup/qa-atoms-dimers/blob/main/scripts/pyscf-calc-generator/generate-pyscf.qa-calculations.py) is used with dictionary of all desired calculations.
For more information, visit the [keithgroup/qa-atoms-dimers](https://github.com/keithgroup/qa-atoms-dimers) repository.

## JSON data

JSONs contain the following information.

- `"schema_name"`: Name of the JSON format.
- `"provenance"`: Origin of the JSON data.
    - `"creator"`: Name of the originating software.
    - `"version"`: Version of the originating software.
- `"molecule`": Information about the atoms making up the system.
    - `"geometry"`: Cartesian coordinates of all atoms in the system.
    - `"symbols"`: All chemical symbols in the system in the same order as in the `"geometry"`.
- `"molecular_charge"`: Total system charge.
- `"molecular_multiplicity"`: Multiplicity of the system, 2S + 1.
- `"name"`: Unique name specifying the calculation.
- `"atomic_numbers"`: List of atomic numbers of all atoms in the system in the same order as `"geometry"`.
- `"n_electrons"`: Total number of electrons in the system.
- `"model"`: Methods used to calculation system properties.
    - `"method"`: Overall quantum chemical method used.
    - `"basis"`: Employed basis set.
    - `"scf_conv_tol"`: Change in electronic energy SCF convergence criteria.
    - `"scf_conv_tol_grad"`: Norm of the gradient convergence criteria.
    - `"cc_conv_tol"`: Change in coupled cluster electronic energy convergence criteria.
    - `"cc_conv_tol_normt"`: Norm of the coupled cluster amplitude vectors convergence criteria.
- `"broken_symmetry"`: If start with an excited state guess.
- `"finite_diff_delta"`: h used for central finite differences.
- `"finite_diff_acc"`: General accuracy for central finite difference.
- `"qa_lambdas"`: List of all calculations and their change in nuclear charge.
- `"electronic_energies"`: Total electronic energies of the systems.
- `"qats_energies"`: Predicted total electron energies with a Taylor series of nth order.
- `"qats_poly_coeffs"`: Taylor series polynomial coefficients (derivatives are from finite differences).
- `"hf_energies"`: Hartree&ndash;Fock energy contributions (if we are using coupled cluster).
- `"triples_corrections"`: Perturbative triple corrections (if selected).
- `"scf_converged"`: If the SCF iterations have converged.
- `"cc_converged"`: If the coupled cluster iterations have converged.
- `"scf_spin_squared"`: Spin squared expectation value of the last SCF iteration, S(S + 1).
- `"cc_spin_squared"`: Spin squared expectation value of the last coupled cluster iteration, S(S + 1).
- `"t1_diagnostic"`: T1 diagnostic for coupled cluster calculations.

**Note:** Atom property predictions involving three-electron systems might slightly differ (&#177; 0.001 eV) from values presented in the respective manuscript.
Data here uses CCSD(T) calculations for three-electron ground state systems; whereas the manuscript does not include the perturbative triples corrections.

<details>
<summary>Here is an example of a typical JSON file for a unrestricted CCSD(T) calculation.</summary>

```json
{
    "schema_name": "pyscf_qa_output",
    "provenance": {
        "creator": "PySCF",
        "version": "1.7.6"
    },
    "molecule": {
        "geometry": [[0.0, 0.0, 0.0]],
        "symbols": [ "C" ]
    },
    "molecular_charge": 0,
    "molecular_multiplicity": 3,
    "name": "c.chrg0.mult3-pyscf-uccsdt.augccpv5z",
    "atomic_numbers": [ 6 ],
    "n_electrons": 6,
    "model": {
        "method": "UCCSD(T)",
        "basis": "aug-cc-pV5Z",
        "scf_conv_tol": 1e-09,
        "scf_conv_tol_grad": 1e-06,
        "cc_conv_tol": 1e-07,
        "cc_conv_tol_normt": 1e-05
    },
    "broken_symmetry": false,
    "finite_diff_delta": 0.01,
    "finite_diff_acc": 2,
    "qa_lambdas": [-2.0, -1.75, -1.5, -1.25, -1.0, -0.75, -0.5, -0.25, -0.02, -0.01, 0.0, 0.01, 0.02, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0],
    "electronic_energies": [-14.484563521780775, -16.755012804999193, -19.20134196738246, -21.829474788173297, -24.64514044379976, -27.652478081221968, -30.851525517344523, -34.24087642997402, -37.52628463028216, -37.67275331139264, -37.81952364527374, -37.966595580511424, -38.11396906538776, -41.586662183011946, -45.5413920989799, -49.682572272882716, -54.00871704426481, -58.51791734854164, -63.207784803991316, -68.07542508517481, -73.11743600087422],
    "qats_energies": {
        "0": [-37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655, -37.819523645273655],
        "1": [-8.435296733395269, -12.108325097380067, -15.781353461364866, -19.454381825349664, -23.127410189334462, -26.80043855331926, -30.47346691730406, -34.14649528128886, -37.52568137615487, -37.67260251071426, -37.819523645273655, -37.96644477983305, -38.11336591439244, -41.49255200925845, -45.16558037324325, -48.83860873722805, -52.51163710121285, -56.18466546519765, -59.857693829182445, -63.53072219316724, -67.20375055715203],
        "2": [-14.467323868458614, -16.72659587266294, -19.174368724837997, -21.810642424983783, -24.6354169731003, -27.648692369187543, -30.850468613245518, -34.24074570527422, -37.52628457886838, -37.67275331139264, -37.819523645273655, -37.966595580511424, -38.113969117105945, -41.58680243324382, -45.54258206918471, -49.68686255309633, -54.019643884978684, -58.540926064831766, -63.250709092655576, -68.14899296845012, -73.23577769221538],
        "3": [-14.53607851783985, -16.77265611629139, -19.203374592545707, -21.827428228055375, -24.64401130427295, -27.65231810265101, -30.8515429046421, -34.2408799916988, -37.52628464762303, -37.672753319986974, -37.819523645273655, -37.96659557191709, -38.113969048351294, -41.58666814681924, -45.54150777778813, -49.68323681963287, -54.01104955380603, -58.524140261760174, -63.221703224947866, -68.10293272482167, -73.16702304283415],
        "4": [-14.515783522525915, -16.760759562641784, -19.196953129184656, -21.824331457530178, -24.642742867065834, -27.65191676119094, -30.851463627316654, -34.24087503686595, -37.52628464742008, -37.672753319974284, -37.819523645273655, -37.966595571904406, -38.11396904814835, -41.5866631919864, -45.541428500462686, -49.682835478172805, -54.00978111659891, -58.52104349123498, -63.215281761586816, -68.09103617117208, -73.14672804752021]
    },
    "qats_poly_coeffs": [ -37.819523645273655, -14.692113455939193, -1.5080067837658362, 0.008594331172654771, 0.0012684372071210721 ],
    "hf_energies": [-14.384823062111412, -16.647391126113256, -19.08535962305732, -21.70762057554105, -24.52125552494976, -27.5280856336613, -30.726637565820834, -34.11546870729174, -37.4004800625491, -37.54693406161179, -37.693689950201474, -37.840747679181504, -37.98810719906119, -41.46055017353023, -45.41517698101154, -49.55644085249811, -53.88285636322785, -58.39250513343741, -63.08298400581805, -67.95137966032644, -72.99426752670709],
    "triples_corrections": [-0.003248126337486383, -0.00384691242808078, -0.004469037687967998, -0.004689170827925569, -0.004317286665632256, -0.003769377962233152, -0.0033525629716953925, -0.0030439965566141608, -0.0028170135950197836, -0.0028080630428685177, -0.002799179540999761, -0.002790362106286786, -0.0027816097744297716, -0.002596297149072977, -0.00242277885871379, -0.0022705761743076667, -0.002134486042245201, -0.00201115065069897, -0.0018981962500425552, -0.0017937696788774779, -0.001696304466383435],
    "scf_converged": [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true],
    "cc_converged": [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true],
    "scf_spin_squared": [2.030856731445663, 2.0182217759905625, 2.01144093646185, 2.0085838643013045, 2.0096626884968813, 2.011575572466355, 2.011940729805693, 2.0113555286046205, 2.010524756576609, 2.0104862468622113, 2.0104476404428686, 2.010408947144103, 2.0103701764832262, 2.0094751678454514, 2.0085479565856925, 2.007710249183533, 2.0069706506543104, 2.006321923108402, 2.0057530502989445, 2.005254214523824, 2.0048172984622736],
    "cc_spin_squared": [2.001160511292121, 2.0011728549991665, 2.0011077595680957, 2.000919589919363, 2.0006422376453354, 2.0004397807384544, 2.00031851416144, 2.000239145809311, 2.0001879595925254, 2.000186078459877, 2.0001842219748083, 2.0001823897211564, 2.0001805812920628, 2.000144745857075, 2.0001156265238293, 2.00009374700278, 2.0000770512451864, 2.0000641080590222, 2.0000539049215202, 2.0000457362431963, 2.000039107285555]
}
```

</details>

## Naming convention

Each file is named following this convention: `<structure>-<calculation>-<options>`.
Information within each `<>` block is generally separated by a period; this minimizes the width of the file name.
Lowercase is always used to speed up navigation with a terminal.

- `<structure>`: A human-readable, unique label for the structure involved.
    It should also specify refinements (i.e., optimizations) to represent a breadcrumb trail.
    <br><br>
    **Example**

    The excited state for a Nitrogen atom with a charge of -1 would be labeled as `n.chrg-1.mult1`, whereas the ground state would be `n.chrg-1.mult3`.
    Neutral systems are still explicitly defined; for example, the ground state of a neutral Argon atom would be `ar.chrg0.mult1`.

- `<calculation>`: Specification of the program and calculation type for output files.
    Restarts should be specified by appending a `r`.
    <br><br>
    **Example**

    Every calculation is labeled as a `pyscf.qa` calculation as the driver Python script performs several PySCF calculations and calculates data for quantum alchemy.

- `<options>`: Calculation specifications or parameters.
    <br><br>
    **Example**

    Only the quantum chemical method and basis set are specified.
    Non-alphanumeric are dropped; for example, a CCSD(T)/aug-cc-pV5Z calculation would be `ccsdt.augccpv5z`.
    In these data, all coupled cluster triples corrections are perturbative.
    In the directory names, the `u` (for unrestricted) is typically dropped, but included in the file names.

## Citation

If you use this dataset, please cite the corresponding [manuscript](https://doi.org/10.26434/chemrxiv-2021-3l4zh) in addition to this repository as specified in `CITATION.cff`.

## License

[![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg