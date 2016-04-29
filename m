Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awEv7-0007SL-I7
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2016 20:21:50 +0000
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org,
	computersforpeace@gmail.com
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH 2/2] mtd: brcmnand: Detect sticky ucorr ecc error on dma reads
Date: Fri, 29 Apr 2016 16:21:25 -0400
Message-Id: <1461961285-24159-2-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
References: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
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

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 29a9abd..13c7784 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1555,9 +1555,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	struct brcmnand_controller *ctrl = host->ctrl;
 	u64 err_addr = 0;
 	int err;
+	bool retry = true;
 
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
+try_dmaread:
 	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_COUNT, 0);
 
 	if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
@@ -1579,7 +1581,18 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 
 	if (mtd_is_eccerr(err)) {
 		int ret;
-
+		/*
+		 * On controller version >=7.0 if we are doing a DMA read
+		 * after a prior PIO read that reported uncorrectable error,
+		 * the DMA engine captures this error following DMA read
+		 * cleared only on subsequent DMA read, so just retry once
+		 * to clear a possible false error reported for current DMA
+		 * read
+		 */
+		if ((ctrl->nand_version >= 0x0700) && retry) {
+			retry = false;
+			goto try_dmaread;
+		}
 		ret = brcmstb_nand_verify_erased_page(mtd, chip, buf, addr);
 		if (ret < 0) {
 			dev_dbg(ctrl->dev, "uncorrectable error at 0x%llx\n",
-- 
1.9.1
