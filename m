Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3l0A-000208-Sw
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 09:43:59 +0000
From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <artem.bityutskiy@linux.intel.com>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 07/10] mtd: onenand: omap2: obtain memory from resource
Date: Tue, 21 Aug 2012 15:13:53 +0530
Message-ID: <317fa1837ee78277770cf25bdd7a6c0c8c73aab1.1344609341.git.afzal@ti.com>
In-Reply-To: <cover.1344609341.git.afzal@ti.com>
References: <cover.1344609341.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: ivan.djelic@parrot.com, Afzal Mohammed <afzal@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

gpmc initialization for onenand done by platform code now provides
onenand address space as memory resource. Hence remove usage of
gpmc_cs_request in onenand driver and obtain memory details from
resource structure.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/onenand/omap2.c |   29 ++++++++++++++++-------------
 1 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 398a827..3ff893d 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -48,13 +48,13 @@
 
 #define DRIVER_NAME "omap2-onenand"
 
-#define ONENAND_IO_SIZE		SZ_128K
 #define ONENAND_BUFRAM_SIZE	(1024 * 5)
 
 struct omap2_onenand {
 	struct platform_device *pdev;
 	int gpmc_cs;
 	unsigned long phys_base;
+	unsigned int mem_size;
 	int gpio_irq;
 	struct mtd_info mtd;
 	struct onenand_chip onenand;
@@ -626,6 +626,7 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	struct omap2_onenand *c;
 	struct onenand_chip *this;
 	int r;
+	struct resource *res;
 
 	pdata = pdev->dev.platform_data;
 	if (pdata == NULL) {
@@ -647,20 +648,24 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 		c->gpio_irq = 0;
 	}
 
-	r = gpmc_cs_request(c->gpmc_cs, ONENAND_IO_SIZE, &c->phys_base);
-	if (r < 0) {
-		dev_err(&pdev->dev, "Cannot request GPMC CS\n");
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL) {
+		r = -EINVAL;
+		dev_err(&pdev->dev, "error getting memory resource\n");
 		goto err_kfree;
 	}
 
-	if (request_mem_region(c->phys_base, ONENAND_IO_SIZE,
+	c->phys_base = res->start;
+	c->mem_size = resource_size(res);
+
+	if (request_mem_region(c->phys_base, c->mem_size,
 			       pdev->dev.driver->name) == NULL) {
-		dev_err(&pdev->dev, "Cannot reserve memory region at 0x%08lx, "
-			"size: 0x%x\n",	c->phys_base, ONENAND_IO_SIZE);
+		dev_err(&pdev->dev, "Cannot reserve memory region at 0x%08lx, size: 0x%x\n",
+						c->phys_base, c->mem_size);
 		r = -EBUSY;
-		goto err_free_cs;
+		goto err_kfree;
 	}
-	c->onenand.base = ioremap(c->phys_base, ONENAND_IO_SIZE);
+	c->onenand.base = ioremap(c->phys_base, c->mem_size);
 	if (c->onenand.base == NULL) {
 		r = -ENOMEM;
 		goto err_release_mem_region;
@@ -776,9 +781,7 @@ err_release_gpio:
 err_iounmap:
 	iounmap(c->onenand.base);
 err_release_mem_region:
-	release_mem_region(c->phys_base, ONENAND_IO_SIZE);
-err_free_cs:
-	gpmc_cs_free(c->gpmc_cs);
+	release_mem_region(c->phys_base, c->mem_size);
 err_kfree:
 	kfree(c);
 
@@ -800,7 +803,7 @@ static int __devexit omap2_onenand_remove(struct platform_device *pdev)
 		gpio_free(c->gpio_irq);
 	}
 	iounmap(c->onenand.base);
-	release_mem_region(c->phys_base, ONENAND_IO_SIZE);
+	release_mem_region(c->phys_base, c->mem_size);
 	gpmc_cs_free(c->gpmc_cs);
 	kfree(c);
 
-- 
1.7.1
