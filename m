Received: from smtp4-g19.free.fr ([212.27.42.30])
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Kqg4g-0003zh-EL
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 03:32:29 +0000
From: Christopher Moore <moore@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [NOR] cfi_cmdset_0002.c: Add Macronix CFI V1.0
	TopBottom detection
Date: Fri, 17 Oct 2008 05:32:22 +0200
Message-Id: <1224214342759-git-send-email-moore@free.fr>
In-Reply-To: <48F7FAFF.7040902@free.fr>
References: <48F7FAFF.7040902@free.fr>
Cc: Christopher Moore <moore@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds TopBottom detection for most Macronix chips with CFI
V1.0.

The main purpose of this patch is to add detection of the MX29LV400C B
used on the LaCie Ethernet Disk mini V2 NAS.

It detects the following parts correctly:-
MX28F640C3B T
MX29LV002C  B
MX29LV002NC B
MX29LV004C  T
MX29LV400C  T/B
MX29LV800C  T/B
MX29LV160C  T/B
MX29SL800C  T/B
MX29SL802C  T/B

It detects the following uniform part as bottom but it should work
correctly:-
MX29LV040C

For T parts it causes the erase block table to be reversed correctly.
For other parts it avoids the bogus "Assuming top" message.

It does not detect the following correctly:-
MX28F640C3B B
MX29LV002C  T
MX29LV002NC T
MX29LV004C  B
MX29SL400C  T/B
MX29SL402C  T/B

If desired I could supply a more complicated patch to handle these as
well.

Only the MX29LV400C B has been physically tested; others were checked
against their data sheets.

Signed-off-by: Christopher Moore <moore@free.fr>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   36 +++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a972cc6..db16b7b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -13,6 +13,8 @@
  * XIP support hooks by Vitaly Wool (based on code for Intel flash
  * by Nicolas Pitre)
  *
+ * 25/09/2008 Christopher Moore: TopBottom fixup for many Macronix with CFI V1.0
+ *
  * Occasionally maintained by Thayne Harbaugh tharbaugh at lnxi dot com
  *
  * This code is GPL
@@ -43,6 +45,7 @@
 
 #define MANUFACTURER_AMD	0x0001
 #define MANUFACTURER_ATMEL	0x001F
+#define MANUFACTURER_MACRONIX	0x00C2
 #define MANUFACTURER_SST	0x00BF
 #define SST49LF004B	        0x0060
 #define SST49LF040B	        0x0050
@@ -144,12 +147,44 @@ static void fixup_amd_bootblock(struct mtd_info *mtd, void* param)
 
 	if (((major << 8) | minor) < 0x3131) {
 		/* CFI version 1.0 => don't trust bootloc */
+
+		DEBUG(MTD_DEBUG_LEVEL1,
+			"%s: JEDEC Vendor ID is 0x%02X Device ID is 0x%02X\n",
+			map->name, cfi->mfr, cfi->id);
+
+		/* AFAICS all 29LV400 with a bottom boot block have a device ID
+		 * of 0x22BA in 16-bit mode and 0xBA in 8-bit mode.
+		 * These were badly detected as they have the 0x80 bit set
+		 * so treat them as a special case.
+		 */
+		if (((cfi->id == 0xBA) || (cfi->id == 0x22BA)) &&
+
+			/* Macronix added CFI to their 2nd generation
+			 * MX29LV400C B/T but AFAICS no other 29LV400 (AMD,
+			 * Fujitsu, Spansion, EON, ESI and older Macronix)
+			 * has CFI.
+			 *
+			 * Therefore also check the manufacturer.
+			 * This reduces the risk of false detection due to
+			 * the 8-bit device ID.
+			 */
+			(cfi->mfr == MANUFACTURER_MACRONIX)) {
+			DEBUG(MTD_DEBUG_LEVEL1,
+				"%s: Macronix MX29LV400C with bottom boot block"
+				" detected\n", map->name);
+			extp->TopBottom = 2;	/* bottom boot */
+		} else
 		if (cfi->id & 0x80) {
 			printk(KERN_WARNING "%s: JEDEC Device ID is 0x%02X. Assuming broken CFI table.\n", map->name, cfi->id);
 			extp->TopBottom = 3;	/* top boot */
 		} else {
 			extp->TopBottom = 2;	/* bottom boot */
 		}
+
+		DEBUG(MTD_DEBUG_LEVEL1,
+			"%s: AMD CFI PRI V%c.%c has no boot block field;"
+			" deduced %s from Device ID\n", map->name, major, minor,
+			extp->TopBottom == 2 ? "bottom" : "top");
 	}
 }
 #endif
@@ -243,6 +278,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 #ifdef AMD_BOOTLOC_BUG
 	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
+	{ MANUFACTURER_MACRONIX, CFI_ID_ANY, fixup_amd_bootblock, NULL },
 #endif
 	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi, NULL, },
 	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi, NULL, },
-- 
1.5.2.2
