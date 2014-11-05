Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlxqe-0008Ev-9N
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 10:29:57 +0000
Received: by mail-pd0-f174.google.com with SMTP id p10so502765pdj.19
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 02:29:34 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: spi-nor: factor out write_enable() for erase commands
Date: Wed,  5 Nov 2014 02:29:03 -0800
Message-Id: <1415183343-11891-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1407374222-8448-8-git-send-email-computersforpeace@gmail.com>
References: <1407374222-8448-8-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

write_enable() was being duplicated to both m25p80.c and fsl-quadspi.c.
But this should be handled within the spi-nor abstraction layer.

At the same time, let's add write_disable() after erasing, so we don't
leave the flash in a write-enabled state afterward.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c      | 6 ------
 drivers/mtd/spi-nor/fsl-quadspi.c | 5 -----
 drivers/mtd/spi-nor/spi-nor.c     | 9 ++++++---
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 35e7e9896b17..3bd12bbb94eb 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -157,16 +157,10 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 static int m25p80_erase(struct spi_nor *nor, loff_t offset)
 {
 	struct m25p *flash = nor->priv;
-	int ret;
 
 	dev_dbg(nor->dev, "%dKiB at 0x%08x\n",
 		flash->mtd.erasesize / 1024, (u32)offset);
 
-	/* Send write enable, then erase commands. */
-	ret = nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0, 0);
-	if (ret)
-		return ret;
-
 	/* Set up command buffer. */
 	flash->command[0] = nor->erase_opcode;
 	m25p_addr2cmd(nor, offset, flash->command);
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 03dcffac8185..7f2ba8d946b5 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -738,11 +738,6 @@ static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
 	dev_dbg(nor->dev, "%dKiB at 0x%08x:0x%08x\n",
 		nor->mtd->erasesize / 1024, q->chip_base_addr, (u32)offs);
 
-	/* Send write enable, then erase commands. */
-	ret = nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0, 0);
-	if (ret)
-		return ret;
-
 	ret = fsl_qspi_runcmd(q, nor->erase_opcode, offs, 0);
 	if (ret)
 		return ret;
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bfb67f1e2b7d..5e3a1d363895 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -228,9 +228,6 @@ static int erase_chip(struct spi_nor *nor)
 {
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd->size >> 10));
 
-	/* Send write enable, then erase commands. */
-	write_enable(nor);
-
 	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0, 0);
 }
 
@@ -285,6 +282,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 	/* whole-chip erase? */
 	if (len == mtd->size) {
+		write_enable(nor);
+
 		if (erase_chip(nor)) {
 			ret = -EIO;
 			goto erase_err;
@@ -302,6 +301,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	/* "sector"-at-a-time erase */
 	} else {
 		while (len) {
+			write_enable(nor);
+
 			if (nor->erase(nor, addr)) {
 				ret = -EIO;
 				goto erase_err;
@@ -316,6 +317,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		}
 	}
 
+	write_disable(nor);
+
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
 
 	instr->state = MTD_ERASE_DONE;
-- 
1.9.1
