Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6aP4-0002Zx-8C
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 02:20:05 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 27 Apr 2010 04:19:34 +0200
Message-Id: <1272334774-17019-2-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1272334774-17019-1-git-send-email-w.sang@pengutronix.de>
References: <1272334774-17019-1-git-send-email-w.sang@pengutronix.de>
Subject: [PATCH 2/2] mtd/chips: use common manufacturer codes in jedec_probe()
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Wolfram Sang <w.sang@pengutronix.de>,
	David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Factor out old manufacturers and use the generic ones from cfi.h

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
---
 drivers/mtd/chips/jedec_probe.c |  256 ++++++++++++++++++---------------------
 include/linux/mtd/cfi.h         |   13 ++-
 2 files changed, 130 insertions(+), 139 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 6850b23..806b2c6 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -22,24 +22,6 @@
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/gen_probe.h>
 
-/* Manufacturers */
-#define MANUFACTURER_AMD	0x0001
-#define MANUFACTURER_ATMEL	0x001f
-#define MANUFACTURER_EON	0x001c
-#define MANUFACTURER_FUJITSU	0x0004
-#define MANUFACTURER_HYUNDAI	0x00AD
-#define MANUFACTURER_INTEL	0x0089
-#define MANUFACTURER_MACRONIX	0x00C2
-#define MANUFACTURER_NEC	0x0010
-#define MANUFACTURER_PMC	0x009D
-#define MANUFACTURER_SHARP	0x00b0
-#define MANUFACTURER_SST	0x00BF
-#define MANUFACTURER_ST		0x0020
-#define MANUFACTURER_TOSHIBA	0x0098
-#define MANUFACTURER_WINBOND	0x00da
-#define CONTINUATION_CODE	0x007f
-
-
 /* AMD */
 #define AM29DL800BB	0x22CB
 #define AM29DL800BT	0x224A
@@ -311,7 +293,7 @@ struct amd_flash_info {
  */
 static const struct amd_flash_info jedec_table[] = {
 	{
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29F032B,
 		.name		= "AMD AM29F032B",
 		.uaddr		= MTD_UADDR_0x0555_0x02AA,
@@ -323,7 +305,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,64)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29LV160DT,
 		.name		= "AMD AM29LV160DT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -338,7 +320,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29LV160DB,
 		.name		= "AMD AM29LV160DB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -353,7 +335,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,31)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29LV400BB,
 		.name		= "AMD AM29LV400BB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -368,7 +350,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,7)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29LV400BT,
 		.name		= "AMD AM29LV400BT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -383,7 +365,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29LV800BB,
 		.name		= "AMD AM29LV800BB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -399,7 +381,7 @@ static const struct amd_flash_info jedec_table[] = {
 		}
 	}, {
 /* add DL */
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29DL800BB,
 		.name		= "AMD AM29DL800BB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -416,7 +398,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,14)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29DL800BT,
 		.name		= "AMD AM29DL800BT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -433,7 +415,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29F800BB,
 		.name		= "AMD AM29F800BB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -448,7 +430,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,15),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29LV800BT,
 		.name		= "AMD AM29LV800BT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -463,7 +445,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29F800BT,
 		.name		= "AMD AM29F800BT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -478,7 +460,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29F017D,
 		.name		= "AMD AM29F017D",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -490,7 +472,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,32),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29F016D,
 		.name		= "AMD AM29F016D",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -502,7 +484,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,32),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29F080,
 		.name		= "AMD AM29F080",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -514,7 +496,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,16),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29F040,
 		.name		= "AMD AM29F040",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -526,7 +508,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29LV040B,
 		.name		= "AMD AM29LV040B",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -538,7 +520,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29F002T,
 		.name		= "AMD AM29F002T",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -553,7 +535,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29SL800DT,
 		.name		= "AMD AM29SL800DT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -568,7 +550,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_AMD,
+		.mfr_id		= CFI_MFR_AMD,
 		.dev_id		= AM29SL800DB,
 		.name		= "AMD AM29SL800DB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -583,7 +565,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,15),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ATMEL,
+		.mfr_id		= CFI_MFR_ATMEL,
 		.dev_id		= AT49BV512,
 		.name		= "Atmel AT49BV512",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -595,7 +577,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ATMEL,
+		.mfr_id		= CFI_MFR_ATMEL,
 		.dev_id		= AT29LV512,
 		.name		= "Atmel AT29LV512",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -608,7 +590,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x80,256)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ATMEL,
+		.mfr_id		= CFI_MFR_ATMEL,
 		.dev_id		= AT49BV16X,
 		.name		= "Atmel AT49BV16X",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -621,7 +603,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,31)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ATMEL,
+		.mfr_id		= CFI_MFR_ATMEL,
 		.dev_id		= AT49BV16XT,
 		.name		= "Atmel AT49BV16XT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -634,7 +616,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000,8)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ATMEL,
+		.mfr_id		= CFI_MFR_ATMEL,
 		.dev_id		= AT49BV32X,
 		.name		= "Atmel AT49BV32X",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -647,7 +629,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,63)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ATMEL,
+		.mfr_id		= CFI_MFR_ATMEL,
 		.dev_id		= AT49BV32XT,
 		.name		= "Atmel AT49BV32XT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -660,7 +642,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000,8)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_EON,
+		.mfr_id		= CFI_MFR_EON,
 		.dev_id		= EN29SL800BT,
 		.name		= "Eon EN29SL800BT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -675,7 +657,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_EON,
+		.mfr_id		= CFI_MFR_EON,
 		.dev_id		= EN29SL800BB,
 		.name		= "Eon EN29SL800BB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -690,7 +672,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,15),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29F040C,
 		.name		= "Fujitsu MBM29F040C",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -702,7 +684,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,8)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29F800BA,
 		.name		= "Fujitsu MBM29F800BA",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -717,7 +699,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,15),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29LV650UE,
 		.name		= "Fujitsu MBM29LV650UE",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -729,7 +711,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,128)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29LV320TE,
 		.name		= "Fujitsu MBM29LV320TE",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -742,7 +724,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000,8)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29LV320BE,
 		.name		= "Fujitsu MBM29LV320BE",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -755,7 +737,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,63)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29LV160TE,
 		.name		= "Fujitsu MBM29LV160TE",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -770,7 +752,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29LV160BE,
 		.name		= "Fujitsu MBM29LV160BE",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -785,7 +767,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,31)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29LV800BA,
 		.name		= "Fujitsu MBM29LV800BA",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -800,7 +782,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,15)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29LV800TA,
 		.name		= "Fujitsu MBM29LV800TA",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -815,7 +797,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29LV400BC,
 		.name		= "Fujitsu MBM29LV400BC",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -830,7 +812,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,7)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_FUJITSU,
+		.mfr_id		= CFI_MFR_FUJITSU,
 		.dev_id		= MBM29LV400TC,
 		.name		= "Fujitsu MBM29LV400TC",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -845,7 +827,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_HYUNDAI,
+		.mfr_id		= CFI_MFR_HYUNDAI,
 		.dev_id		= HY29F002T,
 		.name		= "Hyundai HY29F002T",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -860,7 +842,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F004B3B,
 		.name		= "Intel 28F004B3B",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -873,7 +855,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 7),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F004B3T,
 		.name		= "Intel 28F004B3T",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -886,7 +868,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000, 8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F400B3B,
 		.name		= "Intel 28F400B3B",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -899,7 +881,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 7),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F400B3T,
 		.name		= "Intel 28F400B3T",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -912,7 +894,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000, 8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F008B3B,
 		.name		= "Intel 28F008B3B",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -925,7 +907,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 15),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F008B3T,
 		.name		= "Intel 28F008B3T",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -938,7 +920,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000, 8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F008S5,
 		.name		= "Intel 28F008S5",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -950,7 +932,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,16),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F016S5,
 		.name		= "Intel 28F016S5",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -962,7 +944,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,32),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F008SA,
 		.name		= "Intel 28F008SA",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -974,7 +956,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 16),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F800B3B,
 		.name		= "Intel 28F800B3B",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -987,7 +969,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 15),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F800B3T,
 		.name		= "Intel 28F800B3T",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1000,7 +982,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000, 8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F016B3B,
 		.name		= "Intel 28F016B3B",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1013,7 +995,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 31),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F016S3,
 		.name		= "Intel I28F016S3",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1025,7 +1007,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 32),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F016B3T,
 		.name		= "Intel 28F016B3T",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1038,7 +1020,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000, 8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F160B3B,
 		.name		= "Intel 28F160B3B",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1051,7 +1033,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 31),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F160B3T,
 		.name		= "Intel 28F160B3T",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1064,7 +1046,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000, 8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F320B3B,
 		.name		= "Intel 28F320B3B",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1077,7 +1059,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 63),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F320B3T,
 		.name		= "Intel 28F320B3T",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1090,7 +1072,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000, 8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F640B3B,
 		.name		= "Intel 28F640B3B",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1103,7 +1085,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 127),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F640B3T,
 		.name		= "Intel 28F640B3T",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1116,7 +1098,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000, 8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I28F640C3B,
 		.name		= "Intel 28F640C3B",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1129,7 +1111,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000, 127),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I82802AB,
 		.name		= "Intel 82802AB",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1141,7 +1123,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_INTEL,
+		.mfr_id		= CFI_MFR_INTEL,
 		.dev_id		= I82802AC,
 		.name		= "Intel 82802AC",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1153,7 +1135,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,16),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_MACRONIX,
+		.mfr_id		= CFI_MFR_MACRONIX,
 		.dev_id		= MX29LV040C,
 		.name		= "Macronix MX29LV040C",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1165,7 +1147,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_MACRONIX,
+		.mfr_id		= CFI_MFR_MACRONIX,
 		.dev_id		= MX29LV160T,
 		.name		= "MXIC MX29LV160T",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1180,7 +1162,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_NEC,
+		.mfr_id		= CFI_MFR_NEC,
 		.dev_id		= UPD29F064115,
 		.name		= "NEC uPD29F064115",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1194,7 +1176,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x2000,8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_MACRONIX,
+		.mfr_id		= CFI_MFR_MACRONIX,
 		.dev_id		= MX29LV160B,
 		.name		= "MXIC MX29LV160B",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1209,7 +1191,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,31)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_MACRONIX,
+		.mfr_id		= CFI_MFR_MACRONIX,
 		.dev_id		= MX29F040,
 		.name		= "Macronix MX29F040",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1221,7 +1203,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_MACRONIX,
+		.mfr_id		= CFI_MFR_MACRONIX,
 		.dev_id		= MX29F016,
 		.name		= "Macronix MX29F016",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1233,7 +1215,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,32),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_MACRONIX,
+		.mfr_id		= CFI_MFR_MACRONIX,
 		.dev_id		= MX29F004T,
 		.name		= "Macronix MX29F004T",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1248,7 +1230,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_MACRONIX,
+		.mfr_id		= CFI_MFR_MACRONIX,
 		.dev_id		= MX29F004B,
 		.name		= "Macronix MX29F004B",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1263,7 +1245,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,7),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_MACRONIX,
+		.mfr_id		= CFI_MFR_MACRONIX,
 		.dev_id		= MX29F002T,
 		.name		= "Macronix MX29F002T",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1278,7 +1260,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_PMC,
+		.mfr_id		= CFI_MFR_PMC,
 		.dev_id		= PM49FL002,
 		.name		= "PMC Pm49FL002",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1290,7 +1272,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO( 0x01000, 64 )
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_PMC,
+		.mfr_id		= CFI_MFR_PMC,
 		.dev_id		= PM49FL004,
 		.name		= "PMC Pm49FL004",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1302,7 +1284,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO( 0x01000, 128 )
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_PMC,
+		.mfr_id		= CFI_MFR_PMC,
 		.dev_id		= PM49FL008,
 		.name		= "PMC Pm49FL008",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1314,7 +1296,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO( 0x01000, 256 )
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SHARP,
+		.mfr_id		= CFI_MFR_SHARP,
 		.dev_id		= LH28F640BF,
 		.name		= "LH28F640BF",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1326,7 +1308,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x40000,16),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST39LF512,
 		.name		= "SST 39LF512",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1338,7 +1320,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,16),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST39LF010,
 		.name		= "SST 39LF010",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1350,7 +1332,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,32),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
  		.dev_id 	= SST29EE020,
 		.name		= "SST 29EE020",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1361,7 +1343,7 @@ static const struct amd_flash_info jedec_table[] = {
 		.regions = {ERASEINFO(0x01000,64),
 		}
 	}, {
- 		.mfr_id		= MANUFACTURER_SST,
+ 		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST29LE020,
  		.name		= "SST 29LE020",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1372,7 +1354,7 @@ static const struct amd_flash_info jedec_table[] = {
 		.regions = {ERASEINFO(0x01000,64),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST39LF020,
 		.name		= "SST 39LF020",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1384,7 +1366,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,64),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST39LF040,
 		.name		= "SST 39LF040",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1396,7 +1378,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,128),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST39SF010A,
 		.name		= "SST 39SF010A",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1408,7 +1390,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,32),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST39SF020A,
 		.name		= "SST 39SF020A",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1420,7 +1402,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,64),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST39SF040,
 		.name		= "SST 39SF040",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1432,7 +1414,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,128),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST49LF040B,
 		.name		= "SST 49LF040B",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1445,7 +1427,7 @@ static const struct amd_flash_info jedec_table[] = {
 		}
 	}, {
 
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST49LF004B,
 		.name		= "SST 49LF004B",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1457,7 +1439,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,128),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST49LF008A,
 		.name		= "SST 49LF008A",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1469,7 +1451,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,256),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST49LF030A,
 		.name		= "SST 49LF030A",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1481,7 +1463,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,96),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST49LF040A,
 		.name		= "SST 49LF040A",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1493,7 +1475,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,128),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST49LF080A,
 		.name		= "SST 49LF080A",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1505,7 +1487,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x01000,256),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,     /* should be CFI */
+		.mfr_id		= CFI_MFR_SST,     /* should be CFI */
 		.dev_id		= SST39LF160,
 		.name		= "SST 39LF160",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1518,7 +1500,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x1000,256)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,     /* should be CFI */
+		.mfr_id		= CFI_MFR_SST,     /* should be CFI */
 		.dev_id		= SST39VF1601,
 		.name		= "SST 39VF1601",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1532,7 +1514,7 @@ static const struct amd_flash_info jedec_table[] = {
 		}
 	}, {
 		/* CFI is broken: reports AMD_STD, but needs custom uaddr */
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST39WF1601,
 		.name		= "SST 39WF1601",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1546,7 +1528,7 @@ static const struct amd_flash_info jedec_table[] = {
 		}
 	}, {
 		/* CFI is broken: reports AMD_STD, but needs custom uaddr */
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST39WF1602,
 		.name		= "SST 39WF1602",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1559,7 +1541,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x1000,256)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,     /* should be CFI */
+		.mfr_id		= CFI_MFR_SST,     /* should be CFI */
 		.dev_id		= SST39VF3201,
 		.name		= "SST 39VF3201",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1574,7 +1556,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x1000,256)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_SST,
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST36VF3203,
 		.name		= "SST 36VF3203",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1586,7 +1568,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,64),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,
+		.mfr_id		= CFI_MFR_ST,
 		.dev_id		= M29F800AB,
 		.name		= "ST M29F800AB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1601,7 +1583,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,15),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,	/* FIXME - CFI device? */
+		.mfr_id		= CFI_MFR_ST,	/* FIXME - CFI device? */
 		.dev_id		= M29W800DT,
 		.name		= "ST M29W800DT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1616,7 +1598,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,	/* FIXME - CFI device? */
+		.mfr_id		= CFI_MFR_ST,	/* FIXME - CFI device? */
 		.dev_id		= M29W800DB,
 		.name		= "ST M29W800DB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1631,7 +1613,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,15)
 		}
 	},  {
-		.mfr_id         = MANUFACTURER_ST,
+		.mfr_id         = CFI_MFR_ST,
 		.dev_id         = M29W400DT,
 		.name           = "ST M29W400DT",
 		.devtypes       = CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1646,7 +1628,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,1)
 		}
 	}, {
-		.mfr_id         = MANUFACTURER_ST,
+		.mfr_id         = CFI_MFR_ST,
 		.dev_id         = M29W400DB,
 		.name           = "ST M29W400DB",
 		.devtypes       = CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1661,7 +1643,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,7)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,	/* FIXME - CFI device? */
+		.mfr_id		= CFI_MFR_ST,	/* FIXME - CFI device? */
 		.dev_id		= M29W160DT,
 		.name		= "ST M29W160DT",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1676,7 +1658,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,	/* FIXME - CFI device? */
+		.mfr_id		= CFI_MFR_ST,	/* FIXME - CFI device? */
 		.dev_id		= M29W160DB,
 		.name		= "ST M29W160DB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1691,7 +1673,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,31)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,
+		.mfr_id		= CFI_MFR_ST,
 		.dev_id		= M29W040B,
 		.name		= "ST M29W040B",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1703,7 +1685,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,
+		.mfr_id		= CFI_MFR_ST,
 		.dev_id		= M50FW040,
 		.name		= "ST M50FW040",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1715,7 +1697,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,8),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,
+		.mfr_id		= CFI_MFR_ST,
 		.dev_id		= M50FW080,
 		.name		= "ST M50FW080",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1727,7 +1709,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,16),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,
+		.mfr_id		= CFI_MFR_ST,
 		.dev_id		= M50FW016,
 		.name		= "ST M50FW016",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1739,7 +1721,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,32),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,
+		.mfr_id		= CFI_MFR_ST,
 		.dev_id		= M50LPW080,
 		.name		= "ST M50LPW080",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1751,7 +1733,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,16),
 		},
 	}, {
-		.mfr_id		= MANUFACTURER_ST,
+		.mfr_id		= CFI_MFR_ST,
 		.dev_id		= M50FLW080A,
 		.name		= "ST M50FLW080A",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1766,7 +1748,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x1000,16),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_ST,
+		.mfr_id		= CFI_MFR_ST,
 		.dev_id		= M50FLW080B,
 		.name		= "ST M50FLW080B",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1781,7 +1763,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x1000,16),
 		}
 	}, {
-		.mfr_id		= 0xff00 | MANUFACTURER_ST,
+		.mfr_id		= 0xff00 | CFI_MFR_ST,
 		.dev_id		= 0xff00 | PSD4256G6V,
 		.name		= "ST PSD4256G6V",
 		.devtypes	= CFI_DEVICETYPE_X16,
@@ -1793,7 +1775,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,16),
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_TOSHIBA,
+		.mfr_id		= CFI_MFR_TOSHIBA,
 		.dev_id		= TC58FVT160,
 		.name		= "Toshiba TC58FVT160",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1808,7 +1790,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_TOSHIBA,
+		.mfr_id		= CFI_MFR_TOSHIBA,
 		.dev_id		= TC58FVB160,
 		.name		= "Toshiba TC58FVB160",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1823,7 +1805,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,31)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_TOSHIBA,
+		.mfr_id		= CFI_MFR_TOSHIBA,
 		.dev_id		= TC58FVB321,
 		.name		= "Toshiba TC58FVB321",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1836,7 +1818,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,63)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_TOSHIBA,
+		.mfr_id		= CFI_MFR_TOSHIBA,
 		.dev_id		= TC58FVT321,
 		.name		= "Toshiba TC58FVT321",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1849,7 +1831,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000,8)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_TOSHIBA,
+		.mfr_id		= CFI_MFR_TOSHIBA,
 		.dev_id		= TC58FVB641,
 		.name		= "Toshiba TC58FVB641",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1862,7 +1844,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,127)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_TOSHIBA,
+		.mfr_id		= CFI_MFR_TOSHIBA,
 		.dev_id		= TC58FVT641,
 		.name		= "Toshiba TC58FVT641",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
@@ -1875,7 +1857,7 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000,8)
 		}
 	}, {
-		.mfr_id		= MANUFACTURER_WINBOND,
+		.mfr_id		= CFI_MFR_WINBOND,
 		.dev_id		= W49V002A,
 		.name		= "Winbond W49V002A",
 		.devtypes	= CFI_DEVICETYPE_X8,
@@ -1908,7 +1890,7 @@ static inline u32 jedec_read_mfr(struct map_info *map, uint32_t base,
 		mask = (1 << (cfi->device_type * 8)) - 1;
 		result = map_read(map, base + ofs);
 		bank++;
-	} while ((result.x[0] & mask) == CONTINUATION_CODE);
+	} while ((result.x[0] & mask) == CFI_MFR_CONTINUATION);
 
 	return result.x[0] & mask;
 }
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index cee05b1..c6e2190 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -515,16 +515,25 @@ struct cfi_fixup {
 	void* param;
 };
 
-#define CFI_MFR_ANY 0xffff
-#define CFI_ID_ANY  0xffff
+#define CFI_MFR_ANY		0xFFFF
+#define CFI_ID_ANY		0xFFFF
+#define CFI_MFR_CONTINUATION	0x007F
 
 #define CFI_MFR_AMD		0x0001
 #define CFI_MFR_ATMEL		0x001F
+#define CFI_MFR_EON		0x001C
+#define CFI_MFR_FUJITSU		0x0004
+#define CFI_MFR_HYUNDAI		0x00AD
 #define CFI_MFR_INTEL		0x0089
 #define CFI_MFR_MACRONIX	0x00C2
+#define CFI_MFR_NEC		0x0010
+#define CFI_MFR_PMC		0x009D
 #define CFI_MFR_SAMSUNG		0x00EC
+#define CFI_MFR_SHARP		0x00B0
 #define CFI_MFR_SST		0x00BF
 #define CFI_MFR_ST		0x0020 /* STMicroelectronics */
+#define CFI_MFR_TOSHIBA		0x0098
+#define CFI_MFR_WINBOND		0x00DA
 
 void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
 
-- 
1.7.0
