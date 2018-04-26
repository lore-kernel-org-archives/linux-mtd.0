Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBj2D-0005hg-9p
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 15:42:20 +0000
Received: by mail-wr0-x242.google.com with SMTP id p5-v6so29489316wre.12
 for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2018 08:42:04 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Dries Staelens <dries.staelens@barco.com>,
 Sam Lefebvre <sam.lefebvre@essensium.com>,
 Arnout Vandecapelle <arnout@mind.be>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 06/13] mtd: nand: gpmi: remove unnecessary variables
Date: Thu, 26 Apr 2018 17:41:27 +0200
Message-Id: <20180426154134.8270-7-sam.lefebvre@essensium.com>
In-Reply-To: <20180426154134.8270-1-sam.lefebvre@essensium.com>
References: <20180426154134.8270-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sascha Hauer <s.hauer@pengutronix.de>

Use this->auxiliary_virt and this->auxiliary_phys directly rather
than creating extra local variables for them.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: rebased
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 9ecba7ea0cd5..7ba00b8ab288 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -949,8 +949,6 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	void          *payload_virt;
 	dma_addr_t    payload_phys;
-	void          *auxiliary_virt;
-	dma_addr_t    auxiliary_phys;
 	unsigned int  i;
 	unsigned char *status;
 	unsigned int  max_bitflips = 0;
@@ -974,11 +972,8 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 		}
 	}
 
-	auxiliary_virt = this->auxiliary_virt;
-	auxiliary_phys = this->auxiliary_phys;
-
 	/* go! */
-	ret = gpmi_read_page(this, payload_phys, auxiliary_phys);
+	ret = gpmi_read_page(this, payload_phys, this->auxiliary_phys);
 
 	if (direct)
 		dma_unmap_single(this->dev, payload_phys, nfc_geo->payload_size,
@@ -990,7 +985,7 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	}
 
 	/* Loop over status bytes, accumulating ECC status. */
-	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
+	status = this->auxiliary_virt + nfc_geo->auxiliary_status_offset;
 
 	if (!direct)
 		memcpy(buf, this->payload_virt, nfc_geo->payload_size);
@@ -1048,7 +1043,7 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 						buf + i * nfc_geo->ecc_chunk_size,
 						nfc_geo->ecc_chunk_size,
 						eccbuf, eccbytes,
-						auxiliary_virt,
+						this->auxiliary_virt,
 						nfc_geo->metadata_size,
 						nfc_geo->ecc_strength);
 			} else {
@@ -1076,7 +1071,7 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	}
 
 	/* handle the block mark swapping */
-	block_mark_swapping(this, buf, auxiliary_virt);
+	block_mark_swapping(this, buf, this->auxiliary_virt);
 
 	if (oob_required) {
 		/*
@@ -1090,7 +1085,7 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 		 * the block mark.
 		 */
 		memset(chip->oob_poi, ~0, mtd->oobsize);
-		chip->oob_poi[0] = ((uint8_t *) auxiliary_virt)[0];
+		chip->oob_poi[0] = ((uint8_t *)this->auxiliary_virt)[0];
 	}
 
 	return max_bitflips;
-- 
2.14.1
