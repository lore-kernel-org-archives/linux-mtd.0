Received: from mail-bk0-x229.google.com ([2a00:1450:4008:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VChSk-0007iF-C0
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2013 02:51:03 +0000
Received: by mail-bk0-f41.google.com with SMTP id na10so28583bkb.14
 for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2013 19:50:36 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 23 Aug 2013 10:50:36 +0800
Message-ID: <CAPgLHd8an7_iEV1eTNGFmQ8B4CM=FGu0jrov_A=L9JRJ8AFKPA@mail.gmail.com>
Subject: [PATCH -next] mtd: atmel_nand: fix error return code in
 atmel_nand_probe()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com,
 artem.bityutskiy@linux.intel.com, josh.wu@atmel.com, plagnioj@jcrosoft.com,
 jg1.han@samsung.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: devicetree@vger.kernel.org, yongjun_wei@trendmicro.com.cn,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/nand/atmel_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 65b302c..093bcf8 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2047,6 +2047,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0) {
 			dev_err(host->dev, "Cannot get HSMC irq!\n");
+			res = irq;
 			goto err_nand_ioremap;
 		}
 
