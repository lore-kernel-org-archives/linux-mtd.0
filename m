Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bB7Lb-0004cX-Oo
 for linux-mtd@lists.infradead.org; Thu, 09 Jun 2016 21:18:40 +0000
Received: by mail-pf0-x243.google.com with SMTP id 62so3549366pfd.3
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2016 14:18:19 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [V3, 2/2] mtd: brcmnand: Detect sticky ucorr ecc error on dma reads
Date: Thu,  9 Jun 2016 17:17:55 -0400
Message-Id: <1465507075-9447-2-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1465507075-9447-1-git-send-email-kdasu.kdev@gmail.com>
References: <1465507075-9447-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This change provides a fix for controller bug where nand
controller could have a possible sticky error after a PIO
followed by a DMA read. The fix retries a read if we see
a uncorr_ecc after read to detect such sticky errors.
The fix applies to only controller version 7.0 and 7.1.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
V3 changes 
 none
V2 Changes 
 Restrict controller bug workaround to version 7.0 and 7.1
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 7ee9617..1156495 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1602,9 +1602,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	struct brcmnand_controller *ctrl = host->ctrl;
 	u64 err_addr = 0;
 	int err;
+	static bool retry = true;
 
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
+try_dmaread:
 	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_COUNT, 0);
 
 	if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
@@ -1626,6 +1628,22 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 
 	if (mtd_is_eccerr(err)) {
 		/*
+		 * On controller version and 7.0, 7.1 , DMA read after a
+		 * prior PIO read that reported uncorrectable error,
+		 * the DMA engine captures this error following DMA read
+		 * cleared only on subsequent DMA read, so just retry once
+		 * to clear a possible false error reported for current DMA
+		 * read
+		 */
+		if ((ctrl->nand_version == 0x0700) ||
+		    (ctrl->nand_version == 0x0701)) {
+			if (retry) {
+				retry = false;
+				goto try_dmaread;
+			}
+		}
+
+		/*
 		 * Controller version 7.2 has hw encoder to detect erased page
 		 * bitflips, apply sw verification for older controllers only
 		 */
-- 
1.9.1
