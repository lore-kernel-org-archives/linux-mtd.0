Received: from m12-15.163.com ([220.181.12.15])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBktt-0003lF-N8
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 13:23:40 +0000
From: weiyj_lk@163.com
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Jingoo Han <jg1.han@samsung.com>, Josh Wu <Josh.wu@atmel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH -next] mtd: atmel_nand: remove redundant dev_err call
Date: Mon, 28 Jul 2014 21:19:55 +0800
Message-Id: <1406553595-29939-1-git-send-email-weiyj_lk@163.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org
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
 drivers/mtd/nand/atmel_nand.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index e321c56..8c2b6ee 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1148,7 +1148,6 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 
 	host->ecc = devm_ioremap_resource(&pdev->dev, regs);
 	if (IS_ERR(host->ecc)) {
-		dev_err(host->dev, "ioremap failed\n");
 		err_no = PTR_ERR(host->ecc);
 		goto err;
 	}
@@ -1156,8 +1155,6 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 	regs_pmerr = platform_get_resource(pdev, IORESOURCE_MEM, 2);
 	host->pmerrloc_base = devm_ioremap_resource(&pdev->dev, regs_pmerr);
 	if (IS_ERR(host->pmerrloc_base)) {
-		dev_err(host->dev,
-			"Can not get I/O resource for PMECC ERRLOC controller!\n");
 		err_no = PTR_ERR(host->pmerrloc_base);
 		goto err;
 	}
@@ -1165,7 +1162,6 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 	regs_rom = platform_get_resource(pdev, IORESOURCE_MEM, 3);
 	host->pmecc_rom_base = devm_ioremap_resource(&pdev->dev, regs_rom);
 	if (IS_ERR(host->pmecc_rom_base)) {
-		dev_err(host->dev, "Can not get I/O resource for ROM!\n");
 		err_no = PTR_ERR(host->pmecc_rom_base);
 		goto err;
 	}
@@ -1530,10 +1526,8 @@ static int atmel_hw_nand_init_params(struct platform_device *pdev,
 	}
 
 	host->ecc = devm_ioremap_resource(&pdev->dev, regs);
-	if (IS_ERR(host->ecc)) {
-		dev_err(host->dev, "ioremap failed\n");
+	if (IS_ERR(host->ecc))
 		return PTR_ERR(host->ecc);
-	}
 
 	/* ECC is calculated for the whole page (1 step) */
 	nand_chip->ecc.size = mtd->writesize;
@@ -2040,7 +2034,6 @@ static int atmel_nand_probe(struct platform_device *pdev)
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	host->io_base = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(host->io_base)) {
-		dev_err(&pdev->dev, "atmel_nand: ioremap resource failed\n");
 		res = PTR_ERR(host->io_base);
 		goto err_nand_ioremap;
 	}
