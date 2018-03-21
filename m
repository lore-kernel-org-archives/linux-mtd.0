Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eydY2-0000MA-4Z
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 13:13:00 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/2] mtd: rawnand: add a field in nand_chip to fill an array
 of IDs
Date: Wed, 21 Mar 2018 14:12:34 +0100
Message-Id: <20180321131235.9822-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180321131235.9822-1-miquel.raynal@bootlin.com>
References: <20180321131235.9822-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add an alternate way to give to the core another ID table to later
remove the one given in nand_scan_ident() as part of the migration to
nand_scan().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 8 ++++++--
 include/linux/mtd/rawnand.h      | 3 +++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 9e151e4c7570..d652c692bb1b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5598,8 +5598,12 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	manufacturer = nand_get_manufacturer(maf_id);
 	chip->manufacturer.desc = manufacturer;
 
-	if (!type)
-		type = nand_flash_ids;
+	if (!type) {
+		if (chip->flash_ids)
+			type = chip->flash_ids;
+		else
+			type = nand_flash_ids;
+	}
 
 	/*
 	 * Save the NAND_BUSWIDTH_16 flag before letting auto-detection logic
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 89675cb9c79f..04b6b99cfb99 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1215,6 +1215,7 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
  *			  chipnr is set to %NAND_DATA_IFACE_CHECK_ONLY this
  *			  means the configuration should not be applied but
  *			  only checked.
+ * @flash_ids:		[OPTIONAL] local NAND flash ID table
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
  *			lookup.
@@ -1301,6 +1302,8 @@ struct nand_chip {
 	unsigned long buf_align;
 	struct nand_hw_control hwcontrol;
 
+	struct nand_flash_dev *flash_ids;
+
 	uint8_t *bbt;
 	struct nand_bbt_descr *bbt_td;
 	struct nand_bbt_descr *bbt_md;
-- 
2.14.1
