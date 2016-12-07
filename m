Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEdwi-0006nd-Tl
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 15:15:51 +0000
Received: by mail-pg0-x241.google.com with SMTP id e9so23728693pgc.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2016 07:15:28 -0800 (PST)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@atmel.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V1] mtd : nand : denali :- No need of devm functions
Date: Wed,  7 Dec 2016 20:45:11 +0530
Message-Id: <1481123711-7205-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In function denali_init, the memory allocated for denali->buf.buf
is live within the function only. After the allocation it is
immediately freed with devm_kfree. There is no need to allocate
memory for denali->buf.buf with devm function so replace
devm_kzalloc with kzalloc and devm_kfree with kfree.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/nand/denali.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 0476ae8..ce3c31f 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1476,8 +1476,7 @@ int denali_init(struct denali_nand_info *denali)
 	}
 
 	/* allocate a temporary buffer for nand_scan_ident() */
-	denali->buf.buf = devm_kzalloc(denali->dev, PAGE_SIZE,
-					GFP_DMA | GFP_KERNEL);
+	denali->buf.buf = kzalloc(PAGE_SIZE, GFP_DMA | GFP_KERNEL);
 	if (!denali->buf.buf)
 		return -ENOMEM;
 
@@ -1492,6 +1491,7 @@ int denali_init(struct denali_nand_info *denali)
 	if (request_irq(denali->irq, denali_isr, IRQF_SHARED,
 			DENALI_NAND_NAME, denali)) {
 		pr_err("Spectra: Unable to allocate IRQ\n");
+		kfree(denali->buf.buf);
 		return -ENODEV;
 	}
 
@@ -1512,11 +1512,12 @@ int denali_init(struct denali_nand_info *denali)
 	 */
 	if (nand_scan_ident(mtd, denali->max_banks, NULL)) {
 		ret = -ENXIO;
+		kfree(denali->buf.buf);
 		goto failed_req_irq;
 	}
 
 	/* allocate the right size buffer now */
-	devm_kfree(denali->dev, denali->buf.buf);
+	kfree(denali->buf.buf);
 	denali->buf.buf = devm_kzalloc(denali->dev,
 			     mtd->writesize + mtd->oobsize,
 			     GFP_KERNEL);
-- 
2.7.4
