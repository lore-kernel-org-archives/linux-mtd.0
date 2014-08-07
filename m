Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFCO9-0002za-FQ
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 01:21:05 +0000
Received: by mail-pa0-f53.google.com with SMTP id rd3so4414669pab.12
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 18:20:44 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/8] mtd: spi-nor: factor out write_enable() for erase commands
Date: Wed,  6 Aug 2014 18:17:01 -0700
Message-Id: <1407374222-8448-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, zajec5@gmail.com
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
 drivers/mtd/devices/m25p80.c      | 5 -----
 drivers/mtd/spi-nor/fsl-quadspi.c | 5 -----
 drivers/mtd/spi-nor/spi-nor.c     | 7 ++++---
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 96226ea69f90..116d979ffdb9 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -158,11 +158,6 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
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
index 9c13622a0c7a..07fbfb0a7738 100644
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
index 874e6d9a0b02..d08d9f8bb9bd 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -226,9 +226,6 @@ static int erase_chip(struct spi_nor *nor)
 {
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd->size >> 10));
 
-	/* Send write enable, then erase commands. */
-	write_enable(nor);
-
 	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0, 0);
 }
 
@@ -281,6 +278,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (ret)
 		return ret;
 
+	write_enable(nor);
+
 	/* whole-chip erase? */
 	if (len == mtd->size) {
 		if (erase_chip(nor)) {
@@ -314,6 +313,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		}
 	}
 
+	write_disable(nor);
+
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
 
 	instr->state = MTD_ERASE_DONE;
-- 
1.9.1
