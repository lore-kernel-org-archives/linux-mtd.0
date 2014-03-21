Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR4PU-0007Ev-Mf
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 18:43:17 +0000
From: David Mosberger <davidm@egauge.net>
To: linux-mtd@lists.infradead.org
Subject: mtd: nand: fix byte addressing on 16-bit wide devices
Date: Fri, 21 Mar 2014 12:07:22 -0600
Message-Id: <1395425242-20145-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry, I keep forgetting how broken gmail is for sending patches.
Here is try # 2.

  --david

mtd: nand: fix byte adressing on 16-bit wide devices

Some commands (READID, GET_FEATURES, and SET_FEATURES) require
byte-addresses even when the databus is 16 bits wide.  Without this
patch, 16-bit wide devices are unable to detect ONFI.

Signed-off-by: David Mosberger <davidm@egauge.net>

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9715a7b..132866c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -103,6 +103,20 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
  */
 DEFINE_LED_TRIGGER(nand_led_trigger);
 
+/*
+ * Some commands (READID, GET_FEATURES, and SET_FEATURES) are
+ * byte-oriented even when the data-bus is 16 bits wide.  To preserve
+ * the byte-address, we need to encode it properly depending on
+ * whether or not the device has a 16 bit wide bus.
+ */
+static inline int byte_addr(struct nand_chip *chip, int addr)
+{
+	if (chip->options & NAND_BUSWIDTH_16)
+		return addr << 1;
+	else
+		return addr;
+}
+
 static int check_offs_len(struct mtd_info *mtd,
 					loff_t ofs, uint64_t len)
 {
@@ -2821,7 +2835,7 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 	      & ONFI_OPT_CMD_SET_GET_FEATURES))
 		return -EINVAL;
 
-	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, -1);
+	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, byte_addr(chip, addr), -1);
 	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
 		chip->write_byte(mtd, subfeature_param[i]);
 
@@ -2851,7 +2865,7 @@ static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
 	/* clear the sub feature parameters */
 	memset(subfeature_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
 
-	chip->cmdfunc(mtd, NAND_CMD_GET_FEATURES, addr, -1);
+	chip->cmdfunc(mtd, NAND_CMD_GET_FEATURES, byte_addr(chip, addr), -1);
 	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
 		*subfeature_param++ = chip->read_byte(mtd);
 	return 0;
@@ -3067,7 +3081,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	int val;
 
 	/* Try ONFI for unknown chip or LP */
-	chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
+	chip->cmdfunc(mtd, NAND_CMD_READID, byte_addr(chip, 0x20), -1);
 	if (chip->read_byte(mtd) != 'O' || chip->read_byte(mtd) != 'N' ||
 		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
 		return 0;
@@ -3491,7 +3505,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
 
 	/* Send the command for reading device ID */
-	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
+	chip->cmdfunc(mtd, NAND_CMD_READID, byte_addr(chip, 0x00), -1);
 
 	/* Read manufacturer and device IDs */
 	*maf_id = chip->read_byte(mtd);
@@ -3504,7 +3518,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	 * not match, ignore the device completely.
 	 */
 
-	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
+	chip->cmdfunc(mtd, NAND_CMD_READID, byte_addr(chip, 0x00), -1);
 
 	/* Read entire ID string */
 	for (i = 0; i < 8; i++)
@@ -3662,7 +3676,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		/* See comment in nand_get_flash_type for reset */
 		chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
 		/* Send the command for reading device ID */
-		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
+		chip->cmdfunc(mtd, NAND_CMD_READID, byte_addr(chip, 0x00), -1);
 		/* Read manufacturer and device IDs */
 		if (nand_maf_id != chip->read_byte(mtd) ||
 		    nand_dev_id != chip->read_byte(mtd)) {
