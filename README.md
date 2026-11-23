# QRA-Mar2026
This repository contains the data and code necessary to reproduce the results presented in *The March 2026 North American heat wave was magnified by an unusual early-season atmospheric resonance event* by Xueke Li and Michael E. Mann. 

Related Publications
-------------------
Li, X. and M. E. Mann (2026),  The March 2026 North American heat wave was magnified by an unusual early-season atmospheric resonance event, *Proceedings of the National Academy of Sciences*. (In press)

Li, X., M. E. Mann, M. F. Wehner, and S. Christiansen (2025), Increased frequency of planetary wave resonance events over the past half-century, *Proceedings of the National Academy of Sciences*, 122(25), e2504482122, <a href="https://www.pnas.org/doi/10.1073/pnas.2504482122">https://www.pnas.org/doi/10.1073/pnas.2504482122</a>.

Li, X., M. E. Mann, M. F. Wehner, S. Rahmstorf, S. Petri, S. Christiansen, and J. Carrillo (2024), Role of atmospheric resonance and land–atmosphere feedbacks as a precursor to the June 2021 Pacific Northwest Heat Dome event, *Proceedings of the National Academy of Sciences*, 121(4), e2315330121, <a href="https://www.pnas.org/doi/10.1073/pnas.2315330121">https://www.pnas.org/doi/10.1073/pnas.2315330121</a>.

## File descriptions

### Fig. 1. The March 2026 heat wave over southwestern North America associated with an unusual dual resonant wave-4 and wave-5 pattern. 

The following CSVs reproduce the daily time series and wave amplitude panels for March 2026:

| File | Description |
| --- | --- |
| `tx_absolute_1950_2026.csv` | Daily maximum temperature (°C) for March 1–31 in each year from 1950 to 2026. |
| `tx_sigma_2026.csv` | Standardized daily maximum temperature anomalies. |
| `z500_sigma_2026.csv` | Standardized 500 hPa geopotential height anomalies. |
| `swvl1_sigma_2026.csv` | Standardized surface soil moisture anomalies. |
| `r1000_sigma_2026.csv` | Standardized 1000 hPa relative humidity anomalies. |
| `ampm_2026.csv` | Standardized daily amplitudes for zonal wavenumbers 4 and 5. |

The spatial panels show temperature, soil moisture, 500 hPa geopotential height, and 300 hPa wind anomalies. 
These filenames are established for the Wave 5 map inputs:

| File | Description |
| --- | --- |
| `tx_sigma_wave5.nc` | Standardized daily maximum temperature anomaly field. |
| `z500_sigma_wave5.nc` | Standardized 500 hPa geopotential height anomaly field. |
| `swvl1_sigma_wave5.nc` | Standardized surface soil moisture anomaly field. |
| `u300_sigma_wave5.nc` | Standardized 300 hPa zonal wind component anomaly field. |
| `v300_sigma_wave5.nc` | Standardized 300 hPa meridional wind component anomaly field. |

These filenames are established for the Wave 4 map inputs:

| File | Description |
| --- | --- |
| `tx_sigma_wave4.nc` | Standardized daily maximum temperature anomaly field. |
| `z500_sigma_wave4.nc` | Standardized 500 hPa geopotential height anomaly field. |
| `swvl1_sigma_wave4.nc` | Standardized surface soil moisture anomaly field. |
| `u300_sigma_wave4.nc` | Standardized 300 hPa zonal wind component anomaly field. |
| `v300_sigma_wave4.nc` | Standardized 300 hPa meridional wind component anomaly field. |

### Fig. 2. Planetary wave structure and upper-level winds

Fig. 2 shows spherical contour plots of waves 4 and 5 and line plots, including a comparison of the 300 hPa zonal mean zonal wind across latitudes. The following NetCDF files are used to reproduce Fig. 2:

| File | Description |
| --- | --- |
| `v300_2026_wave4_timemean.nc` | Time-mean 300 hPa meridional wind field for the 2026 Wave 4 period. |
| `v300_2026_wave5_timemean.nc` | Time-mean 300 hPa meridional wind field for the 2026 Wave 5 period. |
| `u300_2026_wave4_zonalmean.nc` | 300 hPa zonal mean zonal wind for the 2026 Wave 4 period. |
| `u300_2026_wave5_zonalmean.nc` | 300 hPa zonal mean zonal wind for the 2026 Wave 5 period. |
| `u300_Mar_zonalmean_2026.nc` | March 2026 profile of 300 hPa zonal mean zonal wind. |
| `u300_Mar_zonalmean_hist_mean.nc` | Historical March mean profile of 300 hPa zonal mean zonal wind. |
| `u300_Mar_zonalmean_hist_std.nc` | Historical March standard deviation of 300 hPa zonal mean zonal wind at each latitude. |

### Fig. 3. Waveguides, phase speed, and wave amplitude
The waveguide panels show the evolution of the squared meridional wavenumber (`l_square`) over 30–70°N during March 2026 for zonal wavenumbers 4 and 5. Black dots mark the turning latitudes (`TP1` and `TP2`) of waveguides that met the selection criteria.

The phase speed and amplitude panels compare the joint distributions for March 2026 (red density shading) with those for March 1979–2025 (black density contours).

| File | Description |
| --- | --- |
| `l_square_wave4_March_2026.csv` | Daily squared meridional wavenumber by latitude for March 2026, evaluated at the sampled zonal wavenumber closest to 4.0. |
| `l_square_wave5_March_2026.csv` | Daily squared meridional wavenumber by latitude for March 2026, evaluated at the sampled zonal wavenumber closest to 5.0. |
| `TP_wave4_March_2026.csv` | Waveguide detections and associated turning latitudes (`TP1` and `TP2`) for wave 4, by date. |
| `TP_wave5_March_2026.csv` | Waveguide detections and associated turning latitudes (`TP1` and `TP2`) for wave 5, by date. |
| `wave4_March_1979_2026.csv` | Daily zonal mean zonal wind, wave 4 phase speed, and wave 4 amplitude for March 1979–2026. |
| `wave5_March_1979_2026.csv` | Daily zonal mean zonal wind, wave 5 phase speed, and wave 5 amplitude for March 1979–2026. |
