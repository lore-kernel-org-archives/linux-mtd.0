From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 18 Dec 2008 13:09:27 +0200
Message-Id: <20081218110927.29710.97896.sendpatchset@localhost.localdomain>
Subject: [PATCH v2] MTD: fix m25p80 64-bit divisions
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] MTD: fix m25p80 64-bit divisions

MTD has recently been upgraded for 64-bit support, see commit
number 69423d99fc182a81f3c5db3eb5c140acc6fc64be in the
mtd-2.6.git tree (git://git.infradead.org/mtd-2.6.git)
or see this URL:
http://git.infradead.org/mtd-2.6.git?a=commit;h=69423d99fc182a81f3c5db3eb5c140acc6fc64be

Some variables in MTD data structures which were 32-bit
became 64-bit. Namely, the 'size' field in 'struct mtd_info'
and the 'addr'/'len' fields in 'struct erase_info'. This
means we have to use 'do_div' to divide them.

This patch fixes the following linking error:
ERROR: "__umoddi3" [drivers/mtd/devices/m25p80.ko] undefined!

This patch changes divisions of 64-bit variable so that they use
'do_div'. This patch also change some print placeholders to
get rid of gcc warnings.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 drivers/mtd/devices/m25p80.c |   31 ++++++++++++++++---------------
 1 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 6659b22..7ac2025 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -20,6 +20,7 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/mutex.h>
+#include <linux/math64.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -169,9 +170,9 @@ static int wait_till_ready(struct m25p *flash)
  */
 static int erase_chip(struct m25p *flash)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %dKiB\n",
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %lluKiB\n",
 			flash->spi->dev.bus_id, __func__,
-			flash->mtd.size / 1024);
+			flash->mtd.size >> 10);
 
 	/* Wait until finished previous write command. */
 	if (wait_till_ready(flash))
@@ -232,18 +233,18 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct m25p *flash = mtd_to_m25p(mtd);
 	u32 addr,len;
+	uint32_t rem;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %d\n",
+	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%llx, len %llu\n",
 			flash->spi->dev.bus_id, __func__, "at",
-			(u32)instr->addr, instr->len);
+			instr->addr, instr->len);
 
 	/* sanity checks */
 	if (instr->addr + instr->len > flash->mtd.size)
 		return -EINVAL;
-	if ((instr->addr % mtd->erasesize) != 0
-			|| (instr->len % mtd->erasesize) != 0) {
+	div_u64_rem(instr->len, mtd->erasesize, &rem);
+	if (rem)
 		return -EINVAL;
-	}
 
 	addr = instr->addr;
 	len = instr->len;
@@ -677,21 +678,21 @@ static int __devinit m25p_probe(struct spi_device *spi)
 		flash->mtd.erasesize = info->sector_size;
 	}
 
-	dev_info(&spi->dev, "%s (%d Kbytes)\n", info->name,
-			flash->mtd.size / 1024);
+	dev_info(&spi->dev, "%s (%llu Kbytes)\n", info->name,
+			flash->mtd.size >> 10);
 
 	DEBUG(MTD_DEBUG_LEVEL2,
-		"mtd .name = %s, .size = 0x%.8x (%uMiB) "
+		"mtd .name = %s, .size = 0x%llx (%lluMiB) "
 			".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
 		flash->mtd.name,
-		flash->mtd.size, flash->mtd.size / (1024*1024),
+		flash->mtd.size, flash->mtd.size >> 20,
 		flash->mtd.erasesize, flash->mtd.erasesize / 1024,
 		flash->mtd.numeraseregions);
 
 	if (flash->mtd.numeraseregions)
 		for (i = 0; i < flash->mtd.numeraseregions; i++)
 			DEBUG(MTD_DEBUG_LEVEL2,
-				"mtd.eraseregions[%d] = { .offset = 0x%.8x, "
+				"mtd.eraseregions[%d] = { .offset = 0x%llx, "
 				".erasesize = 0x%.8x (%uKiB), "
 				".numblocks = %d }\n",
 				i, flash->mtd.eraseregions[i].offset,
@@ -722,12 +723,12 @@ static int __devinit m25p_probe(struct spi_device *spi)
 		if (nr_parts > 0) {
 			for (i = 0; i < nr_parts; i++) {
 				DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
-					"{.name = %s, .offset = 0x%.8x, "
-						".size = 0x%.8x (%uKiB) }\n",
+					"{.name = %s, .offset = 0x%llx, "
+						".size = 0x%llx (%lluKiB) }\n",
 					i, parts[i].name,
 					parts[i].offset,
 					parts[i].size,
-					parts[i].size / 1024);
+					parts[i].size >> 10);
 			}
 			flash->partitioned = 1;
 			return add_mtd_partitions(&flash->mtd, parts, nr_parts);
-- 
1.5.4.3
