Config = {}

Config.ChopWaitTime = 1

Config.ChopQueueList = {}

Config = {
    Pedspawn = true,
	Invincible = true,
	Frozen = true,
	Stoic = true,
	Fade = true,
	Distance = 40.0,
    MinusOne = true,
}

Config.PedList = {
    [1] = { model = "cs_joeminuteman", coords = vector3(472.32, -1876.42, 26.87), heading = 30.47, gender = "male"},
}

Config.MainLocations = { --Actual chop location and the list location
    ["dropoff"] = vector3(2342.08, 3051.5, 48.15), -- Blip location for vehicle drop off, scrap yard north of the prison
}

Config.Items = { -- Available items for the final "Chop Body" option, will give 15-20 of 2-3 different items.  Other car parts have specific items that can be edited in the server/main.lua
"metalscrap",
"plastic",
"copper",
"iron",
"aluminum",
"steel",
"glass",
}

Config.CarLocations = { --Vector4 of exactly where the car will spawn, stand somewhat in the middle of the parking space/area you want the car to spawn and grab that vector4
    [1] = {
        coords = vector4(384.78, -1653.03, 48.3, 138.42),
        occupied = false,
        },
    [2] = {
        coords = vector4(335.15, -1241.93, 30.59, 180.83),
        occupied = false,
        },
    [3] = {
        coords = vector4(-354.9, -1087.82, 23.03, 250.96),
        occupied = false,
        },
    [4] = {
        coords = vector4(736.22, -549.49, 26.78, 143.88),
        occupied = false,
        },
    [5] = {
        coords = vector4(15.88, -1748.4, 29.3, 50.85),
        occupied = false,
        },
    [6] = {
        coords = vector4(0.03, -1719.34, 29.3, 203.22),
        occupied = false,
        },
    [7] = {
        coords = vector4(3.04, -1718.54, 29.3, 203.35),
        occupied = false,
        },
    [8] = {
        coords = vector4(5.83, -1717.05, 29.3, 195.98),
        occupied = false,
        },
    [9] = {
        coords = vector4(5.83, -1717.05, 29.3, 195.98),
        occupied = false,
        },
    [10] = {
        coords = vector4(14.36, -1713.61, 29.3, 202.14),
        occupied = false,
        },
    [11] = {
        coords = vector4(17.02, -1712.29, 29.3, 203.63),
        occupied = false,
        },
    [12] = {
        coords = vector4(19.99, -1711.24, 29.3, 198.59),
        occupied = false,
        },
    [13] = {
        coords = vector4(22.78, -1710.11, 29.3, 210.89),
        occupied = false,
        },
    [14] = {
        coords = vector4(25.75, -1708.78, 29.3, 199.55),
        occupied = false,
        },
    [15] = {
        coords = vector4(34.19, -1705.73, 29.3, 199.79),
        occupied = false,
        },
    [16] = {
        coords = vector4(45.78, -1713.2, 29.3, 50.43),
        occupied = false,
        },
    [17] = {
        coords = vector4(43.46, -1715.45, 29.3, 54.55),
        occupied = false,
        },
    [18] = {
        coords = vector4(49.1, -1720.53, 29.3, 235.3),
        occupied = false,
        },
    [19] = {
        coords = vector4(47.49, -1722.74, 29.3, 238.53),
        occupied = false,
        },
    [20] = {
        coords = vector4(45.36, -1725.13, 29.3, 233.11),
        occupied = false,
        },
    [21] = {
        coords = vector4(38.01, -1722.86, 29.3, 53.49),
        occupied = false,
        },
    [22] = {
        coords = vector4(36.2, -1725.28, 29.3, 47.33),
        occupied = false,
        },
    [23] = {
        coords = vector4(38.69, -1731.21, 29.3, 232.8),
        occupied = false,
        },
    [24] = {
        coords = vector4(36.75, -1734.21, 29.3, 231.43),
        occupied = false,
        },
    [25] = {
        coords = vector4(28.47, -1734.71, 29.3, 51.72),
        occupied = false,
        },
    [26] = {
        coords = vector4(8.15, -1757.96, 29.3, 57.18),
        occupied = false,
        },
    [27] = {
        coords = vector4(6.09, -1760.36, 29.3, 53.37),
        occupied = false,
        },
    [28] = {
        coords = vector4(4.34, -1762.83, 29.3, 49.41),
        occupied = false,
        },
    [29] = {
        coords = vector4(9.91, -1767.57, 29.3, 231.54),
        occupied = false,
        },
    [30] = {
        coords = vector4(11.93, -1765.34, 29.3, 240.53),
        occupied = false,
        },
    [31] = {
        coords = vector4(269.25, -1906.37, 26.47, 50.3),
        occupied = false,
        },
    [32] = {
        coords = vector4(271.81, -1940.58, 24.86, 224.19),
        occupied = false,
        },
    [33] = {
        coords = vector4(275.71, -1935.96, 25.17, 234.68),
        occupied = false,
        },
    [34] = {
        coords = vector4(288.79, -1921.51, 26.25, 232.89),
        occupied = false,
        },
    [35] = {
        coords = vector4(316.76, -1943.4, 24.65, 231.21),
        occupied = false,
        },
    [36] = {
        coords = vector4(299.42, -1976.89, 22.31, 232.31),
        occupied = false,
        },
    [37] = {
        coords = vector4(287.46, -2019.73, 19.53, 318.59),
        occupied = false,
        },
    [38] = {
        coords = vector4(152.26, -1965.24, 18.92, 231.64),
        occupied = false,
        },
    [39] = {
        coords = vector4(90.92, -1965.14, 20.75, 323.29),
        occupied = false,
        },
    [40] = {
        coords = vector4(113.55, -1947.54, 20.62, 341.12),
        occupied = false,
        },
    [41] = {
        coords = vector4(50.27, -1880.74, 22.09, 142.72),
        occupied = false,
        },
    [42] = {
        coords = vector4(40.82, -1855.46, 22.83, 131.93),
        occupied = false,
        },
    [43] = {
        coords = vector4(0.82, -1877.88, 23.69, 316.55),
        occupied = false,
        },
    [44] = {
        coords = vector4(-54.4, -1846.23, 26.38, 315.63),
        occupied = false,
        },
    [45] = {
        coords = vector4(-59.51, -1842.13, 26.58, 321.85),
        occupied = false,
        },
    [46] = {
        coords = vector4(362.38, -1704.19, 48.3, 320.52),
        occupied = false,
        },
    [47] = {
        coords = vector4(356.73, -1699.66, 48.3, 322.81),
        occupied = false,
        },
    [48] = {
        coords = vector4(351.13, -1695.42, 48.3, 325.43),
        occupied = false,
        },
    [49] = {
        coords = vector4(346.18, -1690.57, 48.3, 319.05),
        occupied = false,
        },
    [50] = {
        coords = vector4(361.26, -1672.83, 48.3, 54.34),
        occupied = false,
        },
    [51] = {
        coords = vector4(370.44, -1661.56, 43.04, 51.43),
        occupied = false,
        },
    [52] = {
        coords = vector4(365.19, -1667.02, 43.04, 52.34),
        occupied = false,
        },
    [53] = {
        coords = vector4(358.71, -1675.15, 43.04, 45.75),
        occupied = false,
        },
    [54] = {
        coords = vector4(348.26, -1692.75, 43.04, 319.48),
        occupied = false,
        },
    [55] = {
        coords = vector4(356.61, -1699.33, 43.04, 316.9),
        occupied = false,
        },
    [56] = {
        coords = vector4(361.97, -1703.94, 43.04, 318.75),
        occupied = false,
        },
    [57] = {
        coords = vector4(379.63, -1679.36, 43.04, 226.45),
        occupied = false,
        },
    [58] = {
        coords = vector4(395.55, -1662.46, 37.78, 141.37),
        occupied = false,
        },
    [59] = {
        coords = vector4(379.52, -1648.64, 37.78, 140.67),
        occupied = false,
        },
    [60] = {
        coords = vector4(365.39, -1667.1, 37.79, 52.4),
        occupied = false,
        },
    [61] = {
        coords = vector4(359.23, -1676.22, 37.79, 50.92),
        occupied = false,
        },
    [62] = {
        coords = vector4(1155.48, -1657.5, 36.58, 217.34),
        occupied = false,
        },
    [63] = {
        coords = vector4(1229.38, -1606.74, 51.7, 214.5),
        occupied = false,
        },
    [64] = {
        coords = vector4(1252.4, -1618.34, 53.45, 35.18),
        occupied = false,
        },
    [65] = {
        coords = vector4(1353.35, -1576.21, 53.96, 215.85),
        occupied = false,
        },
    [66] = {
        coords = vector4(1394.33, -1533.05, 57.48, 47.39),
        occupied = false,
        },
    [67] = {
        coords = vector4(1374.29, -1523.18, 57.02, 205.09),
        occupied = false,
        },
    [68] = {
        coords = vector4(1200.18, -1059.55, 41.11, 128.77),
        occupied = false,
        },
    [69] = {
        coords = vector4(1212.2, -1069.25, 39.8, 125.58),
        occupied = false,
        },
    [70] = {
        coords = vector4(1362.42, -556.43, 74.34, 158.85),
        occupied = false,
        },
    [71] = {
        coords = vector4(1388.93, -577.59, 74.34, 100.61),
        occupied = false,
        },
    [72] = {
        coords = vector4(1378.08, -596.31, 74.34, 41.44),
        occupied = false,
        },
    [73] = {
        coords = vector4(1319.63, -575.03, 72.98, 342.99),
        occupied = false,
        },
    [74] = {
        coords = vector4(1295.52, -567.41, 71.18, 350.24),
        occupied = false,
        },
    [75] = {
        coords = vector4(1262.15, -493.93, 69.27, 256.89),
        occupied = false,
        },
    [76] = {
        coords = vector4(1234.55, -431.58, 67.76, 191.24),
        occupied = false,
        },
    [77] = {
        coords = vector4(1052.62, -488.69, 63.88, 266.86),
        occupied = false,
        },
    [78] = {
        coords = vector4(1099.38, -332.41, 67.21, 120.53),
        occupied = false,
        },
    [79] = {
        coords = vector4(1062.15, 236.56, 80.86, 327.2),
        occupied = false,
        },
    [80] = {
        coords = vector4(1130.59, 255.76, 80.86, 69.84),
        occupied = false,
        },
    [81] = {
        coords = vector4(1123.39, 242.98, 80.86, 69.6),
        occupied = false,
        },
    [82] = {
        coords = vector4(841.94, -194.3, 72.57, 144.87),
        occupied = false,
        },
    [83] = {
        coords = vector4(946.09, -255.36, 67.53, 149.35),
        occupied = false,
        },
    [84] = {
        coords = vector4(634.7, 156.38, 95.6, 247.47),
        occupied = false,
        },
    [85] = {
        coords = vector4(604.03, 118.16, 92.9, 247.41),
        occupied = false,
        },
    [86] = {
        coords = vector4(608.4, 129.85, 92.9, 248.96),
        occupied = false,
        },
    [87] = {
        coords = vector4(625.61, 188.39, 97.28, 244.91),
        occupied = false,
        },
    [88] = {
        coords = vector4(443.13, 253.01, 103.21, 66.27),
        occupied = false,
        },
    [89] = {
        coords = vector4(357.16, 278.92, 103.3, 247.14),
        occupied = false,
        },
    [90] = {
        coords = vector4(349.54, 349.27, 105.1, 74.84),
        occupied = false,
        },
    [91] = {
        coords = vector4(334.92, 339.89, 105.2, 168.26),
        occupied = false,
        },
    [92] = {
        coords = vector4(324.34, 342.92, 105.2, 168.64),
        occupied = false,
        },
    [93] = {
        coords = vector4(281.68, 312.98, 105.48, 34.7),
        occupied = false,
        },
    [94] = {
        coords = vector4(181.55, 392.49, 108.72, 181.47),
        occupied = false,
        },
    [95] = {
        coords = vector4(186.94, 381.11, 108.45, 354.46),
        occupied = false,
        },
    [96] = {
        coords = vector4(109.76, 318.13, 112.12, 348.45),
        occupied = false,
        },
    [97] = {
        coords = vector4(122.2, 295.93, 109.97, 160.73),
        occupied = false,
        },
    [98] = {
        coords = vector4(107.94, 286.99, 109.97, 249.07),
        occupied = false,
        },
    [99] = {
        coords = vector4(96.18, 307.2, 110.02, 163.93),
        occupied = false,
        },
    [100] = {
        coords = vector4(-19.2, 190.98, 101.97, 342.84),
        occupied = false,
        },
    [101] = {
        coords = vector4(-29.38, 194.58, 101.98, 339.77),
        occupied = false,
        },
    [102] = {
        coords = vector4(-38.98, 198.12, 101.98, 344.04),
        occupied = false,
        },
    [103] = {
        coords = vector4(-48.39, 201.36, 101.98, 340.68),
        occupied = false,
        },
    [104] = {
        coords = vector4(-57.96, 205.79, 101.98, 343.24),
        occupied = false,
        },
    [105] = {
        coords = vector4(-87.65, 206.13, 95.41, 358.13),
        occupied = false,
        },
    [106] = {
        coords = vector4(-91.23, 190.51, 88.38, 175.86),
        occupied = false,
        },
    [107] = {
        coords = vector4(-123.41, 210.23, 93.15, 182.66),
        occupied = false,
        },
    [108] = {
        coords = vector4(-274.81, 178.02, 79.69, 355.51),
        occupied = false,
        },
    [109] = {
        coords = vector4(-289.92, 112.56, 68.2, 8.3),
        occupied = false,
        },
    [110] = {
        coords = vector4(-317.38, 113.46, 67.4, 48.91),
        occupied = false,
        },
    [111] = {
        coords = vector4(-525.95, 92.97, 59.99, 93.02),
        occupied = false,
        },
    [112] = {
        coords = vector4(-696.98, 40.3, 43.21, 123.35),
        occupied = false,
        },
    [113] = {
        coords = vector4(-739.98, -74.53, 41.75, 32.51),
        occupied = false,
        },
    [114] = {
        coords = vector4(-891.44, -2.59, 43.42, 21.35),
        occupied = false,
        },
    [115] = {
        coords = vector4(-1199.28, 322.92, 70.8, 16.62),
        occupied = false,
        },
    [116] = {
        coords = vector4(-1184.69, 326.61, 70.62, 21.92),
        occupied = false,
        },
    [117] = {
        coords = vector4(-1196.36, 345.14, 71.13, 111.06),
        occupied = false,
        },
    [118] = {
        coords = vector4(-1098.14, 358.93, 68.49, 359.61),
        occupied = false,
        },
    [119] = {
        coords = vector4(78.32, 6398.52, 31.23, 136.53),
        occupied = false,
        },
    [120] = {
        coords = vector4(72.48, 6404.28, 31.23, 134.18),
        occupied = false,
        },
    [121] = {
        coords = vector4(61.85, 6403.79, 31.23, 36.87),
        occupied = false,
        },
    [122] = {
        coords = vector4(50.88, 6393.46, 31.23, 218.45),
        occupied = false,
        },
    [123] = {
        coords = vector4(45.22, 6388.11, 31.23, 212.3),
        occupied = false,
        },
    [124] = {
        coords = vector4(54.11, 6367.83, 31.24, 34.13),
        occupied = false,
        },
    [125] = {
        coords = vector4(73.94, 6363.39, 31.23, 192.24),
        occupied = false,
        },
    [126] = {
        coords = vector4(8.87, 6349.74, 31.23, 217.7),
        occupied = false,
        },
    [127] = {
        coords = vector4(-2.58, 6338.09, 31.23, 32.65),
        occupied = false,
        },
    [128] = {
        coords = vector4(-32.31, 6373.88, 31.3, 52.4),
        occupied = false,
        },
    [129] = {
        coords = vector4(-23.92, 6381.72, 31.29, 47.94),
        occupied = false,
        },
    [130] = {
        coords = vector4(-64.32, 6350.16, 31.49, 316.76),
        occupied = false,
        },
    [131] = {
        coords = vector4(-72.71, 6358.21, 31.49, 314.92),
        occupied = false,
        },
    [132] = {
        coords = vector4(-83.04, 6342.12, 31.49, 226.39),
        occupied = false,
        },
    [133] = {
        coords = vector4(-138.56, 6276.59, 31.34, 228.92),
        occupied = false,
        },
    [134] = {
        coords = vector4(-223.75, 6345.29, 32.35, 283.26),
        occupied = false,
        },
    [135] = {
        coords = vector4(-358.6, 6328.15, 29.85, 46.61),
        occupied = false,
        },
    [136] = {
        coords = vector4(-316.92, 6314.4, 32.19, 228.29),
        occupied = false,
        },
    [137] = {
        coords = vector4(-224.15, 6387.59, 31.6, 221.27),
        occupied = false,
        },
    [138] = {
        coords = vector4(-173.21, 6446.9, 31.51, 224.96),
        occupied = false,
        },
    [139] = {
        coords = vector4(-106.93, 6488.99, 31.27, 129.25),
        occupied = false,
        },
    [140] = {
        coords = vector4(-106.08, 6535.49, 29.81, 226.5),
        occupied = false,
        },
    [141] = {
        coords = vector4(-51.75, 6622.14, 29.95, 42.33),
        occupied = false,
        },
    [142] = {
        coords = vector4(-16.65, 6645.48, 31.11, 26.17),
        occupied = false,
        },
    [143] = {
        coords = vector4(-329.69, 6098.89, 31.45, 244.43),
        occupied = false,
        },
    [144] = {
        coords = vector4(-269.12, 6066.74, 31.46, 302.4),
        occupied = false,
        },
    [145] = {
        coords = vector4(-256.52, 6056.31, 31.99, 305.94),
        occupied = false,
        },
    [146] = {
        coords = vector4(-384.98, 6100.29, 31.44, 298.65),
        occupied = false,
        },
    [147] = {
        coords = vector4(-697.77, 5780.91, 17.33, 335.0),
        occupied = false,
        },
    [148] = {
        coords = vector4(-772.38, 5575.62, 33.49, 276.37),
        occupied = false,
        },
    [149] = {
        coords = vector4(-757.05, 5529.87, 33.49, 28.75),
        occupied = false,
        },
    [150] = {
        coords = vector4(-1124.1, -862.14, 13.57, 38.38),
        occupied = false,
        },
    [151] = {
        coords = vector4(-1127.39, -864.41, 13.55, 38.82),
        occupied = false,
        },
    [152] = {
        coords = vector4(-1127.39, -864.41, 13.55, 38.82),
        occupied = false,
        },
    [153] = {
        coords = vector4(-1326.83, -928.03, 11.2, 285.95),
        occupied = false,
        },
    [154] = {
        coords = vector4(-1297.7, -1315.61, 4.73, 357.64),
        occupied = false,
        },
    [155] = {
        coords = vector4(-1302.45, -1302.44, 4.72, 197.17),
        occupied = false,
        },
    [156] = {
        coords = vector4(-1272.85, -1363.85, 4.3, 111.03),
        occupied = false,
        },
    [157] = {
        coords = vector4(-1245.45, -1408.1, 4.31, 318.76),
        occupied = false,
        },
    [158] = {
        coords = vector4(-1191.98, -1482.27, 4.38, 307.51),
        occupied = false,
        },
    [159] = {
        coords = vector4(-1184.7, -1492.62, 4.38, 308.51),
        occupied = false,
        },
    [160] = {
        coords = vector4(-1110.24, -1503.56, 4.62, 29.83),
        occupied = false,
        },
    [161] = {
        coords = vector4(-1100.45, -1498.32, 4.82, 211.72),
        occupied = false,
        },
    [162] = {
        coords = vector4(-1034.7, -1599.15, 4.91, 215.34),
        occupied = false,
        },
    [163] = {
        coords = vector4(-1052.85, -1683.44, 4.53, 14.45),
        occupied = false,
        },
    [164] = {
        coords = vector4(-1073.66, -1703.7, 4.52, 0.38),
        occupied = false,
        },
    [165] = {
        coords = vector4(-1168.1, -1738.19, 4.07, 213.06),
        occupied = false,
        },
    [166] = {
        coords = vector4(-680.36, -1403.65, 5.0, 268.65),
        occupied = false,
        },
    [167] = {
        coords = vector4(-638.03, -1163.64, 9.58, 40.27),
        occupied = false,
        },
    [168] = {
        coords = vector4(-646.08, -1169.58, 9.64, 38.96),
        occupied = false,
        },
    [169] = {
        coords = vector4(-650.9, -1157.88, 9.13, 47.19),
        occupied = false,
        },
    [170] = {
        coords = vector4(-641.47, -1153.06, 9.18, 285.62),
        occupied = false,
        },
    [171] = {
        coords = vector4(-572.04, -1104.17, 22.18, 273.58),
        occupied = false,
        },
    [172] = {
        coords = vector4(-1078.63, -2178.12, 13.28, 45.0),
        occupied = false,
        },
    [173] = {
        coords = vector4(2710.24, 4335.35, 45.26, 41.97),
        occupied = false,
        },
    [174] = {
        coords = vector4(1704.73, 3765.16, 33.78, 138.43),
        occupied = false,
        },
    [175] = {
        coords = vector4(1299.28, 3635.43, 32.45, 47.92),
        occupied = false,
        },
    [176] = {
        coords = vector4(899.43, 3649.67, 32.17, 90.5),
        occupied = false,
        },
    [177] = {
        coords = vector4(104.43, 3688.78, 39.17, 82.76),
        occupied = false,
        },
    [178] = {
        coords = vector4(20.65, 3684.39, 39.11, 281.84),
        occupied = false,
        },
    [179] = {
        coords = vector4(-127.38, 2792.29, 52.52, 7.38),
        occupied = false,
        },
    [180] = {
        coords = vector4(-1159.92, 2674.14, 17.51, 220.44),
        occupied = false,
        },
    [181] = {
        coords = vector4(-495.19, 749.93, 162.24, 245.32),
        occupied = false,
        },
    [182] = {
        coords = vector4(-555.35, 665.09, 144.47, 341.3),
        occupied = false,
        },
    [183] = {
        coords = vector4(-1021.54, 693.82, 160.67, 0.87),
        occupied = false,
        },
    [184] = {
        coords = vector4(-1053.4, 768.48, 167.06, 281.36),
        occupied = false,
        },
    [185] = {
        coords = vector4(-1107.73, 793.25, 164.37, 187.15),
        occupied = false,
        },
    [186] = {
        coords = vector4(-1247.34, 662.52, 141.82, 217.08),
        occupied = false,
        },
    [187] = {
        coords = vector4(-515.27, 390.11, 93.15, 59.95),
        occupied = false,
        },
    [188] = {
        coords = vector4(-601.47, 345.24, 84.53, 357.11),
        occupied = false,
        },
    [189] = {
        coords = vector4(-503.82, 50.9, 55.91, 85.43),
        occupied = false,
        },
    [190] = {
        coords = vector4(-462.21, -375.75, 23.64, 198.81),
        occupied = false,
        },
    [191] = {
        coords = vector4(-692.0, -732.24, 37.41, 180.25),
        occupied = false,
        },
    [192] = {
        coords = vector4(-1043.53, -1010.26, 1.56, 208.19),
        occupied = false,
        },
    [193] = {
        coords = vector4(-890.7, -2290.19, 6.12, 59.31),
        occupied = false,
        },
    [194] = {
        coords = vector4(-914.46, -2268.98, 6.12, 60.24),
        occupied = false,
        },
    [195] = {
        coords = vector4(-691.9, -2146.59, 5.4, 4.6),
        occupied = false,
        },
    [196] = {
        coords = vector4(-595.64, -2200.93, 5.41, 2.94),
        occupied = false,
        },
    [197] = {
        coords = vector4(-48.63, -2008.28, 17.43, 290.18),
        occupied = false,
        },
    [198] = {
        coords = vector4(-196.31, -1960.0, 27.03, 284.3),
        occupied = false,
        },
    [199] = {
        coords = vector4(-26.28, -1678.98, 28.87, 126.08),
        occupied = false,
        },
    [200] = {
        coords = vector4(10.69, -1755.96, 28.72, 229.64),
        occupied = false,
        },
    [201] = {
        coords = vector4(857.96, -2119.61, 30.07, 273.75),
        occupied = false,
        },
    [202] = {
        coords = vector4(890.92, -2342.45, 29.77, 265.12),
        occupied = false,
        },
    [203] = {
        coords = vector4(1352.33, -1575.58, 53.41, 216.04),
        occupied = false,
        },
    [204] = {
        coords = vector4(1177.75, -1571.68, 38.81, 358.92),
        occupied = false,
        },
    [205] = {
        coords = vector4(1116.99, -1489.88, 34.11, 89.98),
        occupied = false,
        },
    [206] = {
        coords = vector4(704.19, -393.04, 40.71, 243.54),
        occupied = false,
        },
    [207] = {
        coords = vector4(914.02, -47.43, 78.18, 237.9),
        occupied = false,
        },
    [208] = {
        coords = vector4(1044.17, 207.49, 80.27, 327.25),
        occupied = false,
        },
    [209] = {
        coords = vector4(1106.31, 253.74, 80.27, 239.62),
        occupied = false,
        },
    [210] = {
        coords = vector4(1110.36, 56.64, 80.17, 359.03),
        occupied = false,
        },
    [211] = {
        coords = vector4(1735.64, 6402.61, 34.28, 157.44),
        occupied = false,
        },
    [212] = {
        coords = vector4(150.98, 6607.32, 31.29, 3.75),
        occupied = false,
        },
    [213] = {
        coords = vector4(-9.5, 6560.62, 31.38, 225.87),
        occupied = false,
        },
    [214] = {
        coords = vector4(-437.65, 6204.93, 29.0, 275.42),
        occupied = false,
        },
    [215] = {
        coords = vector4(-673.15, 5782.42, 16.74, 66.97),
        occupied = false,
        },
    [216] = {
        coords = vector4(-753.37, 5531.11, 32.9, 208.31),
        occupied = false,
        },
    [217] = {
        coords = vector4(-3237.44, 1034.25, 11.11, 263.83),
        occupied = false,
        },
    [218] = {
        coords = vector4(-3002.23, 687.29, 23.61, 105.44),
        occupied = false,
        },
    [219] = {
        coords = vector4(-3056.5, 440.83, 5.77, 245.33),
        occupied = false,
        },
    [220] = {
        coords = vector4(-2166.24, -419.41, 12.75, 200.72),
        occupied = false,
        },
    [221] = {
        coords = vector4(-2146.35, -409.06, 12.74, 224.99),
        occupied = false,
        },
    [222] = {
        coords = vector4(-2142.67, -379.77, 12.61, 346.42),
        occupied = false,
        },
    [223] = {
        coords = vector4(-2157.76, -384.35, 12.65, 81.66),
        occupied = false,
        },
    [224] = {
        coords = vector4(-2182.17, -369.63, 12.5, 346.64),
        occupied = false,
        },
    [225] = {
        coords = vector4(-2080.09, -335.5, 12.53, 266.17),
        occupied = false,
        },
    [226] = {
        coords = vector4(-2049.41, -465.51, 11.05, 137.69),
        occupied = false,
        },
    [227] = {
        coords = vector4(-2023.59, -487.45, 11.1, 139.41),
        occupied = false,
        },
    [228] = {
        coords = vector4(-1617.68, -899.11, 8.47, 140.45),
        occupied = false,
        },
    [229] = {
        coords = vector4(-1641.79, -904.13, 8.12, 138.65),
        occupied = false,
        },
    [230] = {
        coords = vector4(-1661.31, -921.88, 7.64, 318.46),
        occupied = false,
        },
    [231] = {
        coords = vector4(-1697.21, -909.49, 7.22, 138.38),
        occupied = false,
        },
    [232] = {
        coords = vector4(-1672.21, -860.85, 8.35, 318.41),
        occupied = false,
        },
    [233] = {
        coords = vector4(-1637.72, -837.35, 9.45, 138.82),
        occupied = false,
        },
}
Config.CarTypes = {
    [1] = { 
        ["type"] = "ninef",
        ["name"] = "Obey 9F",
        ["parts"] = 8
    },
    [2] = {
        ["type"] = "ninef2",
        ["name"] = "Obey 9F Cabrio",
        ["parts"] = 8
    },
    [3] = {
        ["type"] = "banshee",
        ["name"] = "Bravado Bansee",
        ["parts"] = 8
    },
    [4] = {
        ["type"] = "alpha",
        ["name"] = "Albany Alpha",
        ["parts"] = 8
    },
    [5] = {
        ["type"] = "baller",
        ["name"] = "Gallivanter Baller",
        ["parts"] = 10
    },
    [6] = {
        ["type"] = "bison",
        ["name"] = "Bravado Bison",
        ["parts"] = 10
    },
    [7] = {
        ["type"] = "huntley",
        ["name"] = "Enus Huntley",
        ["parts"] = 10
    },
    [8] = {
        ["type"] = "f620", 
        ["name"] = "Ocelot F620",
        ["parts"] = 8
    },
    [9] = {
        ["type"] = "asea",
        ["name"] = "Declasese Asea",
        ["parts"] = 10
    },
    [10] = {
        ["type"] = "pigalle",
        ["name"] = "Lampadati Pigalle",
        ["parts"] = 8
    },
    [11] = {
        ["type"] = "bullet", 
        ["name"] = "Vapid Bullet",
        ["parts"] = 8
    },
    [12] = {
        ["type"] = "turismor",
        ["name"] = "Grotti Turismo R",
        ["parts"] = 7
    },
    [13] = {
        ["type"] = "dominator",
        ["name"] = "Vapid Dominator",
        ["parts"] = 8
    },
    [14] = {
        ["type"] = "blade",
        ["name"] = "Vapid Blade",
        ["parts"] = 8
    },
    [15] = {
        ["type"] = "chino",
        ["name"] = "Vapid Chino",
        ["parts"] = 8
    },  
    [16] = {
        ["type"] = "sabregt",
        ["name"] = "Declasse Sabre GT",
        ["parts"] = 8
    },
    [17] = {
        ["type"] = "exemplar",
        ["name"] = "Dewbauchee Exemplar",
        ["parts"] = 10
    },
    [18] = {
        ["type"] = "felon",
        ["name"] = "Lampadata Felon",
        ["parts"] = 10
    },
    [19] = {
        ["type"] = "sentinel",
        ["name"] = "Übermacht Sentinel",
        ["parts"] = 8
    },
    [20] = {
        ["type"] = "blista",
        ["name"] = "Dinka Blista",
        ["parts"] = 8
    },
    [21] = {
        ["type"] = "fusilade",
        ["name"] = "Schyster Fusilade",
        ["parts"] = 8
    },
    [22] = {
        ["type"] = "jackal",
        ["name"] = "Ocelot Jackal",
        ["parts"] = 10
    },
    [23] = {
        ["type"] = "blista2",
        ["name"] = "Dinka Blista Compact",
        ["parts"] = 8
    },
    [24] = { 
        ["type"] = "rocoto", 
        ["name"] = "Obey Rocoto",
        ["parts"] = 10
    },
    [25] = {
        ["type"] = "seminole", 
        ["name"] = "Canis Seminole",
        ["parts"] = 10
    },
    [26] = {
        ["type"] = "landstalker",
        ["name"] = "Dundreary Landstalker",
        ["parts"] = 10
    },
    [27] = {
        ["type"] = "picador",
        ["name"] = "Cheval Picador",
        ["parts"] = 8
    },
    [28] = {
        ["type"] = "prairie", 
        ["name"] = "Bollokan Prairie",
        ["parts"] = 8
    },
    [29] = {
        ["type"] = "bobcatxl",
        ["name"] = "Vapid Bobcat XL",
        ["parts"] = 8
    }, 
    [30] = {
        ["type"] = "gauntlet",
        ["name"] = "Bravado Gauntlet",
        ["parts"] = 8
    },
    [31] = {
        ["type"] = "virgo",
        ["name"] = "Albany Virgo",
        ["parts"] = 8
    },
    [32] = {
        ["type"] = "fq2",
        ["name"] = "Fathom FQ 2",
        ["parts"] = 10
    },
    [33] = {
        ["type"] = "jester",
        ["name"] = "Dinka Jester",
        ["parts"] = 8
    },
    [34] = {
        ["type"] = "rhapsody",
        ["name"] = "Declasse Rhapsody",
        ["parts"] = 8
    },
    [35] = {
        ["type"] = "feltzer2",    
        ["name"] = "Benefactor Feltzer",
        ["parts"] = 8
    },
}