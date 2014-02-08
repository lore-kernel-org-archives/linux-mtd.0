Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WC1fB-0008F2-UU
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2014 06:45:24 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 4/5] mtd: nand: parse out the JEDEC compliant nand
Date: Sat, 8 Feb 2014 14:04:00 +0800
Message-ID: <1391839441-21006-5-git-send-email-b32955@freescale.com>
In-Reply-To: <1391839441-21006-1-git-send-email-b32955@freescale.com>
References: <1391839441-21006-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the parsing code for the JEDEC compliant nand.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   86 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 47fdf17..eb9fb49 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3163,6 +3163,88 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /*
+ * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 otherwise.
+ */
+static int nand_flash_detect_jedec(struct mtd_info *mtd, struct nand_chip *chip,
+					int *busw)
+{
+	struct nand_jedec_params *p = &chip->jedec_params;
+	struct jedec_ecc_info *ecc;
+	int val;
+	int i, j;
+
+	/* Try JEDEC for unknown chip or LP */
+	chip->cmdfunc(mtd, NAND_CMD_READID, 0x40, -1);
+	if (chip->read_byte(mtd) != 'J' || chip->read_byte(mtd) != 'E' ||
+		chip->read_byte(mtd) != 'D' || chip->read_byte(mtd) != 'E' ||
+		chip->read_byte(mtd) != 'C')
+		return 0;
+
+	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0x40, -1);
+	for (i = 0; i < 3; i++) {
+		for (j = 0; j < sizeof(*p); j++)
+			((uint8_t *)p)[j] = chip->read_byte(mtd);
+
+		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
+				le16_to_cpu(p->crc))
+			break;
+	}
+
+	if (i == 3) {
+		pr_err("Could not find valid JEDEC parameter page; aborting\n");
+		return 0;
+	}
+
+	/* Check version */
+	val = le16_to_cpu(p->revision);
+	if (val & (1 << 2))
+		chip->jedec_version = 10;
+	else if (val & (1 << 1))
+		chip->jedec_version = 1; /* vendor specific version */
+
+	if (!chip->jedec_version) {
+		pr_info("unsupported JEDEC version: %d\n", val);
+		return 0;
+	}
+
+	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
+	sanitize_string(p->model, sizeof(p->model));
+	if (!mtd->name)
+		mtd->name = p->model;
+
+	mtd->writesize = le32_to_cpu(p->byte_per_page);
+
+	/* Please reference to the comment for nand_flash_detect_onfi. */
+	mtd->erasesize = 1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
+	mtd->erasesize *= mtd->writesize;
+
+	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
+
+	/* Please reference to the comment for nand_flash_detect_onfi. */
+	chip->chipsize = 1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
+	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
+	chip->bits_per_cell = p->bits_per_cell;
+
+	if (jedec_feature(chip) & JEDEC_FEATURE_16_BIT_BUS)
+		*busw = NAND_BUSWIDTH_16;
+	else
+		*busw = 0;
+
+	/* ECC info */
+	ecc = p->ecc_info;
+
+	if (ecc->codeword_size) {
+		chip->ecc_strength_ds = ecc->ecc_bits;
+		chip->ecc_step_ds = 1 << ecc->codeword_size;
+	} else {
+		pr_debug("Invalid codeword size\n");
+		return 0;
+	}
+
+	return 1;
+}
+
+/*
  * nand_id_has_period - Check if an ID string has a given wraparound period
  * @id_data: the ID string
  * @arrlen: the length of the @id_data array
@@ -3527,6 +3609,10 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		/* Check is chip is ONFI compliant */
 		if (nand_flash_detect_onfi(mtd, chip, &busw))
 			goto ident_done;
+
+		/* Check if the chip is JEDEC compliant */
+		if (nand_flash_detect_jedec(mtd, chip, &busw))
+			goto ident_done;
 	}
 
 	if (!type->name)
-- 
1.7.2.rc3
