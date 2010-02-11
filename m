Received: from mail-pz0-f195.google.com ([209.85.222.195])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NfS3H-0000GB-88
	for linux-mtd@lists.infradead.org; Thu, 11 Feb 2010 05:57:28 +0000
Received: by pzk33 with SMTP id 33so1202409pzk.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Feb 2010 21:57:21 -0800 (PST)
MIME-Version: 1.0
From: Amol Lad <amol.lad@gmail.com>
Date: Thu, 11 Feb 2010 18:57:00 +1300
Message-ID: <8c675e9b1002102157p33e4e7fg3239c62642bc008e@mail.gmail.com>
Subject: JFFS2 mount fail & crash on 2.4.26 kernel
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Our embedded device is successfully running JFFS2 (on NOR) for past
3-4 years now. Recently we are seeing mount fail & crashes. This is
observed when fs is around 90% full. The below dump shows the error we
get during mount in startup. Any ideas what could be going wrong. Is
there a way I can recover from this error ? (or any utility aka fsck).

(We've patched jffs2 in 2.4.26 from mtd cvs snapshot dated
11/20/2004). I'm in the process of decoding the oops and will post as
soon as I'm done...

Please CC me..

# d nlink for child "compare_oids" (ino #228)
<7>Increased nlink for child "crossconnect" (ino #137)
<7>Increased nlink for child "snmp_exclude" (ino #227)
<7>Increased nlink for child "alarm_history" (ino #490)
<7>Pass 1: ino #648
<7>Pass 1: ino #137
<7>Pass 1: ino #649
<7>Pass 1: ino #10
<7>Pass 1: ino #11
<7>Pass 1: ino #12
<7>Pass 1: ino #13
<7>Pass 1: ino #14
<7>Pass 1: ino #15
<7>jffs2_build_inode building directory inode #15
<7>Increased nlink for child "XE1400TXRX.ABS" (ino #247)
<7>Increased nlink for child "XE1500RX.ABS" (ino #245)
<7>Increased nlink for child "XE1500TX.ABS" (ino #246)
<7>Pass 1: ino #16
<7>Pass 1: ino #17
<7>Pass 1: ino #913
<7>Pass 1: ino #18
<7>Pass 1: ino #914
<7>Pass 1: ino #19
<7>Pass 1: ino #915
<7>jffs2_build_inode building directory inode #915
<7>Increased nlink for child "P_0M125_004_02_01.txt" (ino #936)
<7>Increased nlink for child "P_0M125_004_02_02.txt" (ino #937)
<7>Increased nlink for child "P_14M000_064_02_02.txt" (ino #979)
<7>Increased nlink for child "P_0M075_016_02_02.txt" (ino #927)
<7>Increased nlink for child "P_0M025_128_02_02.txt" (ino #920)
<7>Increased nlink for child "P_1M350_016_02_01.txt" (ino #992)
<7>Increased nlink for child "P_1M350_016_02_02.txt" (ino #993)
<7>Increased nlink for child "P_0M075_064_02_02.txt" (ino #929)
<7>Increased nlink for child "P_3M500_032_02_01.txt" (ino #1012)
<7>Increased nlink for child "P_3M500_032_02_02.txt" (ino #1013)
<7>Increased nlink for child "P_1M750_128_02_02.txt" (ino #1007)
<7>Increased nlink for child "P_1M350_064_02_01.txt" (ino #996)
<7>Increased nlink for child "P_1M350_064_02_02.txt" (ino #997)
<7>Increased nlink for child "P_7M000_016_02_02.txt" (ino #1018)
<7>Increased nlink for child "P_1M000_128_02_02.txt" (ino #989)
<7>Increased nlink for child "P_0M100_016_02_02.txt" (ino #932)
<7>Increased nlink for child "P_3M500_004_02_01.txt" (ino #1008)
<7>Increased nlink for child "P_3M500_004_02_02.txt" (ino #1009)
<7>Increased nlink for child "P_7M000_064_02_02.txt" (ino #1020)
<7>Increased nlink for child "P_0M150_032_02_02.txt" (ino #946)
<7>Increased nlink for child "P_0M500_128_02_02.txt" (ino #975)
<7>Increased nlink for child "P_0M250_016_02_01.txt" (ino #960)
<7>Increased nlink for child "P_0M250_016_02_02.txt" (ino #961)
<7>Increased nlink for child "P_0M100_064_02_02.txt" (ino #934)
eth0: config: auto-negotiation on, 10FDX.
<7>Increased nlink for child "P_0M200_128_02_02.txt" (ino #957)
<7>Increased nlink for child "P_0M250_064_02_01.txt" (ino #964)
<7>Increased nlink for child "P_0M250_064_02_02.txt" (ino #965)
<7>Increased nlink for child "P_0M150_004_02_02.txt" (ino #944)
<7>Increased nlink for child "P_0M025_032_02_02.txt" (ino #918)
<7>Increased nlink for child "P_0M050_128_02_02.txt" (ino #925)
<7>Increased nlink for child "P_0M125_016_02_01.txt" (ino #938)
<7>Increased nlink for child "P_0M125_016_02_02.txt" (ino #939)
<7>Increased nlink for child "P_1M750_032_02_01.txt" (ino #1003)
<7>Increased nlink for child "P_1M750_032_02_02.txt" (ino #1004)
<7>Increased nlink for child "P_0M125_064_02_02.txt" (ino #942)
<7>Increased nlink for child "P_0M025_004_02_02.txt" (ino #916)
<7>Increased nlink for child "P_1M000_032_02_01.txt" (ino #985)
<7>Increased nlink for child "P_1M000_032_02_02.txt" (ino #986)
<7>Increased nlink for child "P_14M000_128_02_02.txt" (ino #980)
<7>Increased nlink for child "P_1M750_004_02_01.txt" (ino #999)
<7>Increased nlink for child "P_1M750_004_02_02.txt" (ino #1000)
<7>Increased nlink for child "P_0M500_032_02_01.txt" (ino #971)
<7>Increased nlink for child "P_0M500_032_02_02.txt" (ino #972)
<7>Increased nlink for child "P_1M000_004_02_01.txt" (ino #981)
<7>Increased nlink for child "P_1M000_004_02_02.txt" (ino #982)
<7>Increased nlink for child "P_0M200_032_02_01.txt" (ino #953)
<7>Increased nlink for child "P_0M200_032_02_02.txt" (ino #954)
<7>Increased nlink for child "P_0M075_128_02_02.txt" (ino #930)
<7>Increased nlink for child "P_3M500_016_02_01.txt" (ino #1010)
<7>Increased nlink for child "P_3M500_016_02_02.txt" (ino #1011)
<7>Increased nlink for child "P_0M500_004_02_01.txt" (ino #967)
<7>Increased nlink for child "P_0M500_004_02_02.txt" (ino #968)
<7>Increased nlink for child "P_1M350_128_02_02.txt" (ino #998)
<7>Increased nlink for child "P_0M200_004_02_01.txt" (ino #949)
<7>Increased nlink for child "P_0M200_004_02_02.txt" (ino #950)
<7>Increased nlink for child "P_3M500_064_02_01.txt" (ino #1014)
<7>Increased nlink for child "P_3M500_064_02_02.txt" (ino #1015)
<7>Increased nlink for child "P_0M050_032_02_02.txt" (ino #923)
<7>Increased nlink for child "P_0M150_016_02_02.txt" (ino #945)
<7>Increased nlink for child "P_7M000_128_02_02.txt" (ino #1021)
<7>Increased nlink for child "P_0M100_128_02_02.txt" (ino #935)
<7>Increased nlink for child "P_0M150_064_02_02.txt" (ino #947)
<7>Increased nlink for child "P_0M050_004_02_02.txt" (ino #921)
<7>Increased nlink for child "P_14M000_032_02_02.txt" (ino #978)
<7>Increased nlink for child "P_0M250_128_02_02.txt" (ino #966)
<7>Increased nlink for child "P_0M025_016_02_02.txt" (ino #917)
<7>Increased nlink for child "P_0M075_032_02_02.txt" (ino #928)
<7>Increased nlink for child "P_14M000_004_02_02.txt" (ino #976)
<7>Increased nlink for child "P_0M025_064_02_02.txt" (ino #919)
<7>Increased nlink for child "P_1M750_016_02_01.txt" (ino #1001)
<7>Increased nlink for child "P_1M750_016_02_02.txt" (ino #1002)
<7>Increased nlink for child "P_1M350_032_02_01.txt" (ino #994)
<7>Increased nlink for child "P_1M350_032_02_02.txt" (ino #995)
<7>Increased nlink for child "P_0M125_128_02_02.txt" (ino #943)
<7>Increased nlink for child "P_1M000_016_02_01.txt" (ino #983)
<7>Increased nlink for child "P_1M000_016_02_02.txt" (ino #984)
<7>Increased nlink for child "P_0M075_004_02_02.txt" (ino #926)
<7>Increased nlink for child "P_1M750_064_02_01.txt" (ino #1005)
<7>Increased nlink for child "P_1M750_064_02_02.txt" (ino #1006)
<7>Increased nlink for child "P_7M000_032_02_02.txt" (ino #1019)
<7>Increased nlink for child "P_0M500_016_02_01.txt" (ino #969)
<7>Increased nlink for child "P_0M500_016_02_02.txt" (ino #970)
<7>Increased nlink for child "P_1M000_064_02_01.txt" (ino #987)
<7>Increased nlink for child "P_1M000_064_02_02.txt" (ino #988)
<7>Increased nlink for child "P_1M350_004_02_01.txt" (ino #990)
<7>Increased nlink for child "P_1M350_004_02_02.txt" (ino #991)
<7>Increased nlink for child "P_0M100_032_02_02.txt" (ino #933)
<7>Increased nlink for child "P_0M200_016_02_01.txt" (ino #951)
<7>Increased nlink for child "P_0M200_016_02_02.txt" (ino #952)
<7>Increased nlink for child "P_0M500_064_02_01.txt" (ino #973)
<7>Increased nlink for child "P_0M500_064_02_02.txt" (ino #974)
<7>Increased nlink for child "P_0M250_032_02_01.txt" (ino #962)
<7>Increased nlink for child "P_0M250_032_02_02.txt" (ino #963)
<7>Increased nlink for child "P_7M000_004_02_02.txt" (ino #1017)
<7>Increased nlink for child "P_0M200_064_02_01.txt" (ino #955)
<7>Increased nlink for child "P_0M200_064_02_02.txt" (ino #956)
<7>Increased nlink for child "P_0M100_004_02_02.txt" (ino #931)
<7>Increased nlink for child "P_0M050_016_02_02.txt" (ino #922)
<7>Increased nlink for child "P_3M500_128_02_02.txt" (ino #1016)
<7>Increased nlink for child "P_0M250_004_02_01.txt" (ino #958)
<7>Increased nlink for child "P_0M250_004_02_02.txt" (ino #959)
<7>Increased nlink for child "P_0M050_064_02_02.txt" (ino #924)
<7>Increased nlink for child "P_0M125_032_02_01.txt" (ino #940)
<7>Increased nlink for child "P_0M125_032_02_02.txt" (ino #941)
<7>Increased nlink for child "P_0M150_128_02_02.txt" (ino #948)
<7>Increased nlink for child "P_14M000_016_02_02.txt" (ino #977)
<7>Pass 1: ino #20
<7>Pass 1: ino #916
<7>Pass 1: ino #21
<7>Pass 1: ino #917
<7>Pass 1: ino #22
<7>Pass 1: ino #918
<7>Pass 1: ino #919
<7>Pass 1: ino #920
<7>Pass 1: ino #25
<7>Pass 1: ino #921
<7>Pass 1: ino #26
<7>jffs2_build_inode building directory inode #26
<7>Increased nlink for child "ee_00000_007ff.sav" (ino #28)
<7>Increased nlink for child "ee_00800_009ff.sav" (ino #31)
<7>Increased nlink for child "ee_10000_1402f.sav" (ino #434)
<7>Increased nlink for child "ee_02d10_02e6f.sav" (ino #37)
<7>Increased nlink for child "ee_00a40_00bff.sav" (ino #29)
<7>Increased nlink for child "ee_01000_0103f.sav" (ino #34)
<7>Increased nlink for child "ee_1ff00_1ffff.sav" (ino #27)
<7>Increased nlink for child "ee_16860_1a87b.sav" (ino #432)
<7>Increased nlink for child "ee_00ee0_00fbf.sav" (ino #32)
<7>Increased nlink for child "ee_00c00_00edf.sav" (ino #35)
<7>Increased nlink for child "ee_00fc0_00fdf.sav" (ino #130)
<7>Increased nlink for child "ee_14030_1685f.sav" (ino #433)
<7>Increased nlink for child "ee_00a00_00a2f.sav" (ino #39)
<7>Increased nlink for child "ee_00fe0_00fff.sav" (ino #131)
<7>Increased nlink for child "ee_03810_0384f.sav" (ino #38)
<7>Increased nlink for child "ee_024c0_0250f.sav" (ino #36)
<7>Pass 1: ino #922
<7>Pass 1: ino #27
<7>Pass 1: ino #923
<7>Pass 1: ino #28
<7>Pass 1: ino #924
<7>Pass 1: ino #29
<7>Pass 1: ino #925
<7>Pass 1: ino #926
<7>Pass 1: ino #31
<7>Pass 1: ino #927
<7>Pass 1: ino #32
<7>Pass 1: ino #928
<7>Pass 1: ino #801
<7>Pass 1: ino #929
<7>Pass 1: ino #34
<7>Pass 1: ino #930
<7>Pass 1: ino #35
<7>Pass 1: ino #931
<7>Pass 1: ino #36
<7>Pass 1: ino #932
<7>Pass 1: ino #37
<7>Pass 1: ino #933
<7>Pass 1: ino #38
<7>Pass 1: ino #934
<7>Pass 1: ino #39
<7>Pass 1: ino #935
<7>Pass 1: ino #40
<7>Pass 1: ino #936
<7>Pass 1: ino #937
<7>Pass 1: ino #938
<7>Pass 1: ino #939
<7>Pass 1: ino #44
<7>Pass 1: ino #940
<7>Pass 1: ino #941
<7>Pass 1: ino #942
<7>Pass 1: ino #943
<7>Pass 1: ino #432
<7>Pass 1: ino #944
<7>Pass 1: ino #433
<7>Pass 1: ino #945
<7>Pass 1: ino #434
<7>Pass 1: ino #946
<7>Pass 1: ino #947
<7>Pass 1: ino #948
<7>Pass 1: ino #949
<7>Pass 1: ino #950
<7>Pass 1: ino #951
<7>Pass 1: ino #952
<7>Pass 1: ino #953
<7>Pass 1: ino #954
<7>Pass 1: ino #443
<7>Pass 1: ino #955
<7>Pass 1: ino #956
<7>Pass 1: ino #957
<7>Pass 1: ino #958
<7>Pass 1: ino #959
<7>Pass 1: ino #960
<7>Pass 1: ino #961
<7>Pass 1: ino #962
<7>Pass 1: ino #963
<7>Pass 1: ino #964
<7>Pass 1: ino #965
<7>Pass 1: ino #966
<7>Pass 1: ino #967
<7>Pass 1: ino #968
<7>Pass 1: ino #969
<7>Pass 1: ino #970
<7>Pass 1: ino #971
<7>Pass 1: ino #972
<7>Pass 1: ino #973
<7>Pass 1: ino #974
<7>Pass 1: ino #975
<7>Pass 1: ino #976
<7>Pass 1: ino #977
<7>Pass 1: ino #978
<7>Pass 1: ino #979
<7>Pass 1: ino #980
<7>Pass 1: ino #981
<7>Pass 1: ino #982
<7>Pass 1: ino #983
<7>Pass 1: ino #984
<7>Pass 1: ino #985
<7>Pass 1: ino #986
<7>Pass 1: ino #987
<7>Pass 1: ino #988
<7>Pass 1: ino #989
<7>Pass 1: ino #990
<7>Pass 1: ino #991
<7>Pass 1: ino #992
<7>Pass 1: ino #993
<7>Pass 1: ino #994
<7>Pass 1: ino #227
<7>Pass 1: ino #611
<7>Pass 1: ino #995
<7>Pass 1: ino #228
<7>Pass 1: ino #612
<7>Pass 1: ino #996
<7>Pass 1: ino #229
<7>jffs2_build_inode building directory inode #229
<7>Pass 1: ino #997
<7>Pass 1: ino #998
<7>Pass 1: ino #487
<7>Pass 1: ino #999
<7>Pass 1: ino #1000
<7>Pass 1: ino #1001
<7>Pass 1: ino #490
<7>Pass 1: ino #1002
<7>Pass 1: ino #1003
<7>Pass 1: ino #1004
<7>Pass 1: ino #1005
<7>Pass 1: ino #1006
<7>Pass 1: ino #1007
<7>Pass 1: ino #1008
<7>Pass 1: ino #1009
<7>Pass 1: ino #1010
<7>Pass 1: ino #1011
<7>Pass 1: ino #1012
<7>Pass 1: ino #245
<7>Pass 1: ino #1013
<7>Pass 1: ino #246
<7>Pass 1: ino #1014
<7>Pass 1: ino #247
<7>Pass 1: ino #1015
<7>Pass 1: ino #1016
<7>Pass 1: ino #1017
<7>Pass 1: ino #1018
<7>Pass 1: ino #1019
<7>Pass 1: ino #1020
<7>Pass 1: ino #1021
<7>Pass 1: ino #1023
<7>Pass 1 complete
<7>Pass 2 starting
<7>Pass 2: ino #1, nlink 1, ic c14282c0, nodes c1407650
<7>Pass 2: ino #2, nlink 1, ic c1428398, nodes c1407620
<7>Pass 2: ino #130, nlink 1, ic c1409278, nodes c140ad30
<7>Pass 2: ino #1026, nlink 1, ic c1428b60, nodes c1423ad0
<7>Pass 2: ino #3, nlink 1, ic c1428a88, nodes c14238e0
<7>Pass 2: ino #131, nlink 1, ic c1428d40, nodes c1420550
<7>Pass 2: ino #5, nlink 1, ic c1428338, nodes c14269e0
<7>Pass 2: ino #6, nlink 1, ic c1428350, nodes c1421f30
<7>Pass 2: ino #7, nlink 1, ic c1428368, nodes c140eda0
<7>Pass 2: ino #8, nlink 1, ic c1428380, nodes c1426a40
<7>Pass 2: ino #136, nlink 1, ic c14282d8, nodes c140ede0
<7>Pass 2: ino #648, nlink 1, ic c1428ba8, nodes c1421ab0
<7>Pass 2: ino #137, nlink 1, ic c1428de8, nodes c140df60
<7>Pass 2: ino #649, nlink 1, ic c1428bc0, nodes c1421b50
<7>Pass 2: ino #10, nlink 1, ic c14289f8, nodes c1423870
<7>Pass 2: ino #11, nlink 1, ic c1428a58, nodes c14238b0
<7>Pass 2: ino #12, nlink 1, ic c1428a28, nodes c1423890
<7>Pass 2: ino #13, nlink 1, ic c1428a40, nodes c14238a0
<7>Pass 2: ino #14, nlink 1, ic c1428a10, nodes c1423880
<7>Pass 2: ino #15, nlink 1, ic c14282f0, nodes c1426ab0
<7>Pass 2: ino #16, nlink 1, ic c14283b0, nodes c1426ad0
<7>Pass 2: ino #17, nlink 1, ic c14283c8, nodes c1426b00
<7>Pass 2: ino #913, nlink 1, ic c1428290, nodes c14077e0
<7>Pass 2: ino #18, nlink 1, ic c14283e0, nodes c1426b20
<7>Pass 2: ino #914, nlink 1, ic c1428488, nodes c1421e00
<7>Pass 2: ino #19, nlink 1, ic c14283f8, nodes c1426b40
<7>Pass 2: ino #915, nlink 1, ic c14284b8, nodes c1407410
<7>Pass 2: ino #20, nlink 1, ic c1428410, nodes c1426b60
<7>Pass 2: ino #916, nlink 1, ic c1428bf0, nodes c1421f90
<7>Pass 2: ino #21, nlink 1, ic c1428428, nodes c1426b80
<7>Pass 2: ino #917, nlink 1, ic c1428c08, nodes c1421fc0
<7>Pass 2: ino #22, nlink 1, ic c1428440, nodes c1426ba0
<7>Pass 2: ino #918, nlink 1, ic c1428c20, nodes c1421ff0
<7>Pass 2: ino #919, nlink 1, ic c1428c38, nodes c1420370
<7>Pass 2: ino #920, nlink 1, ic c1428c50, nodes c14203a0
<7>Pass 2: ino #25, nlink 1, ic c1428b48, nodes c14239d0
<7>Pass 2: ino #921, nlink 1, ic c1428c68, nodes c14203d0
<7>Pass 2: ino #26, nlink 1, ic c14282a8, nodes c140a7b0
<7>Pass 2: ino #922, nlink 1, ic c1428c80, nodes c1420400
<7>Pass 2: ino #27, nlink 1, ic c1409458, nodes c1407640
<7>Pass 2: ino #923, nlink 1, ic c1428c98, nodes c1420430
<7>Pass 2: ino #28, nlink 1, ic c1428aa0, nodes c14238f0
<7>Pass 2: ino #924, nlink 1, ic c1428cb0, nodes c1420460
<7>Pass 2: ino #29, nlink 1, ic c1428b30, nodes c14239b0
<7>Pass 2: ino #925, nlink 1, ic c1428cc8, nodes c1420490
<7>Pass 2: ino #926, nlink 1, ic c1428ce0, nodes c14204c0
<7>Pass 2: ino #31, nlink 1, ic c1428b18, nodes c14239a0
<7>Pass 2: ino #927, nlink 1, ic c1428cf8, nodes c14204f0
<7>Pass 2: ino #32, nlink 1, ic c1428b90, nodes c1423b40
<7>Pass 2: ino #928, nlink 1, ic c1428d10, nodes c1420520
<7>Pass 2: ino #801, nlink 1, ic c1428ab8, nodes c1423900
<7>Pass 2: ino #929, nlink 1, ic c1428d28, nodes c140a960
<7>Pass 2: ino #34, nlink 1, ic c1428d58, nodes c1420560
<7>Pass 2: ino #930, nlink 1, ic c1428e48, nodes c140a990
<7>Pass 2: ino #35, nlink 1, ic c1428d70, nodes c140ed30
<7>Pass 2: ino #931, nlink 1, ic c1428e60, nodes c140a9c0
<7>Pass 2: ino #36, nlink 1, ic c1428d88, nodes c140ed50
<7>Pass 2: ino #932, nlink 1, ic c1428e78, nodes c140a9f0
<7>Pass 2: ino #37, nlink 1, ic c1428b78, nodes c1423b00
<7>Pass 2: ino #933, nlink 1, ic c1428e90, nodes c140aa20
<7>Pass 2: ino #38, nlink 1, ic c1428dd0, nodes c140ee10
<7>Pass 2: ino #934, nlink 1, ic c1428ea8, nodes c140aa50
<7>Pass 2: ino #39, nlink 1, ic c1428da0, nodes c140ed90
<7>Pass 2: ino #935, nlink 1, ic c1428ec0, nodes c140aa80
<7>Pass 2: ino #40, nlink 0, ic c1428260, nodes c1407600
<7>JFFS2: Removing ino #40 with nlink == zero.
<7>obsoleting node at 0x001c4308
<7>Obsoleting previously unchecked node at 0x001c4308 of len 80: Dirtying
<7>Eraseblock at 0x001c0000 not moved anywhere. (free 0x00000000,
dirty 0x000067c4, used 0x000000a8)
<7>obliterating obsoleted node at 0x001c4308
<4>Oops: kernel access of bad area, sig: 11
<4>NIP: C0072D88 XER: 00000000 LR: C0072DA4 SP: C1439D10 REGS:
c1439c60 TRAP: 0300    Not tainted
<4>MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
<4>DAR: 00000008, DSISR: 0000009F
<4>TASK = c1438000[15] 'mount' Last syscall: 21
<4>last math 00000000 last altivec 00000000
<4>GPR00: C0072DA4 C1439D10 C1438000 00000000 00001032 0000000C
C1F709C0 C1439BE4
<4>GPR08: 0000000A C1428268 C3092000 C14075F0 42002022 00000000
30005140 30005000
<4>GPR16: 00000002 000000E4 300050A0 000000E4 00009032 01439F40
00000000 C0120000
<4>GPR24: C01D29B8 C01D29B0 00000000 C1439D4C C01D28E4 C0110000
C1428260 00000000
<4>Call backtrace:
<4>C0072DA4 C0072CF8 C00731EC C00754CC C0075A14 C003AC7C C003B078
<4>C004FA90 C004FE0C C0050344 C000433C 1003D830 1003DC4C 1003E06C
<4>10003AF8 10003728 30046314 10003588

--
Real men program in C

Sent from Wellington, Wgn, New Zealand
