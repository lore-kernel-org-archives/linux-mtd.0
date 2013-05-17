Received: from mail-db8lp0188.outbound.messaging.microsoft.com
 ([213.199.154.188] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UdBRB-0005wq-7N
 for linux-mtd@lists.infradead.org; Fri, 17 May 2013 03:34:36 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v6 06/10] mtd: replace the hardcode with the onfi_feature()
Date: Fri, 17 May 2013 11:17:30 +0800
Message-ID: <1368760654-28754-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1368760654-28754-1-git-send-email-b32955@freescale.com>
References: <1368760654-28754-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, vikram186@gmail.com, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current code uses the hardcode to detect the 16-bit bus width.
Use the onfi_feature() to replace it.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0b1162a..355976d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2961,9 +2961,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
 	chip->chipsize = le32_to_cpu(p->blocks_per_lun);
 	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
-	*busw = 0;
-	if (le16_to_cpu(p->features) & 1)
-		*busw = NAND_BUSWIDTH_16;
+
+	*busw = (onfi_feature(chip) & ONFI_FEATURE_16_BIT_BUS) ?
+			NAND_BUSWIDTH_16 : 0;
 
 	if (p->ecc_bits != 0xff) {
 		chip->ecc_strength_ds = p->ecc_bits;
-- 
1.7.1
