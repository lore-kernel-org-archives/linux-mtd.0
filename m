Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VogNZ-0005qz-NO
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 21:22:38 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v4] mtd/nand: don't use {read,write}_buf for 8-bit transfers
Date: Thu,  5 Dec 2013 22:22:04 +0100
Message-Id: <1386278524-25669-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20131127073512.GB13929@norris.computersforpeace.net>
References: <20131127073512.GB13929@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kernel@pengutronix.de, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to the Open NAND Flash Interface Specification (ONFI) Revision
3.1 "Parameters are always transferred on the lower 8-bits of the data
bus." for the Get Features and Set Features commands.

So using read_buf and write_buf is wrong for 16-bit wide nand chips as
they use I/O[15:0]. The Get Features command is easily fixed using 4
times the read_byte callback. For Set Features implement a new
overwritable callback "write_byte". Still I expect the default to work
just fine for all controllers and making it overwriteable was just done
for symmetry.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since v2, sent with
Message-Id: 1362415655-13073-1-git-send-email-u.kleine-koenig@pengutronix.de:

 - use a proper uint16_t instead of a 2 byte array to pass to chip->write_buf
   to fix endianess issue. Noticed by David Woodhouse. (This also gets rid of
   the Compound Literal that catched David's eye.)

Changes since v3, sent with
Message-id:1385500515-5376-1-git-send-email-u.kleine-koenig@pengutronix.de (v3)

 - drop whitespace cleanup
 - support resetting to 16 bit width function on 2nd call of nand_set_defaults

 drivers/mtd/nand/nand_base.c | 57 ++++++++++++++++++++++++++++++++++++++++++--
 include/linux/mtd/nand.h     |  3 +++
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bd39f7b..3a6e95f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -202,6 +202,51 @@ static void nand_select_chip(struct mtd_info *mtd, int chipnr)
 }
 
 /**
+ * nand_write_byte - [DEFAULT] write single byte to chip
+ * @mtd: MTD device structure
+ * @byte: value to write
+ *
+ * Default function to write a byte to I/O[7:0]
+ */
+static void nand_write_byte(struct mtd_info *mtd, uint8_t byte)
+{
+	struct nand_chip *chip = mtd->priv;
+
+	chip->write_buf(mtd, &byte, 1);
+}
+
+/**
+ * nand_write_byte16 - [DEFAULT] write single byte to a chip with width 16
+ * @mtd: MTD device structure
+ * @byte: value to write
+ *
+ * Default function to write a byte to I/O[7:0] on a 16-bit wide chip.
+ */
+static void nand_write_byte16(struct mtd_info *mtd, uint8_t byte)
+{
+	struct nand_chip *chip = mtd->priv;
+	uint16_t word = byte;
+
+	/*
+	 * It's not entirely clear what should happen to I/O[15:8] when writing
+	 * a byte. The ONFi spec (Revision 3.1; 2012-09-19, Section 2.16) reads:
+	 *
+	 *    When the host supports a 16-bit bus width, only data is
+	 *    transferred at the 16-bit width. All address and command line
+	 *    transfers shall use only the lower 8-bits of the data bus. During
+	 *    command transfers, the host may place any value on the upper
+	 *    8-bits of the data bus. During address transfers, the host shall
+	 *    set the upper 8-bits of the data bus to 00h.
+	 *
+	 * One user of the write_byte callback is nand_onfi_set_features. The
+	 * four parameters are specified to be written to I/O[7:0], but this is
+	 * neither an address nor a command transfer. Let's assume a 0 on the
+	 * upper I/O lines is OK.
+	 */
+	chip->write_buf(mtd, &word, 2);
+}
+
+/**
  * nand_write_buf - [DEFAULT] write buffer to chip
  * @mtd: MTD device structure
  * @buf: data buffer
@@ -2716,6 +2761,7 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 			int addr, uint8_t *subfeature_param)
 {
 	int status;
+	int i;
 
 	if (!chip->onfi_version ||
 	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
@@ -2723,7 +2769,9 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 		return -EINVAL;
 
 	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, -1);
-	chip->write_buf(mtd, subfeature_param, ONFI_SUBFEATURE_PARAM_LEN);
+	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
+		chip->write_byte(mtd, subfeature_param[i]);
+
 	status = chip->waitfunc(mtd, chip);
 	if (status & NAND_STATUS_FAIL)
 		return -EIO;
@@ -2740,6 +2788,8 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
 			int addr, uint8_t *subfeature_param)
 {
+	int i;
+
 	if (!chip->onfi_version ||
 	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
 	      & ONFI_OPT_CMD_SET_GET_FEATURES))
@@ -2749,7 +2799,8 @@ static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
 	memset(subfeature_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
 
 	chip->cmdfunc(mtd, NAND_CMD_GET_FEATURES, addr, -1);
-	chip->read_buf(mtd, subfeature_param, ONFI_SUBFEATURE_PARAM_LEN);
+	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
+		*subfeature_param++ = chip->read_byte(mtd);
 	return 0;
 }
 
@@ -2812,6 +2863,8 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 		chip->block_markbad = nand_default_block_markbad;
 	if (!chip->write_buf || chip->write_buf == nand_write_buf)
 		chip->write_buf = busw ? nand_write_buf16 : nand_write_buf;
+	if (!chip->write_byte || chip->write_byte == nand_write_byte)
+		chip->write_byte = busw ? nand_write_byte16 : nand_write_byte;
 	if (!chip->read_buf || chip->read_buf == nand_read_buf)
 		chip->read_buf = busw ? nand_read_buf16 : nand_read_buf;
 	if (!chip->scan_bbt)
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9e6c8f9..e843942 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -432,6 +432,8 @@ struct nand_buffers {
  *			flash device.
  * @read_byte:		[REPLACEABLE] read one byte from the chip
  * @read_word:		[REPLACEABLE] read one word from the chip
+ * @write_byte		[REPLACEABLE] write a single byte to the chip on the
+ *			low 8 I/O lines
  * @write_buf:		[REPLACEABLE] write data from the buffer to the chip
  * @read_buf:		[REPLACEABLE] read data from the chip into the buffer
  * @select_chip:	[REPLACEABLE] select chip nr
@@ -521,6 +523,7 @@ struct nand_chip {
 
 	uint8_t (*read_byte)(struct mtd_info *mtd);
 	u16 (*read_word)(struct mtd_info *mtd);
+	void (*write_byte)(struct mtd_info *mtd, uint8_t byte);
 	void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
 	void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
 	void (*select_chip)(struct mtd_info *mtd, int chip);
-- 
1.8.4.3
