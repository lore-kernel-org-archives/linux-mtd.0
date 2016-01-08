Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHaBZ-0008I3-4I
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 16:46:45 +0000
From: Harvey Hunt <harvey.hunt@imgtec.com>
To: <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>
CC: Harvey Hunt <harvey.hunt@imgtec.com>, Alex Smith <alex@alex-smith.me.uk>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: nand: jz4780: Update ecc correction error codes
Date: Fri, 8 Jan 2016 16:45:17 +0000
Message-ID: <1452271517-18993-1-git-send-email-harvey.hunt@imgtec.com>
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

Update jz4780_bch_ecc_correct's return codes with appropriate values,
as specified in /include/linux/mtd/nand.h.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: Alex Smith <alex@alex-smith.me.uk>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/nand/jz4780_bch.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.c
index 5954fbf..755499c 100644
--- a/drivers/mtd/nand/jz4780_bch.c
+++ b/drivers/mtd/nand/jz4780_bch.c
@@ -210,8 +210,8 @@ EXPORT_SYMBOL(jz4780_bch_calculate);
  * Given the raw data and the ECC read from the NAND device, detects and
  * corrects errors in the data.
  *
- * Return: the number of bit errors corrected, or -1 if there are too many
- * errors to correct or we timed out waiting for the controller.
+ * Return: the number of bit errors corrected, -EBADMSG if there are too many
+ * errors to correct or -ETIMEDOUT if we timed out waiting for the controller.
  */
 int jz4780_bch_correct(struct jz4780_bch *bch, struct jz4780_bch_params *params,
 		       u8 *buf, u8 *ecc_code)
@@ -227,13 +227,13 @@ int jz4780_bch_correct(struct jz4780_bch *bch, struct jz4780_bch_params *params,
 
 	if (!jz4780_bch_wait_complete(bch, BCH_BHINT_DECF, &reg)) {
 		dev_err(bch->dev, "timed out while correcting data\n");
-		ret = -1;
+		ret = -ETIMEDOUT;
 		goto out;
 	}
 
 	if (reg & BCH_BHINT_UNCOR) {
 		dev_warn(bch->dev, "uncorrectable ECC error\n");
-		ret = -1;
+		ret = -EBADMSG;
 		goto out;
 	}
 
-- 
2.6.4
