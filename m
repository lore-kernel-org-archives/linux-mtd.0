Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJnaB-0000df-0j
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2010 13:02:07 +0000
Received: by mail-fx0-f49.google.com with SMTP id 15so4682798fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Jun 2010 06:02:06 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: dwmw2 <dwmw2@infradead.org>
Subject: [PATCH 1/4] r852: register IRQ as last step
Date: Wed,  2 Jun 2010 16:01:45 +0300
Message-Id: <1275483708-11929-2-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1275483708-11929-1-git-send-email-maximlevitsky@gmail.com>
References: <1275483708-11929-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Maxim Levitsky <maximlevitsky@gmail.com>

Otherwise, if it fires right away, it might access
uninitialized spinlock

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/r852.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 78a4232..20a654a 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -940,18 +940,19 @@ int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 
 	r852_dma_test(dev);
 
+	dev->irq = pci_dev->irq;
+	spin_lock_init(&dev->irqlock);
+
+	dev->card_detected = 0;
+	r852_card_update_present(dev);
+
 	/*register irq handler*/
 	error = -ENODEV;
 	if (request_irq(pci_dev->irq, &r852_irq, IRQF_SHARED,
 			  DRV_NAME, dev))
 		goto error10;
 
-	dev->irq = pci_dev->irq;
-	spin_lock_init(&dev->irqlock);
-
 	/* kick initial present test */
-	dev->card_detected = 0;
-	r852_card_update_present(dev);
 	queue_delayed_work(dev->card_workqueue,
 		&dev->card_detect_work, 0);
 
-- 
1.7.0.4
