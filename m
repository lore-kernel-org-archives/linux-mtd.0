Received: from gateway30.websitewelcome.com ([192.185.160.12])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfTxu-0003Es-Mn
 for linux-mtd@lists.infradead.org; Wed, 09 Aug 2017 16:36:16 +0000
Received: from cm15.websitewelcome.com (cm15.websitewelcome.com [100.42.49.9])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 094BB32A0
 for <linux-mtd@lists.infradead.org>; Wed,  9 Aug 2017 11:35:23 -0500 (CDT)
Date: Wed, 9 Aug 2017 11:35:21 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mtd: nand: mtk: fix error return code in mtk_ecc_probe()
Message-ID: <20170809163521.GA4941@embeddedgus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

platform_get_irq() returns an error code, but the mtk_ecc driver
ignores it and always returns -EINVAL. This is not correct and,
prevents -EPROBE_DEFER from being propagated properly.

Print and propagate the return value of platform_get_irq on failure.

This issue was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/nand/mtk_ecc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index 6c3a4aa..7f3b065 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -464,8 +464,8 @@ static int mtk_ecc_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get irq\n");
-		return -EINVAL;
+		dev_err(dev, "failed to get irq: %d\n", irq);
+		return irq;
 	}
 
 	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
-- 
2.5.0
