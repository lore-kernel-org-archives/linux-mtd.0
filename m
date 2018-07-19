Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgAmT-00068t-TU
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 15:23:51 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/3] mtd: rawnand: marvell: speed-up hamming failure path
Date: Thu, 19 Jul 2018 17:23:37 +0200
Message-Id: <20180719152337.6372-4-miquel.raynal@bootlin.com>
In-Reply-To: <20180719152337.6372-1-miquel.raynal@bootlin.com>
References: <20180719152337.6372-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a read triggers an ECC error it might have two causes:
* Either there was too much bitflips and the data cannot be sanitized.
* Or the page is empty.

For the latter case, we need to re-read the page in raw mode to check
for the ECC bytes to be 0xFF. This is done with a call to
marvell_nfc_hw_ecc_hmg_do_read_page() which will trigger a new read
inside the NAND chip and implies strong delays. As the data is already
laying in the NAND cache, let's just retrieve it with the ECC engine
turned off.

As we are only reading a small section of the page, we can write
directly in the OOB buffer at the right offset, there is no need to
allocate a buffer for that.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 83bb4ef9baa6..29cb3d2e121f 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -974,9 +974,7 @@ static int marvell_nfc_hw_ecc_hmg_read_page(struct mtd_info *mtd,
 					    int page)
 {
 	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
-	unsigned int full_sz = lt->data_bytes + lt->spare_bytes + lt->ecc_bytes;
 	int max_bitflips = 0, ret;
-	u8 *raw_buf;
 
 	marvell_nfc_enable_hw_ecc(chip);
 	marvell_nfc_hw_ecc_hmg_do_read_page(chip, buf, chip->oob_poi, false,
@@ -988,18 +986,16 @@ static int marvell_nfc_hw_ecc_hmg_read_page(struct mtd_info *mtd,
 		return max_bitflips;
 
 	/*
-	 * When ECC failures are detected, check if the full page has been
-	 * written or not. Ignore the failure if it is actually empty.
+	 * When ECC failures are detected, check if the page has been
+	 * written or not by re-reading the ECC bytes in raw mode.
+	 * Ignore the failure if it is actually empty.
 	 */
-	raw_buf = kmalloc(full_sz, GFP_KERNEL);
-	if (!raw_buf)
-		return -ENOMEM;
-
-	marvell_nfc_hw_ecc_hmg_do_read_page(chip, raw_buf, raw_buf +
-					    lt->data_bytes, true, page);
-	marvell_nfc_check_empty_chunk(chip, raw_buf, full_sz, NULL, 0, NULL, 0,
+	nand_change_read_column_op(chip, lt->data_bytes + lt->spare_bytes,
+				   chip->oob_poi + lt->spare_bytes,
+				   lt->ecc_bytes, false);
+	marvell_nfc_check_empty_chunk(chip, buf, lt->data_bytes, chip->oob_poi,
+				      lt->spare_bytes + lt->ecc_bytes, NULL, 0,
 				      &max_bitflips);
-	kfree(raw_buf);
 
 	return max_bitflips;
 }
-- 
2.14.1
