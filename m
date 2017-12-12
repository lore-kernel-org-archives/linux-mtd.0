Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOg6D-0005dI-GZ
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 08:39:39 +0000
Received: by mail-pg0-x244.google.com with SMTP id k15so12956853pgr.7
 for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2017 00:39:14 -0800 (PST)
From: Greg Cook <greg@morpheus.ws>
To: ezequiel.garcia@free-electrons.com,
	linux-mtd@lists.infradead.org
Cc: Greg Cook <greg@morpheus.ws>, miquel.raynal@free-electrons.com,
 sean.nyekjaer@prevas.dk
Subject: [PATCH] Fix OOB_READ bug where hardware FIFO is not drained
 completely. Fix potential bug for non-ECC operations.
Date: Tue, 12 Dec 2017 16:38:26 +0800
Message-Id: <20171212083826.5000-1-greg@morpheus.ws>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Greg Cook <greg@morpheus.ws>
---
 drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 021374f..cfa8c71 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -677,7 +677,7 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
 
 static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
 {
-	if (info->ecc_bch) {
+	if (info->use_ecc && info->ecc_bch) {
 		u32 val;
 		int ret;
 
@@ -1023,7 +1023,12 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 
 		if (info->cur_chunk < info->nfullchunks) {
 			info->step_chunk_size = info->chunk_size;
-			info->step_spare_size = info->spare_size;
+			if (info->use_ecc) {
+				info->step_spare_size = info->spare_size;
+			} else {
+				info->step_spare_size = info->spare_size
+							+ info->ecc_size;
+			}
 		} else {
 			info->step_chunk_size = info->last_chunk_size;
 			info->step_spare_size = info->last_spare_size;
-- 
2.9.5
