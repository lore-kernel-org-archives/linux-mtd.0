Received: from fg-out-1718.google.com ([72.14.220.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OFdC5-0006Fz-DE
	for linux-mtd@lists.infradead.org; Sat, 22 May 2010 01:08:02 +0000
Received: by fg-out-1718.google.com with SMTP id l26so1094115fgb.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 May 2010 18:07:59 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3] r852: register IRQ as last step
Date: Sat, 22 May 2010 04:07:54 +0300
Message-Id: <1274490476-16057-1-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1274490185.15285.22.camel@maxim-laptop>
References: <1274490185.15285.22.camel@maxim-laptop>
Cc: dwmw2 <dwmw2@infradead.org>, Maxim Levitsky <maximlevitsky@gmail.com>
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
