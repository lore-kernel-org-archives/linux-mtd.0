Received: from mail-by2on0106.outbound.protection.outlook.com
 ([207.46.100.106] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4GOG-0008QN-21
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 23:00:50 +0000
From: Han Xu <b45815@freescale.com>
To: <shijie.huang@arm.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <b45815@freescale.com>, <boris.brezillon@free-electrons.com>,
 <fabio.estevam@freescale.com>, <hofrat@osadl.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vinod.koul@intel.com>, <dan.j.williams@intel.com>,
 <dmaengine@vger.kernel.org>
Subject: [PATCH v8 4/7] mtd: nand: gpmi: may use minimum required ecc for 744
 oobsize NAND
Date: Wed, 2 Dec 2015 16:47:43 -0600
Message-ID: <1449096466-18064-5-git-send-email-b45815@freescale.com>
In-Reply-To: <1449096466-18064-1-git-send-email-b45815@freescale.com>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

By default NAND driver will choose the highest ecc strength that oob
could contain, in this case, for some 8K+744 NAND flash, the ecc
strength will be up to 52bit, which beyonds the i.MX6QDL BCH capability
(40bit).

This patch allows the NAND driver try to use minimum required ecc
strength if it failed to use the highest ecc, even without explicitly
claiming "fsl,use-minimum-ecc" in dts.

Signed-off-by: Han Xu <b45815@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index ba5975f..298c1d1 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -136,7 +136,7 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
  *
  * We may have available oob space in this case.
  */
-static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
+static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
 	struct mtd_info *mtd = &this->mtd;
@@ -145,7 +145,7 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 	unsigned int block_mark_bit_offset;
 
 	if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
-		return false;
+		return -EINVAL;
 
 	switch (chip->ecc_step_ds) {
 	case SZ_512:
@@ -158,19 +158,19 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 		dev_err(this->dev,
 			"unsupported nand chip. ecc bits : %d, ecc size : %d\n",
 			chip->ecc_strength_ds, chip->ecc_step_ds);
-		return false;
+		return -EINVAL;
 	}
 	geo->ecc_chunk_size = chip->ecc_step_ds;
 	geo->ecc_strength = round_up(chip->ecc_strength_ds, 2);
 	if (!gpmi_check_ecc(this))
-		return false;
+		return -EINVAL;
 
 	/* Keep the C >= O */
 	if (geo->ecc_chunk_size < mtd->oobsize) {
 		dev_err(this->dev,
 			"unsupported nand chip. ecc size: %d, oob size : %d\n",
 			chip->ecc_step_ds, mtd->oobsize);
-		return false;
+		return -EINVAL;
 	}
 
 	/* The default value, see comment in the legacy_set_geometry(). */
@@ -242,7 +242,7 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 				+ ALIGN(geo->ecc_chunk_count, 4);
 
 	if (!this->swap_block_mark)
-		return true;
+		return 0;
 
 	/* For bit swap. */
 	block_mark_bit_offset = mtd->writesize * 8 -
@@ -251,7 +251,7 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 
 	geo->block_mark_byte_offset = block_mark_bit_offset / 8;
 	geo->block_mark_bit_offset  = block_mark_bit_offset % 8;
-	return true;
+	return 0;
 }
 
 static int legacy_set_geometry(struct gpmi_nand_data *this)
@@ -285,7 +285,8 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 	geo->ecc_strength = get_ecc_strength(this);
 	if (!gpmi_check_ecc(this)) {
 		dev_err(this->dev,
-			"required ecc strength of the NAND chip: %d is not supported by the GPMI controller (%d)\n",
+			"ecc strength: %d cannot be supported by the controller (%d)\n"
+			"try to use minimum ecc strength that NAND chip required\n",
 			geo->ecc_strength,
 			this->devdata->bch_max_ecc_strength);
 		return -EINVAL;
@@ -366,10 +367,11 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 
 int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
-	if (of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc")
-		&& set_geometry_by_ecc_info(this))
-		return 0;
-	return legacy_set_geometry(this);
+	if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
+				|| legacy_set_geometry(this))
+		return set_geometry_by_ecc_info(this);
+
+	return 0;
 }
 
 struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
-- 
1.9.1
