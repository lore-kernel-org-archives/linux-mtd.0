Received: from mail.semihalf.com ([83.15.139.206])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Iwi9K-000408-So
	for linux-mtd@lists.infradead.org; Mon, 26 Nov 2007 17:53:45 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.semihalf.com (Postfix) with ESMTP id 1D4FC1437F
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Nov 2007 18:55:21 +0100 (CET)
Received: from mail.semihalf.com ([127.0.0.1])
	by localhost (mail.semihalf.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09041-04 for <linux-mtd@lists.infradead.org>;
	Mon, 26 Nov 2007 18:55:19 +0100 (CET)
Date: Mon, 26 Nov 2007 18:55:18 +0100
From: Bartlomiej Sieka <tur@semihalf.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH][MTD] Fix incorrect interface code for x16/x32 chips
Message-ID: <20071126175517.GA1221@frozen.semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to "Common Flash Memory Interface Publication 100" dated December 1,
2001, the interface code for x16/x32 chips is 0x0005, and not 0x0004 used so
far.

Signed-off-by: Bartlomiej Sieka <tur@semihalf.com>
---
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 389acc6..93ec811 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -338,10 +338,12 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 		/* Modify the unlock address if we are in compatibility mode */
 		if (	/* x16 in x8 mode */
 			((cfi->device_type == CFI_DEVICETYPE_X8) &&
-				(cfi->cfiq->InterfaceDesc == 2)) ||
+				(cfi->cfiq->InterfaceDesc ==
+					CFI_INTERFACE_X8_BY_X16_ASYNC)) ||
 			/* x32 in x16 mode */
 			((cfi->device_type == CFI_DEVICETYPE_X16) &&
-				(cfi->cfiq->InterfaceDesc == 4)))
+				(cfi->cfiq->InterfaceDesc ==
+					CFI_INTERFACE_X16_BY_X32_ASYNC)))
 		{
 			cfi->addr_unlock1 = 0xaaa;
 			cfi->addr_unlock2 = 0x555;
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index 60e11a0..f651b6e 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -370,27 +370,27 @@ static void print_cfi_ident(struct cfi_ident *cfip)
 	printk("Device size: 0x%X bytes (%d MiB)\n", 1 << cfip->DevSize, 1<< (cfip->DevSize - 20));
 	printk("Flash Device Interface description: 0x%4.4X\n", cfip->InterfaceDesc);
 	switch(cfip->InterfaceDesc) {
-	case 0:
+	case CFI_INTERFACE_X8_ASYNC:
 		printk("  - x8-only asynchronous interface\n");
 		break;
 
-	case 1:
+	case CFI_INTERFACE_X16_ASYNC:
 		printk("  - x16-only asynchronous interface\n");
 		break;
 
-	case 2:
+	case CFI_INTERFACE_X8_BY_X16_ASYNC:
 		printk("  - supports x8 and x16 via BYTE# with asynchronous interface\n");
 		break;
 
-	case 3:
+	case CFI_INTERFACE_X32_ASYNC:
 		printk("  - x32-only asynchronous interface\n");
 		break;
 
-	case 4:
+	case CFI_INTERFACE_X16_BY_X32_ASYNC:
 		printk("  - supports x16 and x32 via Word# with asynchronous interface\n");
 		break;
 
-	case 65535:
+	case CFI_INTERFACE_NOT_ALLOWED:
 		printk("  - Not Allowed / Reserved\n");
 		break;
 
diff --git a/drivers/mtd/maps/scb2_flash.c b/drivers/mtd/maps/scb2_flash.c
index dcfb858..0fc5584 100644
--- a/drivers/mtd/maps/scb2_flash.c
+++ b/drivers/mtd/maps/scb2_flash.c
@@ -79,7 +79,7 @@ scb2_fixup_mtd(struct mtd_info *mtd)
 	struct cfi_private *cfi = map->fldrv_priv;
 
 	/* barf if this doesn't look right */
-	if (cfi->cfiq->InterfaceDesc != 1) {
+	if (cfi->cfiq->InterfaceDesc != CFI_INTERFACE_X16_ASYNC) {
 		printk(KERN_ERR MODNAME ": unsupported InterfaceDesc: %#x\n",
 		    cfi->cfiq->InterfaceDesc);
 		return -1;
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index e17c534..b0ddf4b 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -98,6 +98,18 @@ static inline int cfi_interleave_supported(int i)
 #define CFI_DEVICETYPE_X32 (32 / 8)
 #define CFI_DEVICETYPE_X64 (64 / 8)
 
+
+/* Device Interface Code Assignments from the "Common Flash Memory Interface
+ * Publication 100" dated December 1, 2001.
+ */
+#define CFI_INTERFACE_X8_ASYNC		0x0000
+#define CFI_INTERFACE_X16_ASYNC		0x0001
+#define CFI_INTERFACE_X8_BY_X16_ASYNC	0x0002
+#define CFI_INTERFACE_X32_ASYNC		0x0003
+#define CFI_INTERFACE_X16_BY_X32_ASYNC	0x0005
+#define CFI_INTERFACE_NOT_ALLOWED	0xffff
+
+
 /* NB: We keep these structures in memory in HOST byteorder, except
  * where individually noted.
  */
