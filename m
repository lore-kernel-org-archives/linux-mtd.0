Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8ExE-0002Yp-8Z
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 19:36:01 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 03/15] mtd: nand: pxa3xx: Handle ECC and DMA enable/disable
 properly
Date: Sat, 10 Aug 2013 16:34:53 -0300
Message-Id: <1376163305-5591-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When ECC is not selected, the ECC enable bit must be cleared
in the NAND control register. Same applies to DMA.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Tested-by: Daniel Mack <zonque@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 55eb153..dfff327 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -314,8 +314,17 @@ static void pxa3xx_nand_start(struct pxa3xx_nand_info *info)
 	uint32_t ndcr;
 
 	ndcr = host->reg_ndcr;
-	ndcr |= info->use_ecc ? NDCR_ECC_EN : 0;
-	ndcr |= info->use_dma ? NDCR_DMA_EN : 0;
+
+	if (info->use_ecc)
+		ndcr |= NDCR_ECC_EN;
+	else
+		ndcr &= ~NDCR_ECC_EN;
+
+	if (info->use_dma)
+		ndcr |= NDCR_DMA_EN;
+	else
+		ndcr &= ~NDCR_DMA_EN;
+
 	ndcr |= NDCR_ND_RUN;
 
 	/* clear status bits and run */
-- 
1.8.1.5
