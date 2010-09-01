Received: from zmc.proxad.net ([212.27.53.206])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqtuU-0008LQ-Ta
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 20:27:56 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
Date: Wed, 1 Sep 2010 22:28:59 +0200
Subject: [PATCH] NAND: split ONFI detection logic to its own function
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201009012229.00660.ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to reduce the indentation and improve the readability of nand_get_
flash_type, split the ONFI detection logic to its own function. The detection
logic inside nand_flash_detect_onfi is also rewritten to allow for less
indentation.

Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 99222d9..8ea0110 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2819,6 +2819,72 @@ static u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
 }
 
 /*
+ * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise
+ */
+static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
+					int busw)
+{
+	struct nand_onfi_params *p = &chip->onfi_params;
+	int i;
+	int val;
+
+	/* try ONFI for unknow chip or LP */
+	chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
+	if (chip->read_byte(mtd) != 'O' || chip->read_byte(mtd) != 'N' ||
+		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
+		return 0;
+
+	printk(KERN_INFO "ONFI flash detected\n");
+	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
+	for (i = 0; i < 3; i++) {
+		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
+		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
+				le16_to_cpu(p->crc)) {
+			printk(KERN_INFO "ONFI param page %d valid\n", i);
+			break;
+		}
+	}
+
+	if (i == 3)
+		return 0;
+
+	/* check version */
+	val = le16_to_cpu(p->revision);
+	if (val == 1 || val > (1 << 4)) {
+		printk(KERN_INFO "%s: unsupported ONFI version: %d\n",
+								__func__, val);
+		return 0;
+	}
+
+	if (val & (1 << 4))
+		chip->onfi_version = 22;
+	else if (val & (1 << 3))
+		chip->onfi_version = 21;
+	else if (val & (1 << 2))
+		chip->onfi_version = 20;
+	else
+		chip->onfi_version = 10;
+
+	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
+	sanitize_string(p->model, sizeof(p->model));
+	if (!mtd->name)
+		mtd->name = p->model;
+	mtd->writesize = le32_to_cpu(p->byte_per_page);
+	mtd->erasesize = le32_to_cpu(p->pages_per_block) * mtd->writesize;
+	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
+	chip->chipsize = le32_to_cpu(p->blocks_per_lun) * mtd->erasesize;
+	busw = 0;
+	if (le16_to_cpu(p->features) & 1)
+		busw = NAND_BUSWIDTH_16;
+
+	chip->options &= ~NAND_CHIPOPTIONS_MSK;
+	chip->options |= (NAND_NO_READRDY |
+			NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
+
+	return 1;
+}
+
+/*
  * Get the flash and manufacturer id and lookup if the type is supported
  */
 static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
@@ -2828,6 +2894,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 {
 	int i, maf_idx;
 	u8 id_data[8];
+	int ret;
 
 	/* Select the device */
 	chip->select_chip(mtd, 0);
@@ -2872,67 +2939,10 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->onfi_version = 0;
 	if (!type->name || !type->pagesize) {
-		/* try ONFI for unknow chip or LP */
-		chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
-		if (chip->read_byte(mtd) == 'O' &&
-			chip->read_byte(mtd) == 'N' &&
-			chip->read_byte(mtd) == 'F' &&
-			chip->read_byte(mtd) == 'I') {
-
-			struct nand_onfi_params *p = &chip->onfi_params;
-			int i;
-
-			printk(KERN_INFO "ONFI flash detected\n");
-			chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
-			for (i = 0; i < 3; i++) {
-				chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
-				if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
-								le16_to_cpu(p->crc))
-				{
-					 printk(KERN_INFO "ONFI param page %d valid\n", i);
-					 break;
-				}
-			}
-
-			if (i < 3) {
-				/* check version */
-				int val = le16_to_cpu(p->revision);
-				if (val == 1 || val > (1 << 4))
-					printk(KERN_INFO "%s: unsupported ONFI version: %d\n",
-						__func__, val);
-				else {
-					if (val & (1 << 4))
-						chip->onfi_version = 22;
-					else if (val & (1 << 3))
-						chip->onfi_version = 21;
-					else if (val & (1 << 2))
-						chip->onfi_version = 20;
-					else
-						chip->onfi_version = 10;
-				}
-			}
-
-			if (chip->onfi_version) {
-				sanitize_string(p->manufacturer, sizeof(p->manufacturer));
-				sanitize_string(p->model, sizeof(p->model));
-				if (!mtd->name)
-					mtd->name = p->model;
-				mtd->writesize = le32_to_cpu(p->byte_per_page);
-				mtd->erasesize = le32_to_cpu(p->pages_per_block)*mtd->writesize;
-				mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
-				chip->chipsize = le32_to_cpu(p->blocks_per_lun) * mtd->erasesize;
-				busw = 0;
-				if (le16_to_cpu(p->features) & 1)
-					busw = NAND_BUSWIDTH_16;
-
-				chip->options &= ~NAND_CHIPOPTIONS_MSK;
-				chip->options |= (NAND_NO_READRDY |
-						NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
-
-				goto ident_done;
-
-			}
-		}
+		/* Check is chip is ONFI compliant */
+		ret = nand_flash_detect_onfi(mtd, chip, busw);
+		if (ret)
+			goto ident_done;
 	}
 
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
