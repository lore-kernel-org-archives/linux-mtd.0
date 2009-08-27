Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mgbyl-0006uH-2s
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 10:13:19 +0000
Received: by fxm26 with SMTP id 26so858534fxm.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Aug 2009 03:13:13 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 27 Aug 2009 12:13:13 +0200
Message-ID: <62cbdcd90908270313i5a45cb4aw6f34477a798bdbfe@mail.gmail.com>
Subject: [PATCH] [MTD] CHIPS: buffer size adjustment for M29EW Numonyx devices
From: massimo cirillo <maxcir@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Massimo Cirillo <maxcir@gmail.com>

The buffer size fot M29EW Numonyx flash devices used in 8bit configuration
is 256 bytes sized, while the CFI contains a wrong value (1024 bytes).
The following patch fixes this hardware bug.
The following patch applies to 2.6.30 kernel.

Signed-off-by: Massimo Cirillo <maxcir@gmail.com>
---
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
old mode 100644
new mode 100755
index e63e674..1281920
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -158,6 +158,9 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	__u32 base = 0;
 	int num_erase_regions = cfi_read_query(map, base + (0x10 + 28)*ofs_factor);
 	int i;
+	int extendedId1 = 0;
+	int extendedId2 = 0;
+	int extendedId3 = 0;

 	xip_enable(base, map, cfi);
 #ifdef DEBUG_CFI
@@ -196,23 +199,39 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	cfi->id = cfi_read_query16(map, base + ofs_factor);

 	/* Get AMD/Spansion extended JEDEC ID */
-	if (cfi->mfr == CFI_MFR_AMD && (cfi->id & 0xff) == 0x7e)
-		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
+	if ((cfi->mfr == CFI_MFR_NMX || cfi->mfr == CFI_MFR_ST ||
+		cfi->mfr == CFI_MFR_AMD) && ((cfi->id & 0xff) == 0x7e)
+		&& (le16_to_cpu(cfi->cfiq->P_ID) == 0x0002)) {
+		extendedId1 = cfi_read_query16(map, base + 0x1 * ofs_factor);
+		extendedId2 = cfi_read_query16(map, base + 0xe * ofs_factor);
+		extendedId3 = cfi_read_query16(map, base + 0xf * ofs_factor);
+		/* compatibility with previous versions */
+		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
 			  cfi_read_query(map, base + 0xf * ofs_factor);
+	}

 	/* Put it back into Read Mode */
 	cfi_qry_mode_off(base, map, cfi);
 	xip_allowed(base, map);
-
-	/* Do any necessary byteswapping */
+
+	/* Do any necessary byteswapping */
 	cfi->cfiq->P_ID = le16_to_cpu(cfi->cfiq->P_ID);
-
 	cfi->cfiq->P_ADR = le16_to_cpu(cfi->cfiq->P_ADR);
 	cfi->cfiq->A_ID = le16_to_cpu(cfi->cfiq->A_ID);
 	cfi->cfiq->A_ADR = le16_to_cpu(cfi->cfiq->A_ADR);
 	cfi->cfiq->InterfaceDesc = le16_to_cpu(cfi->cfiq->InterfaceDesc);
 	cfi->cfiq->MaxBufWriteSize = le16_to_cpu(cfi->cfiq->MaxBufWriteSize);

+	/* If the device is a M29EW used in 8-bit mode, adjust buffer size */
+	if ((cfi->cfiq->MaxBufWriteSize > 0x8) && (cfi->mfr == CFI_MFR_NMX ||
+		cfi->mfr == CFI_MFR_ST) && (extendedId1 == 0x7E) &&
+		(extendedId2 == 0x22 || extendedId2 == 0x23 || extendedId2 == 0x28) &&
+		(extendedId3 == 0x01)) {
+		cfi->cfiq->MaxBufWriteSize = 0x8;
+		pr_warning("Adjusted buffer size on Numonyx flash M29EW family");
+		pr_warning(" in 8 bit mode\n");
+	}
+
 #ifdef DEBUG_CFI
 	/* Dump the information therein */
 	print_cfi_ident(cfi->cfiq);
@@ -228,6 +247,8 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 #endif
 	}

+
+
 	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
 	       map->name, cfi->interleave, cfi->device_type*8, base,
 	       map->bankwidth*8);
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
old mode 100644
new mode 100755
index 88d3d8f..43d6a77
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -522,6 +522,7 @@ struct cfi_fixup {
 #define CFI_MFR_ATMEL 0x001F
 #define CFI_MFR_SAMSUNG 0x00EC
 #define CFI_MFR_ST  0x0020 	/* STMicroelectronics */
+#define CFI_MFR_NMX 0x0089 /* Numonyx */

 void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
