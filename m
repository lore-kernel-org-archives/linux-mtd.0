Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V458X-0004G0-Am
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 08:18:31 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQQ001XHPQ4UQU0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 17:18:07 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 30/35] mtd: maps: use dev_get_platdata()
Date: Tue, 30 Jul 2013 17:18:06 +0900
Message-id: <005901ce8cfd$51fb20b0$f5f16210$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the wrapper function for retrieving the platform data instead of
accessing dev->platform_data directly.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/maps/bfin-async-flash.c |    2 +-
 drivers/mtd/maps/gpio-addr-flash.c  |    2 +-
 drivers/mtd/maps/ixp4xx.c           |    4 ++--
 drivers/mtd/maps/latch-addr-flash.c |    4 ++--
 drivers/mtd/maps/physmap.c          |    6 +++---
 drivers/mtd/maps/plat-ram.c         |    4 ++--
 drivers/mtd/maps/pxa2xx-flash.c     |    2 +-
 drivers/mtd/maps/rbtx4939-flash.c   |    4 ++--
 drivers/mtd/maps/sa1100-flash.c     |    4 ++--
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index 319b04a..5434d8d 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -128,7 +128,7 @@ static const char * const part_probe_types[] = {
 static int bfin_flash_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct physmap_flash_data *pdata = pdev->dev.platform_data;
+	struct physmap_flash_data *pdata = dev_get_platdata(&pdev->dev);
 	struct resource *memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	struct resource *flash_ambctl = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	struct async_state *state;
diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 5ede282..1adba86 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -196,7 +196,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	struct resource *gpios;
 	struct async_state *state;
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 	memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	gpios = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 
diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index 09c542b..10debfe 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -152,7 +152,7 @@ static const char * const probes[] = { "RedBoot", "cmdlinepart", NULL };
 
 static int ixp4xx_flash_remove(struct platform_device *dev)
 {
-	struct flash_platform_data *plat = dev->dev.platform_data;
+	struct flash_platform_data *plat = dev_get_platdata(&dev->dev);
 	struct ixp4xx_flash_info *info = platform_get_drvdata(dev);
 
 	if(!info)
@@ -178,7 +178,7 @@ static int ixp4xx_flash_remove(struct platform_device *dev)
 
 static int ixp4xx_flash_probe(struct platform_device *dev)
 {
-	struct flash_platform_data *plat = dev->dev.platform_data;
+	struct flash_platform_data *plat = dev_get_platdata(&dev->dev);
 	struct ixp4xx_flash_info *info;
 	struct mtd_part_parser_data ppdata = {
 		.origin = dev->resource->start,
diff --git a/drivers/mtd/maps/latch-addr-flash.c b/drivers/mtd/maps/latch-addr-flash.c
index 675ccb8..98bb5d5 100644
--- a/drivers/mtd/maps/latch-addr-flash.c
+++ b/drivers/mtd/maps/latch-addr-flash.c
@@ -103,7 +103,7 @@ static int latch_addr_flash_remove(struct platform_device *dev)
 	if (info == NULL)
 		return 0;
 
-	latch_addr_data = dev->dev.platform_data;
+	latch_addr_data = dev_get_platdata(&dev->dev);
 
 	if (info->mtd != NULL) {
 		mtd_device_unregister(info->mtd);
@@ -134,7 +134,7 @@ static int latch_addr_flash_probe(struct platform_device *dev)
 	int chipsel;
 	int err;
 
-	latch_addr_data = dev->dev.platform_data;
+	latch_addr_data = dev_get_platdata(&dev->dev);
 	if (latch_addr_data == NULL)
 		return -ENODEV;
 
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 9eb7ead9..f73cd46 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -41,7 +41,7 @@ static int physmap_flash_remove(struct platform_device *dev)
 	if (info == NULL)
 		return 0;
 
-	physmap_data = dev->dev.platform_data;
+	physmap_data = dev_get_platdata(&dev->dev);
 
 	if (info->cmtd) {
 		mtd_device_unregister(info->cmtd);
@@ -68,7 +68,7 @@ static void physmap_set_vpp(struct map_info *map, int state)
 	unsigned long flags;
 
 	pdev = (struct platform_device *)map->map_priv_1;
-	physmap_data = pdev->dev.platform_data;
+	physmap_data = dev_get_platdata(&pdev->dev);
 
 	if (!physmap_data->set_vpp)
 		return;
@@ -102,7 +102,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 	int i;
 	int devices_found = 0;
 
-	physmap_data = dev->dev.platform_data;
+	physmap_data = dev_get_platdata(&dev->dev);
 	if (physmap_data == NULL)
 		return -ENODEV;
 
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index b0b85eb..6762716 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -128,13 +128,13 @@ static int platram_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "probe entered\n");
 
-	if (pdev->dev.platform_data == NULL) {
+	if (dev_get_platdata(&pdev->dev) == NULL) {
 		dev_err(&pdev->dev, "no platform data supplied\n");
 		err = -ENOENT;
 		goto exit_error;
 	}
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (info == NULL) {
diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 22c55cb..d210d13 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -49,7 +49,7 @@ static const char * const probes[] = { "RedBoot", "cmdlinepart", NULL };
 
 static int pxa2xx_flash_probe(struct platform_device *pdev)
 {
-	struct flash_platform_data *flash = pdev->dev.platform_data;
+	struct flash_platform_data *flash = dev_get_platdata(&pdev->dev);
 	struct pxa2xx_flash_info *info;
 	struct resource *res;
 
diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index ab4ec55..9352512 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -36,7 +36,7 @@ static int rbtx4939_flash_remove(struct platform_device *dev)
 		return 0;
 
 	if (info->mtd) {
-		struct rbtx4939_flash_data *pdata = dev->dev.platform_data;
+		struct rbtx4939_flash_data *pdata = dev_get_platdata(&dev->dev);
 
 		mtd_device_unregister(info->mtd);
 		map_destroy(info->mtd);
@@ -56,7 +56,7 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
 	int err = 0;
 	unsigned long size;
 
-	pdata = dev->dev.platform_data;
+	pdata = dev_get_platdata(&dev->dev);
 	if (!pdata)
 		return -ENODEV;
 
diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 9e70f8e..8fc06bf 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -248,7 +248,7 @@ static const char * const part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 
 static int sa1100_mtd_probe(struct platform_device *pdev)
 {
-	struct flash_platform_data *plat = pdev->dev.platform_data;
+	struct flash_platform_data *plat = dev_get_platdata(&pdev->dev);
 	struct sa_info *info;
 	int err;
 
@@ -277,7 +277,7 @@ static int sa1100_mtd_probe(struct platform_device *pdev)
 static int __exit sa1100_mtd_remove(struct platform_device *pdev)
 {
 	struct sa_info *info = platform_get_drvdata(pdev);
-	struct flash_platform_data *plat = pdev->dev.platform_data;
+	struct flash_platform_data *plat = dev_get_platdata(&pdev->dev);
 
 	sa1100_destroy(info, plat);
 
-- 
1.7.10.4
