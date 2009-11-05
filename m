Received: from relay.atmel.no ([80.232.32.139])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N63ie-00014U-ON
	for linux-mtd@lists.infradead.org; Thu, 05 Nov 2009 14:53:53 +0000
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: move manufacturer to the common cfi.h header file
Date: Thu,  5 Nov 2009 15:53:43 +0100
Message-Id: <1257432823-20816-1-git-send-email-hans-christian.egtvedt@atmel.com>
Cc: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>, nico@fluxnic.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch moves the MANUFACTURER_ST and MANUFACTURER_INTEL to the
include/linux/mtd/cfi.h header file and renames them to CFI_MFR_ST and
CFI_MFR_INTEL. CFI_MFR_ST was already present there.

All references in drivers/mtd/chips/cfi_cmdset_0001.c are updated to reflect
this.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   20 ++++++++++----------
 include/linux/mtd/cfi.h             |    9 +++++----
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 31e9c43..65d796e 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -43,11 +43,11 @@
 // debugging, turns off buffer write mode if set to 1
 #define FORCE_WORD_WRITE 0
 
-#define MANUFACTURER_INTEL	0x0089
+/* Intel chips */
 #define I82802AB	0x00ad
 #define I82802AC	0x00ac
 #define PF38F4476	0x881c
-#define MANUFACTURER_ST         0x0020
+/* STMicroelectronics chips */
 #define M50LPW080       0x002F
 #define M50FLW080A	0x0080
 #define M50FLW080B	0x0081
@@ -308,16 +308,16 @@ static struct cfi_fixup cfi_fixup_table[] = {
 #endif
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
-	{ MANUFACTURER_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock, NULL, },
+	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };
 
 static struct cfi_fixup jedec_fixup_table[] = {
-	{ MANUFACTURER_INTEL, I82802AB,   fixup_use_fwh_lock, NULL, },
-	{ MANUFACTURER_INTEL, I82802AC,   fixup_use_fwh_lock, NULL, },
-	{ MANUFACTURER_ST,    M50LPW080,  fixup_use_fwh_lock, NULL, },
-	{ MANUFACTURER_ST,    M50FLW080A, fixup_use_fwh_lock, NULL, },
-	{ MANUFACTURER_ST,    M50FLW080B, fixup_use_fwh_lock, NULL, },
+	{ CFI_MFR_INTEL, I82802AB,   fixup_use_fwh_lock, NULL, },
+	{ CFI_MFR_INTEL, I82802AC,   fixup_use_fwh_lock, NULL, },
+	{ CFI_MFR_ST,    M50LPW080,  fixup_use_fwh_lock, NULL, },
+	{ CFI_MFR_ST,    M50FLW080A, fixup_use_fwh_lock, NULL, },
+	{ CFI_MFR_ST,    M50FLW080B, fixup_use_fwh_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };
 static struct cfi_fixup fixup_table[] = {
@@ -333,7 +333,7 @@ static struct cfi_fixup fixup_table[] = {
 static void cfi_fixup_major_minor(struct cfi_private *cfi,
 						struct cfi_pri_intelext *extp)
 {
-	if (cfi->mfr == MANUFACTURER_INTEL &&
+	if (cfi->mfr == CFI_MFR_INTEL &&
 			cfi->id == PF38F4476 && extp->MinorVersion == '3')
 		extp->MinorVersion = '1';
 }
@@ -2249,7 +2249,7 @@ static int cfi_intelext_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 
 	/* Some chips have OTP located in the _top_ partition only.
 	   For example: Intel 28F256L18T (T means top-parameter device) */
-	if (cfi->mfr == MANUFACTURER_INTEL) {
+	if (cfi->mfr == CFI_MFR_INTEL) {
 		switch (cfi->id) {
 		case 0x880b:
 		case 0x880c:
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index 88d3d8f..df89f42 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -518,10 +518,11 @@ struct cfi_fixup {
 #define CFI_MFR_ANY 0xffff
 #define CFI_ID_ANY  0xffff
 
-#define CFI_MFR_AMD 0x0001
-#define CFI_MFR_ATMEL 0x001F
-#define CFI_MFR_SAMSUNG 0x00EC
-#define CFI_MFR_ST  0x0020 	/* STMicroelectronics */
+#define CFI_MFR_AMD	0x0001
+#define CFI_MFR_INTEL	0x0089
+#define CFI_MFR_ATMEL	0x001F
+#define CFI_MFR_SAMSUNG	0x00EC
+#define CFI_MFR_ST	0x0020 /* STMicroelectronics */
 
 void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
 
-- 
1.6.0.4
