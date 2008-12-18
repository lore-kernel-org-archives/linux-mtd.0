From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 18 Dec 2008 14:09:56 +0200
Message-Id: <20081218120956.29978.4145.sendpatchset@localhost.localdomain>
Subject: [PATCH v3] MTD: fix dataflash 64-bit divisions
Cc: David Brownell <david-b@pacbell.net>, David Woodhouse <dwmw2@infradead.org>,
	Nicolas Pitre <nico@cam.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] MTD: fix dataflash 64-bit divisions

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
ERROR: "__udivdi3" [drivers/mtd/devices/mtd_dataflash.ko] undefined!
ERROR: "__umoddi3" [drivers/mtd/devices/mtd_dataflash.ko] undefined!

This patch changes divisions of 64-bit variable so that they use
'do_div'. This patch also change some print placeholders to
get rid of gcc warnings.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: David Brownell <david-b@pacbell.net>
Cc: Nicolas Pitre <nico@cam.org>
---
 drivers/mtd/devices/mtd_dataflash.c |   24 +++++++++++++++---------
 1 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 6dd9aff..6806897 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -16,6 +16,7 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/err.h>
+#include <linux/math64.h>
 
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
@@ -152,15 +153,20 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 	struct spi_message	msg;
 	unsigned		blocksize = priv->page_size << 3;
 	uint8_t			*command;
+	uint32_t		rem;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=0x%x len 0x%x\n",
-			spi->dev.bus_id,
-			instr->addr, instr->len);
+	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=0x%llx len 0x%llx\n",
+			spi->dev.bus_id, (long long)instr->addr,
+			(long long)instr->len);
 
 	/* Sanity checks */
-	if ((instr->addr + instr->len) > mtd->size
-			|| (instr->len % priv->page_size) != 0
-			|| (instr->addr % priv->page_size) != 0)
+	if (instr->addr + instr->len > mtd->size)
+		return -EINVAL;
+	div_u64_rem(instr->len, priv->page_size, &rem);
+	if (rem)
+		return -EINVAL;
+	div_u64_rem(instr->addr, priv->page_size, &rem);
+	if (rem)
 		return -EINVAL;
 
 	spi_message_init(&msg);
@@ -178,7 +184,7 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 		/* Calculate flash page address; use block erase (for speed) if
 		 * we're at a block boundary and need to erase the whole block.
 		 */
-		pageaddr = instr->addr / priv->page_size;
+		pageaddr = div_u64(instr->len, priv->page_size);
 		do_block = (pageaddr & 0x7) == 0 && instr->len >= blocksize;
 		pageaddr = pageaddr << priv->page_offset;
 
@@ -667,8 +673,8 @@ add_dataflash_otp(struct spi_device *spi, char *name,
 	if (revision >= 'c')
 		otp_tag = otp_setup(device, revision);
 
-	dev_info(&spi->dev, "%s (%d KBytes) pagesize %d bytes%s\n",
-			name, DIV_ROUND_UP(device->size, 1024),
+	dev_info(&spi->dev, "%s (%lld KBytes) pagesize %d bytes%s\n",
+			name, (long long)((device->size + 1023) >> 10),
 			pagesize, otp_tag);
 	dev_set_drvdata(&spi->dev, priv);
 
-- 
1.5.4.3
