Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnYD0-0002ht-ML
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 18:59:19 +0000
Received: by mail-pb0-f51.google.com with SMTP id ma3so2885214pbc.24
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 11:58:56 -0700 (PDT)
Date: Fri, 23 May 2014 00:28:48 +0530
From: Himangi Saraogi <himangi774@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: Introduce the use of the managed version of kzalloc
Message-ID: <20140522185848.GA15125@himangi-Dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: julia.lawall@lip6.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch moves data allocated using kzalloc to managed data allocated
using devm_kzalloc and cleans now unnecessary kfrees in probe and remove
functions. Also, the now unnecessary label out_err_hw_init is done away
with and the label out_err_kzalloc is renamed to out_err.

The following Coccinelle semantic patch was used for making the change:

@platform@
identifier p, probefn, removefn;
@@
struct platform_driver p = {
  .probe = probefn,
  .remove = removefn,
};

@prb@
identifier platform.probefn, pdev;
expression e, e1, e2;
@@
probefn(struct platform_device *pdev, ...) {
  <+...
- e = kzalloc(e1, e2)
+ e = devm_kzalloc(&pdev->dev, e1, e2)
  ...
?-kfree(e);
  ...+>
}

@rem depends on prb@
identifier platform.removefn;
expression e;
@@
removefn(...) {
  <...
- kfree(e);
  ...>
}

Signed-off-by: Himangi Saraogi <himangi774@gmail.com>
---
 drivers/mtd/nand/bf5xx_nand.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index b7a2494..722898a 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -679,9 +679,6 @@ static int bf5xx_nand_remove(struct platform_device *pdev)
 	peripheral_free_list(bfin_nfc_pin_req);
 	bf5xx_nand_dma_remove(info);
 
-	/* free the common resources */
-	kfree(info);
-
 	return 0;
 }
 
@@ -742,10 +739,10 @@ static int bf5xx_nand_probe(struct platform_device *pdev)
 		return -EFAULT;
 	}
 
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (info == NULL) {
 		err = -ENOMEM;
-		goto out_err_kzalloc;
+		goto out_err;
 	}
 
 	platform_set_drvdata(pdev, info);
@@ -790,7 +787,7 @@ static int bf5xx_nand_probe(struct platform_device *pdev)
 	/* initialise the hardware */
 	err = bf5xx_nand_hw_init(info);
 	if (err)
-		goto out_err_hw_init;
+		goto out_err;
 
 	/* setup hardware ECC data struct */
 	if (hardware_ecc) {
@@ -827,9 +824,7 @@ static int bf5xx_nand_probe(struct platform_device *pdev)
 
 out_err_nand_scan:
 	bf5xx_nand_dma_remove(info);
-out_err_hw_init:
-	kfree(info);
-out_err_kzalloc:
+out_err:
 	peripheral_free_list(bfin_nfc_pin_req);
 
 	return err;
-- 
1.9.1
