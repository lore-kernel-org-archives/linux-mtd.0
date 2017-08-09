Received: from gateway30.websitewelcome.com ([192.185.160.12])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfTri-00031n-8T
 for linux-mtd@lists.infradead.org; Wed, 09 Aug 2017 16:29:51 +0000
Received: from cm15.websitewelcome.com (cm15.websitewelcome.com [100.42.49.9])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id BCF222189F
 for <linux-mtd@lists.infradead.org>; Wed,  9 Aug 2017 11:29:25 -0500 (CDT)
Date: Wed, 9 Aug 2017 11:29:21 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mtd: nand: fix error return code in flctl_probe()
Message-ID: <20170809162921.GA2006@embeddedgus>
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

platform_get_irq() returns an error code, but the sh_flctl
driver ignores it and always returns -ENXIO. This is not correct
and, prevents -EPROBE_DEFER from being propagated properly.

Print and propagate the return value of platform_get_irq on failure.

This issue was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/nand/sh_flctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 891ac7b..7461b80 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -1141,8 +1141,8 @@ static int flctl_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get flste irq data\n");
-		return -ENXIO;
+		dev_err(&pdev->dev, "failed to get flste irq data: %d\n", irq);
+		return irq;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq, flctl_handle_flste, IRQF_SHARED,
-- 
2.5.0
