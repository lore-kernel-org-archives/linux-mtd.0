From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 08/10] mtd: nand: gpmi: remove unnecessary variables
Date: Wed,  6 Dec 2017 10:19:23 +0100
Message-Id: <20171206091925.5810-9-s.hauer@pengutronix.de>
In-Reply-To: <20171206091925.5810-1-s.hauer@pengutronix.de>
References: <20171206091925.5810-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use this->auxiliary_virt and this->auxiliary_phys directly rather
than creating extra local variables for them.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 09eb1960a60d..8dc40b672ab9 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -954,8 +954,6 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
 	void          *payload_virt;
 	dma_addr_t    payload_phys;
-	void          *auxiliary_virt;
-	dma_addr_t    auxiliary_phys;
 	unsigned int  i;
 	unsigned char *status;
 	unsigned int  max_bitflips = 0;
@@ -979,13 +977,10 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		}
 	}
 
-	auxiliary_virt = this->auxiliary_virt;
-	auxiliary_phys = this->auxiliary_phys;
-
 	writel(mtd->bitflip_threshold, this->resources.bch_regs + HW_BCH_MODE);
 
 	/* go! */
-	ret = gpmi_read_page(this, payload_phys, auxiliary_phys);
+	ret = gpmi_read_page(this, payload_phys, this->auxiliary_phys);
 
 	if (direct)
 		dma_unmap_single(this->dev, payload_phys, nfc_geo->payload_size,
@@ -997,7 +992,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	/* Loop over status bytes, accumulating ECC status. */
-	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
+	status = this->auxiliary_virt + nfc_geo->auxiliary_status_offset;
 
 	if (!direct)
 		memcpy(buf, this->payload_virt, nfc_geo->payload_size);
@@ -1022,7 +1017,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	/* handle the block mark swapping */
-	block_mark_swapping(this, buf, auxiliary_virt);
+	block_mark_swapping(this, buf, this->auxiliary_virt);
 
 	if (oob_required) {
 		/*
@@ -1036,7 +1031,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		 * the block mark.
 		 */
 		memset(chip->oob_poi, ~0, mtd->oobsize);
-		chip->oob_poi[0] = ((uint8_t *) auxiliary_virt)[0];
+		chip->oob_poi[0] = ((uint8_t *)this->auxiliary_virt)[0];
 	}
 
 	return max_bitflips;
-- 
2.11.0
