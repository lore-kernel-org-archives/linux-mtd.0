MIME-Version: 1.0
Date: Tue, 7 Jan 2014 21:38:32 +0800
Message-ID: <CAPgLHd_RMOPLP2f4nA1vqNNddocMUX7f-gE29TTkuJZPUm=SWw@mail.gmail.com>
Subject: [PATCH -next] mtd: nuc900_nand: remove redundant return value check
 of platform_get_resource()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: mcuos.com@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 jg1.han@samsung.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove unneeded error handling on the result of a call
to platform_get_resource() when the value is passed to
devm_ioremap_resource().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/nand/nuc900_nand.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index 661fd14..9ee09a8 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -268,9 +268,6 @@ static int nuc900_nand_probe(struct platform_device *pdev)
 	chip->ecc.mode		= NAND_ECC_SOFT;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENXIO;
-
 	nuc900_nand->reg = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(nuc900_nand->reg))
 		return PTR_ERR(nuc900_nand->reg);
