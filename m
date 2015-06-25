Received: from gproxy2-pub.mail.unifiedlayer.com ([69.89.18.3])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8Gs0-00015T-Uc
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2015 23:47:49 +0000
From: Willem Atsma <willem.atsma@tanglebridge.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Bug fix in kernel nand driver code for ONFI flash with
 unconfigured buswidth
Date: Thu, 25 Jun 2015 16:46:46 -0700
Message-Id: <1435276006-804-1-git-send-email-willem.atsma@tanglebridge.com>
Cc: Willem Atsma <willem.atsma@tanglebridge.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previously, when ONFI configuration succeeds the driver configuration might
still fail in the calling function nand_get_flash_type() if the
chip->options was not configured for the detected busw (8 or 16bit). With
ONFI present the hardware driver does not need to be configured. However
downstream the driver uses the chip->options field, so this patch updates
the bits when ONFI detection succeeds.

This fixes nand driver configuration on the overo-earth platform with
micron nand flash.

Signed-off-by: Willem Atsma <willem.atsma@tanglebridge.com>
---
 drivers/mtd/nand/nand_base.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ceb68ca..7b20471 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3218,6 +3218,11 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	else
 		*busw = 0;
 
+	/* Set the chip option here since ONFI succeeded and non-ONFI config may
+	 * be incomplete:
+	 */
+	chip->options |= *busw;
+
 	if (p->ecc_bits != 0xff) {
 		chip->ecc_strength_ds = p->ecc_bits;
 		chip->ecc_step_ds = 512;
-- 
1.9.1
