Received: from smtp1.int-evry.fr ([157.159.10.44])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ikgr3-00054Q-Sr
	for linux-mtd@lists.infradead.org; Wed, 24 Oct 2007 15:05:09 +0100
Received: from smtp-ext.int-evry.fr (smtp-ext.int-evry.fr [157.159.11.17])
	by smtp1.int-evry.fr (Postfix) with ESMTP id 757918E6EDD
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Oct 2007 16:04:12 +0200 (CEST)
Received: from [157.159.47.53] (unknown [157.159.47.53])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-ext.int-evry.fr (Postfix) with ESMTP id 400B2D0E31A
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Oct 2007 16:04:12 +0200 (CEST)
From: Florian Fainelli <florian.fainelli@telecomint.eu>
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: [PATCH] Extend plat_nand to support more callbacks
Date: Wed, 24 Oct 2007 16:04:18 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200710241604.18909.florian.fainelli@telecomint.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

This patch extends the platform NAND driver to support more callbacks.
One user will be the AU1550 NAND driver.

Signed-off-by: Florian Fainelli <florian.fainelli@telecomint.eu>
-- 
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index cd725fc..365642a 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -60,6 +60,12 @@ static int __init plat_nand_probe(struct platform_device *pdev)
 	data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
 	data->chip.dev_ready = pdata->ctrl.dev_ready;
 	data->chip.select_chip = pdata->ctrl.select_chip;
+	data->chip.cmdfunc = pdata->ctrl.cmdfunc;
+	data->chip.read_byte = pdata->ctrl.read_byte;
+	data->chip.read_word = pdata->ctrl.ready_byte;
+	data->chip.write_buf = pdata->ctrl.write_buf;
+	data->chip.read_buf = pdata->ctrl.read_buf;
+	data->chip.verify_buf = pdata->ctrl.verify_buf;
 	data->chip.chip_delay = pdata->chip.chip_delay;
 	data->chip.options |= pdata->chip.options;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c42bc7f..dd69c62 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -583,6 +583,12 @@ struct platform_nand_chip {
  * @select_chip:	platform specific chip select function
  * @cmd_ctrl:		platform specific function for controlling
  *			ALE/CLE/nCE. Also used to write command and address
+ * @cmdfunc:		[REPLACEABLE] hardwarespecific function for writing commands to the chip
+ * @read_byte:		[REPLACEABLE] read one byte from the chip
+ * @read_word:		[REPLACEABLE] read one word from the chip
+ * @write_buf:		[REPLACEABLE] write data from the buffer to the chip
+ * @read_buf:		[REPLACEABLE] read data from the chip into the buffer
+ * @verify_buf:		[REPLACEABLE] verify buffer contents against the chip data
  * @priv:		private data to transport driver specific settings
  *
  * All fields are optional and depend on the hardware driver requirements
@@ -593,6 +599,12 @@ struct platform_nand_ctrl {
 	void		(*select_chip)(struct mtd_info *mtd, int chip);
 	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
 				    unsigned int ctrl);
+	void		(*cmdfunc)(struct mtd_info *mtd, unsigned command, int column, int page_addr);
+	uint8_t		(*read_byte)(struct mtd_info *mtd);
+	u16		(*read_word)(struct mtd_info *mtd);
+	void		(*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
+	void		(*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
+	int		(*verify_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
 	void		*priv;
 };
