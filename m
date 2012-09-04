Received: from smtp27.msg.oleane.net ([62.161.4.27])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8oYu-0001MA-P9
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 08:32:45 +0000
Received: from ic.fr (LDijon-156-65-26-47.w80-15.abo.wanadoo.fr
 [80.15.105.47])
 by smtp27.msg.oleane.net (MTA) with ESMTP id q848WgBN003567
 for <linux-mtd@lists.infradead.org>; Tue, 4 Sep 2012 10:32:42 +0200
Received: from [192.168.4.56] (unknown [192.168.4.56])
 by ic.fr (Postfix) with ESMTPA id 2B5D822AA7
 for <linux-mtd@lists.infradead.org>; Tue,  4 Sep 2012 10:53:14 +0200 (CEST)
Message-ID: <5045BCA9.5040401@ic.fr>
Date: Tue, 04 Sep 2012 10:32:41 +0200
From: =?ISO-8859-1?Q?C=E9dric_Cano?= <ccano@interfaceconcept.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] drivers/mtd/devices/m25p80.c: Fix whole device erase
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Cédric Cano<ccano@interfaceconcept.com>

There are two ways to erase SPI Flash devices: sector per sector or the
entire Flash (used when MTD partition is the whole Flash).

When the whole Flash is erased, the SPI command is sent to the device
and the erase function exits. Then, when another access (read, write or
erase) is done, a  wait of busy is performed that fails because of Flash
erase time (can be more than 30s in case of whole erase).

This patch removes chip erase and use only sector per sector erase to
erase the chip. When erase is performed, Flash accesses can be done.

C. Cano

Signed-off-by: Cédric Cano<ccano@interfaceconcept.com>
---
  drivers/mtd/devices/m25p80.c |   50 +++++-------------------------------------
  1 file changed, 5 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5257345..b8956df 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -202,31 +202,6 @@ static int wait_till_ready(struct m25p *flash)
  	return 1;
  }
  
-/*
- * Erase the whole flash memory
- *
- * Returns 0 if successful, non-zero otherwise.
- */
-static int erase_chip(struct m25p *flash)
-{
-	pr_debug("%s: %s %lldKiB\n", dev_name(&flash->spi->dev), __func__,
-			(long long)(flash->mtd.size >> 10));
-
-	/* Wait until finished previous write command. */
-	if (wait_till_ready(flash))
-		return 1;
-
-	/* Send write enable, then erase commands. */
-	write_enable(flash);
-
-	/* Set up command buffer. */
-	flash->command[0] = OPCODE_CHIP_ERASE;
-
-	spi_write(flash->spi, flash->command, 1);
-
-	return 0;
-}
-
  static void m25p_addr2cmd(struct m25p *flash, unsigned int addr, u8 *cmd)
  {
  	/* opcode is in cmd[0] */
@@ -297,31 +272,16 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
  
  	mutex_lock(&flash->lock);
  
-	/* whole-chip erase? */
-	if (len == flash->mtd.size) {
-		if (erase_chip(flash)) {
+	/* "sector"-at-a-time erase */
+	while (len) {
+		if (erase_sector(flash, addr)) {
  			instr->state = MTD_ERASE_FAILED;
  			mutex_unlock(&flash->lock);
  			return -EIO;
  		}
  
-	/* REVISIT in some cases we could speed up erasing large regions
-	 * by using OPCODE_SE instead of OPCODE_BE_4K.  We may have set up
-	 * to use "small sector erase", but that's not always optimal.
-	 */
-
-	/* "sector"-at-a-time erase */
-	} else {
-		while (len) {
-			if (erase_sector(flash, addr)) {
-				instr->state = MTD_ERASE_FAILED;
-				mutex_unlock(&flash->lock);
-				return -EIO;
-			}
-
-			addr += mtd->erasesize;
-			len -= mtd->erasesize;
-		}
+		addr += mtd->erasesize;
+		len -= mtd->erasesize;
  	}
  
  	mutex_unlock(&flash->lock);
-- 
