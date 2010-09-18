Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox6bL-0008Lx-6z
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2010 23:14:03 +0000
Received: by fxm4 with SMTP id 4so197257fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Sep 2010 16:12:58 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/3] MTD: r852: remove useless pci powerup/down from
	suspend/resume routines.
Date: Sun, 19 Sep 2010 01:12:37 +0200
Message-Id: <1284851558-1154-3-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1284851558-1154-1-git-send-email-maximlevitsky@gmail.com>
References: <1284851558-1154-1-git-send-email-maximlevitsky@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Maciej Rutecki <maciej.rutecki@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It turns out that pci core now handles these, so this code is redundand
and can even cause bugs

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/r852.c |   30 +-----------------------------
 drivers/mtd/nand/r852.h |    2 --
 2 files changed, 1 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 5169ca6..d9d7efb 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -757,11 +757,6 @@ static irqreturn_t r852_irq(int irq, void *data)
 
 	spin_lock_irqsave(&dev->irqlock, flags);
 
-	/* We can recieve shared interrupt while pci is suspended
-		in that case reads will return 0xFFFFFFFF.... */
-	if (dev->insuspend)
-		goto out;
-
 	/* handle card detection interrupts first */
 	card_status = r852_read_reg(dev, R852_CARD_IRQ_STA);
 	r852_write_reg(dev, R852_CARD_IRQ_STA, card_status);
@@ -1035,7 +1030,6 @@ void r852_shutdown(struct pci_dev *pci_dev)
 int r852_suspend(struct device *device)
 {
 	struct r852_device *dev = pci_get_drvdata(to_pci_dev(device));
-	unsigned long flags;
 
 	if (dev->ctlreg & R852_CTL_CARDENABLE)
 		return -EBUSY;
@@ -1047,43 +1041,22 @@ int r852_suspend(struct device *device)
 	r852_disable_irqs(dev);
 	r852_engine_disable(dev);
 
-	spin_lock_irqsave(&dev->irqlock, flags);
-	dev->insuspend = 1;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
-
-	/* At that point, even if interrupt handler is running, it will quit */
-	/* So wait for this to happen explictly */
-	synchronize_irq(dev->irq);
-
 	/* If card was pulled off just during the suspend, which is very
 		unlikely, we will remove it on resume, it too late now
 		anyway... */
 	dev->card_unstable = 0;
-
-	pci_save_state(to_pci_dev(device));
-	return pci_prepare_to_sleep(to_pci_dev(device));
+	return 0;
 }
 
 int r852_resume(struct device *device)
 {
 	struct r852_device *dev = pci_get_drvdata(to_pci_dev(device));
-	unsigned long flags;
-
-	/* Turn on the hardware */
-	pci_back_from_sleep(to_pci_dev(device));
-	pci_restore_state(to_pci_dev(device));
 
 	r852_disable_irqs(dev);
 	r852_card_update_present(dev);
 	r852_engine_disable(dev);
 
 
-	/* Now its safe for IRQ to run */
-	spin_lock_irqsave(&dev->irqlock, flags);
-	dev->insuspend = 0;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
-
-
 	/* If card status changed, just do the work */
 	if (dev->card_detected != dev->card_registred) {
 		dbg("card was %s during low power state",
@@ -1121,7 +1094,6 @@ MODULE_DEVICE_TABLE(pci, r852_pci_id_tbl);
 
 SIMPLE_DEV_PM_OPS(r852_pm_ops, r852_suspend, r852_resume);
 
-
 static struct pci_driver r852_pci_driver = {
 	.name		= DRV_NAME,
 	.id_table	= r852_pci_id_tbl,
diff --git a/drivers/mtd/nand/r852.h b/drivers/mtd/nand/r852.h
index 8096cc2..e6a21d9 100644
--- a/drivers/mtd/nand/r852.h
+++ b/drivers/mtd/nand/r852.h
@@ -140,8 +140,6 @@ struct r852_device {
 	/* interrupt handling */
 	spinlock_t irqlock;		/* IRQ protecting lock */
 	int irq;			/* irq num */
-	int insuspend;			/* device is suspended */
-
 	/* misc */
 	void *tmp_buffer;		/* temporary buffer */
 	uint8_t ctlreg;			/* cached contents of control reg */
-- 
1.7.0.4
