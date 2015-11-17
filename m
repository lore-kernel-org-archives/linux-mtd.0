Received: from mail-bn1bbn0108.outbound.protection.outlook.com
 ([157.56.111.108] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyifP-0004Yi-3m
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 15:59:36 +0000
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Fabio Estevam
 <fabio.estevam@freescale.com>
Subject: [PATCH] mtd: mxc_nand: Remove bit-or operation with zero
Date: Tue, 17 Nov 2015 13:58:50 -0200
Message-ID: <1447775930-11439-1-git-send-email-fabio.estevam@freescale.com>
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

Doing a bit-or operation with zero is pointless.

Remove this unneeded bit-or.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/mxc_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 7922d31..f507d36 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1067,8 +1067,7 @@ static void preset_v3(struct mtd_info *mtd)
 
 	/* Blocks to be unlocked */
 	for (i = 0; i < NAND_MAX_CHIPS; i++)
-		writel(0x0 |	(0xffff << 16),
-				NFC_V3_WRPROT_UNLOCK_BLK_ADD0 + (i << 2));
+		writel(0xffff << 16, NFC_V3_WRPROT_UNLOCK_BLK_ADD0 + (i << 2));
 
 	writel(0, NFC_V3_IPC);
 
-- 
1.9.1
