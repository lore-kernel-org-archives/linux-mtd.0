Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNoQZ-0003Nj-Rn
 for linux-mtd@lists.infradead.org; Tue, 17 Feb 2015 20:07:28 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH] mtd: pxa3xx-nand: handle PIO in threaded interrupt
Date: Tue, 17 Feb 2015 21:06:57 +0100
Message-Id: <1424203617-29431-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change the handling of the data stage in the driver : don't pump data in
the top-half interrupt, but rather schedule a thread for non dma cases.

This will enable latencies in the data pumping, especially if delays are
required. Moreover platform shall be more reactive as other interrupts
can be served while pumping data.

No throughput degradation was observed, at least on the zylonite
platform, while a slight degradation was being expected.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/nand/pxa3xx_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 96b0b1d..237c92c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -569,11 +569,25 @@ static void start_data_dma(struct pxa3xx_nand_info *info)
 {}
 #endif
 
+static irqreturn_t pxa3xx_nand_irq_thread(int irq, void *data)
+{
+	struct pxa3xx_nand_info *info = data;
+
+	handle_data_pio(info);
+
+	info->state = STATE_CMD_DONE;
+	nand_writel(info, NDSR, NDSR_WRDREQ | NDSR_RDDREQ);
+	enable_int(info, NDCR_INT_MASK);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 {
 	struct pxa3xx_nand_info *info = devid;
 	unsigned int status, is_completed = 0, is_ready = 0;
 	unsigned int ready, cmd_done;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	if (info->cs == 0) {
 		ready           = NDSR_FLASH_RDY;
@@ -613,9 +627,11 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 			start_data_dma(info);
 			goto NORMAL_IRQ_EXIT;
 		} else {
+			disable_int(info, NDCR_INT_MASK);
 			info->state = (status & NDSR_RDDREQ) ?
 				      STATE_PIO_READING : STATE_PIO_WRITING;
-			handle_data_pio(info);
+			ret = IRQ_WAKE_THREAD;
+			goto NORMAL_IRQ_EXIT;
 		}
 	}
 	if (status & cmd_done) {
@@ -656,7 +672,7 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 	if (is_ready)
 		complete(&info->dev_ready);
 NORMAL_IRQ_EXIT:
-	return IRQ_HANDLED;
+	return ret;
 }
 
 static inline int is_buf_blank(uint8_t *buf, size_t len)
@@ -1672,7 +1688,8 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	/* initialize all interrupts to be disabled */
 	disable_int(info, NDSR_MASK);
 
-	ret = request_irq(irq, pxa3xx_nand_irq, 0, pdev->name, info);
+	ret = request_threaded_irq(irq, pxa3xx_nand_irq,
+				   pxa3xx_nand_irq_thread, 0, pdev->name, info);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ\n");
 		goto fail_free_buf;
-- 
2.1.0
