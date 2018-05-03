Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fE3sw-0004ZA-0q
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 02:22:19 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	boris.brezillon@bootlin.com
Cc: linux-mtd@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, stable@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: marvell: pass ms delay to wait_op
Date: Thu,  3 May 2018 14:21:28 +1200
Message-Id: <20180503022128.10702-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

marvell_nfc_wait_op() expects the delay to be expressed in milliseconds
but nand_sdr_timings uses picoseconds. Use PSEC_TO_MSEC when passing
tPROG_max to marvell_nfc_wait_op().

Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/nand/raw/marvell_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 1d779a35ac8e..e4b964fd40d8 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1074,7 +1074,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
 		return ret;
 
 	ret = marvell_nfc_wait_op(chip,
-				  chip->data_interface.timings.sdr.tPROG_max);
+				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
 	return ret;
 }
 
@@ -1494,7 +1494,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct mtd_info *mtd,
 	}
 
 	ret = marvell_nfc_wait_op(chip,
-				  chip->data_interface.timings.sdr.tPROG_max);
+				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
 
 	marvell_nfc_disable_hw_ecc(chip);
 
-- 
2.17.0
