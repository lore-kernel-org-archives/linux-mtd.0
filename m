Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ks7o0-0000pC-OE
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 03:21:13 +0000
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m9L3L4x0021651 for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 20:21:05 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m9L3L3nH000213
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 22:21:03 -0500 (CDT)
From: Chen Gong <g.chen@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] m25p80.c erase enhance (v2)
Date: Tue, 21 Oct 2008 11:15:09 +0800
Message-Id: <1224558909-4254-1-git-send-email-g.chen@freescale.com>
Cc: david-b@pacbell.net, Chen Gong <clumsycg@gmail.com>,
	Chen Gong <g.chen@freescale.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To avoid confusion, according to the suggestion from
David Brownell <david-b@pacbell.net>, cleanup some
terminology as follows:

OPCODE_BE   ==> OPCODE_CHIP_ERASE
erase_block ==> erase_chip

Signed-Off-by: Chen Gong <clumsycg@gmail.com>
---
 drivers/mtd/devices/m25p80.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 76a7675..b95aadf 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -39,7 +39,7 @@
 #define	OPCODE_PP		0x02	/* Page program (up to 256 bytes) */
 #define	OPCODE_BE_4K 		0x20	/* Erase 4KiB block */
 #define	OPCODE_BE_32K		0x52	/* Erase 32KiB block */
-#define	OPCODE_BE		0xc7	/* Erase whole flash block */
+#define	OPCODE_CHIP_ERASE	0xc7	/* Erase whole flash block */
 #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
 
@@ -167,7 +167,7 @@ static int wait_till_ready(struct m25p *flash)
  *
  * Returns 0 if successful, non-zero otherwise.
  */
-static int erase_block(struct m25p *flash)
+static int erase_chip(struct m25p *flash)
 {
 	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %dKiB\n",
 			flash->spi->dev.bus_id, __func__,
@@ -181,7 +181,7 @@ static int erase_block(struct m25p *flash)
 	write_enable(flash);
 
 	/* Set up command buffer. */
-	flash->command[0] = OPCODE_BE;
+	flash->command[0] = OPCODE_CHIP_ERASE;
 
 	spi_write(flash->spi, flash->command, 1);
 
@@ -255,7 +255,7 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
 	 */
 
 	/* now erase those sectors */
-	if (len == flash->mtd.size && erase_block(flash)) {
+	if (len == flash->mtd.size && erase_chip(flash)) {
 		instr->state = MTD_ERASE_FAILED;
 		mutex_unlock(&flash->lock);
 		return -EIO;
-- 
1.5.4
