Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QJR4E-00033q-1o
	for linux-mtd@lists.infradead.org; Mon, 09 May 2011 14:04:11 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: sst25l: fix section markings
Date: Mon,  9 May 2011 10:07:58 -0400
Message-Id: <1304950078-27141-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The previous section mismatch fix for this driver wasn't entirely correct.
The sst25l_flash_info array is now used in the devinit probe func, but is
marked as initdata, so building results in the warning:

WARNING: drivers/mtd/devices/sst25l.o(.devinit.text): Section mismatch
	in reference from the function sst25l_probe()
	to the variable .init.data:sst25l_flash_info

Further, the remove func should be devexit rather than exit to match the
probe func.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/devices/sst25l.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index c163e61..ac1d244 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -66,7 +66,7 @@ struct flash_info {
 
 #define to_sst25l_flash(x) container_of(x, struct sst25l_flash, mtd)
 
-static struct flash_info __initdata sst25l_flash_info[] = {
+static struct flash_info __devinitdata sst25l_flash_info[] = {
 	{"sst25lf020a", 0xbf43, 256, 1024, 4096},
 	{"sst25lf040a",	0xbf44,	256, 2048, 4096},
 };
@@ -469,7 +469,7 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	return 0;
 }
 
-static int __exit sst25l_remove(struct spi_device *spi)
+static int __devexit sst25l_remove(struct spi_device *spi)
 {
 	struct sst25l_flash *flash = dev_get_drvdata(&spi->dev);
 	int ret;
@@ -490,7 +490,7 @@ static struct spi_driver sst25l_driver = {
 		.owner	= THIS_MODULE,
 	},
 	.probe		= sst25l_probe,
-	.remove		= __exit_p(sst25l_remove),
+	.remove		= __devexit_p(sst25l_remove),
 };
 
 static int __init sst25l_init(void)
-- 
1.7.5.rc3
