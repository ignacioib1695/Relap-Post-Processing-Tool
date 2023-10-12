$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$                                                                            $$
$$                    Dynasty - Natural Circulation Loop                      $$
$$                                                                            $$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

$==============================================================================$
$==============================================================================$
$                                 TITLE CARD                                   $
$==============================================================================$
$==============================================================================$

=DynNC

$ Developmental Model Control
$ Option 50 activates RELAP5 critical flow model instead of the default Henry-Fauske model
$ Option 50 is necessary for numerical model 11
$ Card no.  Option
  1         50  

$ Problem type and option card
$ Card no.  Problem Type  Option
  100       new           transnt
  
$ Input Check or Run option card
$ Card no.  Input Check / Run
$  101       inp-chk
  101       run

$ Units selection
$ Card no.  Input Units   Output units
  102       si            si

* non-condensable
110 air  * air in the ambient
$==============================================================================$
$==============================================================================$
$                             TIME STEP CONTROL CARD                           $
$==============================================================================$
$==============================================================================$

$ Initial time value card
$ Card no.  Initial Time
  200       0.
  
$ Time step control card
$ Card no.  Time end  MinStep  MaxStep Ctrl.  MinEdit  MajEdit  Restart Freq.
  201       1.e4      1.e-5     .1     3      100      100      500
   
$  
$==============================================================================$
$==============================================================================$
$                                 TRIP INPUT DATA                              $
$==============================================================================$
$==============================================================================$



$==============================================================================$
$==============================================================================$
$                             HYDRODYNAMIC COMPONENTS                          $
$==============================================================================$
$==============================================================================$
$ Volumes and Junctions within Components: CCCXXYYZZ
$ ccc - Component number
$ xx  - Volume number
$ yy  - Currently 0 by default
$ zz  - Currently 0 by default

$ Cards structure: CCCXXNN
$ ccc - Component number
$ XX  - Card type
$ NN  - Card number within the type
$
$------------------------------------------------------------------------------$
$                                  GO1 pipe - 101                              $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name    Type
  1010000     GO1     pipe

$ Annulus / Pipe information card
$ Card no.    No. of Volumes
  1010001     12

$ X-coordinate volume flow area (ccc0101 -- ccc0199)
$ Card no.    Flow area   Vol. no.
  1010101     1.134e-3         5
  1010102     1.134e-3         7 $ Mass Flow Rate Meter: D = 12mm
  1010103     1.134e-3         12

$ Junction flow area (ccc0201 -- ccc0299)
$ Card no.    Flow area   Junc. no.
  1010201     1.134e-3      4
  1010202     1.134e-3      7 $ Mass Flow Rate Meter: D = 12mm
  1010203     1.134e-3      11
  
$ X-coordinate volume length (ccc0301 -- ccc0399)
$ Card no.    Vol. length   Vol. no.
  1010301     0.255         1
  1010302     0.300         2 $flexible pipe
  1010303     0.25833       5
  1010304     0.22          7
  1010305     0.266         12
  
$ Azimuthal angles (ccc0501 -- ccc0599)
$ Card no.    Azim. ang.   Vol. no.
  1010501     180.0        12

$ Vertical angles (ccc0601 -- ccc0699)
$ Card no.    Vert. ang.   Vol. no.
  1010601     0.           1
  1010602    -8.1443       2
  1010603     0.           12
  
$ X-coordinate (elevation) changes (ccc0701 -- ccc0799)
$ Card no.    Elev. change   Vol. no.
  1010701     0.             1
  1010702    -0.0425         2
  1010703     0.             12
  
$ Volume x-coordinate friction data (ccc0801 -- ccc0899)
$ Card no.    Wall rough.   Hydraulic dia.    Vol. no.
  1010801     5.e-5         0.0               12

$ Junction energy loss coefficients (ccc0901 -- ccc0999)
$ Card no.    Fwd. coeff.     Rev. coeff.     Jun. no.
  1010901     1.              1.              1 $ Flex. pipe
  1010902     0.              0.              4
  1010903     50.0             61.             7
  1010904     0.              0.              11

$ Pipe junction form loss data (ccc3001 -- ccc3099)
$ Optional: K = A + B*Re^-C both for Fwd. and Rev.
$ A is W1/W2 of ccc0901 -- ccc0999
$ B is W1/W3 of ccc3001 -- ccc3099
$ C is W2/W4 of ccc3001 -- ccc3099
$ W5 is the junction number
$ Card no.   W1      W2   W3      W4   W5
  1013001    0.      1.   0.      1.   6
  1013002    5.5e4   1.   5.5e4   1.   7
  1013003    0.      1.   0.      1.   11
  
$ Volume x-coordinate control flags (ccc1001 -- ccc1099)
$ Format - tlpvbfe
$     t - Thermal front tracking model (t = 0 => Not used)
$     l - Mixture level tracking model (l = 0 => Not used)
$     p - Water packing scheme (p = 0 => Not used)
$     v - Vertical stratification model (v = 0 => Used)
$     b - Interphase friction (b = 0 => Pipe interphase friction model)
$     f - Wall friction (f = 0 => Computed along x-coordinate)
$     e - Equilibrium or non-equilibrium (e = 0 => Non-equilibrium (unequal temperature))
$ Card no.    Flags     Vol. no.
  1011001     0000000   12

$ Junction control flags (ccc1101 -- ccc1199)
$ Format - efvcahs
$     e - Modified PV term in energy balance (e = 0 => Not applied)
$     f - CCFL options (f = 0 => Not applied)
$     v - Not used (Must be v = 0)
$     c - Choking options (c = 0 => Applied)
$     a - Area change options (a = 0 => Smooth / no area change)
$     h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$     s - Not used (Must be s = 0)
$ Card no.    Flags    Jun. no.
  1011101     100      11

$ Volume initial conditions (ccc1201 -- ccc1299)
$ Control word format - (epsilon)bt
$     epsilon - Fluid (epsilon = 0 => Default fluid, epsilon = 1 => H2O)
$     b       - Boron (b = 0 => No Boron)
$     t       - Initial thermodynamic state (t = 0 to 3 => One component (water / steam))
$               t = 3 => Next two words are pressure and temperature. Words 4, 5 & 6 must be 0.0
$ Card no.    Ctrl. word  Press.    Temp.   W4    W5    W6    Vol. no.
  1011201     003         1.0e5     297.15  0.0   0.0   0.0   12

$ Junction initial conditions control word (ccc1300)
$ Format - 0 / 1
$     0 - Words 1 and 2 on cards ccc1301 to ccc1399 are velocities
$     1 - Words 1 and 2 on cards ccc1301 to ccc1399 are mass flow rates
$ Card no.    Ctrl. word
  1011300     1

$ Junction initial conditions (ccc1301 -- ccc1399)
$ Card no.    Liq. Vel / Flow   Gas Vel / Flow    Interface Vel.    Jun. no.
  1011301     0.                0.                0.                11

$ Junction diameter and CCFL data (ccc1401 -- ccc1499)
$ Junction hydraulic diameter - D_j = 4.0$(junction area)/(wetted perimeter).
$     (D_j)                     0 / default => D_j = 2.0$(junction area/π)$$0.5
$ Flooding correlation form   - beta = 0 => Wallis CCFL form (default)
$     (beta)                    beta = 1 => Kutateladze CCFL form
$ Gas intercept (c)           - Used when {H_f}^{1/2}. Must be > 0. Default 1
$ Slope (m)                   - Must be > 0. Default 1
$ Card no.    D_j    beta     c     m     Jun. no.
  1011401     0      0.       1.    1.    11
$
$------------------------------------------------------------------------------$
$                    From GO1 to GV1 elbow (+ ball vlv) - 199                  $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name      Type
  1990000     b2l_jun   sngljun

$ Single junction geometry cards (ccc0101 -- ccc0109)
$   W1 - From connection code cccvv000n
$   W2 - To connection code cccvv000n
$   W3 - Junction area. If 0, set to minimum area of adjoining volumes
$   W4 - Forward flow energy loss coefficient
$   W5 - Reverse flow energy loss coefficient
$   W6 - Junction control flags
$        Format - efvcahs
$           e - Modified PV term in energy balance (e = 0 => Not applied)
$           f - CCFL options (f = 0 => Not applied)
$           v - Horizontal stratification entrainment / pullthrough (v = 0 => Not applied)
$           c - Choking options (c = 0 => Applied)
$           a - Area change options (a = 0 => Smooth / no area change)
$           h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$           s - Momentum flux (s = 0 => Used in both to and from components)
$ Card no.    W1          W2           W3     W4      W5      W6
  1990101    101120002    201010001    0.0    0.63    0.63    0000100 $ 0.55 (elb.) + 0.08 (ball vlv)
 
$ Single-Junction Form Loss Data (opt.): K = A + B/Re^-CF
$ Card no.   W1      W2    W3      W4
  1990111    400.    1.    400.    1.
  
$ Single junction initial conditions cards (ccc0201)
$   W1 - Control word (0 / 1 => Vel. / Mass flow rates)
$   W2 - Initial liquid vel. / flow
$   W3 - Initial vapour vel. / flow
$   W4 - Interphase velocity (Must be 0)
$ Card no.    W1    W2    W3    W4
  1990201     1     0.    0.    0.
$
$------------------------------------------------------------------------------$
$                              GV1 pipe - 201                                  $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name    Type
  2010000     GV1     pipe

$ Annulus / Pipe information card
$ Card no.    No. of Volumes
  2010001     12

$ X-coordinate volume flow area (ccc0101 -- ccc0199)
$ Card no.    Flow area   Vol. no.
  2010101     1.134e-3      12

$ Junction flow area (ccc0201 -- ccc0299)
$ Card no.    Flow area   Junc. no.
  2010201     1.134e-3      11

$ X-coordinate volume length (ccc0301 -- ccc0399)
$ Card no.    Vol. length   Vol. no.
  2010301     0.309         10
  2010302     0.25          12

$ Volume volumes (ccc0401 -- ccc0499)
$ Card no.    Vol. vol.   Vol. no.
  2010401     0.          12

$ Azimuthal angles (ccc0501 -- ccc0599)
$ Card no.    Azim. ang.   Vol. no.
  2010501     0.           12

$ Vertical angles (ccc0601 -- ccc0699)
$ Card no.    Vert. ang.   Vol. no.
  2010601     +90.         10
  2010602      0.          12

$ X-coordinate (elevation) changes (ccc0701 -- ccc0799)
$ Card no.    Elev. change   Vol. no.
  2010701     0.309          10
  2010702     0.             12

$ Volume x-coordinate friction data (ccc0801 -- ccc0899)
$ Card no.    Wall rough.   Hydraulic dia.    Vol. no.
  2010801     5.e-5         0.0               12

$ Junction energy loss coefficients (ccc0901 -- ccc0999)
$ Card no.    Fwd. coeff.    Rev. coeff.    Jun. no.
  2010901     0.0            0.0            9
  2010902     0.63           0.63           10 $ 0.55 (elb.) + 0.08 (fl.) 
  2010903     0.0            0.0            11
  
$ Single-Junction Form Loss Data (opt.): K = A + B/Re^-CF
$ Card no.   W1      W2    W3      W4   W5
  2013001    0.      1.    0.      1.   9
  2013002    400.    1.    400.    1.   10
  2013003    0.      1.    0.      1.   11
  
$ Volume x-coordinate control flags (ccc1001 -- ccc1099)
$ Format - tlpvbfe
$     t - Thermal front tracking model (t = 0 => Not used)
$     l - Mixture level tracking model (l = 0 => Not used)
$     p - Water packing scheme (p = 0 => Not used)
$     v - Vertical stratification model (v = 0 => Used)
$     b - Interphase friction (b = 0 => Pipe interphase friction model)
$     f - Wall friction (f = 0 => Computed along x-coordinate)
$     e - Equilibrium or non-equilibrium (e = 0 => Non-equilibrium (unequal temperature))
$ Card no.    Flags     Vol. no.
  2011001     0000000   12

$ Junction control flags (ccc1101 -- ccc1199)
$ Format - efvcahs
$     e - Modified PV term in energy balance (e = 0 => Not applied)
$     f - CCFL options (f = 0 => Not applied)
$     v - Not used (Must be v = 0)
$     c - Choking options (c = 0 => Applied)
$     a - Area change options (a = 0 => Smooth / no area change)
$     h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$     s - Not used (Must be s = 0)
$ Card no.    Flags     Jun. no.
  2011101     0000000   11

$ Volume initial conditions (ccc1201 -- ccc1299)
$ Control word format - (epsilon)bt
$     epsilon - Fluid (epsilon = 0 => Default fluid, epsilon = 1 => H2O)
$     b       - Boron (b = 0 => No Boron)
$     t       - Initial thermodynamic state (t = 0 to 3 => One component (water / steam))
$               t = 3 => Next two words are pressure and temperature. Words 4, 5 & 6 must be 0.0
$ Card no.    Ctrl. word  Press.    Temp.   W4    W5    W6    Vol. no.
  2011201     003         1.e5      297.15  0.0   0.0   0.0   12

$ Junction initial conditions control word (ccc1300)
$ Format - 0 / 1
$     0 - Words 1 and 2 on cards ccc1301 to ccc1399 are velocities
$     1 - Words 1 and 2 on cards ccc1301 to ccc1399 are mass flow rates
$ Card no.    Ctrl. word
  2011300     1

$ Junction initial conditions (ccc1301 -- ccc1399)
$ Card no.    Liq. Vel / Flow   Gas Vel / Flow    Interface Vel.    Jun. no.
  2011301     0.                0.                0.                11

$ Junction diameter and CCFL data (ccc1401 -- ccc1499)
$ Junction hydraulic diameter - D_j = 4.0$(junction area)/(wetted perimeter).
$     (D_j)                     0 / default => D_j = 2.0$(junction area/π)$$0.5
$ Flooding correlation form   - beta = 0 => Wallis CCFL form (default)
$     (beta)                    beta = 1 => Kutateladze CCFL form
$ Gas intercept (c)           - Used when {H_f}^{1/2}. Must be > 0. Default 1
$ Slope (m)                   - Must be > 0. Default 1
$ Card no.    D_j    beta     c     m     Jun. no.
  2011401     0      0.       1.    1.    11
$
$------------------------------------------------------------------------------$
$                               Flange - 300                                   $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name      Type
  3000000     flng  sngljun

$ Single junction geometry cards (ccc0101 -- ccc0109)
$   W1 - From connection code cccvv000n
$   W2 - To connection code cccvv000n
$   W3 - Junction area. If 0, set to minimum area of adjoining volumes
$   W4 - Forward flow energy loss coefficient
$   W5 - Reverse flow energy loss coefficient
$   W6 - Junction control flags
$        Format - efvcahs
$           e - Modified PV term in energy balance (e = 0 => Not applied)
$           f - CCFL options (f = 0 => Not applied)
$           v - Horizontal stratification entrainment / pullthrough (v = 0 => Not applied)
$           c - Choking options (c = 0 => Applied)
$           a - Area change options (a = 0 => Smooth / no area change)
$           h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$           s - Momentum flux (s = 0 => Used in both to and from components)
$ Card no.    W1          W2           W3    W4    W5     W6
  3000101     201120002   301010001    0.0   0.08  0.08   0000000 $ 0.08 (flange)
  
$ Single junction initial conditions cards (ccc0201)
$   W1 - Control word (0 / 1 => Vel. / Mass flow rates)
$   W2 - Initial liquid vel. / flow
$   W3 - Initial vapour vel. / flow
$   W4 - Interphase velocity (Must be 0)
$ Card no.    W1    W2    W3    W4
  3000201     1     0.    0.    0.
$
$------------------------------------------------------------------------------$
$                                Cooler - 301                                  $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name      Type
  3010000     cooler   pipe

$ Annulus / Pipe information card
$ Card no.    No. of Volumes
  3010001     6

$ X-coordinate volume flow area (ccc0101 -- ccc0199)
$ Card no.    Flow area   Vol. no.
  3010101     1.134e-3         6

$ Junction flow area (ccc0201 -- ccc0299)
$ Card no.    Flow area   Junc. no.
  3010201     1.134e-3         5

$ X-coordinate volume length (ccc0301 -- ccc0399)
$ Card no.    Vol. length   Vol. no.
  3010301     0.35          6

$ Volume volumes (ccc0401 -- ccc0499)
$ Card no.    Vol. vol.   Vol. no.
  3010401     0.0         6

$ Azimuthal angles (ccc0501 -- ccc0599)
$ Card no.    Azim. ang.   Vol. no.
  3010501     0.0          6

$ Vertical angles (ccc0601 -- ccc0699)
$ Card no.    Vert. ang.   Vol. no.
  3010601     0.0          6

$ X-coordinate (elevation) changes (ccc0701 -- ccc0799)
$ Card no.    Elev. change   Vol. no.
  3010701     0.0            6

$ Volume x-coordinate friction data (ccc0801 -- ccc0899)
$ Card no.    Wall rough.   Hydraulic dia.    Vol. no.
  3010801     5.e-5         0.0               6 

$ Junction energy loss coefficients (ccc0901 -- ccc0999)
$ Card no.    Fwd. coeff.     Rev. coeff.     Jun. no.
  3010901     0.              0.              5

$ Volume x-coordinate control flags (ccc1001 -- ccc1099)
$ Format - tlpvbfe
$     t - Thermal front tracking model (t = 0 => Not used)
$     l - Mixture level tracking model (l = 0 => Not used)
$     p - Water packing scheme (p = 0 => Not used)
$     v - Vertical stratification model (v = 0 => Used)
$     b - Interphase friction (b = 0 => Pipe interphase friction model)
$     f - Wall friction (f = 0 => Computed along x-coordinate)
$     e - Equilibrium or non-equilibrium (e = 0 => Non-equilibrium (unequal temperature))
$ Card no.    Flags     Vol. no.
  3011001     0000000   6

$ Junction control flags (ccc1101 -- ccc1199)
$ Format - efvcahs
$     e - Modified PV term in energy balance (e = 0 => Not applied)
$     f - CCFL options (f = 0 => Not applied)
$     v - Not used (Must be v = 0)
$     c - Choking options (c = 0 => Applied)
$     a - Area change options (a = 0 => Smooth / no area change)
$     h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$     s - Not used (Must be s = 0)
$ Card no.    Flags     Jun. no.
  3011101     0000000   5

$ Volume initial conditions (ccc1201 -- ccc1299)
$ Control word format - (epsilon)bt
$     epsilon - Fluid (epsilon = 0 => Default fluid, epsilon = 1 => H2O)
$     b       - Boron (b = 0 => No Boron)
$     t       - Initial thermodynamic state (t = 0 to 3 => One component (water / steam))
$               t = 3 => Next two words are pressure and temperature. Words 4, 5 & 6 must be 0.0
$ Card no.    Ctrl. word  Press.    Temp.   W4    W5    W6    Vol. no.
  3011201     003         1.e5      297.15  0.0   0.0   0.0   6

$ Junction initial conditions control word (ccc1300)
$ Format - 0 / 1
$     0 - Words 1 and 2 on cards ccc1301 to ccc1399 are velocities
$     1 - Words 1 and 2 on cards ccc1301 to ccc1399 are mass flow rates
$ Card no.    Ctrl. word
  3011300     1

$ Junction initial conditions (ccc1301 -- ccc1399)
$ Card no.    Liq. Vel / Flow   Gas Vel / Flow    Interface Vel.    Jun. no.
  3011301     0.                0.                0.                5

$ Junction diameter and CCFL data (ccc1401 -- ccc1499)
$ Junction hydraulic diameter - D_j = 4.0$(junction area)/(wetted perimeter).
$     (D_j)                     0 / default => D_j = 2.0$(junction area/π)$$0.5
$ Flooding correlation form   - beta = 0 => Wallis CCFL form (default)
$     (beta)                    beta = 1 => Kutateladze CCFL form
$ Gas intercept (c)           - Used when {H_f}^{1/2}. Must be > 0. Default 1
$ Slope (m)                   - Must be > 0. Default 1
$ Card no.    D_j    beta     c     m     Jun. no.
  3011401     0      0.       1.    1.    5
$
$------------------------------------------------------------------------------$
$                               Flange - 399                                   $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name      Type
  3990000     flange2  sngljun

$ Single junction geometry cards (ccc0101 -- ccc0109)
$   W1 - From connection code cccvv000n
$   W2 - To connection code cccvv000n
$   W3 - Junction area. If 0, set to minimum area of adjoining volumes
$   W4 - Forward flow energy loss coefficient
$   W5 - Reverse flow energy loss coefficient
$   W6 - Junction control flags
$        Format - efvcahs
$           e - Modified PV term in energy balance (e = 0 => Not applied)
$           f - CCFL options (f = 0 => Not applied)
$           v - Horizontal stratification entrainment / pullthrough (v = 0 => Not applied)
$           c - Choking options (c = 0 => Applied)
$           a - Area change options (a = 0 => Smooth / no area change)
$           h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$           s - Momentum flux (s = 0 => Used in both to and from components)
$ Card no.    W1         W2           W3    W4    W5       W6
  3990101    301060002   401010001    0.0   0.08   0.08    0000000 $ 0.08 (flange)
  
$ Single junction initial conditions cards (ccc0201)
$   W1 - Control word (0 / 1 => Vel. / Mass flow rates)
$   W2 - Initial liquid vel. / flow
$   W3 - Initial vapour vel. / flow
$   W4 - Interphase velocity (Must be 0)
$ Card no.    W1    W2    W3    W4
  3990201     1     0.    0.    0.
$  
$------------------------------------------------------------------------------$
$                        GV2 horizontal part - 401                             $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name     Type
  4010000     GV2_up   pipe

$ Annulus / Pipe information card
$ Card no.    No. of Volumes
  4010001     2

$ X-coordinate volume flow area (ccc0101 -- ccc0199)
$ Card no.    Flow area   Vol. no.
  4010101     1.134e-3         2

$ Junction flow area (ccc0201 -- ccc0299)
$ Card no.    Flow area   Junc. no.
  4010201     1.134e-3         1

$ X-coordinate volume length (ccc0301 -- ccc0399)
$ Card no.    Vol. length   Vol. no.
  4010301     0.25          2

$ Volume volumes (ccc0401 -- ccc0499)
$ Card no.    Vol. vol.   Vol. no.
  4010401     0.          2

$ Azimuthal angles (ccc0501 -- ccc0599)
$ Card no.    Azim. ang.   Vol. no.
  4010501     0.           2

$ Vertical angles (ccc0601 -- ccc0699)
$ Card no.    Vert. ang.   Vol. no.
  4010601    +8.1443       1
  4010602     0.           2

$ X-coordinate (elevation) changes (ccc0701 -- ccc0799)
$ Card no.    Elev. change   Vol. no.
  4010701     0.0425         1
  4010702     0.             2
  
$ Volume x-coordinate friction data (ccc0801 -- ccc0899)
$ Card no.    Wall rough.   Hydraulic dia.    Vol. no.
  4010801     5.e-5         0.0               2 

$ Junction energy loss coefficients (ccc0901 -- ccc0999)
$ Card no.    Fwd. coeff.     Rev. coeff.     Jun. no.
  4010901     1.              1.              1  $flex. tube

$ Volume x-coordinate control flags (ccc1001 -- ccc1099)
$ Format - tlpvbfe
$     t - Thermal front tracking model (t = 0 => Not used)
$     l - Mixture level tracking model (l = 0 => Not used)
$     p - Water packing scheme (p = 0 => Not used)
$     v - Vertical stratification model (v = 0 => Used)
$     b - Interphase friction (b = 0 => Pipe interphase friction model)
$     f - Wall friction (f = 0 => Computed along x-coordinate)
$     e - Equilibrium or non-equilibrium (e = 0 => Non-equilibrium (unequal temperature))
$ Card no.    Flags     Vol. no.
  4011001     0000000   2

$ Junction control flags (ccc1101 -- ccc1199)
$ Format - efvcahs
$     e - Modified PV term in energy balance (e = 0 => Not applied)
$     f - CCFL options (f = 0 => Not applied)
$     v - Not used (Must be v = 0)
$     c - Choking options (c = 0 => Applied)
$     a - Area change options (a = 0 => Smooth / no area change)
$     h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$     s - Not used (Must be s = 0)
$ Card no.    Flags     Jun. no.
  4011101     0000000   1

$ Volume initial conditions (ccc1201 -- ccc1299)
$ Control word format - (epsilon)bt
$     epsilon - Fluid (epsilon = 0 => Default fluid, epsilon = 1 => H2O)
$     b       - Boron (b = 0 => No Boron)
$     t       - Initial thermodynamic state (t = 0 to 3 => One component (water / steam))
$               t = 3 => Next two words are pressure and temperature. Words 4, 5 & 6 must be 0.0
$ Card no.    Ctrl. word  Press.  Temp.   W4    W5    W6    Vol. no.
  4011201     003         1.e5    297.15  0.0   0.0   0.0   2

$ Junction initial conditions control word (ccc1300)
$ Format - 0 / 1
$     0 - Words 1 and 2 on cards ccc1301 to ccc1399 are velocities
$     1 - Words 1 and 2 on cards ccc1301 to ccc1399 are mass flow rates
$ Card no.    Ctrl. word
  4011300     1

$ Junction initial conditions (ccc1301 -- ccc1399)
$ Card no.    Liq. Vel / Flow   Gas Vel / Flow    Interface Vel.    Jun. no.
  4011301     0.                0.                0.                1

$ Junction diameter and CCFL data (ccc1401 -- ccc1499)
$ Junction hydraulic diameter - D_j = 4.0$(junction area)/(wetted perimeter).
$     (D_j)                     0 / default => D_j = 2.0$(junction area/π)$$0.5
$ Flooding correlation form   - beta = 0 => Wallis CCFL form (default)
$     (beta)                    beta = 1 => Kutateladze CCFL form
$ Gas intercept (c)           - Used when {H_f}^{1/2}. Must be > 0. Default 1
$ Slope (m)                   - Must be > 0. Default 1
$ Card no.    D_j    beta     c     m     Jun. no.
  4011401     0      0.       1.    1.    1
$ 
$------------------------------------------------------------------------------$
$                          Branch - GV2/Pressurizer (402)                      $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name      Type
  4020000     branch1  branch

$ Branch information card
$ Card no.    No. junc.    Init. cond. ctrl. (If 0 => vel. If ≠0 => mass flow)
  4020001     3            1

$ X-coordinate volume data (ccc0101 -- ccc0109)
$ Nine word card:
$   W1 - Volume flow area
$   W2 - Length of volume
$   W3 - Volume of volume
$   W4 - Azimuthal angle
$   W5 - Inclination angle
$   W6 - Elevation change
$   W7 - Wall roughness
$   W8 - Hydraulic diameter
$   W9 - Volume control flags
$        Format - tlpvbfe
$           t - Thermal front tracking model (t = 0 => Not used)
$           l - Mixture level tracking model (l = 0 => Not used)
$           p - Water packing scheme (p = 0 => Used)
$           v - Vertical stratification model (v = 0 => Used)
$           b - Interphase friction (b = 0 => Pipe interphase friction model)
$           f - Wall friction (f = 0 => Computed along x-coordinate)
$           e - Equilibrium or non-equilibrium (e = 0 => Non-equilibrium (unequal temperature))
$ Card no.    W1        W2       W3    W4    W5     W6       W7       W8     W9
  4020101     1.134e-3    0.309   0.    0.   -90.   -0.309    5.e-5    0.     0000000

$ Volume initial conditions (ccc0200)
$ Control word format - (epsilon)bt
$     epsilon - Fluid (epsilon = 0 => Default fluid, epsilon = 1 => H2O)
$     b       - Boron (b = 0 => No Boron)
$     t       - Initial thermodynamic state (t = 0 to 3 => One component (water / steam))
$               t = 3 => Next two words are pressure and temperature.
$ Card no.    Ctrl. word  Press.    Temp.
  4020200     003         1.e5      297.15

$ Junction geometry cards (cccn101 -- cccn109)
$  Six word card:
$   W1 - From connection code cccvv000n
$   W2 - To connection code cccvv000n
$   W3 - Junction area
$   W4 - Forward flow energy loss coefficient
$   W5 - Reverse flow energy loss coefficient
$   W6 - Junction control flags
$        Format - efvcahs
$           e - Modified PV term in energy balance (e = 0 => Not applied)
$           f - CCFL options (f = 0 => Not applied)
$           v - Horizontal stratification entrainment / pullthrough (v = 0 => Not applied)
$           c - Choking options (c = 0 => Applied)
$           a - Area change options (a = 0 => Smooth / no area change)
$           h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$           s - Momentum flux (s = 0 => Used in both to and from components)
$ Card no.    W1          W2          W3    W4      W5     W6
  4021101     401020002   402010001   0.    0.71    0.71    0000100  $ 0.55 (elb.) + 0.16 (2 fl.)

$ Single-Junction Form Loss Data (opt.): K = A + B/Re^-CF
$ Card no.   W1      W2    W3      W4
  4021112    400.    1.    400.    1.

$ Card no.    W1          W2          W3    W4     W5      W6
  4022101     402010001   501010001   0.    0.88   0.88    0000000  $ 0.88 (elb.)
  
$ Card no.    W1          W2          W3     W4      W5     W6
  4023101     402010002   403010001   0.     0.      0.     0000000  

$ Junction initial conditions (cccn201)
$ Card no.    Liq. Vel / Flow   Gas Vel / Flow    Interface Vel.
  4021201     0.                 0.               0.

$ Card no.    Liq. Vel / Flow   Gas Vel / Flow    Interface Vel.
  4022201     0.                 0.               0.

$ Card no.    Liq. Vel / Flow   Gas Vel / Flow    Interface Vel.
  4023201     0.                 0.               0.  
$
$------------------------------------------------------------------------------$
$                         Pipe2pressurizer - 501                               $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name       Type
  5010000     pip2pres   pipe

$ Annulus / Pipe information card
$ Card no.    No. of Volumes
  5010001     2

$ X-coordinate volume flow area (ccc0101 -- ccc0199)
$ Card no.    Flow area   Vol. no.
  5010101     1.134e-3         2

$ Junction flow area (ccc0201 -- ccc0299)
$ Card no.    Flow area   Junc. no.
  5010201     1.134e-3         1

$ X-coordinate volume length (ccc0301 -- ccc0399)
$ Card no.    Vol. length   Vol. no.
  5010301     0.25          2

$ Volume volumes (ccc0401 -- ccc0499)
$ card no.    Vol. vol.   Vol. no.
  5010401     0.0         2

$ Azimuthal angles (ccc0501 -- ccc0599)
$ Card no.    Azim. ang.   Vol. no.
  5010501     0.0          2

$ Vertical angles (ccc0601 -- ccc0699)
$ Card no.    Vert. ang.   Vol. no.
  5010601     90.0          2

$ X-coordinate (elevation) changes (ccc0701 -- ccc0799)
$ Card no.    Elev. change   Vol. no.
  5010701     0.25            2

$ Volume x-coordinate friction data (ccc0801 -- ccc0899)
$ Card no.    Wall rough.   Hydraulic dia.    Vol. no.
  5010801     5.e-5         0.0               2 

$ Junction energy loss coefficients (ccc0901 -- ccc0999)
$ Card no.    Fwd. coeff.     Rev. coeff.     Jun. no.
  5010901     0.              1000.              1

$ Volume x-coordinate control flags (ccc1001 -- ccc1099)
$ Format - tlpvbfe
$     t - Thermal front tracking model (t = 0 => Not used)
$     l - Mixture level tracking model (l = 0 => Not used)
$     p - Water packing scheme (p = 0 => Not used)
$     v - Vertical stratification model (v = 0 => Used)
$     b - Interphase friction (b = 0 => Pipe interphase friction model)
$     f - Wall friction (f = 0 => Computed along x-coordinate)
$     e - Equilibrium or non-equilibrium (e = 0 => Non-equilibrium (unequal temperature))
$ Card no.    Flags     Vol. no.
  5011001     0000000   2

$ Junction control flags (ccc1101 -- ccc1199)
$ Format - efvcahs
$     e - Modified PV term in energy balance (e = 0 => Not applied)
$     f - CCFL options (f = 0 => Not applied)
$     v - Not used (Must be v = 0)
$     c - Choking options (c = 0 => Applied)
$     a - Area change options (a = 0 => Smooth / no area change)
$     h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$     s - Not used (Must be s = 0)
$ Card no.    Flags     Jun. no.
  5011101     0000000   1

$ Volume initial conditions (ccc1201 -- ccc1299)
$ Control word format - (epsilon)bt
$     epsilon - Fluid (epsilon = 0 => Default fluid, epsilon = 1 => H2O)
$     b       - Boron (b = 0 => No Boron)
$     t       - Initial thermodynamic state (t = 0 to 3 => One component (water / steam))
$               t = 3 => Next two words are pressure and temperature. Words 4, 5 & 6 must be 0.0
$ Card no.    Ctrl. word  Press.    Temp.   W4    W5    W6    Vol. no.
  5011201     003         1.e5      297.15  0.0   0.0   0.0   2

$ Junction initial conditions control word (ccc1300)
$ Format - 0 / 1
$     0 - Words 1 and 2 on cards ccc1301 to ccc1399 are velocities
$     1 - Words 1 and 2 on cards ccc1301 to ccc1399 are mass flow rates
$ Card no.    Ctrl. word
  5011300     1

$ Junction initial conditions (ccc1301 -- ccc1399)
$ Card no.    Liq. Vel / Flow   Gas Vel / Flow    Interface Vel.    Jun. no.
  5011301     0.                0.                0.                1

$ Junction diameter and CCFL data (ccc1401 -- ccc1499)
$ Junction hydraulic diameter - D_j = 4.0$(junction area)/(wetted perimeter).
$     (D_j)                     0 / default => D_j = 2.0$(junction area/π)$$0.5
$ Flooding correlation form   - beta = 0 => Wallis CCFL form (default)
$     (beta)                    beta = 1 => Kutateladze CCFL form
$ Gas intercept (c)           - Used when {H_f}^{1/2}. Must be > 0. Default 1
$ Slope (m)                   - Must be > 0. Default 1
$ Card no.    D_j    beta     c     m     Jun. no.
  5011401     0      0.       1.    1.    1
$ 
$------------------------------------------------------------------------------$
$                   Connection -> pipe - Pressurizer (502)                     $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name      Type
  5020000     presconn  sngljun

$ Single junction geometry cards (ccc0101 -- ccc0109)
$   W1 - From connection code cccvv000n
$   W2 - To connection code cccvv000n
$   W3 - Junction area. If 0, set to minimum area of adjoining volumes
$   W4 - Forward flow energy loss coefficient
$   W5 - Reverse flow energy loss coefficient
$   W6 - Junction control flags
$        Format - efvcahs
$           e - Modified PV term in energy balance (e = 0 => Not applied)
$           f - CCFL options (f = 0 => Not applied)
$           v - Horizontal stratification entrainment / pullthrough (v = 0 => Not applied)
$           c - Choking options (c = 0 => Applied)
$           a - Area change options (a = 0 => Smooth / no area change)
$           h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$           s - Momentum flux (s = 0 => Used in both to and from components)
$ Card no.    W1           W2          W3    W4   W5      W6
  5020101     501020002    503010001   0.0   0.   1000.    0000000 

$ Single junction initial conditions cards (ccc0201)
$   W1 - Control word (0 / 1 => Vel. / Mass flow rates)
$   W2 - Initial liquid vel. / flow
$   W3 - Initial vapour vel. / flow
$   W4 - Interphase velocity (Must be 0)
$ Card no.    W1    W2    W3    W4
  5020201     1     0.    0.    0.
$ 
$------------------------------------------------------------------------------$
$                           Pressurizer - 503                                  $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name      Type
  5030000     presctrl   tmdpvol

$ Time dependent volume geometry card
$ Nine word card:
$   W1 - Volume flow area
$   W2 - Length of volume
$   W3 - Volume of volume
$   W4 - Azimuthal angle
$   W5 - Inclination angle
$   W6 - Elevation change
$   W7 - Wall roughness
$   W8 - Hydraulic diameter
$   W9 - Volume control flags
$        Format - tlpvbfe
$           t - Thermal stratification model (Must be t = 0 => Not used)
$           l - Level tracking model (Must be l = 0 => Not used)
$           p - Must be p = 0 => Not used
$           v - Must be v = 0 => Not used
$           b - Interphase friction (b = 0 / 1 => Not used)
$           f - Wall friction (f = 0 / 1 => Not used)
$           e - Equilibrium or non-equilibrium (e = 0 / 1 => Not used)
$ Card no.    W1     W2     W3    W4     W5     W6      W7      W8   W9
  5030101     1.     0.5    0.0   0.     90.    0.5    5.e-5   0.   0000000

$ Time dependent volume data control card
$ Control word format - (epsilon)bt
$     epsilon - Fluid (epsilon = 0 => Default fluid, epsilon = 1 => H2O)
$     b       - Boron (b = 0 => No Boron)
$     t       - Initial thermodynamic state (t = 0 to 3 => One component (water / steam))
$               t = 3 => Second and third words on cards ccc0201 -- ccc0209
$               are pressure and temperature.
$ Card no.    Ctrl. word       
  5030200     003             

$ Time dependent volume data cards (ccc0201 -- ccc0209)
$ Card no.    Search variable     Pressure     Temp
  5030201     0.                  1.e5         297.15
  5030202     1.e6                1.e5         297.15
$
$------------------------------------------------------------------------------$
$                             GV2 pipe - 403                                   $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name      Type
  4030000     GV2_lat   pipe

$ Annulus / Pipe information card
$ Card no.    No. of Volumes
  4030001     9

$ X-coordinate volume flow area (ccc0101 -- ccc0199)
$ Card no.    Flow area   Vol. no.
  4030101     1.134e-3         9

$ Junction flow area (ccc0201 -- ccc0299)
$ Card no.    Flow area   Junc. no.
  4030201     1.134e-3         8

$ X-coordinate volume length (ccc0301 -- ccc0399)
$ Card no.    Vol. length   Vol. no.
  4030301     0.309        9

$ Volume volumes (ccc0401 -- ccc0499)
$ Card no.    Vol. vol.   Vol. no.
  4030401     0.0         9

$ Azimuthal angles (ccc0501 -- ccc0599)
$ Card no.    Azim. ang.   Vol. no.
  4030501     0.0         9

$ Vertical angles (ccc0601 -- ccc0699)
$ Card no.    Vert. ang.   Vol. no.
  4030601     -90.0        9

$ X-coordinate (elevation) changes (ccc0701 -- ccc0799)
$ Card no.    Elev. change   Vol. no.
  4030701     -0.309         9

$ Volume x-coordinate friction data (ccc0801 -- ccc0899)
$ Card no.    Wall rough.   Hydraulic dia.    Vol. no.
  4030801     5.e-5         0.0               9 

$ Junction energy loss coefficients (ccc0901 -- ccc0999)
$ Card no.    Fwd. coeff.     Rev. coeff.      Jun. no.
  4030901     0.0             0.0              4
  4030902     0.08            0.08             5
  4030903     0.0             0.0              8
  
$ Volume x-coordinate control flags (ccc1001 -- ccc1099)
$ Format - tlpvbfe
$     t - Thermal front tracking model (t = 0 => Not used)
$     l - Mixture level tracking model (l = 0 => Not used)
$     p - Water packing scheme (p = 0 => Not used)
$     v - Vertical stratification model (v = 0 => Used)
$     b - Interphase friction (b = 0 => Pipe interphase friction model)
$     f - Wall friction (f = 0 => Computed along x-coordinate)
$     e - Equilibrium or non-equilibrium (e = 0 => Non-equilibrium (unequal temperature))
$ Card no.    Flags     Vol. no.
  4031001     0000000   9

$ Junction control flags (ccc1101 -- ccc1199)
$ Format - efvcahs
$     e - Modified PV term in energy balance (e = 0 => Not applied)
$     f - CCFL options (f = 0 => Not applied)
$     v - Not used (Must be v = 0)
$     c - Choking options (c = 0 => Applied)
$     a - Area change options (a = 0 => Smooth / no area change)
$     h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$     s - Not used (Must be s = 0)
$ Card no.    Flags     Jun. no.
  4031101     0000000   8

$ Volume initial conditions (ccc1201 -- ccc1299)
$ Control word format - (epsilon)bt
$     epsilon - Fluid (epsilon = 0 => Default fluid, epsilon = 1 => H2O)
$     b       - Boron (b = 0 => No Boron)
$     t       - Initial thermodynamic state (t = 0 to 3 => One component (water / steam))
$               t = 3 => Next two words are pressure and temperature. Words 4, 5 & 6 must be 0.0
$ Card no.    Ctrl. word  Press.    Temp.   W4    W5    W6    Vol. no.
  4031201     003         1.e5      297.15  0.0   0.0   0.0   9

$ Junction initial conditions control word (ccc1300)
$ Format - 0 / 1
$     0 - Words 1 and 2 on cards ccc1301 to ccc1399 are velocities
$     1 - Words 1 and 2 on cards ccc1301 to ccc1399 are mass flow rates
$ Card no.    Ctrl. word
  4031300     1

$ Junction initial conditions (ccc1301 -- ccc1399)
$ Card no.    Liq. Vel / Flow   Gas Vel / Flow    Interface Vel.    Jun. no.
  4031301     0.                0.                0.                8

$ Junction diameter and CCFL data (ccc1401 -- ccc1499)
$ Junction hydraulic diameter - D_j = 4.0$(junction area)/(wetted perimeter).
$     (D_j)                     0 / default => D_j = 2.0$(junction area/π)$$0.5
$ Flooding correlation form   - beta = 0 => Wallis CCFL form (default)
$     (beta)                    beta = 1 => Kutateladze CCFL form
$ Gas intercept (c)           - Used when {H_f}^{1/2}. Must be > 0. Default 1
$ Slope (m)                   - Must be > 0. Default 1
$ Card no.    D_j    beta     c     m     Jun. no.
  4031401     0      0.       1.    1.    8
$  
$------------------------------------------------------------------------------$
$                 Right vert. to bottom horiz. juction - 499                   $
$------------------------------------------------------------------------------$
$ Component name and type
$ Card no.    Name      Type
  4990000     r2b_jun   sngljun

$ Single junction geometry cards (ccc0101 -- ccc0109)
$   W1 - From connection code cccvv000n
$   W2 - To connection code cccvv000n
$   W3 - Junction area. If 0, set to minimum area of adjoining volumes
$   W4 - Forward flow energy loss coefficient
$   W5 - Reverse flow energy loss coefficient
$   W6 - Junction control flags
$        Format - efvcahs
$           e - Modified PV term in energy balance (e = 0 => Not applied)
$           f - CCFL options (f = 0 => Not applied)
$           v - Horizontal stratification entrainment / pullthrough (v = 0 => Not applied)
$           c - Choking options (c = 0 => Applied)
$           a - Area change options (a = 0 => Smooth / no area change)
$           h - Homogeneous / non-homogeneous (h = 0 => Non-homogeneous (two-velocity momentum equations))
$           s - Momentum flux (s = 0 => Used in both to and from components)
$ Card no.    W1         W2         W3      W4      W5       W6
  4990101    403090002   101010001  0.0     0.79    0.79     0000000 $ 0.88 (elb.) + 0.16 (2 fl.) + 0.08 (ball vlv) 

$ Single-Junction Form Loss Data (opt.): K = A + B/Re^-CF
$ Card no.   W1      W2    W3      W4
  4990111    400.    1.    400.    1.
  
$ Single junction initial conditions cards (ccc0201)
$   W1 - Control word (0 / 1 => Vel. / Mass flow rates)
$   W2 - Initial liquid vel. / flow
$   W3 - Initial vapour vel. / flow
$   W4 - Interphase velocity (Must be 0)
$ Card no.    W1    W2    W3    W4
  4990201     1     0.    0.    0.
$  
$==============================================================================$
$==============================================================================$
$                              HEAT STRUCTURES                                 $
$==============================================================================$
$==============================================================================$
$ Cards structure: 1CCCGXNN
$ ccc - Component number
$ g   - Geometry number used to differentiate between different types of heat
$       structures (such as fuel pins and core barrel) that might be associated
$       with the same hydrodynamic volume.
$ x   - Card type
$ NN  - Card number within the type
$
$------------------------------------------------------------------------------$
$                     Heat structure - cooler (301)                            $
$------------------------------------------------------------------------------$
$ General heat structure data
$ W1 - Number of axial heat structures
$ W2 - Number of radial mesh point
$ W3 - Geometry type (2 => Cylindrical)
$ W4 - Steady state initialisation flag (1 => Initial temperatures computed by code)
$ W5 - Left boundary coordinate
$ Card no.    W1    W2    W3    W4    W5
  13011000    6     5    2     1     0.019

$ Heat structure mesh flags card
$ Card no.    Mesh location flag      Mesh format flag
  13011100    0                       1

$ Heat structure mesh interval data (radial) cards (1cccg101 -- 1cccg199)
$ Card no.    No. intervals     Right coord.
  13011101    4                 0.021

$ Heat structure composition data (radial) cards (1cccg201 -- 1cccg299)
$   Must correspond to subfield mmm in heat structure thermal property data
$   Sign indicates if the region over which this composition is applied is
$   to be included (positive) or excluded (negative) from the volume averaged
$   temperature computations.
$ Card no.    Composition no.     Interval no.
  13011201    101                 4

$ Heat structure source distribution data (radial) cards (1cccg301 -- 1cccg399)
$ Card no.    Source value     Interval no.
  13011301    0.               4

$ Inital temperature flag card
$ Card no.    Flag (0 => Initial temperature entered with input data)
  13011400    0

$ Inital temperature data cards (1cccg401 -- 1cccg499)
$ Card no.    Temperature     Mesh point no.
  13011401    297.15          5

$ Left boundary condition cards (1cccg501 -- 1cccg599)
$ W1 - Boundary volume number (cccnn000f) / general table (0 => No vol. associated. Insulated BC)
$ W2 - Increment added to W1
$ W3 - Boundary condition type
$      0 => Symmetry / insulated boundary condition
$      110 => Vertical bundle without crossflow
$ W4 - Surface area code (1 => Cylinder height)
$ W5 - Surface area or factor
$ W6 - Heat structure number
$ Card no.    W1            W2        W3    W4    W5       W6
  13011501    301010000     10000     1     1     0.35     6

$ Right boundary condition cards (1cccg601 -- 1cccg699)
$ Same as the left boundary cards
$ W3 - 3xxx => Convective boundary condition. Heat transfer coeff. vs. time from table xxx
$ W3 - 4xxx => Convective boundary condition. Heat transfer coeff. vs. temp from table xx
$ Card no.    W1      W2      W3     W4    W5       W6
  13011601   -201     0       3202   1     0.35     6
 
$ Source data cards (1cccg701 -- 1cccg799)
$ W1 - Source type (0 => No source is used)
$ W2 - Internal source multiplier.
$ W3 - Direct moderator heating multiplier for left boundary volume
$ W4 - Direct moderator heating multiplier for right boundary volume
$ W5 - Heat structure number
$ Card no.    W1    W2    W3    W4    W5
  13011701    0     0.    0.    0.    6

$ Additional left boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  13011800    0

$ Additional left boundary condition cards (1cccg801 -- 1cccg899)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  - Heat structure number
$ Card no.    W1   W2      W3    W4   W5   W6     W7     W8    W9
  13011801    0    100.0   100.0  0.   0.   0.     0.     1.    6

$ Additional right boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  13011900    0

$ Additional right boundary condition cards (1cccg901 -- 1cccg999)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  - Heat structure number
$ Card no.    W1   W2      W3     W4   W5   W6    W7    W8    W9
  13011901    0    100.0   100.0  0.   0.   0.    0.    1.    6
$
$------------------------------------------------------------------------------$
$                        Heat structure - GV1 pipe (201)                       $
$------------------------------------------------------------------------------$  
$ General heat structure data
$ W1 - Number of axial heat structures
$ W2 - Number of radial mesh point
$ W3 - Geometry type (1 => Rectangular; 2 => Cylindrical)
$ W4 - Steady state initialisation flag (1 => Initial temperatures computed by code)
$ W5 - Left boundary coordinate
$ Card no.    W1    W2    W3    W4    W5
  12011000    12    13     2     1     0.019
  
$ Heat structure mesh flags card
$ Card no.    Mesh location flag      Mesh format flag
  12011100    0                       1

$ Heat structure mesh interval data (radial) cards (1cccg101 -- 1cccg199)
$ Card no.    No. intervals      Right coord.
  12011101    3                  0.021
  12011102    3                  0.0215
  12011103    3                  0.0218
  12011104    3                  0.022
  
$ Heat structure composition data (radial) cards (1cccg201 -- 1cccg299)
$   Must correspond to subfield mmm in heat structure thermal property data
$   Sign indicates if the region over which this composition is applied is
$   to be included (positive) or excluded (negative) from the volume averaged
$   temperature computations.
$ Card no.    Composition no.     Interval no.
  12011201    101                 3
  12011202    102                 6
  12011203    103                 9
  12011204    102                 12
  
$ Heat structure source distribution data (radial) cards (1cccg301 -- 1cccg399)
$ Card no.    Source value     Interval no.
  12011301    0.               3
  12011302    0.               6
  12011303    1.               9
  12011304    0.               12
  
$ Inital temperature flag card
$ Card no.    Flag (0 => Initial temperature entered with input data)
  12011400    0

$ Inital temperature data cards (1cccg401 -- 1cccg499)
$ Card no.    Temperature     Mesh point no.
  12011401    297.15          13
 
$ Left boundary condition cards (1cccg501 -- 1cccg599)
$ W1 - Boundary volume number (cccnn000f) / general table (0 => No vol. associated. Insulated BC)
$ W2 - Increment added to W1
$ W3 - Boundary condition type
$      0 => Symmetry / insulated boundary condition
$      1 => Upflow vertical duct
$      110 => Vertical bundle without crossflow
$ W4 - Surface area code (1 => Cylinder height)
$ W5 - Surface area or factor
$ W6 - Heat structure number
$ Card no.    W1            W2        W3    W4    W5      W6
  12011501    201010000     10000     1     1     0.309   10
  12011502    201110000     10000     1     1     0.25    12

$ Right boundary condition cards (1cccg601 -- 1cccg699)
$ Same as the left boundary cards
$ W3 - 3xxx => Convective boundary condition. Heat transfer coeff. vs. time from table xxx
$ W3 - 4xxx => Convective boundary condition. Heat transfer coeff. vs. temp from table xxx
$ Card no.    W1          W2       W3      W4    W5        W6
  12011601    -201        0        3203    1     0.309     10
  12011602    -201        0        3203    1     0.25      12

$ Source data cards (1cccg701 -- 1cccg799)
$ W1 - Source type (0 => No source is used)
$ W2 - Internal source multiplier.
$ W3 - Direct moderator heating multiplier for left boundary volume
$ W4 - Direct moderator heating multiplier for left boundary volume
$ W5 - Heat structure number
$ Card no.    W1     W2    W3    W4    W5
  12011701    0      1.    0.    0.    1
  12011702    902    1.    0.    0.    12
  
$ Additional left boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  12011800    0

$ Additional left boundary condition cards (1cccg801 -- 1cccg899)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  - Heat structure number
$ Card no.    W1    W2      W3    W4   W5   W6   W7   W8   W9
  12011801    0.    100.    100.  0.   0.   0.   0.   1.   12

$ Additional right boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  12011900    0

$ Additional right boundary condition cards (1cccg901 -- 1cccg999)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  -  Heat structure number
$ Card no.    W1    W2      W3      W4   W5   W6   W7   W8   W9
  12011901    0.    100.    100.    0    0    0    0    1.   12
$
$------------------------------------------------------------------------------$
$                 Heat structure - GV2 horizontal part (401)                   $
$------------------------------------------------------------------------------$  
$ General heat structure data
$ W1 - Number of axial heat structures
$ W2 - Number of radial mesh point
$ W3 - Geometry type (1 => Rectangular; 2 => Cylindrical)
$ W4 - Steady state initialisation flag (1 => Initial temperatures computed by code)
$ W5 - Left boundary coordinate
$ Card no.    W1    W2    W3    W4    W5
  14011000    2     13     2     1     0.019
  
$ Heat structure mesh flags card
$ Card no.    Mesh location flag      Mesh format flag
  14011100    0                       1

$ Heat structure mesh interval data (radial) cards (1cccg101 -- 1cccg199)
$ Card no.    No. intervals     Right coord.
  14011101    3                    0.021
  14011102    3                    0.0215
  14011103    3                    0.0218
  14011104    3                    0.022
  
$ Heat structure composition data (radial) cards (1cccg201 -- 1cccg299)
$   Must correspond to subfield mmm in heat structure thermal property data
$   Sign indicates if the region over which this composition is applied is
$   to be included (positive) or excluded (negative) from the volume averaged
$   temperature computations.
$ Card no.    Composition no.     Interval no.
  14011201    101                 3
  14011202    102                 6
  14011203    103                 9
  14011204    102                 12

$ Heat structure source distribution data (radial) cards (1cccg301 -- 1cccg399)
$ Card no.    Source value     Interval no.
  14011301    0.               3
  14011302    0.               6
  14011303    1.               9
  14011304    0.               12
  
$ Inital temperature flag card
$ Card no.    Flag (0 => Initial temperature entered with input data)
  14011400    0

$ Inital temperature data cards (1cccg401 -- 1cccg499)
$ Card no.    Temperature     Mesh point no.
  14011401    297.15          13
 
$ Left boundary condition cards (1cccg501 -- 1cccg599)
$ W1 - Boundary volume number (cccnn000f) / general table (0 => No vol. associated. Insulated BC)
$ W2 - Increment added to W1
$ W3 - Boundary condition type
$      0 => Symmetry / insulated boundary condition
$      1 => Upflow vertical duct
$      110 => Vertical bundle without crossflow
$ W4 - Surface area code (1 => Cylinder height)
$ W5 - Surface area or factor
$ W6 - Heat structure number
$ Card no.    W1            W2        W3    W4    W5       W6
  14011501    401010000     10000     1     1     0.25     2

$ Right boundary condition cards (1cccg601 -- 1cccg699)
$ Same as the left boundary cards
$ W3 - 3xxx => Convective boundary condition. Heat transfer coeff. vs. time from table xxx
$ W3 - 4xxx => Convective boundary condition. Heat transfer coeff. vs. temp from table xxx
$ Card no.    W1            W2      W3     W4    W5     W6
  14011601    -201          0       3204   1     0.25   2

$ Source data cards (1cccg701 -- 1cccg799)
$ W1 - Source type (0 => No vol. associated. Insulated BC)
$ W2 - Internal source multiplier.
$ W3 - Direct moderator heating multiplier for left boundary volume
$ W4 - Direct moderator heating multiplier for left boundary volume
$ W5 - Heat structure number
$ Card no.    W1    W2    W3    W4    W5
  14011701    0     1.    0.    0.    2

$ Additional left boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  14011800    0

$ Additional left boundary condition cards (1cccg801 -- 1cccg899)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  - Heat structure number
$ Card no.    W1    W2       W3      W4   W5   W6   W7   W8   W9
  14011801    0.    100.0    100.0   0.   0.   0.   0.   1.   2

$ Additional right boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  14011900    0

$ Additional right boundary condition cards (1cccg901 -- 1cccg999)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  -  Heat structure number
$ Card no.    W1    W2      W3      W4   W5   W6   W7   W8   W9
  14011901    0.    100.0   100.0    0    0    0    0    1.   2
$
$------------------------------------------------------------------------------$
$                 Heat structure - Branch GV2/Pressurizer (402)                $
$------------------------------------------------------------------------------$  
$ General heat structure data
$ W1 - Number of axial heat structures
$ W2 - Number of radial mesh point
$ W3 - Geometry type (1 => Rectangular; 2 => Cylindrical)
$ W4 - Steady state initialisation flag (1 => Initial temperatures computed by code)
$ W5 - Left boundary coordinate
$ Card no.    W1    W2    W3    W4    W5
  14021000    1     13     2     1     0.019
  
$ Heat structure mesh flags card
$ Card no.    Mesh location flag      Mesh format flag
  14021100    0                       1

$ Heat structure mesh interval data (radial) cards (1cccg101 -- 1cccg199)
$ Card no.    No. intervals     Right coord.
  14021101    3                    0.021
  14021102    3                    0.0215
  14021103    3                    0.0218
  14021104    3                    0.022
  
$ Heat structure composition data (radial) cards (1cccg201 -- 1cccg299)
$   Must correspond to subfield mmm in heat structure thermal property data
$   Sign indicates if the region over which this composition is applied is
$   to be included (positive) or excluded (negative) from the volume averaged
$   temperature computations.
$ Card no.    Composition no.     Interval no.
  14021201    101                 3
  14021202    102                 6
  14021203    103                 9
  14021204    102                 12
  
$ Heat structure source distribution data (radial) cards (1cccg301 -- 1cccg399)
$ Card no.    Source value     Interval no.
  14021301    0.               3
  14021302    0.               6
  14021303    1.               9
  14021304    0.               12
  
$ Inital temperature flag card
$ Card no.    Flag (0 => Initial temperature entered with input data)
  14021400    0

$ Inital temperature data cards (1cccg401 -- 1cccg499)
$ Card no.    Temperature     Mesh point no.
  14021401    297.15          13
 
$ Left boundary condition cards (1cccg501 -- 1cccg599)
$ W1 - Boundary volume number (cccnn000f) / general table (0 => No vol. associated. Insulated BC)
$ W2 - Increment added to W1
$ W3 - Boundary condition type
$      0 => Symmetry / insulated boundary condition
$      1 => Upflow vertical duct
$      110 => Vertical bundle without crossflow
$ W4 - Surface area code (1 => Cylinder height)
$ W5 - Surface area or factor
$ W6 - Heat structure number
$ Card no.    W1            W2        W3    W4    W5       W6
  14021501    402010000     10000     1     1     0.309    1
  
$ Right boundary condition cards (1cccg601 -- 1cccg699)
$ Same as the left boundary cards
$ W3 - 4xxx => Convective boundary condition. Heat transfer coeff. from table xxx
$ Card no.    W1            W2        W3     W4     W5        W6
  14021601    -201          0         3204   1     0.309      1
  
$ Source data cards (1cccg701 -- 1cccg799)
$ W1 - Source type (0 => No source is used)
$ W2 - Internal source multiplier.
$ W3 - Direct moderator heating multiplier for left boundary volume
$ W4 - Direct moderator heating multiplier for left boundary volume
$ W5 - Heat structure number
$ Card no.    W1    W2    W3    W4    W5
  14021701    0     1.    0.    0.    1

$ Additional left boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  14021800    0

$ Additional left boundary condition cards (1cccg801 -- 1cccg899)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  - Heat structure number
$ Card no.    W1    W2      W3      W4   W5   W6   W7   W8   W9
  14021801    0.    100.0   100.0   0    0    0    0    1.   1

$ Additional right boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  14021900    0

$ Additional right boundary condition cards (1cccg901 -- 1cccg999)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  -  Heat structure number
$ Card no.    W1    W2       W3      W4   W5   W6   W7   W8   W9
  14021901    0.    100.0    100.0   0    0    0    0    1.   1
$
$------------------------------------------------------------------------------$
$                 Heat structure - GV2 vertical part (403)                     $
$------------------------------------------------------------------------------$  
$ General heat structure data
$ W1 - Number of axial heat structures
$ W2 - Number of radial mesh point
$ W3 - Geometry type (1 => Rectangular; 2 => Cylindrical)
$ W4 - Steady state initialisation flag (1 => Initial temperatures computed by code)
$ W5 - Left boundary coordinate
$ Card no.    W1   W2    W3    W4    W5
  14031000    9    13     2     1     0.019
  
$ Heat structure mesh flags card
$ Card no.    Mesh location flag      Mesh format flag
  14031100    0                       1

$ Heat structure mesh interval data (radial) cards (1cccg101 -- 1cccg199)
$ Card no.    No. intervals     Right coord.
  14031101    3                    0.021
  14031102    3                    0.0215
  14031103    3                    0.0218
  14031104    3                    0.022
  
$ Heat structure composition data (radial) cards (1cccg201 -- 1cccg299)
$   Must correspond to subfield mmm in heat structure thermal property data
$   Sign indicates if the region over which this composition is applied is
$   to be included (positive) or excluded (negative) from the volume averaged
$   temperature computations.
$ Card no.    Composition no.     Interval no.
  14031201    101                 3
  14031202    102                 6
  14031203    103                 9
  14031204    102                 12
  
$ Heat structure source distribution data (radial) cards (1cccg301 -- 1cccg399)
$ Card no.    Source value     Interval no.
  14031301    0.               3
  14031302    0.               6
  14031303    1.               9
  14031304    0.               12
  
$ Inital temperature flag card
$ Card no.    Flag (0 => Initial temperature entered with input data)
  14031400    0

$ Inital temperature data cards (1cccg401 -- 1cccg499)
$ Card no.    Temperature     Mesh point no.
  14031401    297.15          13
 
$ Left boundary condition cards (1cccg501 -- 1cccg599)
$ W1 - Boundary volume number (cccnn000f) / general table (0 => No vol. associated. Insulated BC)
$ W2 - Increment added to W1
$ W3 - Boundary condition type
$      0 => Symmetry / insulated boundary condition
$      1 => Upflow vertical duct
$      110 => Vertical bundle without crossflow
$ W4 - Surface area code (1 => Cylinder height)
$ W5 - Surface area or factor
$ W6 - Heat structure number
$ Card no.    W1            W2        W3    W4    W5       W6
  14031501    403010000     10000     1     1     0.309    9
  
$ Right boundary condition cards (1cccg601 -- 1cccg699)
$ Same as the left boundary cards
$ W3 - 4xxx => Convective boundary condition. Heat transfer coeff. from table xxx
$ Card no.    W1            W2        W3     W4     W5       W6
  14031601    -201          0         3204   1      0.309    9

$ Source data cards (1cccg701 -- 1cccg799)
$ W1 - Source type (0 => No vol. associated. Insulated BC)
$ W2 - Internal source multiplier.
$ W3 - Direct moderator heating multiplier for left boundary volume
$ W4 - Direct moderator heating multiplier for left boundary volume
$ W5 - Heat structure number
$ Card no.    W1    W2    W3    W4    W5
  14031701    0     1.    0.    0.    9

$ Additional left boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  14031800    0

$ Additional left boundary condition cards (1cccg801 -- 1cccg899)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  - Heat structure number
$ Card no.    W1    W2      W3      W4   W5   W6   W7   W8   W9
  14031801    0.    100.0   100.0    0    0    0    0    1.   9

$ Additional right boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  14031900    0

$ Additional right boundary condition cards (1cccg901 -- 1cccg999)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  -  Heat structure number
$ Card no.    W1    W2      W3      W4   W5   W6   W7   W8   W9
  14031901    0.    100.0   100.0    0    0    0    0    1.   9
$
$------------------------------------------------------------------------------$
$                      Heat structure - GO1 pipe (101)                         $
$------------------------------------------------------------------------------$
$ General heat structure data
$ W1 - Number of axial heat structures
$ W2 - Number of radial mesh point
$ W3 - Geometry type (2 => Cylindrical)
$ W4 - Steady state initialisation flag (1 => Initial temperatures computed by code)
$ W5 - Left boundary coordinate
$ Card no.    W1    W2    W3    W4    W5
  11011000    12    13     2     1     0.019

$ Heat structure mesh flags card
$ Card no.    Mesh location flag      Mesh format flag
  11011100    0                       1

$ Heat structure mesh interval data (radial) cards (1cccg101 -- 1cccg199)
$ Card no.    No. intervals     Right coord.
  11011101    3                 0.021
  11011102    3                 0.0215
  11011103    3                 0.0218
  11011104    3                 0.022

$ Heat structure composition data (radial) cards (1cccg201 -- 1cccg299)
$   Must correspond to subfield mmm in heat structure thermal property data
$   Sign indicates if the region over which this composition is applied is
$   to be included (positive) or excluded (negative) from the volume averaged
$   temperature computations.
$ Card no.    Composition no.     Interval no.
  11011201    101                 3
  11011202    102                 6
  11011203    103                 9
  11011204    102                 12

$ Heat structure source distribution data (radial) cards (1cccg301 -- 1cccg399)
$ Card no.    Source value     Interval no.
  11011301    0.               3
  11011302    0.               6
  11011303    0.               9
  11011304    0.               12
  
$ Inital temperature flag card
$ Card no.    Flag (0 => Initial temperature entered with input data)
  11011400    0

$ Inital temperature data cards (1cccg401 -- 1cccg499)
$ Card no.    Temperature     Mesh point no.
  11011401    297.15          13

$ Left boundary condition cards (1cccg501 -- 1cccg599)
$ W1 - Boundary volume number (cccnn000f) / general table (0 => No vol. associated. Insulated BC)
$ W2 - Increment added to W1
$ W3 - Boundary condition type
$      0 => Symmetry / insulated boundary condition
$      110 => Vertical bundle without crossflow
$ W4 - Surface area code (1 => Cylinder height)
$ W5 - Surface area or factor
$ W6 - Heat structure number
$ Card no.    W1            W2        W3    W4    W5      W6
  11011501    101010000     10000     1     1     0.255   1
  11011502    101020000     10000     1     1     0.3     2
  11011503    101030000     10000     1     1     0.25833 5
  11011504    101070000     10000     1     1     0.22    7
  11011505    101080000     10000     1     1     0.266   12
  
$ Right boundary condition cards (1cccg601 -- 1cccg699)
$ Same as the left boundary cards
$ W3 - 3xxx => Convective boundary condition. Heat transfer coeff. vs. time from table xxx
$ W3 - 4xxx => Convective boundary condition. Heat transfer coeff. vs. temp from table xx
$ Card no.    W1            W2       W3     W4     W5     W6
  11011601   -201          0         3205   1      0.255   1
  11011602   -201          0         3205   1      0.3     2
  11011603   -201          0         3205   1      0.25833 5
  11011604   -201          0         3205   1      0.22    7
  11011605   -201          0         3205   1      0.266   12
  
$ Source data cards (1cccg701 -- 1cccg799)
$ W1 - Source type (0 => No vol. associated. Insulated BC)
$ W2 - Internal source multiplier.
$ W3 - Direct moderator heating multiplier for left boundary volume
$ W4 - Direct moderator heating multiplier for right boundary volume
$ W5 - Heat structure number
$ Card no.    W1    W2    W3    W4    W5
  11011701    0     1.    0.    0.    12

$ Additional left boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  11011800    0

$ Additional left boundary condition cards (1cccg801 -- 1cccg899)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  - Heat structure number
$ Card no.    W1   W2     W3     W4   W5   W6     W7     W8    W9
  11011801    0    100.0  100.0  0.   0.   0.     0.     1.    12

$ Additional right boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  11011900    0

$ Additional right boundary condition cards (1cccg901 -- 1cccg999)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  - Heat structure number
$ Card no.    W1   W2      W3     W4   W5   W6    W7    W8    W9
  11011901    0    100.0   100.0  0.   0.   0.    0.    1.    12
$
$------------------------------------------------------------------------------$
$                         Heat source - pipe2press (501)                       $
$------------------------------------------------------------------------------$
$ General heat structure data
$ W1 - Number of axial heat structures
$ W2 - Number of radial mesh point
$ W3 - Geometry type (2 => Cylindrical)
$ W4 - Steady state initialisation flag (1 => Initial temperatures computed by code)
$ W5 - Left boundary coordinate
$ Card no.    W1    W2    W3    W4    W5
  15011000    2     5     2     1     0.019

$ Heat structure mesh flags card
$ Card no.    Mesh location flag      Mesh format flag
  15011100    0                       1

$ Heat structure mesh interval data (radial) cards (1cccg101 -- 1cccg199)
$ Card no.    No. intervals     Right coord.
  15011101    4                 0.021

$ Heat structure composition data (radial) cards (1cccg201 -- 1cccg299)
$   Must correspond to subfield mmm in heat structure thermal property data
$   Sign indicates if the region over which this composition is applied is
$   to be included (positive) or excluded (negative) from the volume averaged
$   temperature computations.
$ Card no.    Composition no.     Interval no.
  15011201    101                 4

$ Heat structure source distribution data (radial) cards (1cccg301 -- 1cccg399)
$ Card no.    Source value     Interval no.
  15011301    0.               4

$ Inital temperature flag card
$ Card no.    Flag (0 => Initial temperature entered with input data)
  15011400    0

$ Inital temperature data cards (1cccg401 -- 1cccg499)
$ Card no.    Temperature     Mesh point no.
  15011401    297.15          5

$ Left boundary condition cards (1cccg501 -- 1cccg599)
$ W1 - Boundary volume number (cccnn000f) / general table (0 => No vol. associated. Insulated BC)
$ W2 - Increment added to W1
$ W3 - Boundary condition type
$      0 => Symmetry / insulated boundary condition
$      110 => Vertical bundle without crossflow
$ W4 - Surface area code (1 => Cylinder height)
$ W5 - Surface area or factor
$ W6 - Heat structure number
$ Card no.    W1            W2        W3    W4    W5      W6
  15011501    501010000     10000     1     1     0.25    2

$ Right boundary condition cards (1cccg601 -- 1cccg699)
$ Same as the left boundary cards
$ W3 - 3xxx => Convective boundary condition. Heat transfer coeff. vs. time from table xxx
$ W3 - 4xxx => Convective boundary condition. Heat transfer coeff. vs. temp from table xx
$ Card no.    W1   W2    W3     W4    W5       W6
  15011601    0    0     0      1     0.25     2

$ Source data cards (1cccg701 -- 1cccg799)
$ W1 - Source type (0 => No source is used)
$ W2 - Internal source multiplier.
$ W3 - Direct moderator heating multiplier for left boundary volume
$ W4 - Direct moderator heating multiplier for right boundary volume
$ W5 - Heat structure number
$ Card no.    W1     W2    W3    W4    W5
  15011701    0      1.    0.    0.    2

$ Additional left boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  15011800    0

$ Additional left boundary condition cards (1cccg801 -- 1cccg899)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  - Heat structure number
$ Card no.    W1   W2     W3     W4   W5   W6     W7     W8    W9
  15011801    0    100.   100.   0.   0.   0.     0.     1.    2

$ Additional right boundary option card
$ Card no.    W1 (0 / 1 => 9 / 12 word format on next cards)
  15011900    0

$ Additional right boundary condition cards (1cccg901 -- 1cccg999)
$ W1  - Heat transfer hydraulic diameter
$ W2  - Heated length forward
$ W3  - Heated length reverse
$ W4  - Grid spacer length forward
$ W5  - Grid spacer length reverse
$ W6  - Grid loss coefficient forward
$ W7  - Grid loss coefficient reverse
$ W8  - Local boiling factor
$ W9  - Heat structure number
$ Card no.    W1   W2     W3     W4   W5   W6    W7    W8    W9
  15011901    0    100.   100.   0.   0.   0.    0.    1.    2   
$  
$==============================================================================$
$==============================================================================$
$                             GENERAL TABLES                                   $
$==============================================================================$
$==============================================================================$

$------------------------------------------------------------------------------$
$                    Table 101 - Stainless Steel AISI 316L                     $
$        Thermophysical properties of stainless steels by ANL                  $
$------------------------------------------------------------------------------$
$ Composition type and data card
$ Card no.    Table type   Therm. cond. flag   Vol. heat cap. flag
  20110100    tbl/fctn     1                   1

$ Thermal conductivity data cards (201mmm01 -- 201mmm49)
$ Card no.      Temp. [K]       Therm. cond. [W/mK]
  20110101      100.            12.39
  20110102      200.            13.96
  20110103      300.            15.53
  20110104      400.            17.10
  20110105      500.            18.68
  20110106      600.            20.25
  20110107      700.            21.82
  20110108      800.            23.39

$ Volumetric heat capacity data cards (201mmm51 -- 201mmm99)
$ Card no.      Temp. [K]      Heat cap. [J/m^3K]
  20110151      100.           3.88e6
  20110152      200.           3.96e6
  20110153      300.           4.05e6
  20110154      400.           4.13e6
  20110155      500.           4.20e6
  20110156      600.           4.29e6
  20110157      700.           4.36e6
  20110158      800.           4.44e6
$
$------------------------------------------------------------------------------$
$                           Table 102 - Fiberglass                             $
$                                                                              $
$------------------------------------------------------------------------------$
$ Composition type and data card
$ Card no.    Table type   Therm. cond. flag   Vol. heat cap. flag
  20110200    tbl/fctn     1                   1

$ Thermal conductivity data cards (201mmm01 -- 201mmm49)
$ Card no.      Temp. [K]       Therm. cond. [W/mK]
  20110201      250.            0.035
  20110202      300.            0.04
  20110203      350.            0.046
  20110204      400.            0.053
  20110205      450.            0.062
  20110206      573.            0.065

  
$ Volumetric heat capacity data cards (201mmm51 -- 201mmm99)
$ Card no.      Temp. [K]      Heat cap. [J/m^3K]
  20110251      100.           8.e5
  20110252      200.           8.e5
  20110253      300.           8.e5
  20110254      400.           8.e5
  20110255      500.           8.e5
$
$------------------------------------------------------------------------------$
$                           Table 103 - Copper                                 $
$                                                                              $
$------------------------------------------------------------------------------$
$ Composition type and data card
$ Card no.    Table type   Therm. cond. flag   Vol. heat cap. flag
  20110300    tbl/fctn     1                   1

$ Thermal conductivity data cards (201mmm01 -- 201mmm49)
$ Card no.      Temp. [K]       Therm. cond. [W/mK]
  20110301      200.            413.
  20110302      273.            401.
  20110303      400.            392.
  20110304      600.            383.
  20110305      800.            371.

$ Volumetric heat capacity data cards (201mmm51 -- 201mmm99)
$ Card no.      Temp. [K]      Heat cap. [J/m^3K]
  20110351      100.           3.0e6
  20110352      200.           3.2e6
  20110353      300.           3.3e6
  20110354      400.           3.4e6
  20110355      500.           3.5e6
  20110356      800.           3.5e6
$
$------------------------------------------------------------------------------$
$                 Table 201 - Environment Temp. vs. Time                       $
$------------------------------------------------------------------------------$
$ Table type and multiplier data card
$ Card no.   Table type
  20220100   temp
$
$ General table data cards (202ttt01 -- 202ttt99)
$ Card no.     Time(s)   Temp.(K)
  20220101    -1.        295.15
  20220102     0.        295.15
  20220103     1.e+6     295.15
$
$------------------------------------------------------------------------------$
$         Table 202 - Dissipative Heat Transfer Coeff. vs. Time. (FAN)         $
$------------------------------------------------------------------------------$
$ Table type and multiplier data card
$ Card no.   Table type
  20220200   htc-t

$ General table data cards (202ttt01 -- 202ttt99)
$ Card no.     Time.(s)    Heat trans. coeff.(W/m^2K)
  20220201     0.          46.2

$
$------------------------------------------------------------------------------$
$    Table 203 - Dissipative Heat Transfer Coeff. vs. Temp. (Heated Pipe)      $
$------------------------------------------------------------------------------$
$ Table type and multiplier data card
$ Card no.   Table type
  20220300   htc-t

$ General table data cards (202ttt01 -- 202ttt99)
$ Card no.       Time(s)    Heat trans. coeff.(W/m^2K)
  20220301       0.         54.0
$
$------------------------------------------------------------------------------$
$    Table 204 - Dissipative Heat Transfer Coeff. vs. Temp. (Non-heated Pipe)  $
$------------------------------------------------------------------------------$
$ Table type and multiplier data card
$ Card no.   Table type
  20220400   htc-t

$ General table data cards (202ttt01 -- 202ttt99)
$ Card no.       Temp(K)    Heat trans. coeff.(W/m^2K)
  20220401      -1.         120.6
$------------------------------------------------------------------------------$
$    Table 205 - Dissipative Heat Transfer Coeff. vs. Temp. (Non-heated Pipe)  $
$------------------------------------------------------------------------------$
$ Table type and multiplier data card
$ Card no.   Table type
  20220500   htc-t

$ General table data cards (202ttt01 -- 202ttt99)
$ Card no.       Temp(K)    Heat trans. coeff.(W/m^2K)
  20220501      -1.         26.4

$------------------------------------------------------------------------------$
$                           Table 902 - Power versus Time                      $
$------------------------------------------------------------------------------$
$ Table type and multiplier data card
$ Card no.   Table type
  20290200   power

$ General table data cards (202ttt01 -- 202ttt99)
$ Card no.     Time     Power [W]
  20290201    -1.       0.
  20290202     0.       0.
  20290203     1350.    0. 
  20290204     1350.    115.
  20290205     1.e6     1000.0
$  20290206     1700.    0.
$  20290207     1800.    0.
$  20290208     1.41e4   0.
$  20290209     1.41e4   0.
$
$==============================================================================$
$==============================================================================$
$                          CONTROL SYSTEM INPUT DATA                           $
$==============================================================================$
$==============================================================================$
$ Cards structure: 205CCCNN
$ CCC - Control variable
$ NN  - Card number within the type

$------------------------------------------------------------------------------$
$            Control Variable 101 - Power exchanged from GO1 [W]               $
$------------------------------------------------------------------------------$
$ Control component type card
$ W1  - Alphanumeric name
$ W2  - Control component type (sum / mult / div / etc.)
$ W3  - Scaling factor
$ W4  - Initial value
$ W5  - Initial value flag (0 / 1 => Use W4 / Compute initial condition)
$ W6  - Limiter control (Omit this and following words if no limits on control variables)
$ W7  - Minimum or maximum value
$ W8  - Maximum value (Use only if both minimum and maximum value to be imposed)
$ Card no.    W1         W2    W3   W4    W5
  20510100    powerGO1   sum   1.    0.   1

$ Control component data cards (205ccc01 -- 205ccc98)
$ For sum component, Y = S(A0 + A1V1 + A2V2 + ... + AjVj)
$   W1  - Constant A0
$   W2  - Constant Ai
$   W3  - Alphanumeric name of variable request code for Vi
$   W4  - Integer code for volume of variable request code
$ Card no.    W1   W2   W3    W4
  20510101    0.   1.   q     101010000
  20510102         1.   q     101020000
  20510103         1.   q     101030000
  20510104         1.   q     101040000
  20510105         1.   q     101050000
  20510106         1.   q     101060000
  20510107         1.   q     101070000
  20510108         1.   q     101080000
  20510109         1.   q     101090000
  20510110         1.   q     101100000
  20510111         1.   q     101110000
  20510112         1.   q     101120000
$
$------------------------------------------------------------------------------$
$             Control Variable 201 - Power exchanged from GV1 [W]              $
$------------------------------------------------------------------------------$
$ Control component type card
$ W1  - Alphanumeric name
$ W2  - Control component type (sum / mult / div / etc.)
$ W3  - Scaling factor
$ W4  - Initial value
$ W5  - Initial value flag (0 / 1 => Use W4 / Compute initial condition)
$ W6  - Limiter control (Omit this and following words if no limits on control variables)
$ W7  - Minimum or maximum value
$ W8  - Maximum value (Use only if both minimum and maximum value to be imposed)
$ Card no.    W1        W2    W3     W4    W5
  20520100    powerGV1  sum   1.     0.    1

$ Control component data cards (205ccc01 -- 205ccc98)
$ For sum component, Y = S(A0 + A1V1 + A2V2 + ... + AjVj)
$   W1  - Constant A0
$   W2  - Constant Ai
$   W3  - Alphanumeric name of variable request code for Vi
$   W4  - Integer code for volume of variable request code
$ Card no.    W1   W2   W3    W4
  20520101    0.   1.   q     201020000
  20520102         1.   q     201030000
  20520103         1.   q     201040000
  20520104         1.   q     201050000
  20520105         1.   q     201060000
  20520106         1.   q     201070000
  20520107         1.   q     201080000
  20520108         1.   q     201090000
  20520109         1.   q     201100000
  20520110         1.   q     201110000
  20520111         1.   q     201120000
$
$------------------------------------------------------------------------------$
$          Control Variable 301 - Power exchanged from the cooler [W]          $
$------------------------------------------------------------------------------$
$ Control component type card
$ W1  - Alphanumeric name
$ W2  - Control component type (sum / mult / div / etc.)
$ W3  - Scaling factor
$ W4  - Initial value
$ W5  - Initial value flag (0 / 1 => Use W4 / Compute initial condition)
$ W6  - Limiter control (Omit this and following words if no limits on control variables)
$ W7  - Minimum or maximum value
$ W8  - Maximum value (Use only if both minimum and maximum value to be imposed)
$ Card no.    W1        W2    W3     W4    W5
  20530100    Cooler  sum   1.     0.    1

$ Control component data cards (205ccc01 -- 205ccc98)
$ For sum component, Y = S(A0 + A1V1 + A2V2 + ... + AjVj)
$   W1  - Constant A0
$   W2  - Constant Ai
$   W3  - Alphanumeric name of variable request code for Vi
$   W4  - Integer code for volume of variable request code
$ Card no.    W1   W2   W3    W4
  20530101    0.   1.   q     301010000
  20530102         1.   q     301020000
  20530103         1.   q     301030000
  20530104         1.   q     301040000
  20530105         1.   q     301050000
  20530106         1.   q     301060000
$
$------------------------------------------------------------------------------$
$             Control Variable 400 - Power exchanged from GV2 [W]              $
$------------------------------------------------------------------------------$
$ Control component type card
$ W1  - Alphanumeric name
$ W2  - Control component type (sum / mult / div / etc.)
$ W3  - Scaling factor
$ W4  - Initial value
$ W5  - Initial value flag (0 / 1 => Use W4 / Compute initial condition)
$ W6  - Limiter control (Omit this and following words if no limits on control variables)
$ W7  - Minimum or maximum value
$ W8  - Maximum value (Use only if both minimum and maximum value to be imposed)
$ Card no.    W1        W2    W3     W4    W5
  20540100    powerGV2  sum   1.     0.    1

$ Control component data cards (205ccc01 -- 205ccc98)
$ For sum component, Y = S(A0 + A1V1 + A2V2 + ... + AjVj)
$   W1  - Constant A0
$   W2  - Constant Ai
$   W3  - Alphanumeric name of variable request code for Vi
$   W4  - Integer code for volume of variable request code
$ Card no.    W1   W2   W3    W4
  20540101    0.   1.   q     401010000 
  20540102         1.   q     401020000
  20540103         1.   q     402010000
  20540104         1.   q     403010000
  20540105         1.   q     403020000
  20540106         1.   q     403030000
  20540107         1.   q     403040000
  20540108         1.   q     403050000
  20540109         1.   q     403060000
  20540110         1.   q     403070000
  20540111         1.   q     403080000
  20540112         1.   q     403090000
$
$------------------------------------------------------------------------------$
$               Control Variable 105 - pressure drop MFRM 1 [Pa]               $
$------------------------------------------------------------------------------$
$ Control component type card
$ W1  - Alphanumeric name
$ W2  - Control component type (sum / mult / div / etc.)
$ W3  - Scaling factor
$ W4  - Initial value
$ W5  - Initial value flag (0 / 1 => Use W4 / Compute initial condition)
$ W6  - Limiter control (Omit this and following words if no limits on control variables)
$ W7  - Minimum or maximum value
$ W8  - Maximum value (Use only if both minimum and maximum value to be imposed)
$ Card no.    W1        W2    W3     W4    W5
  20510500    dP_MFRM   sum   1.     0.    1

$ Control component data cards (205ccc01 -- 205ccc98)
$ For sum component, Y = S(A0 + A1V1 + A2V2 + ... + AjVj)
$   W1  - Constant A0
$   W2  - Constant Ai
$   W3  - Alphanumeric name of variable request code for Vi
$   W4  - Integer code for volume of variable request code
$ Card no.    W1   W2   W3    W4
  20510501    0.   1.   p     101070000 
  20510502        -1.   p     101080000
$
$------------------------------------------------------------------------------$
$               Control Variable 106 - pressure drop MFRM 2 [Pa]               $
$------------------------------------------------------------------------------$
$ Control component type card
$ W1  - Alphanumeric name
$ W2  - Control component type (sum / mult / div / etc.)
$ W3  - Scaling factor
$ W4  - Initial value
$ W5  - Initial value flag (0 / 1 => Use W4 / Compute initial condition)
$ W6  - Limiter control (Omit this and following words if no limits on control variables)
$ W7  - Minimum or maximum value
$ W8  - Maximum value (Use only if both minimum and maximum value to be imposed)
$ Card no.    W1        W2    W3     W4    W5
  20510600    dP_MFRM   sum   1.     0.    1

$ Control component data cards (205ccc01 -- 205ccc98)
$ For sum component, Y = S(A0 + A1V1 + A2V2 + ... + AjVj)
$   W1  - Constant A0
$   W2  - Constant Ai
$   W3  - Alphanumeric name of variable request code for Vi
$   W4  - Integer code for volume of variable request code
$ Card no.    W1   W2   W3    W4
  20510601    0.   1.   p     101060000 
  20510602        -1.   p     101070000
$
$------------------------------------------------------------------------------$
$                     Control Variable 500 - Courant number [-]                $
$------------------------------------------------------------------------------$
$ Control component type card
$ W1  - Alphanumeric name
$ W2  - Control component type (sum / mult / div / etc.)
$ W3  - Scaling factor
$ W4  - Initial value
$ W5  - Initial value flag (0 / 1 => Use W4 / Compute initial condition)
$ W6  - Limiter control (Omit this and following words if no limits on control variables)
$ W7  - Minimum or maximum value
$ W8  - Maximum value (Use only if both minimum and maximum value to be imposed)
$ Card no.    W1         W2     W3   W4    W5
  20550000    CrntNum    mult   4.09  0.    1

$ Control component data cards (205ccc01 -- 205ccc98)
$ For sum component, Y = S(A0 + A1V1 + A2V2 + ... + AjVj)
$   W1  - Constant A0
$   W2  - Constant Ai
$   W3  - Alphanumeric name of variable request code for Vi
$   W4  - Integer code for volume of variable request code
$ Card no.    W1     W2  
  20550001    velfj  199000000
  20550002    dtcrnt 0
$ 
$------------------------------------------------------------------------------$
$                       Control Variable 600 - Re number [-]                   $
$------------------------------------------------------------------------------$
$ Control component type card
$ W1  - Alphanumeric name
$ W2  - Control component type (sum / mult / div / etc.)
$ W3  - Scaling factor
$ W4  - Initial value
$ W5  - Initial value flag (0 / 1 => Use W4 / Compute initial condition)
$ W6  - Limiter control (Omit this and following words if no limits on control variables)
$ W7  - Minimum or maximum value
$ W8  - Maximum value (Use only if both minimum and maximum value to be imposed)
$ Card no.    W1         W2     W3     W4    W5
  20560000    Re_num    mult    0.038  0.    1

$ Control component data cards (205ccc01 -- 205ccc98)
$ For sum component, Y = S(A0 + A1V1 + A2V2 + ... + AjVj)
$   W1  - Constant A0
$   W2  - Constant Ai
$   W3  - Alphanumeric name of variable request code for Vi
$   W4  - Integer code for volume of variable request code
$ Card no.    W1     W2  
  20560001    velfj  199000000
  20560002    rhofj  199000000
$
$------------------------------------------------------------------------------$
$                        Control Variable 601 - Re number [-]                  $
$------------------------------------------------------------------------------$
$ Control component type card
$ W1  - Alphanumeric name
$ W2  - Control component type (sum / mult / div / etc.)
$ W3  - Scaling factor
$ W4  - Initial value
$ W5  - Initial value flag (0 / 1 => Use W4 / Compute initial condition)
$ W6  - Limiter control (Omit this and following words if no limits on control variables)
$ W7  - Minimum or maximum value
$ W8  - Maximum value (Use only if both minimum and maximum value to be imposed)
$ Card no.    W1      W2    W3   W4    W5
  20560100    Re      div   1.   0.    1

$ Control component data cards (205ccc01 -- 205ccc98)
$ For sum component, Y = S(A0 + A1V1 + A2V2 + ... + AjVj)
$   W1  - Constant A0
$   W2  - Constant Ai
$   W3  - Alphanumeric name of variable request code for Vi
$   W4  - Integer code for volume of variable request code
$ Card no.    W1        W2  
  20560101    viscf     201010000
  20560102    cntrlvar  600  
$
$
$ End of file
.