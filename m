Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffi2s-0000pz-3C
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:42:54 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 6/7] mtd: rawnand: micron: Avoid enabling/disabling ECC when
 it can't be disabled
Date: Wed, 18 Jul 2018 10:42:20 +0200
Message-Id: <20180718084221.27821-6-boris.brezillon@bootlin.com>
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

Some chips have their on-die ECC forcibly enabled, there's no point in
trying to enable/disable the ECC engine in that case.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/nand/raw/nand_micron.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 2cff25f7b48b..9d13b701e581 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -65,6 +65,7 @@ struct nand_onfi_vendor_micron {
 } __packed;
 
 struct micron_on_die_ecc {
+	bool forced;
 	void *rawbuf;
 };
 
@@ -171,8 +172,12 @@ static const struct mtd_ooblayout_ops micron_nand_on_die_8_ooblayout_ops = {
 
 static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
 {
+	struct micron_nand *micron = nand_get_manufacturer_data(chip);
 	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
 
+	if (micron->ecc.forced)
+		return 0;
+
 	if (enable)
 		feature[0] |= ONFI_FEATURE_ON_DIE_ECC_EN;
 
@@ -452,6 +457,9 @@ static int micron_nand_init(struct nand_chip *chip)
 			goto err_free_manuf_data;
 		}
 
+		if (ondie == MICRON_ON_DIE_MANDATORY)
+			micron->ecc.forced = true;
+
 		/*
 		 * In case of 4bit on-die ECC, we need a buffer to store a
 		 * page dumped in raw mode so that we can compare its content
-- 
2.14.1
