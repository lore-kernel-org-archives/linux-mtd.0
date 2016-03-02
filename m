Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab3MO-0006Iw-Or
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 09:46:25 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: mtdram: Add parameter for setting writebuf size
Date: Wed,  2 Mar 2016 10:45:54 +0100
Message-Id: <1456911954-12929-1-git-send-email-alexander.stein@systec-electronic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubifs uses the write buffer size in recovery algorithm. When inspecting
an unclean ubifs recovery fails with writebuf size 64 in mtdram while
recovery on actual mtd device with writebuf size of 1024 succeeds.
So add a parameter for setting this property.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/mtd/devices/Kconfig  | 10 ++++++++++
 drivers/mtd/devices/mtdram.c |  6 +++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index f73c416..5431d75 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -171,6 +171,16 @@ config MTDRAM_ERASE_SIZE
 	  as a module, it is also possible to specify this as a parameter when
 	  loading the module.
 
+config MTDRAM_WRITEBUF_SIZE
+	int "MTDRAM write buf size in Bytes"
+	depends on MTD_MTDRAM
+	default "64"
+	help
+	  This allows you to configure the write buffer size in the device
+	  emulated by the MTDRAM driver.  If the MTDRAM driver is built
+	  as a module, it is also possible to specify this as a parameter when
+	  loading the module. E.g. ubifs relies this in the recovery algorithm.
+
 #If not a module (I don't want to test it as a module)
 config MTDRAM_ABS_POS
 	hex "SRAM Hexadecimal Absolute position or 0"
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 627a9bc..f32315f 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -19,14 +19,18 @@
 
 static unsigned long total_size = CONFIG_MTDRAM_TOTAL_SIZE;
 static unsigned long erase_size = CONFIG_MTDRAM_ERASE_SIZE;
+static unsigned long writebuf_size = CONFIG_MTDRAM_WRITEBUF_SIZE;
 #define MTDRAM_TOTAL_SIZE (total_size * 1024)
 #define MTDRAM_ERASE_SIZE (erase_size * 1024)
+#define MTDRAM_WRITEBUF_SIZE (writebuf_size)
 
 #ifdef MODULE
 module_param(total_size, ulong, 0);
 MODULE_PARM_DESC(total_size, "Total device size in KiB");
 module_param(erase_size, ulong, 0);
 MODULE_PARM_DESC(erase_size, "Device erase block size in KiB");
+module_param(writebuf_size, ulong, 0);
+MODULE_PARM_DESC(writebuf_size, "Device write buf size in Bytes");
 #endif
 
 // We could store these in the mtd structure, but we only support 1 device..
@@ -123,7 +127,7 @@ int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
 	mtd->flags = MTD_CAP_RAM;
 	mtd->size = size;
 	mtd->writesize = 1;
-	mtd->writebufsize = 64; /* Mimic CFI NOR flashes */
+	mtd->writebufsize = MTDRAM_WRITEBUF_SIZE; /* Mimic CFI NOR flashes */
 	mtd->erasesize = MTDRAM_ERASE_SIZE;
 	mtd->priv = mapped_address;
 
-- 
2.4.10
