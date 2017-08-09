Received: from gateway31.websitewelcome.com ([192.185.143.47])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfTkl-0001Nf-Mq
 for linux-mtd@lists.infradead.org; Wed, 09 Aug 2017 16:22:41 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id 4EBA81C223
 for <linux-mtd@lists.infradead.org>; Wed,  9 Aug 2017 11:22:05 -0500 (CDT)
Date: Wed, 9 Aug 2017 11:22:04 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mtd: spi-nor: cqspi: fix error return code in cqspi_probe()
Message-ID: <20170809162204.GA370@embeddedgus>
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

platform_get_irq() returns an error code, but the cadence-quadspi
driver ignores it and always returns -ENXIO. This is not correct
and, prevents -EPROBE_DEFER from being propagated properly.

Print and propagate the return value of platform_get_irq on failure.

This issue was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 53c7d8e..15dacf5 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1202,8 +1202,8 @@ static int cqspi_probe(struct platform_device *pdev)
 	/* Obtain IRQ line. */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(dev, "Cannot obtain IRQ.\n");
-		return -ENXIO;
+		dev_err(dev, "Cannot obtain IRQ: %d\n", irq);
+		return irq;
 	}
 
 	ret = clk_prepare_enable(cqspi->clk);
-- 
2.5.0
