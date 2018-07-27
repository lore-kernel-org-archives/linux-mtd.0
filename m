Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fj9w2-0000XX-7W
 for linux-mtd@lists.infradead.org; Fri, 27 Jul 2018 21:06:04 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] mtd: rawnand: Get rid of the ->read_word() hook
Date: Fri, 27 Jul 2018 23:05:42 +0200
Message-Id: <20180727210542.8266-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit c120e75e0e7d ("mtd: nand: use read_oob() instead of cmdfunc()
for bad block check") removed this only user of the ->read_word()
method but kept the hook in place. Remove it now.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c |  9 ---------
 drivers/mtd/nand/raw/au1550nd.c              | 15 ---------------
 drivers/mtd/nand/raw/denali.c                | 10 ----------
 drivers/mtd/nand/raw/hisi504_nand.c          | 10 ----------
 drivers/mtd/nand/raw/mpc5121_nfc.c           | 11 -----------
 drivers/mtd/nand/raw/mxc_nand.c              | 13 -------------
 drivers/mtd/nand/raw/nand_base.c             | 14 --------------
 drivers/mtd/nand/raw/nandsim.c               | 10 ----------
 drivers/mtd/nand/raw/sh_flctl.c              | 10 ----------
 drivers/mtd/nand/raw/socrates_nand.c         | 12 ------------
 include/linux/mtd/rawnand.h                  |  2 --
 11 files changed, 116 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index a068b214ebaa..525e1325841d 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -418,14 +418,6 @@ static u8 atmel_nand_read_byte(struct mtd_info *mtd)
 	return ioread8(nand->activecs->io.virt);
 }
 
-static u16 atmel_nand_read_word(struct mtd_info *mtd)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct atmel_nand *nand = to_atmel_nand(chip);
-
-	return ioread16(nand->activecs->io.virt);
-}
-
 static void atmel_nand_write_byte(struct mtd_info *mtd, u8 byte)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
@@ -1500,7 +1492,6 @@ static void atmel_nand_init(struct atmel_nand_controller *nc,
 
 	chip->cmd_ctrl = atmel_nand_cmd_ctrl;
 	chip->read_byte = atmel_nand_read_byte;
-	chip->read_word = atmel_nand_read_word;
 	chip->write_byte = atmel_nand_write_byte;
 	chip->read_buf = atmel_nand_read_buf;
 	chip->write_buf = atmel_nand_write_buf;
diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 35f5c84cd331..32c0440141fb 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -83,20 +83,6 @@ static void au_write_byte16(struct mtd_info *mtd, u_char byte)
 	wmb(); /* drain writebuffer */
 }
 
-/**
- * au_read_word -  read one word from the chip
- * @mtd:	MTD device structure
- *
- * read function for 16bit buswidth without endianness conversion
- */
-static u16 au_read_word(struct mtd_info *mtd)
-{
-	struct nand_chip *this = mtd_to_nand(mtd);
-	u16 ret = readw(this->IO_ADDR_R);
-	wmb(); /* drain writebuffer */
-	return ret;
-}
-
 /**
  * au_write_buf -  write buffer to chip
  * @mtd:	MTD device structure
@@ -462,7 +448,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 
 	this->read_byte = (pd->devwidth) ? au_read_byte16 : au_read_byte;
 	ctx->write_byte = (pd->devwidth) ? au_write_byte16 : au_write_byte;
-	this->read_word = au_read_word;
 	this->write_buf = (pd->devwidth) ? au_write_buf16 : au_write_buf;
 	this->read_buf = (pd->devwidth) ? au_read_buf16 : au_read_buf;
 
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index ca18612c4201..a031645a244d 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -279,15 +279,6 @@ static void denali_write_byte(struct mtd_info *mtd, uint8_t byte)
 	denali_write_buf(mtd, &byte, 1);
 }
 
-static uint16_t denali_read_word(struct mtd_info *mtd)
-{
-	uint16_t word;
-
-	denali_read_buf16(mtd, (uint8_t *)&word, 2);
-
-	return word;
-}
-
 static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
@@ -1349,7 +1340,6 @@ int denali_init(struct denali_nand_info *denali)
 	chip->select_chip = denali_select_chip;
 	chip->read_byte = denali_read_byte;
 	chip->write_byte = denali_write_byte;
-	chip->read_word = denali_read_word;
 	chip->cmd_ctrl = denali_cmd_ctrl;
 	chip->dev_ready = denali_dev_ready;
 	chip->waitfunc = denali_waitfunc;
diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index 950dc7789296..0f5c48aa5673 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -380,15 +380,6 @@ static uint8_t hisi_nfc_read_byte(struct mtd_info *mtd)
 	return *(uint8_t *)(host->buffer + host->offset - 1);
 }
 
-static u16 hisi_nfc_read_word(struct mtd_info *mtd)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct hinfc_host *host = nand_get_controller_data(chip);
-
-	host->offset += 2;
-	return *(u16 *)(host->buffer + host->offset - 2);
-}
-
 static void
 hisi_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
@@ -795,7 +786,6 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	chip->cmdfunc		= hisi_nfc_cmdfunc;
 	chip->select_chip	= hisi_nfc_select_chip;
 	chip->read_byte		= hisi_nfc_read_byte;
-	chip->read_word		= hisi_nfc_read_word;
 	chip->write_buf		= hisi_nfc_write_buf;
 	chip->read_buf		= hisi_nfc_read_buf;
 	chip->chip_delay	= HINFC504_CHIP_DELAY;
diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 6d1740d54e0d..c0be9c30b4cf 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -515,16 +515,6 @@ static u8 mpc5121_nfc_read_byte(struct mtd_info *mtd)
 	return tmp;
 }
 
-/* Read word from NFC buffers */
-static u16 mpc5121_nfc_read_word(struct mtd_info *mtd)
-{
-	u16 tmp;
-
-	mpc5121_nfc_read_buf(mtd, (u_char *)&tmp, sizeof(tmp));
-
-	return tmp;
-}
-
 /*
  * Read NFC configuration from Reset Config Word
  *
@@ -703,7 +693,6 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	chip->dev_ready = mpc5121_nfc_dev_ready;
 	chip->cmdfunc = mpc5121_nfc_command;
 	chip->read_byte = mpc5121_nfc_read_byte;
-	chip->read_word = mpc5121_nfc_read_word;
 	chip->read_buf = mpc5121_nfc_read_buf;
 	chip->write_buf = mpc5121_nfc_write_buf;
 	chip->select_chip = mpc5121_nfc_select_chip;
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 4c9214dea424..a0884a621053 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -921,18 +921,6 @@ static u_char mxc_nand_read_byte(struct mtd_info *mtd)
 	return ret;
 }
 
-static uint16_t mxc_nand_read_word(struct mtd_info *mtd)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
-	uint16_t ret;
-
-	ret = *(uint16_t *)(host->data_buf + host->buf_start);
-	host->buf_start += 2;
-
-	return ret;
-}
-
 /* Write data of length len to buffer buf. The data to be
  * written on NAND Flash is first copied to RAMbuffer. After the Data Input
  * Operation by the NFC, the data is written to NAND Flash */
@@ -1793,7 +1781,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 	this->dev_ready = mxc_nand_dev_ready;
 	this->cmdfunc = mxc_nand_command;
 	this->read_byte = mxc_nand_read_byte;
-	this->read_word = mxc_nand_read_word;
 	this->write_buf = mxc_nand_write_buf;
 	this->read_buf = mxc_nand_read_buf;
 	this->set_features = mxc_nand_set_features;
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e591410cddc9..306ef6ec41db 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -277,18 +277,6 @@ static uint8_t nand_read_byte16(struct mtd_info *mtd)
 	return (uint8_t) cpu_to_le16(readw(chip->IO_ADDR_R));
 }
 
-/**
- * nand_read_word - [DEFAULT] read one word from the chip
- * @mtd: MTD device structure
- *
- * Default read function for 16bit buswidth without endianness conversion.
- */
-static u16 nand_read_word(struct mtd_info *mtd)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	return readw(chip->IO_ADDR_R);
-}
-
 /**
  * nand_select_chip - [DEFAULT] control CE line
  * @mtd: MTD device structure
@@ -5007,8 +4995,6 @@ static void nand_set_defaults(struct nand_chip *chip)
 	/* If called twice, pointers that depend on busw may need to be reset */
 	if (!chip->read_byte || chip->read_byte == nand_read_byte)
 		chip->read_byte = busw ? nand_read_byte16 : nand_read_byte;
-	if (!chip->read_word)
-		chip->read_word = nand_read_word;
 	if (!chip->block_bad)
 		chip->block_bad = nand_block_bad;
 	if (!chip->block_markbad)
diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 71ac034aee9c..47a81d1b1397 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2108,15 +2108,6 @@ static int ns_device_ready(struct mtd_info *mtd)
 	return 1;
 }
 
-static uint16_t ns_nand_read_word(struct mtd_info *mtd)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-
-	NS_DBG("read_word\n");
-
-	return chip->read_byte(mtd) | (chip->read_byte(mtd) << 8);
-}
-
 static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
@@ -2267,7 +2258,6 @@ static int __init ns_init_module(void)
 	chip->dev_ready  = ns_device_ready;
 	chip->write_buf  = ns_nand_write_buf;
 	chip->read_buf   = ns_nand_read_buf;
-	chip->read_word  = ns_nand_read_word;
 	chip->ecc.mode   = NAND_ECC_SOFT;
 	chip->ecc.algo   = NAND_ECC_HAMMING;
 	/* The NAND_SKIP_BBTSCAN option is necessary for 'overridesize' */
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index bb8866e05ff7..ef3036d9bf15 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -985,15 +985,6 @@ static uint8_t flctl_read_byte(struct mtd_info *mtd)
 	return data;
 }
 
-static uint16_t flctl_read_word(struct mtd_info *mtd)
-{
-	struct sh_flctl *flctl = mtd_to_flctl(mtd);
-	uint16_t *buf = (uint16_t *)&flctl->done_buff[flctl->index];
-
-	flctl->index += 2;
-	return *buf;
-}
-
 static void flctl_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	struct sh_flctl *flctl = mtd_to_flctl(mtd);
@@ -1186,7 +1177,6 @@ static int flctl_probe(struct platform_device *pdev)
 	nand->chip_delay = 20;
 
 	nand->read_byte = flctl_read_byte;
-	nand->read_word = flctl_read_word;
 	nand->write_buf = flctl_write_buf;
 	nand->read_buf = flctl_read_buf;
 	nand->select_chip = flctl_select_chip;
diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 9824a9923583..36c45aa21f66 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -85,17 +85,6 @@ static uint8_t socrates_nand_read_byte(struct mtd_info *mtd)
 	return byte;
 }
 
-/**
- * socrates_nand_read_word -  read one word from the chip
- * @mtd:	MTD device structure
- */
-static uint16_t socrates_nand_read_word(struct mtd_info *mtd)
-{
-	uint16_t word;
-	socrates_nand_read_buf(mtd, (uint8_t *)&word, sizeof(word));
-	return word;
-}
-
 /*
  * Hardware specific access to control-lines
  */
@@ -172,7 +161,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 
 	nand_chip->cmd_ctrl = socrates_nand_cmd_ctrl;
 	nand_chip->read_byte = socrates_nand_read_byte;
-	nand_chip->read_word = socrates_nand_read_word;
 	nand_chip->write_buf = socrates_nand_write_buf;
 	nand_chip->read_buf = socrates_nand_read_buf;
 	nand_chip->dev_ready = socrates_nand_device_ready;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index efb2345359bb..d155470f53c8 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1182,7 +1182,6 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
  * @IO_ADDR_W:		[BOARDSPECIFIC] address to write the 8 I/O lines of the
  *			flash device.
  * @read_byte:		[REPLACEABLE] read one byte from the chip
- * @read_word:		[REPLACEABLE] read one word from the chip
  * @write_byte:		[REPLACEABLE] write a single byte to the chip on the
  *			low 8 I/O lines
  * @write_buf:		[REPLACEABLE] write data from the buffer to the chip
@@ -1287,7 +1286,6 @@ struct nand_chip {
 	void __iomem *IO_ADDR_W;
 
 	uint8_t (*read_byte)(struct mtd_info *mtd);
-	u16 (*read_word)(struct mtd_info *mtd);
 	void (*write_byte)(struct mtd_info *mtd, uint8_t byte);
 	void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
 	void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
-- 
2.14.1
