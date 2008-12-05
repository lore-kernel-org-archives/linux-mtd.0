Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L8Zcy-0004JO-OL
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 12:17:49 +0000
Received: from mgw-mx03.nokia.com (mgw-mx03.nokia.com [192.100.122.230])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	mB5CHi4P031668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Fri, 5 Dec 2008 14:17:45 +0200
Message-ID: <49391D78.90407@nokia.com>
Date: Fri, 05 Dec 2008 14:24:24 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] OneNAND: OMAP2: Switch to generic gpio calls
References: <1228289844-5897-1-git-send-email-jarkko.nikula@nokia.com>
	<1228289844-5897-3-git-send-email-jarkko.nikula@nokia.com>
In-Reply-To: <1228289844-5897-3-git-send-email-jarkko.nikula@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Jarkko Nikula <jarkko.nikula@nokia.com>,
	linux-omap Mailing List <linux-omap@vger.kernel.org>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jarkko Nikula <jarkko.nikula@nokia.com>

Signed-off-by: Jarkko Nikula <jarkko.nikula@nokia.com>
Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/omap2.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index a7e4d98..c260e2d 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -149,7 +149,7 @@ static int omap2_onenand_wait(struct mtd_info *mtd, int state)
 
 		INIT_COMPLETION(c->irq_done);
 		if (c->gpio_irq) {
-			result = omap_get_gpio_datain(c->gpio_irq);
+			result = gpio_get_value(c->gpio_irq);
 			if (result == -1) {
 				ctrl = read_reg(c, ONENAND_REG_CTRL_STATUS);
 				intr = read_reg(c, ONENAND_REG_INTERRUPT);
@@ -629,14 +629,14 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	}
 
 	if (c->gpio_irq) {
-		if ((r = omap_request_gpio(c->gpio_irq)) < 0) {
+		if ((r = gpio_request(c->gpio_irq, "OneNAND irq")) < 0) {
 			dev_err(&pdev->dev,  "Failed to request GPIO%d for "
 				"OneNAND\n", c->gpio_irq);
 			goto err_iounmap;
 	}
-	omap_set_gpio_direction(c->gpio_irq, 1);
+	gpio_direction_input(c->gpio_irq);
 
-	if ((r = request_irq(OMAP_GPIO_IRQ(c->gpio_irq),
+	if ((r = request_irq(gpio_to_irq(c->gpio_irq),
 			     omap2_onenand_interrupt, IRQF_TRIGGER_RISING,
 			     pdev->dev.driver->name, c)) < 0)
 		goto err_release_gpio;
@@ -723,10 +723,10 @@ err_release_dma:
 	if (c->dma_channel != -1)
 		omap_free_dma(c->dma_channel);
 	if (c->gpio_irq)
-		free_irq(OMAP_GPIO_IRQ(c->gpio_irq), c);
+		free_irq(gpio_to_irq(c->gpio_irq), c);
 err_release_gpio:
 	if (c->gpio_irq)
-		omap_free_gpio(c->gpio_irq);
+		gpio_free(c->gpio_irq);
 err_iounmap:
 	iounmap(c->onenand.base);
 err_release_mem_region:
@@ -760,8 +760,8 @@ static int __devexit omap2_onenand_remove(struct platform_device *pdev)
 	omap2_onenand_shutdown(pdev);
 	platform_set_drvdata(pdev, NULL);
 	if (c->gpio_irq) {
-		free_irq(OMAP_GPIO_IRQ(c->gpio_irq), c);
-		omap_free_gpio(c->gpio_irq);
+		free_irq(gpio_to_irq(c->gpio_irq), c);
+		gpio_free(c->gpio_irq);
 	}
 	iounmap(c->onenand.base);
 	release_mem_region(c->phys_base, ONENAND_IO_SIZE);
-- 
1.5.4.3
