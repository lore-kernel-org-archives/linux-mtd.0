Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffi2f-0000nl-Sm
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:42:39 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 4/7] mtd: rawnand: micron: allow forced on-die ECC
Date: Wed, 18 Jul 2018 10:42:18 +0200
Message-Id: <20180718084221.27821-4-boris.brezillon@bootlin.com>
In-Reply-To: <20180718084221.27821-1-boris.brezillon@bootlin.com>
References: <20180718084221.27821-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Chris Packham <chris.packham@alliedtelesis.co.nz>

Some Micron NAND chips have on-die ECC forceably enabled. Allow such
chips to be used as long as the controller has set chip->ecc.mode to
NAND_ECC_ON_DIE.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index f8839c7f7464..fd3f68e0909f 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -374,7 +374,8 @@ static int micron_nand_init(struct nand_chip *chip)
 
 	ondie = micron_supports_on_die_ecc(chip);
 
-	if (ondie == MICRON_ON_DIE_MANDATORY) {
+	if (ondie == MICRON_ON_DIE_MANDATORY &&
+	    chip->ecc.mode != NAND_ECC_ON_DIE) {
 		pr_err("On-die ECC forcefully enabled, not supported\n");
 		return -EINVAL;
 	}
@@ -398,8 +399,14 @@ static int micron_nand_init(struct nand_chip *chip)
 		chip->ecc.algo = NAND_ECC_BCH;
 		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
 		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
-		chip->ecc.read_page_raw = nand_read_page_raw;
-		chip->ecc.write_page_raw = nand_write_page_raw;
+
+		if (ondie == MICRON_ON_DIE_MANDATORY) {
+			chip->ecc.read_page_raw = nand_read_page_raw_notsupp;
+			chip->ecc.write_page_raw = nand_write_page_raw_notsupp;
+		} else {
+			chip->ecc.read_page_raw = nand_read_page_raw;
+			chip->ecc.write_page_raw = nand_write_page_raw;
+		}
 	}
 
 	return 0;
-- 
2.14.1
