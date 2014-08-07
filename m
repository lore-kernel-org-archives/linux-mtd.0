Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFCO7-0002zV-G7
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 01:21:04 +0000
Received: by mail-pd0-f176.google.com with SMTP id y10so4240375pdj.35
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 18:20:42 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/8] mtd: fsl-quadspi: drop wait-till-ready checks
Date: Wed,  6 Aug 2014 18:16:59 -0700
Message-Id: <1407374222-8448-6-git-send-email-computersforpeace@gmail.com>
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

spi-nor.c should be taking care of these now.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 8d659a2888d5..9c13622a0c7a 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -719,16 +719,10 @@ static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
 {
 	struct fsl_qspi *q = nor->priv;
 	u8 cmd = nor->read_opcode;
-	int ret;
 
 	dev_dbg(q->dev, "cmd [%x],read from (0x%p, 0x%.8x, 0x%.8x),len:%d\n",
 		cmd, q->ahb_base, q->chip_base_addr, (unsigned int)from, len);
 
-	/* Wait until the previous command is finished. */
-	ret = nor->wait_till_ready(nor);
-	if (ret)
-		return ret;
-
 	/* Read out the data directly from the AHB buffer.*/
 	memcpy(buf, q->ahb_base + q->chip_base_addr + from, len);
 
@@ -744,11 +738,6 @@ static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
 	dev_dbg(nor->dev, "%dKiB at 0x%08x:0x%08x\n",
 		nor->mtd->erasesize / 1024, q->chip_base_addr, (u32)offs);
 
-	/* Wait until finished previous write command. */
-	ret = nor->wait_till_ready(nor);
-	if (ret)
-		return ret;
-
 	/* Send write enable, then erase commands. */
 	ret = nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0, 0);
 	if (ret)
-- 
1.9.1
