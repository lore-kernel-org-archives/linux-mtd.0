Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab8gU-0005qN-8s
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 15:27:41 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/1] mtd: mtdram: Add parameter for setting writebuf size
Date: Wed,  2 Mar 2016 16:26:59 +0100
Message-Id: <1456932419-14614-1-git-send-email-alexander.stein@systec-electronic.com>
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
Reviewed-by: Richard Weinberger <richard@nod.at>
---
Changes in v3:
* Removed Kconfig option

Changes in v2:
* Added Reviewed-by: Richard Weinberger <richard@nod.at>
* Removed outdated comment about CFI NOR flash write buffer sizes

 drivers/mtd/devices/mtdram.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 627a9bc..cbd8547 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -19,6 +19,7 @@
 
 static unsigned long total_size = CONFIG_MTDRAM_TOTAL_SIZE;
 static unsigned long erase_size = CONFIG_MTDRAM_ERASE_SIZE;
+static unsigned long writebuf_size = 64;
 #define MTDRAM_TOTAL_SIZE (total_size * 1024)
 #define MTDRAM_ERASE_SIZE (erase_size * 1024)
 
@@ -27,6 +28,8 @@ module_param(total_size, ulong, 0);
 MODULE_PARM_DESC(total_size, "Total device size in KiB");
 module_param(erase_size, ulong, 0);
 MODULE_PARM_DESC(erase_size, "Device erase block size in KiB");
+module_param(writebuf_size, ulong, 0);
+MODULE_PARM_DESC(writebuf_size, "Device write buf size in Bytes (Default: 64)");
 #endif
 
 // We could store these in the mtd structure, but we only support 1 device..
@@ -123,7 +126,7 @@ int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
 	mtd->flags = MTD_CAP_RAM;
 	mtd->size = size;
 	mtd->writesize = 1;
-	mtd->writebufsize = 64; /* Mimic CFI NOR flashes */
+	mtd->writebufsize = writebuf_size;
 	mtd->erasesize = MTDRAM_ERASE_SIZE;
 	mtd->priv = mapped_address;
 
-- 
2.4.10
