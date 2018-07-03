Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faKIL-0001Hp-Vz
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 12:20:38 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/3] mtd: rawnand: micron: Stop passing mtd to ecc_status()
 funcs
Date: Tue,  3 Jul 2018 14:20:07 +0200
Message-Id: <20180703122009.29914-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180703122009.29914-1-boris.brezillon@bootlin.com>
References: <20180703122009.29914-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd_info object can be retrieved from a nand_chip object. There's
no need to pass both to the ecc_status() functions.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 35fa6880a799..63ac98a36ed7 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -134,9 +134,10 @@ static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
 }
 
 
-static int micron_nand_on_die_ecc_status_4(struct mtd_info *mtd,
-					   struct nand_chip *chip, u8 status)
+static int micron_nand_on_die_ecc_status_4(struct nand_chip *chip, u8 status)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
 	/*
 	 * The internal ECC doesn't tell us the number of bitflips
 	 * that have been corrected, but tells us if it recommends to
@@ -154,9 +155,10 @@ static int micron_nand_on_die_ecc_status_4(struct mtd_info *mtd,
 	return 0;
 }
 
-static int micron_nand_on_die_ecc_status_8(struct mtd_info *mtd,
-					   struct nand_chip *chip, u8 status)
+static int micron_nand_on_die_ecc_status_8(struct nand_chip *chip, u8 status)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
 	/*
 	 * With 8/512 we have more information but still don't know precisely
 	 * how many bit-flips were seen.
@@ -206,9 +208,9 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
 		goto out;
 
 	if (chip->ecc.strength == 4)
-		max_bitflips = micron_nand_on_die_ecc_status_4(mtd, chip, status);
+		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status);
 	else
-		max_bitflips = micron_nand_on_die_ecc_status_8(mtd, chip, status);
+		max_bitflips = micron_nand_on_die_ecc_status_8(chip, status);
 
 	ret = nand_read_data_op(chip, buf, mtd->writesize, false);
 	if (!ret && oob_required)
-- 
2.14.1
