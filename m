Received: from mail-pg0-f66.google.com ([74.125.83.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbV2s-0000aC-3c
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 16:24:40 +0000
Received: by mail-pg0-f66.google.com with SMTP id 75so15578169pgf.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 08:24:17 -0800 (PST)
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH -next] mtd: aspeed: remove redundant dev_err call in
 aspeed_smc_probe()
Date: Wed,  8 Feb 2017 16:23:10 +0000
Message-Id: <20170208162310.6048-1-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <weiyongjun1@huawei.com>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 7c86099..56051d3 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -723,17 +723,13 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	controller->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(controller->regs)) {
-		dev_err(dev, "Cannot remap controller address.\n");
+	if (IS_ERR(controller->regs))
 		return PTR_ERR(controller->regs);
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	controller->ahb_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(controller->ahb_base)) {
-		dev_err(dev, "Cannot remap controller address.\n");
+	if (IS_ERR(controller->ahb_base))
 		return PTR_ERR(controller->ahb_base);
-	}
 
 	ret = aspeed_smc_setup_flash(controller, np, res);
 	if (ret)
