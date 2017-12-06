From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 10/10] mtd: nand: gpmi: return error code from
 gpmi_ecc_write_page
Date: Wed,  6 Dec 2017 10:19:25 +0100
Message-Id: <20171206091925.5810-11-s.hauer@pengutronix.de>
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

When something goes wrong in gpmi_ecc_write_page() return an
error rather than howling in the logs.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index d8038b62246c..d1f1bd69f496 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1132,8 +1132,6 @@ static int gpmi_ecc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	/* Ask the NFC. */
 	ret = gpmi_send_page(this, payload_phys, auxiliary_phys);
-	if (ret)
-		dev_err(this->dev, "Error in ECC-based write: %d\n", ret);
 
 	if (oob_mapped)
 		dma_unmap_single(this->dev, auxiliary_phys, mtd->oobsize,
@@ -1143,7 +1141,7 @@ static int gpmi_ecc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		dma_unmap_single(this->dev, payload_phys, mtd->writesize,
 				 DMA_TO_DEVICE);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.11.0
