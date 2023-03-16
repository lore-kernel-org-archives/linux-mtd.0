Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC421C6FD19
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Mar 2023 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cWTXLqqXy6JRs1IQKP5qmVTYxMIsWVOI5H2TvcKq4MY=; b=S88QDnwHFKwzvU
	Bva8HWfuDhxyw8+uSBNkem7MLtODYXJUKnpXXVfJut1Brx/D2EBN+UJrXhiyeoYUFzykD0v2VQk9c
	gXyMPzkYwKVpy3CZ2foNioqYiTBCOcjJmxClCN30j4M/GAle2McpEZoB8iqLu44zXAj53iNMtt2rQ
	awY38YZ51hUa22jfTWeYZlXxTNfSi6opJqqFhI1+mxSuannPjzrgeBuKWiQdPlC94xsEHF/OUEmVs
	qHVf4CezMO+7gtJg5BpecXTLVU4y7tAWUDW97p9oUjMCFmpw1xt/7fbvjd+A3swbr92xQep1nHhxW
	9HB5W2tsZq7Ousl8Bd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcqOg-00Gzmx-2v;
	Thu, 16 Mar 2023 16:24:10 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcqOc-00Gzl7-0U
	for linux-mtd@lists.infradead.org;
	Thu, 16 Mar 2023 16:24:09 +0000
Received: from ramsan.of.borg ([84.195.187.55])
	by xavier.telenet-ops.be with bizsmtp
	id Z4Pp2900a1C8whw014PqHe; Thu, 16 Mar 2023 17:23:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pcqNi-00CR3p-9e;
	Thu, 16 Mar 2023 17:23:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pcqOL-00ErGL-PY;
	Thu, 16 Mar 2023 17:23:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mtd: cfi_probe: Cleanup forward declarations and linkage
Date: Thu, 16 Mar 2023 17:23:48 +0100
Message-Id: <98d8fa6c7bf2242f4a310540ed50821b254f54f8.1678983742.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_092406_502561_C36694E1 
X-CRM114-Status: GOOD (  26.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

  - Move cfi_probe_chip() and cfi_chip_setup(), to remove the need for
    forward declarations,
  - Remove unneeded forward declarations for print_cfi_ident(),
    cfi_probe_chip(), cfi_chip_setup(), and cfi_probe(),
  - Make cfi_probe() static, as there are no users outside this file.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mtd/chips/cfi_probe.c | 374 +++++++++++++++++-----------------
 1 file changed, 182 insertions(+), 192 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index cf426956454cfb57..b970ed83a643534d 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -20,16 +20,6 @@
 
 //#define DEBUG_CFI
 
-#ifdef DEBUG_CFI
-static void print_cfi_ident(struct cfi_ident *);
-#endif
-
-static int cfi_probe_chip(struct map_info *map, __u32 base,
-			  unsigned long *chip_map, struct cfi_private *cfi);
-static int cfi_chip_setup(struct map_info *map, struct cfi_private *cfi);
-
-struct mtd_info *cfi_probe(struct map_info *map);
-
 #ifdef CONFIG_MTD_XIP
 
 /* only needed for short periods, so this is rather simple */
@@ -87,94 +77,6 @@ static void cfi_early_fixup(struct cfi_private *cfi,
 	}
 }
 
-/* check for QRY.
-   in: interleave,type,mode
-   ret: table index, <0 for error
- */
-
-static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
-				   unsigned long *chip_map, struct cfi_private *cfi)
-{
-	int i;
-
-	if ((base + 0) >= map->size) {
-		printk(KERN_NOTICE
-			"Probe at base[0x00](0x%08lx) past the end of the map(0x%08lx)\n",
-			(unsigned long)base, map->size -1);
-		return 0;
-	}
-	if ((base + 0xff) >= map->size) {
-		printk(KERN_NOTICE
-			"Probe at base[0x55](0x%08lx) past the end of the map(0x%08lx)\n",
-			(unsigned long)base + 0x55, map->size -1);
-		return 0;
-	}
-
-	xip_disable();
-	if (!cfi_qry_mode_on(base, map, cfi)) {
-		xip_enable(base, map, cfi);
-		return 0;
-	}
-
-	if (!cfi->numchips) {
-		/* This is the first time we're called. Set up the CFI
-		   stuff accordingly and return */
-		return cfi_chip_setup(map, cfi);
-	}
-
-	/* Check each previous chip to see if it's an alias */
- 	for (i=0; i < (base >> cfi->chipshift); i++) {
- 		unsigned long start;
- 		if(!test_bit(i, chip_map)) {
-			/* Skip location; no valid chip at this address */
- 			continue;
- 		}
- 		start = i << cfi->chipshift;
-		/* This chip should be in read mode if it's one
-		   we've already touched. */
-		if (cfi_qry_present(map, start, cfi)) {
-			/* Eep. This chip also had the QRY marker.
-			 * Is it an alias for the new one? */
-			cfi_qry_mode_off(start, map, cfi);
-
-			/* If the QRY marker goes away, it's an alias */
-			if (!cfi_qry_present(map, start, cfi)) {
-				xip_allowed(base, map);
-				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
-				       map->name, base, start);
-				return 0;
-			}
-			/* Yes, it's actually got QRY for data. Most
-			 * unfortunate. Stick the new chip in read mode
-			 * too and if it's the same, assume it's an alias. */
-			/* FIXME: Use other modes to do a proper check */
-			cfi_qry_mode_off(base, map, cfi);
-
-			if (cfi_qry_present(map, base, cfi)) {
-				xip_allowed(base, map);
-				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
-				       map->name, base, start);
-				return 0;
-			}
-		}
-	}
-
-	/* OK, if we got to here, then none of the previous chips appear to
-	   be aliases for the current one. */
-	set_bit((base >> cfi->chipshift), chip_map); /* Update chip map */
-	cfi->numchips++;
-
-	/* Put it back into Read Mode */
-	cfi_qry_mode_off(base, map, cfi);
-	xip_allowed(base, map);
-
-	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
-	       map->name, cfi->interleave, cfi->device_type*8, base,
-	       map->bankwidth*8);
-
-	return 1;
-}
-
 static void fixup_s70gl02gs_chips(struct cfi_private *cfi)
 {
 	/*
@@ -191,99 +93,6 @@ static const struct cfi_early_fixup cfi_early_fixup_table[] = {
 	{ },
 };
 
-static int __xipram cfi_chip_setup(struct map_info *map,
-				   struct cfi_private *cfi)
-{
-	int ofs_factor = cfi->interleave*cfi->device_type;
-	__u32 base = 0;
-	int num_erase_regions = cfi_read_query(map, base + (0x10 + 28)*ofs_factor);
-	int i;
-	int addr_unlock1 = 0x555, addr_unlock2 = 0x2AA;
-
-	xip_enable(base, map, cfi);
-#ifdef DEBUG_CFI
-	printk("Number of erase regions: %d\n", num_erase_regions);
-#endif
-	if (!num_erase_regions)
-		return 0;
-
-	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
-	if (!cfi->cfiq)
-		return 0;
-
-	memset(cfi->cfiq,0,sizeof(struct cfi_ident));
-
-	cfi->cfi_mode = CFI_MODE_CFI;
-
-	cfi->sector_erase_cmd = CMD(0x30);
-
-	/* Read the CFI info structure */
-	xip_disable_qry(base, map, cfi);
-	for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
-		((unsigned char *)cfi->cfiq)[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
-
-	/* Do any necessary byteswapping */
-	cfi->cfiq->P_ID = le16_to_cpu(cfi->cfiq->P_ID);
-
-	cfi->cfiq->P_ADR = le16_to_cpu(cfi->cfiq->P_ADR);
-	cfi->cfiq->A_ID = le16_to_cpu(cfi->cfiq->A_ID);
-	cfi->cfiq->A_ADR = le16_to_cpu(cfi->cfiq->A_ADR);
-	cfi->cfiq->InterfaceDesc = le16_to_cpu(cfi->cfiq->InterfaceDesc);
-	cfi->cfiq->MaxBufWriteSize = le16_to_cpu(cfi->cfiq->MaxBufWriteSize);
-
-#ifdef DEBUG_CFI
-	/* Dump the information therein */
-	print_cfi_ident(cfi->cfiq);
-#endif
-
-	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
-		cfi->cfiq->EraseRegionInfo[i] = le32_to_cpu(cfi->cfiq->EraseRegionInfo[i]);
-
-#ifdef DEBUG_CFI
-		printk("  Erase Region #%d: BlockSize 0x%4.4X bytes, %d blocks\n",
-		       i, (cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff,
-		       (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1);
-#endif
-	}
-
-	if (cfi->cfiq->P_ID == P_ID_SST_OLD) {
-		addr_unlock1 = 0x5555;
-		addr_unlock2 = 0x2AAA;
-	}
-
-	/*
-	 * Note we put the device back into Read Mode BEFORE going into Auto
-	 * Select Mode, as some devices support nesting of modes, others
-	 * don't. This way should always work.
-	 * On cmdset 0001 the writes of 0xaa and 0x55 are not needed, and
-	 * so should be treated as nops or illegal (and so put the device
-	 * back into Read Mode, which is a nop in this case).
-	 */
-	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xaa, addr_unlock1, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, addr_unlock2, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, addr_unlock1, base, map, cfi, cfi->device_type, NULL);
-	cfi->mfr = cfi_read_query16(map, base);
-	cfi->id = cfi_read_query16(map, base + ofs_factor);
-
-	/* Get AMD/Spansion extended JEDEC ID */
-	if (cfi->mfr == CFI_MFR_AMD && (cfi->id & 0xff) == 0x7e)
-		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
-			  cfi_read_query(map, base + 0xf * ofs_factor);
-
-	/* Put it back into Read Mode */
-	cfi_qry_mode_off(base, map, cfi);
-	xip_allowed(base, map);
-
-	cfi_early_fixup(cfi, cfi_early_fixup_table);
-
-	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank. Manufacturer ID %#08x Chip ID %#08x\n",
-	       map->name, cfi->interleave, cfi->device_type*8, base,
-	       map->bankwidth*8, cfi->mfr, cfi->id);
-
-	return 1;
-}
-
 #ifdef DEBUG_CFI
 static char *vendorname(__u16 vendor)
 {
@@ -423,12 +232,193 @@ static void print_cfi_ident(struct cfi_ident *cfip)
 }
 #endif /* DEBUG_CFI */
 
+static int __xipram cfi_chip_setup(struct map_info *map,
+				   struct cfi_private *cfi)
+{
+	int ofs_factor = cfi->interleave*cfi->device_type;
+	__u32 base = 0;
+	int num_erase_regions = cfi_read_query(map, base + (0x10 + 28)*ofs_factor);
+	int i;
+	int addr_unlock1 = 0x555, addr_unlock2 = 0x2AA;
+
+	xip_enable(base, map, cfi);
+#ifdef DEBUG_CFI
+	printk("Number of erase regions: %d\n", num_erase_regions);
+#endif
+	if (!num_erase_regions)
+		return 0;
+
+	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
+	if (!cfi->cfiq)
+		return 0;
+
+	memset(cfi->cfiq,0,sizeof(struct cfi_ident));
+
+	cfi->cfi_mode = CFI_MODE_CFI;
+
+	cfi->sector_erase_cmd = CMD(0x30);
+
+	/* Read the CFI info structure */
+	xip_disable_qry(base, map, cfi);
+	for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
+		((unsigned char *)cfi->cfiq)[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
+
+	/* Do any necessary byteswapping */
+	cfi->cfiq->P_ID = le16_to_cpu(cfi->cfiq->P_ID);
+
+	cfi->cfiq->P_ADR = le16_to_cpu(cfi->cfiq->P_ADR);
+	cfi->cfiq->A_ID = le16_to_cpu(cfi->cfiq->A_ID);
+	cfi->cfiq->A_ADR = le16_to_cpu(cfi->cfiq->A_ADR);
+	cfi->cfiq->InterfaceDesc = le16_to_cpu(cfi->cfiq->InterfaceDesc);
+	cfi->cfiq->MaxBufWriteSize = le16_to_cpu(cfi->cfiq->MaxBufWriteSize);
+
+#ifdef DEBUG_CFI
+	/* Dump the information therein */
+	print_cfi_ident(cfi->cfiq);
+#endif
+
+	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
+		cfi->cfiq->EraseRegionInfo[i] = le32_to_cpu(cfi->cfiq->EraseRegionInfo[i]);
+
+#ifdef DEBUG_CFI
+		printk("  Erase Region #%d: BlockSize 0x%4.4X bytes, %d blocks\n",
+		       i, (cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff,
+		       (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1);
+#endif
+	}
+
+	if (cfi->cfiq->P_ID == P_ID_SST_OLD) {
+		addr_unlock1 = 0x5555;
+		addr_unlock2 = 0x2AAA;
+	}
+
+	/*
+	 * Note we put the device back into Read Mode BEFORE going into Auto
+	 * Select Mode, as some devices support nesting of modes, others
+	 * don't. This way should always work.
+	 * On cmdset 0001 the writes of 0xaa and 0x55 are not needed, and
+	 * so should be treated as nops or illegal (and so put the device
+	 * back into Read Mode, which is a nop in this case).
+	 */
+	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xaa, addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, addr_unlock2, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+	cfi->mfr = cfi_read_query16(map, base);
+	cfi->id = cfi_read_query16(map, base + ofs_factor);
+
+	/* Get AMD/Spansion extended JEDEC ID */
+	if (cfi->mfr == CFI_MFR_AMD && (cfi->id & 0xff) == 0x7e)
+		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
+			  cfi_read_query(map, base + 0xf * ofs_factor);
+
+	/* Put it back into Read Mode */
+	cfi_qry_mode_off(base, map, cfi);
+	xip_allowed(base, map);
+
+	cfi_early_fixup(cfi, cfi_early_fixup_table);
+
+	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank. Manufacturer ID %#08x Chip ID %#08x\n",
+	       map->name, cfi->interleave, cfi->device_type*8, base,
+	       map->bankwidth*8, cfi->mfr, cfi->id);
+
+	return 1;
+}
+
+/* check for QRY.
+   in: interleave,type,mode
+   ret: table index, <0 for error
+ */
+
+static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
+				   unsigned long *chip_map, struct cfi_private *cfi)
+{
+	int i;
+
+	if ((base + 0) >= map->size) {
+		printk(KERN_NOTICE
+			"Probe at base[0x00](0x%08lx) past the end of the map(0x%08lx)\n",
+			(unsigned long)base, map->size -1);
+		return 0;
+	}
+	if ((base + 0xff) >= map->size) {
+		printk(KERN_NOTICE
+			"Probe at base[0x55](0x%08lx) past the end of the map(0x%08lx)\n",
+			(unsigned long)base + 0x55, map->size -1);
+		return 0;
+	}
+
+	xip_disable();
+	if (!cfi_qry_mode_on(base, map, cfi)) {
+		xip_enable(base, map, cfi);
+		return 0;
+	}
+
+	if (!cfi->numchips) {
+		/* This is the first time we're called. Set up the CFI
+		   stuff accordingly and return */
+		return cfi_chip_setup(map, cfi);
+	}
+
+	/* Check each previous chip to see if it's an alias */
+	for (i=0; i < (base >> cfi->chipshift); i++) {
+		unsigned long start;
+		if(!test_bit(i, chip_map)) {
+			/* Skip location; no valid chip at this address */
+			continue;
+		}
+		start = i << cfi->chipshift;
+		/* This chip should be in read mode if it's one
+		   we've already touched. */
+		if (cfi_qry_present(map, start, cfi)) {
+			/* Eep. This chip also had the QRY marker.
+			 * Is it an alias for the new one? */
+			cfi_qry_mode_off(start, map, cfi);
+
+			/* If the QRY marker goes away, it's an alias */
+			if (!cfi_qry_present(map, start, cfi)) {
+				xip_allowed(base, map);
+				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
+				       map->name, base, start);
+				return 0;
+			}
+			/* Yes, it's actually got QRY for data. Most
+			 * unfortunate. Stick the new chip in read mode
+			 * too and if it's the same, assume it's an alias. */
+			/* FIXME: Use other modes to do a proper check */
+			cfi_qry_mode_off(base, map, cfi);
+
+			if (cfi_qry_present(map, base, cfi)) {
+				xip_allowed(base, map);
+				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
+				       map->name, base, start);
+				return 0;
+			}
+		}
+	}
+
+	/* OK, if we got to here, then none of the previous chips appear to
+	   be aliases for the current one. */
+	set_bit((base >> cfi->chipshift), chip_map); /* Update chip map */
+	cfi->numchips++;
+
+	/* Put it back into Read Mode */
+	cfi_qry_mode_off(base, map, cfi);
+	xip_allowed(base, map);
+
+	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
+	       map->name, cfi->interleave, cfi->device_type*8, base,
+	       map->bankwidth*8);
+
+	return 1;
+}
+
 static struct chip_probe cfi_chip_probe = {
 	.name		= "CFI",
 	.probe_chip	= cfi_probe_chip
 };
 
-struct mtd_info *cfi_probe(struct map_info *map)
+static struct mtd_info *cfi_probe(struct map_info *map)
 {
 	/*
 	 * Just use the generic probe stuff to call our CFI-specific
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
