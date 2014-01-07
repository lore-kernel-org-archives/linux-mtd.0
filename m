Received: from mail-bk0-x22e.google.com ([2a00:1450:4008:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0Wrd-0007IO-J2
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 13:38:38 +0000
Received: by mail-bk0-f46.google.com with SMTP id u15so234411bkz.19
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2014 05:38:13 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 7 Jan 2014 21:38:12 +0800
Message-ID: <CAPgLHd-2rHs_v0=tsnG08oJqaf1YmF2peeB_6KJQRnwK6r2N+w@mail.gmail.com>
Subject: [PATCH -next] mtd: plat_nand: remove redundant return value check of
 platform_get_resource()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, grant.likely@linaro.org,
 robh+dt@kernel.org, jg1.han@samsung.com, artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org
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
devm_ioremap_resource(). And move those two call together
to make the connection between them more clear.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/nand/plat_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 4ebed72..0b068a5 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -48,16 +48,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENXIO;
-
 	/* Allocate memory for the device structure (and zero it) */
 	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
 			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	data->io_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(data->io_base))
 		return PTR_ERR(data->io_base);
