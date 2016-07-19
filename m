Received: from m12-15.163.com ([220.181.12.15])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPTNB-0005ch-H1
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 11:39:38 +0000
From: Wei Yongjun <weiyj_lk@163.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH -next] mtd: atmel-quadspi: remove redundant dev_err call in
 atmel_qspi_probe()
Date: Tue, 19 Jul 2016 11:38:28 +0000
Message-Id: <1468928308-5543-1-git-send-email-weiyj_lk@163.com>
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

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/spi-nor/atmel-quadspi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
index 47937d9..f0c04bb 100644
--- a/drivers/mtd/spi-nor/atmel-quadspi.c
+++ b/drivers/mtd/spi-nor/atmel-quadspi.c
@@ -615,7 +615,6 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_base");
 	aq->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(aq->regs)) {
-		dev_err(&pdev->dev, "missing registers\n");
 		err = PTR_ERR(aq->regs);
 		goto exit;
 	}
@@ -624,7 +623,6 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_mmap");
 	aq->mem = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(aq->mem)) {
-		dev_err(&pdev->dev, "missing AHB memory\n");
 		err = PTR_ERR(aq->mem);
 		goto exit;
 	}
