Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V72uI-0006lT-EQ
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 12:32:02 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 02/14] mtd: nand: pxa3xx: Handle ECC and DMA enable/disable
 properly
Date: Wed,  7 Aug 2013 09:31:07 -0300
Message-Id: <1375878679-18098-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
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
---
 drivers/mtd/nand/pxa3xx_nand.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 2582e1f..e3cd903 100644
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
