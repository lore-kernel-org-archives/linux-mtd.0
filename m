Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqgUz-00067E-W0
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 07:45:30 +0000
Received: by ggnh4 with SMTP id h4so811187ggn.36
 for <linux-mtd@lists.infradead.org>; Thu, 26 Jan 2012 23:45:27 -0800 (PST)
Message-ID: <1327650320.3758.5.camel@phoenix>
Subject: [PATCH] mtd: convert drivers/mtd/* to use module_spi_driver()
From: Axel Lin <axel.lin@gmail.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 27 Jan 2012 15:45:20 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: Ryan Mallon <rmallon@gmail.com>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Andre Renaud <andre@bluewatersys.com>, Mike Lavender <mike@steroidmicros.com>,
 David Woodhouse <dwmw2@infradead.org>, Andrew Victor <linux@maxim.org.za>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch converts the drivers in drivers/mtd/* to use the
module_spi_driver() macro which makes the code smaller and a bit simpler.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
Cc: Mike Lavender <mike@steroidmicros.com>
Cc: Andrew Victor <linux@maxim.org.za>
Cc: Andre Renaud <andre@bluewatersys.com>
Cc: Ryan Mallon <rmallon@gmail.com>
---
 drivers/mtd/devices/m25p80.c        |   16 +---------------
 drivers/mtd/devices/mtd_dataflash.c |   13 +------------
 drivers/mtd/devices/sst25l.c        |   13 +------------
 3 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7c60ddd..230b02e 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -1004,21 +1004,7 @@ static struct spi_driver m25p80_driver = {
 	 */
 };
 
-
-static int __init m25p80_init(void)
-{
-	return spi_register_driver(&m25p80_driver);
-}
-
-
-static void __exit m25p80_exit(void)
-{
-	spi_unregister_driver(&m25p80_driver);
-}
-
-
-module_init(m25p80_init);
-module_exit(m25p80_exit);
+module_spi_driver(m25p80_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mike Lavender");
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 236057e..5ec5fc9 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -946,18 +946,7 @@ static struct spi_driver dataflash_driver = {
 	/* FIXME:  investigate suspend and resume... */
 };
 
-static int __init dataflash_init(void)
-{
-	return spi_register_driver(&dataflash_driver);
-}
-module_init(dataflash_init);
-
-static void __exit dataflash_exit(void)
-{
-	spi_unregister_driver(&dataflash_driver);
-}
-module_exit(dataflash_exit);
-
+module_spi_driver(dataflash_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Andrew Victor, David Brownell");
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 5fc1983..196fd95 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -450,18 +450,7 @@ static struct spi_driver sst25l_driver = {
 	.remove		= __devexit_p(sst25l_remove),
 };
 
-static int __init sst25l_init(void)
-{
-	return spi_register_driver(&sst25l_driver);
-}
-
-static void __exit sst25l_exit(void)
-{
-	spi_unregister_driver(&sst25l_driver);
-}
-
-module_init(sst25l_init);
-module_exit(sst25l_exit);
+module_spi_driver(sst25l_driver);
 
 MODULE_DESCRIPTION("MTD SPI driver for SST25L Flash chips");
 MODULE_AUTHOR("Andre Renaud <andre@bluewatersys.com>, "
-- 
1.7.5.4
