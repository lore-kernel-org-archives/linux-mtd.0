Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP3iy-0006o0-02
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 10:57:45 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [RFC PATCH 2/5] mtd: rawnand: tmio: Do not abuse nand_controller->wq
Date: Tue, 20 Nov 2018 11:57:17 +0100
Message-Id: <20181120105720.23081-3-boris.brezillon@bootlin.com>
In-Reply-To: <20181120105720.23081-1-boris.brezillon@bootlin.com>
References: <20181120105720.23081-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_controller->wq has never been meant to be used by NAND controller
drivers. This waitqueue is used by the framework to serialize accesses
to a NAND controller, and messing up with its state is a really bad
idea.

Declare a completion object in tmio_nand and use it to wait for RB
transitions.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/tmio_nand.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
index f3b59e649b7d..4405273898ac 100644
--- a/drivers/mtd/nand/raw/tmio_nand.c
+++ b/drivers/mtd/nand/raw/tmio_nand.c
@@ -104,6 +104,7 @@
 
 struct tmio_nand {
 	struct nand_chip chip;
+	struct completion comp;
 
 	struct platform_device *dev;
 
@@ -168,15 +169,11 @@ static int tmio_nand_dev_ready(struct nand_chip *chip)
 static irqreturn_t tmio_irq(int irq, void *__tmio)
 {
 	struct tmio_nand *tmio = __tmio;
-	struct nand_chip *nand_chip = &tmio->chip;
 
 	/* disable RDYREQ interrupt */
 	tmio_iowrite8(0x00, tmio->fcr + FCR_IMR);
+	complete(&tmio->comp);
 
-	if (unlikely(!waitqueue_active(&nand_chip->controller->wq)))
-		dev_warn(&tmio->dev->dev, "spurious interrupt\n");
-
-	wake_up(&nand_chip->controller->wq);
 	return IRQ_HANDLED;
 }
 
@@ -193,12 +190,14 @@ static int tmio_nand_wait(struct nand_chip *nand_chip)
 	u8 status;
 
 	/* enable RDYREQ interrupt */
+
 	tmio_iowrite8(0x0f, tmio->fcr + FCR_ISR);
+	reinit_completion(&tmio->comp);
 	tmio_iowrite8(0x81, tmio->fcr + FCR_IMR);
 
-	timeout = wait_event_timeout(nand_chip->controller->wq,
-		tmio_nand_dev_ready(nand_chip),
-		msecs_to_jiffies(nand_chip->state == FL_ERASING ? 400 : 20));
+	timeout = nand_chip->state == FL_ERASING ? 400 : 20;
+	timeout = wait_for_completion_timeout(&tmio->comp,
+					      msecs_to_jiffies(timeout));
 
 	if (unlikely(!tmio_nand_dev_ready(nand_chip))) {
 		tmio_iowrite8(0x00, tmio->fcr + FCR_IMR);
@@ -378,6 +377,8 @@ static int tmio_probe(struct platform_device *dev)
 	if (!tmio)
 		return -ENOMEM;
 
+	init_completion(&tmio->comp);
+
 	tmio->dev = dev;
 
 	platform_set_drvdata(dev, tmio);
-- 
2.17.1
