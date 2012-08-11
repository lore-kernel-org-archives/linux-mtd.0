Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T07X7-0001pi-UH
 for linux-mtd@lists.infradead.org; Sat, 11 Aug 2012 08:58:59 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: maps: pci: remove dead code
Date: Sat, 11 Aug 2012 10:58:43 +0200
Message-Id: <1344675523-27452-1-git-send-email-w.sang@pengutronix.de>
Cc: Russell King <linux@arm.linux.org.uk>, Wolfram Sang <w.sang@pengutronix.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removes disabled printk (which should be dev_dbg these days) as well
as #if 0 blocks (which are trivial to reimplement if ever needed) to
meet basic CodingStyle guidelines.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Artem Bityutskiy <dedekind1@gmail.com>

---

I thought I'd need this driver but in the end I didn't. Still, it appeared to
me it could need a little love. Compile tested.

 drivers/mtd/maps/pci.c |   23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/mtd/maps/pci.c b/drivers/mtd/maps/pci.c
index f14ce0a..1c30c1a 100644
--- a/drivers/mtd/maps/pci.c
+++ b/drivers/mtd/maps/pci.c
@@ -43,26 +43,14 @@ static map_word mtd_pci_read8(struct map_info *_map, unsigned long ofs)
 	struct map_pci_info *map = (struct map_pci_info *)_map;
 	map_word val;
 	val.x[0]= readb(map->base + map->translate(map, ofs));
-//	printk("read8 : %08lx => %02x\n", ofs, val.x[0]);
 	return val;
 }
 
-#if 0
-static map_word mtd_pci_read16(struct map_info *_map, unsigned long ofs)
-{
-	struct map_pci_info *map = (struct map_pci_info *)_map;
-	map_word val;
-	val.x[0] = readw(map->base + map->translate(map, ofs));
-//	printk("read16: %08lx => %04x\n", ofs, val.x[0]);
-	return val;
-}
-#endif
 static map_word mtd_pci_read32(struct map_info *_map, unsigned long ofs)
 {
 	struct map_pci_info *map = (struct map_pci_info *)_map;
 	map_word val;
 	val.x[0] = readl(map->base + map->translate(map, ofs));
-//	printk("read32: %08lx => %08x\n", ofs, val.x[0]);
 	return val;
 }
 
@@ -75,22 +63,12 @@ static void mtd_pci_copyfrom(struct map_info *_map, void *to, unsigned long from
 static void mtd_pci_write8(struct map_info *_map, map_word val, unsigned long ofs)
 {
 	struct map_pci_info *map = (struct map_pci_info *)_map;
-//	printk("write8 : %08lx <= %02x\n", ofs, val.x[0]);
 	writeb(val.x[0], map->base + map->translate(map, ofs));
 }
 
-#if 0
-static void mtd_pci_write16(struct map_info *_map, map_word val, unsigned long ofs)
-{
-	struct map_pci_info *map = (struct map_pci_info *)_map;
-//	printk("write16: %08lx <= %04x\n", ofs, val.x[0]);
-	writew(val.x[0], map->base + map->translate(map, ofs));
-}
-#endif
 static void mtd_pci_write32(struct map_info *_map, map_word val, unsigned long ofs)
 {
 	struct map_pci_info *map = (struct map_pci_info *)_map;
-//	printk("write32: %08lx <= %08x\n", ofs, val.x[0]);
 	writel(val.x[0], map->base + map->translate(map, ofs));
 }
 
@@ -358,4 +336,3 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Russell King <rmk@arm.linux.org.uk>");
 MODULE_DESCRIPTION("Generic PCI map driver");
 MODULE_DEVICE_TABLE(pci, mtd_pci_ids);
-
-- 
1.7.10.4
