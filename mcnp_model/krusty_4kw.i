Krusty Neutronics Model: 4 kW th
c
c  Author: Alex Swenson
c  Created on: December 2, 2018
c  NE555 Reactor Dynamics
c
c ******************************************************************************
c
c                                 CELL CARDS
c
c ******************************************************************************
c
c ------------------------------------------------------------------------------
c     Fuel Block
c ------------------------------------------------------------------------------
c
c Fuel
  1 1 -18.044 -1 2 301 302 303 304 305 306 307 308  imp:n=1         $ fuel meat
c Void  
  2 0 -1 -2 401                                     imp:n=1         $ center void
c Heat Pipes
  3 2 -1.0 (-301 -309 310):                                         $ Na HPs
           (-302 -309 310):
           (-303 -309 310):
           (-304 -309 310):
           (-305 -309 310):
           (-306 -309 310):
           (-307 -309 310):
           (-308 -309 310)                          imp:n=1
c B4C control rod
  4 6 -2.5 -401                                     imp:n=1 
c
c ------------------------------------------------------------------------------
c     Reflectors
c ------------------------------------------------------------------------------
c
c Beryllium Reflector
c 
  501 0 -501 1 301 302 303 304 305 306 307 308            imp:n=1  $ void gap
  502 5 -3.0 -502 501 1 301 302 303 304 305 306 307 308   imp:n=1  $ refl meat
c 
c SS 316 Reflector
  503 7 -8 -503 502                                       imp:n=1  $ SS meat
c
c ------------------------------------------------------------------------------
c     Outside World
c ------------------------------------------------------------------------------
c
  6 0 503                                           imp:n=0

c ******************************************************************************
c
c                              SURFACE CARDS
c
c ******************************************************************************
c
c ------------------------------------------------------------------------------
c     Fuel block
c ------------------------------------------------------------------------------
c
  1 rcc 0 0 0 0 0 25 5.5                                        $ outer radius
  2 CZ 1.994                                                    $ inner void
c 
c ------------------------------------------------------------------------------
c     Heat Pipes
c ------------------------------------------------------------------------------
c 
c 
  301 1 rcc 0 0 0 0 0 25 0.47625                                $ HP #1
  302 2 rcc 0 0 0 0 0 25 0.47625                                $ HP #2
  303 3 rcc 0 0 0 0 0 25 0.47625                                $ HP #3
  304 4 rcc 0 0 0 0 0 25 0.47625                                $ HP #4
  305 5 rcc 0 0 0 0 0 25 0.47625                                $ HP #5
  306 6 rcc 0 0 0 0 0 25 0.47625                                $ HP #6
  307 7 rcc 0 0 0 0 0 25 0.47625                                $ HP #7
  308 8 rcc 0 0 0 0 0 25 0.47625                                $ HP #8
c
  309 PZ 25
  310 PZ 0
c
c -----------------------------------------------------------------------------
c    Reactivity Control
c -----------------------------------------------------------------------------
c
c B4C control rod
  401 10 rcc 0 0 0 0 0 4.866 1.994
c Beyllium Reflector
  501 rcc 0 0 0 0 0 25 8
  502 rcc 0 0 -9.358 0 0 40.426 19.1638
c SS Reflector
  503 rcc 0 0 -28.0736 0 0 65 51

c ******************************************************************************
c
c                                 DATA CARDS
c
c ******************************************************************************
c
c ------------------------------------------------------------------------------
c     Simulation parameters
c ------------------------------------------------------------------------------
c
  kcode 10000 1.0 15 50 
  ksrc  5 0 10
  prdmp j -300 j 2 j  $ 15 minutes
c
  mode n
c
c
c ------------------------------------------------------------------------------
c     Coordinate transforms
c ------------------------------------------------------------------------------
c
c Heat Pipes
  tr1   5.2     0.     0. 
  tr2   3.767   3.767  0. 
  tr3   0.      5.2    0. 
  tr4  -3.767   3.767  0.
  tr5  -5.2     0.     0.
  tr6  -3.767  -3.767  0.
  tr7   0.     -5.2    0.
  tr8   3.767  -3.767  0.
c
c Control Rod position
  tr10 0. 0. 0.
c
c
c ------------------------------------------------------------------------------
c     Burn Card
c ------------------------------------------------------------------------------
  burn  time=365.25 9R power=0.04 pfrac=1 9R bopt=1 14 -1          $Burnup_input
      mat= 1                                                           $burn_mat
      omit= -1 46  66159 67163 67164 67166 68163 68165 68169 69166    $burn_omit
         69167 69171 69172 69173 70168 70169 70170 70171 70172 70173  $burn_omit
         70174 6014 7016 39087 39092 39093 40089 40097 41091 41092    $burn_omit
         41096 41097 41098 41099 42091 42093 70175 70176 71173 71174  $burn_omit
         71177 72175 72181 72182 73179 73183 74179 74181              $burn_omit
c ------------------------------------------------------------------------------
c     Materials from PNNL materials handbook
c ------------------------------------------------------------------------------
c
c      Fuel (U8Mo 93 % Enriched Uranium)
c      rho = 18.044 g/cm^3
c
  m1
         42092.80c 2.5527e-02
         42094.80c 1.6075e-02
         42095.80c 2.7829e-02
         42096.80c 2.9287e-02
         42097.80c 1.6866e-02
         42098.80c 4.2850e-02
         42100.80c 1.7253e-02
         92234.80c 8.1182e-03
         92235.80c 7.6840e-01
         92236.80c 3.6961e-03
         92238.80c 4.4102e-02
c
c ------------------------------------------------------------------------------
c
c       name: Sodium
c       density = 1.0
  m2
        11023.80c -1.0000e+00
c
c ------------------------------------------------------------------------------
c
c       name: Beryllium Oxide
c       density = 3.0
  m5
        4009.80c -3.6032e-01
        8016.80c -6.3968e-01
c
c ------------------------------------------------------------------------------
c
c       name: Boron Carbide
c       density = 2.5
  m6
        5010 -1.4424e-01
        5011 -6.3837e-01
        6012 -2.1487e-01
        6013 -2.5183e-03
c ------------------------------------------------------------------------------
c
c       name: Steel, Stainless 316
c       density = 8.0
  m7
        6012.80c -4.0525e-04
        6013.80c -4.7496e-06
        14028.80c -4.6576e-03
        14029.80c -2.4506e-04
        14030.80c -1.6730e-04
        15031.80c -2.3000e-04
        16032.80c -1.4207e-04
        16033.80c -1.1568e-06
        16034.80c -6.7534e-06
        16036.80c -1.6826e-08
        24050.80c -7.0953e-03
        24052.80c -1.4229e-01
        24053.80c -1.6445e-02
        24054.80c -4.1707e-03
        25055.80c -1.0140e-02
        26054.80c -3.7769e-02
        26056.80c -6.1482e-01
        26057.80c -1.4453e-02
        26058.80c -1.9571e-03
        28058.80c -8.0637e-02
        28060.80c -3.2131e-02
        28061.80c -1.4200e-03
        28062.80c -4.6019e-03
        28064.80c -1.2096e-03
        42092.80c -3.4791e-03
        42094.80c -2.2385e-03
        42095.80c -3.9165e-03
        42096.80c -4.1651e-03
        42097.80c -2.4237e-03
        42098.80c -6.2211e-03
        42100.80c -2.5560e-03


OTHER PNNL MATS FOR FUTURE USE
c ------------------------------------------------------------------------------
c
c       Aluminum, Alloy 6061-O
c       rho = 2.7 g/cm^3
c
c m13   12024.00c  0.00881687922435
c       12025.00c  0.0011162019527
c       12026.00c  0.00122893834992
c       13027.00c  0.977324712523
c       14028.00c  0.00534499965894
c       14029.00c  0.00027153013242
c       14030.00c  0.000179204091663
c       22046.00c  4.11473670684e-05
c       22047.00c  3.71074437563e-05
c       22048.00c  0.000367682897004
c       22049.00c  2.69826976776e-05
c       22050.00c  2.58355589593e-05
c       24050.00c  4.4207166807e-05
c       24052.00c  0.000852491208192
c       24053.00c  9.66656598006e-05
c       24054.00c  2.40621287684e-05
c       25055.00c  0.000434559056892
c       26054.00c  0.000116134627359
c       26056.00c  0.00182306528635
c       26057.00c  4.21025278655e-05
c       26058.00c  5.60307355265e-06
c       29063.00c  0.000811849845839
c       29065.00c  0.00036219186904
c       30064.00c  0.000297894307017
c       30066.00c  0.000168000999259
c       30067.00c  2.44761643349e-05
c       30068.00c  0.000111778522767
c       30070.00c  3.69565847631e-06
c mt13  al-27.80t
c
c ------------------------------------------------------------------------------
c
c       Cadmium
c       rho = 8.65 g/cm^3
c
  m51   48106.00c  0.0125
        48108.00c  0.0089
        48110.00c  0.1249
        48111.00c  0.128
        48112.00c  0.2413
        48113.00c  0.1222
        48114.00c  0.2873
        48116.00c  0.0749
c
c ------------------------------------------------------------------------------
c
c       Carbon, Graphite (Reactor Grade)
c       rho = 1.7 g/cm^3
c
  m63    5010.00c  2.21083154061e-07
         5011.00c  8.89887469362e-07
         6012.00c  0.989298900917
         6013.00c  0.0106999881126
  mt63   grph.80t
c
c ------------------------------------------------------------------------------
c
c       Concrete, Regular
c       rho = 2.3 g/cm^3
c
  m99    1001.00c  0.168018339318
         1002.00c  1.93243313197e-05
         8016.00c  0.561814342918
         8017.00c  0.000214009493378
         8018.00c  0.00115452489848
        11023.00c  0.0213651046802
        13027.00c  0.0213429205057
        14028.00c  0.187425486395
        14029.00c  0.00952136022209
        14030.00c  0.00628389451584
        20040.00c  0.0180258406267
        20042.00c  0.000120307391976
        20043.00c  2.51027788512e-05
        20044.00c  0.000387884419878
        20046.00c  7.43786040034e-07
        20048.00c  3.47719973716e-05
        26054.00c  0.0002481811386
        26056.00c  0.0038959131208
        26057.00c  8.99736240706e-05
        26058.00c  1.19738376536e-05
c
c       Reinforced Concrete w/ 36 in (OC) rebar
c       rho = 2.54
c       vfrac rebar = 0.0436
c       rebar: Carbon Steel
c       Homogeneous Mixture Created July 5, 2018 by Alex Swenson
m100
        1001.00c 1.6034e-01
        1002.00c 1.8442e-05
        6012.00c 1.0318e-03
        6013.00c 1.1160e-05
        8016.00c 5.3615e-01
        8017.00c 2.0423e-04
        8018.00c 1.1018e-03
        11023.00c 2.0389e-02
        13027.00c 2.0368e-02
        14028.00c 1.7886e-01
        14029.00c 9.0864e-03
        14030.00c 5.9968e-03
        20040.00c 1.7202e-02
        20042.00c 1.1481e-04
        20043.00c 2.3956e-05
        20044.00c 3.7017e-04
        20046.00c 7.0981e-07
        20048.00c 3.3184e-05
        26054.00c 2.8459e-03
        26056.00c 4.4675e-02
        26057.00c 1.0317e-03
        26058.00c 1.3730e-04
c
c ------------------------------------------------------------------------------
c
c       Earth, U.S. Average
c       rho = 1.52 g/cm^3
c
  m105   8016.00c  0.668974598141
         8017.00c  0.000254829583181
         8018.00c  0.00137473854084
        11023.00c  0.00557806125867
        12024.00c  0.00902972820518
        12025.00c  0.00114314827259
        12026.00c  0.00125860624812
        13027.00c  0.0530728760518
        14028.00c  0.185981218049
        14029.00c  0.0094479902688
        14030.00c  0.00623547191272
        19039.00c  0.00713729192509
        19040.00c  8.95432305865e-07
        19041.00c  0.000515080214097
        20040.00c  0.025848817839
        20042.00c  0.00017251921418
        20043.00c  3.59970539634e-05
        20044.00c  0.000556221144945
        20046.00c  1.06657937669e-06
        20048.00c  4.98625858603e-05
        22046.00c  0.00016576743163
        22047.00c  0.000149492083798
        22048.00c  0.001481257583
        22049.00c  0.000108703249105
        22050.00c  0.000104081854042
        25055.00c  0.000272200771183
        26054.00c  0.00123034201872
        26056.00c  0.0193137385091
        26057.00c  0.000446038449559
        26058.00c  5.93595293892e-05
c
c ------------------------------------------------------------------------------
c
c       Gold
c       rho = 19.32 g/cm^3
c
  m148  79197.00c  1.0
c
c ------------------------------------------------------------------------------
c
c       Inconel-718
c       rho = 8.19 g/cm^3
c
c m156   5010.00c  5.31119209289e-05
c        5011.00c  0.000213782154091
c        6012.00c  0.00346990171821
c        6013.00c  3.75295141867e-05
c       13027.00c  0.0106939762758
c       14028.00c  0.00602587540807
c       14029.00c  0.000306119149093
c       14030.00c  0.000202032104375
c       15031.00c  0.000260837483111
c       16032.00c  0.000239339004716
c       16033.00c  1.88971737591e-06
c       16034.00c  1.07083984635e-05
c       16036.00c  2.51962316787e-08
c       22046.00c  0.000895155500448
c       22047.00c  0.000807267505858
c       22048.00c  0.00799889254461
c       22049.00c  0.0005870050009
c       22050.00c  0.000562049150584
c       24050.00c  0.00916237933818
c       24052.00c  0.176687365332
c       24053.00c  0.020034928905
c       24054.00c  0.00498711786762
c       25055.00c  0.00334033366107
c       26054.00c  0.0102679546194
c       26056.00c  0.161184928682
c       26057.00c  0.00372246293216
c       26058.00c  0.000495391480353
c       27059.00c  0.00891081307036
c       28058.00c  0.351404046272
c       28060.00c  0.135359494475
c       28061.00c  0.00588400593954
c       28062.00c  0.0187613018579
c       28064.00c  0.00477730283099
c       29063.00c  0.00171436093619
c       29065.00c  0.00076483058397
c       41093.00c  0.0318334923315
c       42092.00c  0.00266509131225
c       42094.00c  0.00167829218906
c       42095.00c  0.00290537139614
c       42096.00c  0.00305760992258
c       42097.00c  0.00176083114918
c       42098.00c  0.00447361163838
c       42100.00c  0.00180118352968
c mt156 fe-56.80t
c
c ------------------------------------------------------------------------------
c
c       Lead
c       rho = 11.35 g/cm^3
c
  m171  82204.00c  0.014
        82206.00c  0.241
        82207.00c  0.221
        82208.00c  0.524
c
c ------------------------------------------------------------------------------
c
c       Polyethylene, Non-borated
c       rho = 0.93 g/cm^3
c
  m248   1001.00c  0.666585860082
         1002.00c  7.66661905213e-05
         6012.00c  0.329770762759
         6013.00c  0.00356671096889
  mt248 h-poly.80t
c
c ------------------------------------------------------------------------------
c
c       Water, Heavy
c       rho = 1.10534 g/cm^3
c
c m353   1002.00c  0.666667317193
c        8016.00c  0.332522684388
c        8017.00c  0.000126666419467
c        8018.00c  0.000683331999754
c mt353 d-d2o.80t  o-d2o.80t
c
c ------------------------------------------------------------------------------
c
c       Water, Liquid
c       rho = 0.998207 g/cm^3
c
  m354   1001.00c  0.666580189038
         1002.00c  7.66655382762e-05
         8016.00c  0.332533121581
         8017.00c  0.000126670395261
         8018.00c  0.00068335344812
  mt354 h-h2o.80t
c
c ------------------------------------------------------------------------------
c     Other materials
c ------------------------------------------------------------------------------
c
c       5% Borated Polyethylene (SWX-201)
c       rho = 0.95 g/cm^3
c
  m501   1001.00c  0.61068220656
         1002.00c  7.02365309555e-05
         5010.00c  0.00484250907665
         5011.00c  0.0194917073889
         6012.00c  0.361008767701
         6013.00c  0.00390457274274
  mt501 h-poly.80t
c
c ------------------------------------------------------------------------------
c
c       Beryllium (Grade S-65)
c       rho = 1.851554 g/cm^3
c
  m601   4009.00c  0.997228663014
         6012.00c  0.000401673120413
         6013.00c  4.34438733288e-06
         8016.00c  0.00194498699147
         8017.00c  7.40895432661e-07
         8018.00c  3.99693588672e-06
        12024.00c  1.76095166314e-05
        12025.00c  2.22933493244e-06
        12026.00c  2.45449776062e-06
        13027.00c  0.000100409582924
        14028.00c  8.00647751833e-05
        14029.00c  4.06735273992e-06
        14030.00c  2.68436599185e-06
        20040.00c  6.55304399796e-06
        20042.00c  4.37360813967e-08
        20043.00c  9.12576659746e-09
        20044.00c  1.41009993499e-07
        20046.00c  2.70393084369e-10
        20048.00c  1.26408766943e-08
        22046.00c  2.33470455533e-06
        22047.00c  2.10547901717e-06
        22048.00c  2.08623539174e-05
        22049.00c  1.53100019931e-06
        22050.00c  1.46591146626e-06
        24050.00c  4.52783522934e-07
        24052.00c  8.73147954041e-06
        24053.00c  9.90079689619e-07
        24054.00c  2.46451790964e-07
        25055.00c  4.93138240412e-06
        26054.00c  4.53691824137e-06
        26056.00c  7.1219913827e-05
        26057.00c  1.64477840094e-06
        26058.00c  2.1888981079e-07
        27059.00c  4.59707820571e-06
        28058.00c  1.57117083906e-05
        28060.00c  6.05208997353e-06
        28061.00c  2.63081163895e-07
        28062.00c  8.38840949463e-07
        28064.00c  2.13599102715e-07
        29063.00c  1.47406138929e-05
        29065.00c  6.57625363116e-06
        30064.00c  2.03756698674e-06
        30066.00c  1.14910987477e-06
        30067.00c  1.67414493114e-07
        30068.00c  7.64553811374e-07
        30070.00c  2.5277930891e-08
        40090.00c  7.63993831059e-06
        40091.00c  1.6660856724e-06
        40092.00c  2.54664610353e-06
        40094.00c  2.58079937489e-06
        40096.00c  4.15778955678e-07
        42092.00c  4.10221298875e-07
        42094.00c  2.58329310716e-07
        42095.00c  4.47206151011e-07
        42096.00c  4.706393016e-07
        42097.00c  2.71034030916e-07
        42098.00c  6.88595834795e-07
        42100.00c  2.77245227457e-07
        47107.00c  1.30198283792e-06
        47109.00c  1.20960657916e-06
        82204.00c  1.8303945747e-08
        82206.00c  3.15089351787e-07
        82207.00c  2.88940857863e-07
        82208.00c  6.85090540815e-07
        92234.00c  1.84385901107e-10
        92235.00c  2.45984450292e-08
        92238.00c  3.38977089327e-06
  mt601 be-met.80t
c
c ------------------------------------------------------------------------------
c
c       Beryllium (Grade S-200-F)
c       rho = 1.854039 g/cm^3
c
  m602   4009.00c  0.995099251443
         6012.00c  0.000662159092611
         6013.00c  7.16173283224e-06
         8016.00c  0.00320631567303
         8017.00c  1.2213678797e-06
         8018.00c  6.58895829838e-06
        12024.00c  0.000139340783873
        12025.00c  1.76403068582e-05
        12026.00c  1.94219778509e-05
        13027.00c  0.000198630522999
        14028.00c  0.000105589577577
        14029.00c  5.36403251844e-06
        14030.00c  3.54014696841e-06
        20040.00c  5.18530012233e-05
        20042.00c  3.46075363278e-07
        20043.00c  7.22104699266e-08
        20044.00c  1.11578548346e-06
        20046.00c  2.13956947931e-09
        20048.00c  1.00024873158e-07
        22046.00c  3.69481536218e-06
        22047.00c  3.33205167208e-06
        22048.00c  3.30159743637e-05
        22049.00c  2.42290316478e-06
        22050.00c  2.31989619104e-06
        24050.00c  1.79139531002e-06
        24052.00c  3.45452754042e-05
        24053.00c  3.91715692531e-06
        24054.00c  9.75063270011e-07
        25055.00c  3.90210988837e-05
        26054.00c  7.29214247969e-06
        26056.00c  0.000114471042101
        26057.00c  2.64363557134e-06
        26058.00c  3.51819363434e-07
        27059.00c  3.63758128129e-05
        28058.00c  2.48647570398e-05
        28060.00c  9.57780930202e-06
        28061.00c  4.16342326331e-07
        28062.00c  1.32751804481e-06
        28064.00c  3.38033882814e-07
        29063.00c  2.33279395181e-05
        29065.00c  1.04073309347e-05
        30064.00c  1.61228832721e-05
        30066.00c  9.09268971191e-06
        30067.00c  1.32471930891e-06
        30068.00c  6.04977011124e-06
        30070.00c  2.00019499613e-07
        40090.00c  1.20906781852e-05
        40091.00c  2.63668433894e-06
        40092.00c  4.03022606175e-06
        40094.00c  4.08427574071e-06
        40096.00c  6.57996091713e-07
        42092.00c  3.24600376849e-06
        42094.00c  2.04411111367e-06
        42095.00c  3.53865792793e-06
        42096.00c  3.72408002895e-06
        42097.00c  2.14464116844e-06
        42098.00c  5.44872896857e-06
        42100.00c  2.19378919522e-06
        47107.00c  1.03023446368e-05
        47109.00c  9.57138872384e-06
        82204.00c  1.44835670492e-07
        82206.00c  2.49324261347e-06
        82207.00c  2.28633451277e-06
        82208.00c  5.42099223842e-06
        92234.00c  4.8633695316e-10
        92235.00c  6.48809520474e-08
        92238.00c  8.94087258433e-06
  mt602 be-met.80t
c
c ------------------------------------------------------------------------------
c
c       Aluminum 6061
c       rho = 2.7 g/cm^3
c
  m606  12024.00c  0.00923751877843
        12025.00c  0.00116945420666
        12026.00c  0.00128756908154
        13027.00c  0.977699971169
        14028.00c  0.00631111252531
        14029.00c  0.000320609416101
        14030.00c  0.000211595371309
        22046.00c  1.39968973261e-05
        22047.00c  1.26226564977e-05
        22048.00c  0.000125072881319
        22049.00c  9.17857145867e-06
        22050.00c  8.78835492716e-06
        24050.00c  4.07175576047e-05
        24052.00c  0.000785197568272
        24053.00c  8.90351012203e-05
        24054.00c  2.21627212279e-05
        25055.00c  0.000591287261838
        26054.00c  5.09990482439e-05
        26056.00c  0.000800575991885
        26057.00c  1.84887909716e-05
        26058.00c  2.46051866634e-06
        29063.00c  0.000795349342338
        29065.00c  0.000354830473046
        30064.00c  2.0359189805e-05
        30066.00c  1.14818046226e-05
        30067.00c  1.6727908646e-06
        30068.00c  7.63935431976e-06
        30070.00c  2.52574858268e-07
  mt606 al-27.80t
c
c ------------------------------------------------------------------------------
c
c       Heavy Water (99% Deuterium)
c       rho = 1.10534 g/cm^3
c
  m608   1001.00c  0.00666666666667
         1002.00c  0.66
         8016.00c  0.332523333333
         8017.00c  0.000126666666667
         8018.00c  0.000683333333333
  mt608 d-d2o.80t  o-d2o.80t
c

