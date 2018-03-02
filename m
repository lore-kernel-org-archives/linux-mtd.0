Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlcq-0004s2-Qt
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:25:53 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 13/14] mtd: rawnand: get rid of the JEDEC parameter page in
 nand_chip
Date: Fri,  2 Mar 2018 15:24:21 +0100
Message-Id: <20180302142422.2543-14-miquel.raynal@bootlin.com>
In-Reply-To: <20180302142422.2543-1-miquel.raynal@bootlin.com>
References: <20180302142422.2543-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND chip parameter page is statically allocated within the
nand_chip structure, which reserves a lot of space. Even not ONFI nor
JEDEC chips have it embedded. Also, only a few parameters are actually
read from the parameter page after the detection.

Now that there is a small nand_parameters structure that can held
generic parameters, remove the JEDEC page from the nand_chip structure
by just allocating it during the identification phase and removing it
right after.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 34 ++++++++++++++++++++++++----------
 include/linux/mtd/rawnand.h      | 14 +-------------
 2 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 2d8cbe8eb78b..9706908fbdcf 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5225,7 +5225,7 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 static int nand_flash_detect_jedec(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_jedec_params *p = &chip->jedec_params;
+	struct nand_jedec_params *p;
 	struct jedec_ecc_info *ecc;
 	char id[5];
 	int i, val, ret;
@@ -5235,14 +5235,23 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 	if (ret || strncmp(id, "JEDEC", sizeof(id)))
 		return 0;
 
+	/* JEDEC chip: allocate a buffer to hold its parameter page */
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
 	ret = nand_read_param_page_op(chip, 0x40, NULL, 0);
-	if (ret)
-		return 0;
+	if (ret) {
+		ret = 0;
+		goto free_jedec_param_page;
+	}
 
 	for (i = 0; i < 3; i++) {
 		ret = nand_read_data_op(chip, p, sizeof(*p), true);
-		if (ret)
-			return 0;
+		if (ret) {
+			ret = 0;
+			goto free_jedec_param_page;
+		}
 
 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
 				le16_to_cpu(p->crc))
@@ -5251,7 +5260,7 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 
 	if (i == 3) {
 		pr_err("Could not find valid JEDEC parameter page; aborting\n");
-		return 0;
+		goto free_jedec_param_page;
 	}
 
 	/* Check version */
@@ -5263,7 +5272,7 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 
 	if (!chip->jedec_version) {
 		pr_info("unsupported JEDEC version: %d\n", val);
-		return 0;
+		goto free_jedec_param_page;
 	}
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
@@ -5285,7 +5294,7 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
 	chip->bits_per_cell = p->bits_per_cell;
 
-	if (jedec_feature(chip) & JEDEC_FEATURE_16_BIT_BUS)
+	if (le16_to_cpu(p->features) & JEDEC_FEATURE_16_BIT_BUS)
 		chip->options |= NAND_BUSWIDTH_16;
 
 	/* ECC info */
@@ -5298,7 +5307,9 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 		pr_warn("Invalid codeword size\n");
 	}
 
-	return 1;
+free_jedec_param_page:
+	kfree(p);
+	return ret;
 }
 
 /*
@@ -5604,7 +5615,10 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 			goto ident_done;
 
 		/* Check if the chip is JEDEC compliant */
-		if (nand_flash_detect_jedec(chip))
+		ret = nand_flash_detect_jedec(chip);
+		if (ret < 0)
+			return ret;
+		if (ret)
 			goto ident_done;
 	}
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index d2105352033a..965e6113f661 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1186,8 +1186,6 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
  *			non 0 if JEDEC supported.
  * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
  *			supported, 0 otherwise.
- * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
- *			supported, 0 otherwise.
  * @max_bb_per_die:	[INTERN] the max number of bad blocks each die of a
  *			this nand device will encounter their life times.
  * @blocks_per_die:	[INTERN] The number of PEBs in a die
@@ -1268,10 +1266,7 @@ struct nand_chip {
 	struct nand_id id;
 	int onfi_version;
 	int jedec_version;
-	union {
-		struct nand_onfi_params	onfi_params;
-		struct nand_jedec_params jedec_params;
-	};
+	struct nand_onfi_params	onfi_params;
 	struct nand_parameters parameters;
 	u16 max_bb_per_die;
 	u32 blocks_per_die;
@@ -1602,13 +1597,6 @@ static inline int nand_opcode_8bits(unsigned int command)
 	return 0;
 }
 
-/* return the supported JEDEC features. */
-static inline int jedec_feature(struct nand_chip *chip)
-{
-	return chip->jedec_version ? le16_to_cpu(chip->jedec_params.features)
-		: 0;
-}
-
 /* get timing characteristics from ONFI timing mode. */
 const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode);
 
-- 
2.14.1
