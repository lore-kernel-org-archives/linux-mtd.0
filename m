Received: from fg-out-1718.google.com ([72.14.220.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OFdC8-0006Ha-Jw
	for linux-mtd@lists.infradead.org; Sat, 22 May 2010 01:08:05 +0000
Received: by fg-out-1718.google.com with SMTP id e21so537924fga.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 May 2010 18:08:03 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] r852: Fixes in case of DMA timeout
Date: Sat, 22 May 2010 04:07:55 +0300
Message-Id: <1274490476-16057-2-git-send-email-maximlevitsky@gmail.com>
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

* Don't call complete on dma completion
* do a INIT_COMPLETE before using it each time
* Report DMA read error via ecc 'correct'

I finally managed to make my system do suspend to ram propertly, and I see that
if card was inserted during suspend (while system was off), I get dma timeouts
on resume. Simple card reinsert solves the issue.
This patch solves a crash that would happen otherwise

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/r852.c |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 20a654a..3f219e6 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -150,7 +150,6 @@ static void r852_dma_done(struct r852_device *dev, int error)
 	if (dev->phys_dma_addr && dev->phys_dma_addr != dev->phys_bounce_buffer)
 		pci_unmap_single(dev->pci_dev, dev->phys_dma_addr, R852_DMA_LEN,
 			dev->dma_dir ? PCI_DMA_FROMDEVICE : PCI_DMA_TODEVICE);
-	complete(&dev->dma_done);
 }
 
 /*
@@ -182,6 +181,7 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 	/* Set dma direction */
 	dev->dma_dir = do_read;
 	dev->dma_stage = 1;
+	INIT_COMPLETION(dev->dma_done);
 
 	dbg_verbose("doing dma %s ", do_read ? "read" : "write");
 
@@ -494,6 +494,11 @@ int r852_ecc_correct(struct mtd_info *mtd, uint8_t *dat,
 	if (dev->card_unstable)
 		return 0;
 
+	if (dev->dma_error) {
+		dev->dma_error = 0;
+		return -1;
+	}
+
 	r852_write_reg(dev, R852_CTL, dev->ctlreg | R852_CTL_ECC_ACCESS);
 	ecc_reg = r852_read_reg_dword(dev, R852_DATALINE);
 	r852_write_reg(dev, R852_CTL, dev->ctlreg);
@@ -796,6 +801,7 @@ static irqreturn_t r852_irq(int irq, void *data)
 		if (dma_status & R852_DMA_IRQ_ERROR) {
 			dbg("recieved dma error IRQ");
 			r852_dma_done(dev, -EIO);
+			complete(&dev->dma_done);
 			goto out;
 		}
 
@@ -825,8 +831,10 @@ static irqreturn_t r852_irq(int irq, void *data)
 			r852_dma_enable(dev);
 
 		/* Operation done */
-		if (dev->dma_stage == 3)
+		if (dev->dma_stage == 3) {
 			r852_dma_done(dev, 0);
+			complete(&dev->dma_done);
+		}
 		goto out;
 	}
 
@@ -1082,7 +1090,7 @@ int r852_resume(struct device *device)
 			dev->card_detected ? "added" : "removed");
 
 		queue_delayed_work(dev->card_workqueue,
-		&dev->card_detect_work, 1000);
+		&dev->card_detect_work, msecs_to_jiffies(1000));
 		return 0;
 	}
 
-- 
1.7.0.4
