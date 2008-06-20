Received: from de01egw01.freescale.net ([192.88.165.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K9eUz-0007fl-Ix
	for linux-mtd@lists.infradead.org; Fri, 20 Jun 2008 11:09:45 +0000
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by de01egw01.freescale.net (8.12.11/az33egw01) with ESMTP id
	m5KB9gug012368 for <linux-mtd@lists.infradead.org>;
	Fri, 20 Jun 2008 04:09:42 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m5KB9eeK002104
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 Jun 2008 06:09:41 -0500 (CDT)
From: Chen Gong <g.chen@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] [MTD] m25p80.c add a erase_block command to enhance erase
	operation
Date: Fri, 20 Jun 2008 19:04:40 +0800
Message-Id: <1213959882-12828-1-git-send-email-g.chen@freescale.com>
Cc: Chen Gong <g.chen@freescale.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-Off-by: Chen Gong <g.chen@freescale.com>
---
 drivers/mtd/devices/m25p80.c |   48 +++++++++++++++++++++++++++++++++++-------
 1 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index b402269..9632247 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -38,6 +38,7 @@
 #define	OPCODE_PP		0x02	/* Page program (up to 256 bytes) */
 #define	OPCODE_BE_4K 		0x20	/* Erase 4KiB block */
 #define	OPCODE_BE_32K		0x52	/* Erase 32KiB block */
+#define OPCODE_BE               0xc7    /* Erase whole flash block */
 #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
 
@@ -149,6 +150,31 @@ static int wait_till_ready(struct m25p *flash)
 	return 1;
 }
 
+/*
+ * Erase the whole flash memory
+ *
+ * Returns 0 if successful, non-zero otherwise.
+ */
+static int erase_block(struct m25p *flash)
+{
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %dKiB\n",
+			flash->spi->dev.bus_id, __func__,
+			flash->mtd.size / 1024);
+
+	/* Wait until finished previous write command. */
+	if (wait_till_ready(flash))
+		return 1;
+
+	/* Send write enable, then erase commands. */
+	write_enable(flash);
+
+	/* Set up command buffer. */
+	flash->command[0] = OPCODE_BE;
+
+	spi_write(flash->spi, flash->command, 1);
+
+	return 0;
+}
 
 /*
  * Erase one sector of flash memory at offset ``offset'' which is any
@@ -217,15 +243,21 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
 	 */
 
 	/* now erase those sectors */
-	while (len) {
-		if (erase_sector(flash, addr)) {
-			instr->state = MTD_ERASE_FAILED;
-			mutex_unlock(&flash->lock);
-			return -EIO;
-		}
+	if (len == flash->mtd.size && erase_block(flash)) {
+		instr->state = MTD_ERASE_FAILED;
+		mutex_unlock(&flash->lock);
+		return -EIO;
+	} else {
+		while (len) {
+			if (erase_sector(flash, addr)) {
+				instr->state = MTD_ERASE_FAILED;
+				mutex_unlock(&flash->lock);
+				return -EIO;
+			}
 
-		addr += mtd->erasesize;
-		len -= mtd->erasesize;
+			addr += mtd->erasesize;
+			len -= mtd->erasesize;
+		}
 	}
 
 	mutex_unlock(&flash->lock);
-- 
1.5.4
