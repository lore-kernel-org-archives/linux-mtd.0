Received: from mx1.minet.net ([157.159.40.25])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWETI-00074J-A8
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 17:29:04 +0000
From: Florian Fainelli <florian.fainelli@telecomint.eu>
Date: Mon, 3 Mar 2008 18:28:36 +0100
Subject: [PATCH] Extend plat_nand to support more callbacks
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200803031828.36965.florian.fainelli@telecomint.eu>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch extends the platform NAND driver to support
more callbacks thus making possible to convert more
drivers to use plat_nand.

Signed-off-by: Florian Fainelli <florian.fainelli@telecomint.eu>
---
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index f6d5c2a..d924a1d 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -58,7 +58,13 @@ static int __init plat_nand_probe(struct platform_device *pdev)
 	data->chip.IO_ADDR_R = data->io_base;
 	data->chip.IO_ADDR_W = data->io_base;
 	data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
+	data->chip.cmdfunc = pdata->ctrl.cmdfunc;
 	data->chip.dev_ready = pdata->ctrl.dev_ready;
+	data->chip.read_byte = pdata->ctrl.read_byte;
+	data->chip.read_word = pdata->ctrl.read_word;
+	data->chip.write_buf = pdata->ctrl.write_buf;
+	data->chip.read_buf = pdata->ctrl.read_buf;
+	data->chip.verify_buf = pdata->ctrl.verify_buf;
 	data->chip.select_chip = pdata->ctrl.select_chip;
 	data->chip.chip_delay = pdata->chip.chip_delay;
 	data->chip.options |= pdata->chip.options;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c42bc7f..9256d51 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -583,6 +583,16 @@ struct platform_nand_chip {
  * @select_chip:	platform specific chip select function
  * @cmd_ctrl:		platform specific function for controlling
  *			ALE/CLE/nCE. Also used to write command and address
+ * @cmdfunc:		platform specific function for writing commands 
+ * 			to the chip
+ * @read_byte:		platform specific function to read one byte from the chip
+ * @read_word:		platform specific function to read one word from the chip
+ * @write_buf:		platform specific function to write data from the buffer to
+ * 			the chip
+ * @read_buf:		platform specific function to read data from the chip into
+ * 			the buffer
+ * @verify_buf:		platforum specific function to verify buffer contents against
+ * 			the chip data
  * @priv:		private data to transport driver specific settings
  *
  * All fields are optional and depend on the hardware driver requirements
@@ -593,6 +603,16 @@ struct platform_nand_ctrl {
 	void		(*select_chip)(struct mtd_info *mtd, int chip);
 	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
 				    unsigned int ctrl);
+	void		(*cmdfunc)(struct mtd_info *mtd, unsigned command,
+					int column, int page_addr);
+	uint8_t		(*read_byte)(struct mtd_info *mtd);
+	u16		(*read_word)(struct mtd_info *mtd);
+	void		(*write_buf)(struct mtd_info *mtd, const uint8_t *buf,
+					int len);
+	void		(*read_buf)(struct mtd_info *mtd, uint8_t *buf,
+					int len);
+	int		(*verify_buf)(struct mtd_info *mtd, const uint8_t *buf,
+					int len);
 	void		*priv;
 };
