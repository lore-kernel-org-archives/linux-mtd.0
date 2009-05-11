Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M3aEQ-0004hI-JT
	for linux-mtd@lists.infradead.org; Mon, 11 May 2009 18:28:09 +0000
Date: Mon, 11 May 2009 19:28:01 +0100
From: Alexander Clouter <alex@digriz.org.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [REPOST] mtd: extend plat_nand for (read|write)_buf
Message-ID: <20090511182801.GK32684@woodchuck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: hsweeten@visionengravers.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds (write|read)_buf callbacks to plat_nand.

The NAND on the TS-7800 provisioned by the FPGA allows readw() and 
readl() to be used which gives a 2.5x speed up.  To be able to use this 
from the plat_nand driver a hook for read_buf (and also write_buf whilst 
we are in there) need to be made available.  This patch adds the hook.

This is a repost[1] of a feature asked for before[2], plus other helpful 
patches to plat_nand[3] would be welcomed if at all possible too.

[1] http://lists.infradead.org/pipermail/linux-mtd/2009-March/024747.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2007-October/019659.html
[3] http://lists.infradead.org/pipermail/linux-mtd/2009-March/024780.html

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
---
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 86e1d08..4cdec46 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -61,6 +61,8 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
 	data->chip.dev_ready = pdata->ctrl.dev_ready;
 	data->chip.select_chip = pdata->ctrl.select_chip;
+	data->chip.write_buf = pdata->ctrl.write_buf;
+	data->chip.read_buf = pdata->ctrl.read_buf;
 	data->chip.chip_delay = pdata->chip.chip_delay;
 	data->chip.options |= pdata->chip.options;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7efb9be..0e35375 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -584,6 +584,8 @@ struct platform_nand_chip {
  * @select_chip:	platform specific chip select function
  * @cmd_ctrl:		platform specific function for controlling
  *			ALE/CLE/nCE. Also used to write command and address
+ * @write_buf:		platform specific function for write buffer
+ * @read_buf:		platform specific function for read buffer
  * @priv:		private data to transport driver specific settings
  *
  * All fields are optional and depend on the hardware driver requirements
@@ -594,6 +596,10 @@ struct platform_nand_ctrl {
 	void		(*select_chip)(struct mtd_info *mtd, int chip);
 	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
 				    unsigned int ctrl);
+	void		(*write_buf)(struct mtd_info *mtd,
+				    const uint8_t *buf, int len);
+	void		(*read_buf)(struct mtd_info *mtd,
+				    uint8_t *buf, int len);
 	void		*priv;
 };
