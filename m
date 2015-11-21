Received: from smtp-out-098.synserver.de ([212.40.185.98]
 helo=smtp-out-188.synserver.de)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a068Q-0005DV-JU
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 11:15:16 +0000
From: Lars-Peter Clausen <lars@metafoo.de>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, linux-mtd@lists.infradead.org,
 Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] mtd: nand: r852: Remove unnecessary synchronize_irq() before
 free_irq()
Date: Sat, 21 Nov 2015 12:14:44 +0100
Message-Id: <1448104484-22612-1-git-send-email-lars@metafoo.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Calling synchronize_irq() right before free_irq() is quite useless. On one
hand the IRQ can easily fire again before free_irq() is entered, on the
other hand free_irq() itself calls synchronize_irq() internally (in a race
condition free way), before any state associated with the IRQ is freed.

Patch was generated using the following semantic patch:
// <smpl>
@@
expression irq;
@@
-synchronize_irq(irq);
 free_irq(irq, ...);
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/mtd/nand/r852.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index d8bb2be..be28cdd 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -980,7 +980,6 @@ static void r852_remove(struct pci_dev *pci_dev)
 
 	/* Stop interrupts */
 	r852_disable_irqs(dev);
-	synchronize_irq(dev->irq);
 	free_irq(dev->irq, dev);
 
 	/* Cleanup */
-- 
2.1.4
