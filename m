Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUBeX-0000LP-S9
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 07:59:11 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 4/8] mtd: replace the hardcode with the onfi_get_feature()
Date: Mon, 22 Apr 2013 15:47:54 +0800
Message-ID: <1366616878-29481-5-git-send-email-b32955@freescale.com>
In-Reply-To: <1366616878-29481-1-git-send-email-b32955@freescale.com>
References: <1366616878-29481-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current code uses the hardcode to detect the 16-bit bus width.
Use the onfi_get_feature() to replace it.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 48ff097..ba87e43 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2957,9 +2957,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
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
 		chip->ecc_strength = p->ecc_bits;
-- 
1.7.1
