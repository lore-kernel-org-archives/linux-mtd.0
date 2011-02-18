Received: from lunge.mit.edu ([18.54.1.69] helo=lunge.queued.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PqGhN-0008GD-Jx
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2011 03:08:03 +0000
From: Andres Salomon <dilinger@queued.net>
To: Samuel Ortiz <sameo@linux.intel.com>
Subject: [PATCH 09/29] t7166xb: mfd_cell is now implicitly available to drivers
Date: Thu, 17 Feb 2011 19:07:16 -0800
Message-Id: <1297998456-7615-10-git-send-email-dilinger@queued.net>
In-Reply-To: <1297998456-7615-1-git-send-email-dilinger@queued.net>
References: <1297998456-7615-1-git-send-email-dilinger@queued.net>
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No need to explicitly set the cell's platform_data/data_size.

Modify clients to use mfd_get_cell helper function instead of
accessing platform_data directly.

Signed-off-by: Andres Salomon <dilinger@queued.net>
---
 drivers/mfd/t7l66xb.c        |    9 ---------
 drivers/mtd/nand/tmio_nand.c |   10 +++++-----
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/t7l66xb.c b/drivers/mfd/t7l66xb.c
index 9caeb4a..b9c1e4c 100644
--- a/drivers/mfd/t7l66xb.c
+++ b/drivers/mfd/t7l66xb.c
@@ -384,15 +384,6 @@ static int t7l66xb_probe(struct platform_device *dev)
 	t7l66xb_attach_irq(dev);
 
 	t7l66xb_cells[T7L66XB_CELL_NAND].driver_data = pdata->nand_data;
-	t7l66xb_cells[T7L66XB_CELL_NAND].platform_data =
-		&t7l66xb_cells[T7L66XB_CELL_NAND];
-	t7l66xb_cells[T7L66XB_CELL_NAND].data_size =
-		sizeof(t7l66xb_cells[T7L66XB_CELL_NAND]);
-
-	t7l66xb_cells[T7L66XB_CELL_MMC].platform_data =
-		&t7l66xb_cells[T7L66XB_CELL_MMC];
-	t7l66xb_cells[T7L66XB_CELL_MMC].data_size =
-		sizeof(t7l66xb_cells[T7L66XB_CELL_MMC]);
 
 	ret = mfd_add_devices(&dev->dev, dev->id,
 			      t7l66xb_cells, ARRAY_SIZE(t7l66xb_cells),
diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 3041d1f..5bf63e3 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -319,7 +319,7 @@ static int tmio_nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 
 static int tmio_hw_init(struct platform_device *dev, struct tmio_nand *tmio)
 {
-	struct mfd_cell *cell = dev_get_platdata(&dev->dev);
+	struct mfd_cell *cell = mfd_get_cell(dev);
 	int ret;
 
 	if (cell->enable) {
@@ -363,7 +363,7 @@ static int tmio_hw_init(struct platform_device *dev, struct tmio_nand *tmio)
 
 static void tmio_hw_stop(struct platform_device *dev, struct tmio_nand *tmio)
 {
-	struct mfd_cell *cell = dev_get_platdata(&dev->dev);
+	struct mfd_cell *cell = mfd_get_cell(dev);
 
 	tmio_iowrite8(FCR_MODE_POWER_OFF, tmio->fcr + FCR_MODE);
 	if (cell->disable)
@@ -372,7 +372,7 @@ static void tmio_hw_stop(struct platform_device *dev, struct tmio_nand *tmio)
 
 static int tmio_probe(struct platform_device *dev)
 {
-	struct mfd_cell *cell = dev_get_platdata(&dev->dev);
+	struct mfd_cell *cell = mfd_get_cell(dev);
 	struct tmio_nand_data *data = cell->driver_data;
 	struct resource *fcr = platform_get_resource(dev,
 			IORESOURCE_MEM, 0);
@@ -516,7 +516,7 @@ static int tmio_remove(struct platform_device *dev)
 #ifdef CONFIG_PM
 static int tmio_suspend(struct platform_device *dev, pm_message_t state)
 {
-	struct mfd_cell *cell = dev_get_platdata(&dev->dev);
+	struct mfd_cell *cell = mfd_get_cell(dev);
 
 	if (cell->suspend)
 		cell->suspend(dev);
@@ -527,7 +527,7 @@ static int tmio_suspend(struct platform_device *dev, pm_message_t state)
 
 static int tmio_resume(struct platform_device *dev)
 {
-	struct mfd_cell *cell = dev_get_platdata(&dev->dev);
+	struct mfd_cell *cell = mfd_get_cell(dev);
 
 	/* FIXME - is this required or merely another attack of the broken
 	 * SHARP platform? Looks suspicious.
-- 
1.7.2.3
