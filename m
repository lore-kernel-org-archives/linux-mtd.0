Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vtubu-00017A-NF
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 07:35:03 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY300NR8H2C3320@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 16:35:00 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
In-reply-to: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
Subject: [PATCH V2 8/8] mtd: tmio_nand: Use devm_*() functions
Date: Fri, 20 Dec 2013 16:35:00 +0900
Message-id: <001501cefd55$fd5a8ae0$f80fa0a0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Ian Molton' <ian.molton@codethink.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_*() functions to make cleanup paths simpler.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
No change since v1.

 drivers/mtd/nand/tmio_nand.c |   46 ++++++++++++------------------------------
 1 file changed, 13 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index a3747c9..fb8fd35 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -371,11 +371,9 @@ static int tmio_probe(struct platform_device *dev)
 	if (data == NULL)
 		dev_warn(&dev->dev, "NULL platform data!\n");
 
-	tmio = kzalloc(sizeof *tmio, GFP_KERNEL);
-	if (!tmio) {
-		retval = -ENOMEM;
-		goto err_kzalloc;
-	}
+	tmio = devm_kzalloc(&dev->dev, sizeof(*tmio), GFP_KERNEL);
+	if (!tmio)
+		return -ENOMEM;
 
 	tmio->dev = dev;
 
@@ -385,22 +383,18 @@ static int tmio_probe(struct platform_device *dev)
 	mtd->priv = nand_chip;
 	mtd->name = "tmio-nand";
 
-	tmio->ccr = ioremap(ccr->start, resource_size(ccr));
-	if (!tmio->ccr) {
-		retval = -EIO;
-		goto err_iomap_ccr;
-	}
+	tmio->ccr = devm_ioremap(&dev->dev, ccr->start, resource_size(ccr));
+	if (!tmio->ccr)
+		return -EIO;
 
 	tmio->fcr_base = fcr->start & 0xfffff;
-	tmio->fcr = ioremap(fcr->start, resource_size(fcr));
-	if (!tmio->fcr) {
-		retval = -EIO;
-		goto err_iomap_fcr;
-	}
+	tmio->fcr = devm_ioremap(&dev->dev, fcr->start, resource_size(fcr));
+	if (!tmio->fcr)
+		return -EIO;
 
 	retval = tmio_hw_init(dev, tmio);
 	if (retval)
-		goto err_hwinit;
+		return retval;
 
 	/* Set address of NAND IO lines */
 	nand_chip->IO_ADDR_R = tmio->fcr;
@@ -428,7 +422,8 @@ static int tmio_probe(struct platform_device *dev)
 	/* 15 us command delay time */
 	nand_chip->chip_delay = 15;
 
-	retval = request_irq(irq, &tmio_irq, 0, dev_name(&dev->dev), tmio);
+	retval = devm_request_irq(&dev->dev, irq, &tmio_irq, 0,
+				  dev_name(&dev->dev), tmio);
 	if (retval) {
 		dev_err(&dev->dev, "request_irq error %d\n", retval);
 		goto err_irq;
@@ -440,7 +435,7 @@ static int tmio_probe(struct platform_device *dev)
 	/* Scan to find existence of the device */
 	if (nand_scan(mtd, 1)) {
 		retval = -ENODEV;
-		goto err_scan;
+		goto err_irq;
 	}
 	/* Register the partitions */
 	retval = mtd_device_parse_register(mtd, NULL, NULL,
@@ -451,18 +446,8 @@ static int tmio_probe(struct platform_device *dev)
 
 	nand_release(mtd);
 
-err_scan:
-	if (tmio->irq)
-		free_irq(tmio->irq, tmio);
 err_irq:
 	tmio_hw_stop(dev, tmio);
-err_hwinit:
-	iounmap(tmio->fcr);
-err_iomap_fcr:
-	iounmap(tmio->ccr);
-err_iomap_ccr:
-	kfree(tmio);
-err_kzalloc:
 	return retval;
 }
 
@@ -471,12 +456,7 @@ static int tmio_remove(struct platform_device *dev)
 	struct tmio_nand *tmio = platform_get_drvdata(dev);
 
 	nand_release(&tmio->mtd);
-	if (tmio->irq)
-		free_irq(tmio->irq, tmio);
 	tmio_hw_stop(dev, tmio);
-	iounmap(tmio->fcr);
-	iounmap(tmio->ccr);
-	kfree(tmio);
 	return 0;
 }
 
-- 
1.7.10.4
