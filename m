Received: from gateway-1237.mvista.com ([63.81.120.158])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H5VTr-0004vo-Sv
	for linux-mtd@lists.infradead.org; Fri, 12 Jan 2007 18:06:42 -0500
Subject: [PATCH] [MTD] CHIPS: fix CFI point method for discontiguous maps
From: Andy Lowe <alowe@mvista.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 12 Jan 2007 17:05:10 -0600
Message-Id: <1168643110.15116.20.camel@alowe-desktop.mvista.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] CHIPS: fix CFI point method for discontiguous maps

The CFI probe routine is capable of detecting flash banks consisting of
identical chips mapped to physically discontiguous addresses.  (One
common way this can occur is if a flash bank is populated with chips of
less capacity than the hardware was designed to support.)  The CFI
point() routine currently ignores any such gaps.  This patch fixes
the CFI point() routine so that it truncates any request that would
span a gap.

Signed-off-by: Andy Lowe <alowe@mvista.com>
Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: linux-2.6.19/drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
--- linux-2.6.19.orig/drivers/mtd/chips/cfi_cmdset_0001.c
+++ linux-2.6.19/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1140,28 +1140,34 @@ static int cfi_intelext_point (struct mt
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long ofs;
+	unsigned long ofs, last_end = 0;
 	int chipnum;
 	int ret = 0;
 
 	if (!map->virt || (from + len > mtd->size))
 		return -EINVAL;
 
-	*mtdbuf = (void *)map->virt + from;
-	*retlen = 0;
-
 	/* Now lock the chip(s) to POINT state */
 
 	/* ofs: offset within the first chip that the first read should start */
 	chipnum = (from >> cfi->chipshift);
 	ofs = from - (chipnum << cfi->chipshift);
 
+	*mtdbuf = (void *)map->virt + cfi->chips[chipnum].start + ofs;
+	*retlen = 0;
+
 	while (len) {
 		unsigned long thislen;
 
 		if (chipnum >= cfi->numchips)
 			break;
 
+		/* We cannot point across chips that are virtually disjoint */
+		if (!last_end)
+			last_end = cfi->chips[chipnum].start;
+		else if (cfi->chips[chipnum].start != last_end)
+			break;
+
 		if ((len + ofs -1) >> cfi->chipshift)
 			thislen = (1<<cfi->chipshift) - ofs;
 		else
@@ -1175,6 +1181,7 @@ static int cfi_intelext_point (struct mt
 		len -= thislen;
 
 		ofs = 0;
+		last_end += 1 << cfi->chipshift;
 		chipnum++;
 	}
 	return 0;
