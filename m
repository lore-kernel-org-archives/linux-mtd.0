Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faKIL-0001Hq-W1
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 12:20:39 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/3] mtd: rawnand: micron: Disable ECC earlier in the read path
Date: Tue,  3 Jul 2018 14:20:08 +0200
Message-Id: <20180703122009.29914-3-boris.brezillon@bootlin.com>
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

We are about to support extracting the real number of bitflips for
4-bits ECC when WRITE_RECOMMEND is returned. This requires re-reading
the page in raw mode to compare it to the corrected version, and this
logic will be placed in micron_nand_on_die_ecc_status_4().

Moving the micron_nand_on_die_ecc_setup() will allow us to disable
ECC only once.

As a result, we have to rework the exit path and add an error path
where the ECC is disabled.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 63ac98a36ed7..b9cbaf125a98 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -197,30 +197,37 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
 
 	ret = nand_read_page_op(chip, page, 0, NULL, 0);
 	if (ret)
-		goto out;
+		goto err_disable_ecc;
 
 	ret = nand_status_op(chip, &status);
 	if (ret)
-		goto out;
+		goto err_disable_ecc;
 
 	ret = nand_exit_status_op(chip);
 	if (ret)
-		goto out;
+		goto err_disable_ecc;
 
-	if (chip->ecc.strength == 4)
-		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status);
-	else
-		max_bitflips = micron_nand_on_die_ecc_status_8(chip, status);
+	micron_nand_on_die_ecc_setup(chip, false);
 
 	ret = nand_read_data_op(chip, buf, mtd->writesize, false);
 	if (!ret && oob_required)
 		ret = nand_read_data_op(chip, chip->oob_poi, mtd->oobsize,
 					false);
 
-out:
+	if (ret)
+		return ret;
+
+	if (chip->ecc.strength == 4)
+		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status);
+	else
+		max_bitflips = micron_nand_on_die_ecc_status_8(chip, status);
+
+	return max_bitflips;
+
+err_disable_ecc:
 	micron_nand_on_die_ecc_setup(chip, false);
 
-	return ret ? ret : max_bitflips;
+	return ret;
 }
 
 static int
-- 
2.14.1
