Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Niosq-0003tI-I8
	for linux-mtd@lists.infradead.org; Sat, 20 Feb 2010 12:56:39 +0000
Subject: [PATCH 2/6] mtd: cfi_cmdset_0002: rename MANUFACTURER_* definitions
	to CFI_MFR_* and move them to cfi.h with similar definitions
To: David Woodhouse <dwmw2@infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 20 Feb 2010 13:57:54 +0100
Message-ID: <20100220125754.14843.76613.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
References: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rename MANUFACTURER_MACRONIX and MANUFACTURER_SST definitions to CFI_MFR_{MACRONIX,SST} and
move them to include/linux/mtd/cfi.h, with similar definitions.

Signed-off-by: Guillaume Lecerf <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   12 +++++-------
 include/linux/mtd/cfi.h             |   12 +++++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 1fe27ea..3df6056 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -43,8 +43,6 @@
 
 #define MAX_WORD_RETRIES 3
 
-#define MANUFACTURER_MACRONIX	0x00C2
-#define MANUFACTURER_SST	0x00BF
 #define SST49LF004B	        0x0060
 #define SST49LF040B	        0x0050
 #define SST49LF008A		0x005a
@@ -166,7 +164,7 @@ static void fixup_amd_bootblock(struct mtd_info *mtd, void* param)
 			 * This reduces the risk of false detection due to
 			 * the 8-bit device ID.
 			 */
-			(cfi->mfr == MANUFACTURER_MACRONIX)) {
+			(cfi->mfr == CFI_MFR_MACRONIX)) {
 			DEBUG(MTD_DEBUG_LEVEL1,
 				"%s: Macronix MX29LV400C with bottom boot block"
 				" detected\n", map->name);
@@ -284,7 +282,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 #ifdef AMD_BOOTLOC_BUG
 	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
-	{ MANUFACTURER_MACRONIX, CFI_ID_ANY, fixup_amd_bootblock, NULL },
+	{ CFI_MFR_MACRONIX, CFI_ID_ANY, fixup_amd_bootblock, NULL },
 #endif
 	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi, NULL, },
 	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi, NULL, },
@@ -302,9 +300,9 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ 0, 0, NULL, NULL }
 };
 static struct cfi_fixup jedec_fixup_table[] = {
-	{ MANUFACTURER_SST, SST49LF004B, fixup_use_fwh_lock, NULL, },
-	{ MANUFACTURER_SST, SST49LF040B, fixup_use_fwh_lock, NULL, },
-	{ MANUFACTURER_SST, SST49LF008A, fixup_use_fwh_lock, NULL, },
+	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock, NULL, },
+	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock, NULL, },
+	{ CFI_MFR_SST, SST49LF008A, fixup_use_fwh_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };
 
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index df89f42..6cb3e7b 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -518,11 +518,13 @@ struct cfi_fixup {
 #define CFI_MFR_ANY 0xffff
 #define CFI_ID_ANY  0xffff
 
-#define CFI_MFR_AMD	0x0001
-#define CFI_MFR_INTEL	0x0089
-#define CFI_MFR_ATMEL	0x001F
-#define CFI_MFR_SAMSUNG	0x00EC
-#define CFI_MFR_ST	0x0020 /* STMicroelectronics */
+#define CFI_MFR_AMD		0x0001
+#define CFI_MFR_ATMEL		0x001F
+#define CFI_MFR_INTEL		0x0089
+#define CFI_MFR_MACRONIX	0x00C2
+#define CFI_MFR_SAMSUNG		0x00EC
+#define CFI_MFR_SST		0x00BF
+#define CFI_MFR_ST		0x0020 /* STMicroelectronics */
 
 void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
 
