Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNTLF-0002q1-5z
 for linux-mtd@lists.infradead.org; Mon, 16 Feb 2015 21:36:34 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
 <87oaotaa6r.fsf@free.fr> <20150216205825.GG25269@lukather>
Date: Mon, 16 Feb 2015 22:36:02 +0100
In-Reply-To: <20150216205825.GG25269@lukather> (Maxime Ripard's message of
 "Mon, 16 Feb 2015 21:58:25 +0100")
Message-ID: <87k2zha69p.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Maxime Ripard <maxime.ripard@free-electrons.com> writes:

>> I don't think an mdelay(256) is acceptable.
>
> That's very true that this driver would need some love, but
> valentine's day was last week.
That doesn't cope with the 256ms mdelay. And a potential big mdelay is not what
I'd call a bug fix, see below.

> I'm sorry, but this is a patch targeted for stable. This is a pure
> bugfix. I won't rewrite the whole driver solely to make the driver
> better, especially since that would make such a patch (or more likely
> a whole serie) unsuitable for stable.

This is the rewrite I was asking for (not tested), consider it against your
"rewrite the whole driver" :

	Modified   drivers/mtd/nand/pxa3xx_nand.c
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index e512902..6e569e9 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -576,11 +576,20 @@ static void start_data_dma(struct pxa3xx_nand_info *info)
 {}
 #endif
 
+static irqreturn_t pxa3xx_nand_irq_thread(int irq, void *data)
+{
+	struct pxa3xx_nand_info *info = data;
+
+	handle_data_pio(info);
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
@@ -622,7 +631,7 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 		} else {
 			info->state = (status & NDSR_RDDREQ) ?
 				      STATE_PIO_READING : STATE_PIO_WRITING;
-			handle_data_pio(info);
+			ret = IRQ_WAKE_THREAD;
 		}
 	}
 	if (status & cmd_done) {
@@ -663,7 +672,7 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 	if (is_ready)
 		complete(&info->dev_ready);
 NORMAL_IRQ_EXIT:
-	return IRQ_HANDLED;
+	return ret;
 }
 
 static inline int is_buf_blank(uint8_t *buf, size_t len)
@@ -1688,7 +1697,8 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	/* initialize all interrupts to be disabled */
 	disable_int(info, NDSR_MASK);
 
-	ret = request_irq(irq, pxa3xx_nand_irq, 0, pdev->name, info);
+	ret = request_threaded_irq(irq, pxa3xx_nand_irq,
+				   pxa3xx_nand_irq_thread, 0, pdev->name, info);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ\n");
 		goto fail_free_buf;

--
Robert
