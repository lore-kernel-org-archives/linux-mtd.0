Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOjiW-0006va-Sg
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 07:41:03 +0000
Received: by mail-bk0-f49.google.com with SMTP id r7so2077738bkg.22
 for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2013 00:40:38 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 25 Sep 2013 15:40:38 +0800
Message-ID: <CAPgLHd8G-uaG3a7DfA-eAhcdKD3yXzpCuQJ2c8qFe0412pQX2Q@mail.gmail.com>
Subject: [PATCH] mtd: mpc5121_nfc: drop devm_free_irq of devm_ allocated irq
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com,
 artem.bityutskiy@linux.intel.com, wfp5p@virginia.edu, shijie8@gmail.com,
 agust@denx.de, gsi@denx.de
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

The devm_request_irq function allocates irq that is released
when a driver detaches. Thus, there is no reason to explicitly
call devm_free_irq in probe or remove functions.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/nand/mpc5121_nfc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 3c60a00..7df37f0 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -784,7 +784,6 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	/* Detect NAND chips */
 	if (nand_scan(mtd, be32_to_cpup(chips_no))) {
 		dev_err(dev, "NAND Flash not found !\n");
-		devm_free_irq(dev, prv->irq, mtd);
 		retval = -ENXIO;
 		goto error;
 	}
@@ -809,7 +808,6 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
-		devm_free_irq(dev, prv->irq, mtd);
 		retval = -ENXIO;
 		goto error;
 	}
@@ -820,7 +818,6 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	retval = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
-		devm_free_irq(dev, prv->irq, mtd);
 		goto error;
 	}
 
@@ -838,7 +835,6 @@ static int mpc5121_nfc_remove(struct platform_device *op)
 	struct mpc5121_nfc_prv *prv = chip->priv;
 
 	nand_release(mtd);
-	devm_free_irq(dev, prv->irq, mtd);
 	mpc5121_nfc_free(dev, mtd);
 
 	return 0;
