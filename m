Received: from imta21.fe.bosch.de ([139.15.243.226])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMVXr-00068l-Lq
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:59:16 +0000
Received: from smtp6-v.fe.bosch.de (imta24.fe.bosch.de [139.15.243.27])
 by imta21.fe.bosch.de (Postfix) with ESMTP id E2113C07E6
 for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2017 09:49:23 +0100 (CET)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
CC: <manfred@colorfullife.com>, <dirk.behme@de.bosch.com>, Manfred Spraul
 <manfred.spraul@de.bosch.com>
Subject: [PATCH 1/5] mtdram: expose write size and writebuf size as module
 parameters
Date: Wed, 6 Dec 2017 09:50:35 +0100
Message-ID: <20171206085039.27164-2-dirk.behme@de.bosch.com>
In-Reply-To: <20171206085039.27164-1-dirk.behme@de.bosch.com>
References: <20171206085039.27164-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Manfred Spraul <manfred@colorfullife.com>

Right now, mtdram reports itself as a device with a 1 byte write
size, and the writebuf size can only be changed at compile time.

The patch:
- allows to change the write size, both at compile and at
  module load time
- allows to change the writebuf size at module load time.

Increasing the write size e.g. speeds up nandwrite significantly,
and it allows to test how UBI behaves with/without subpage writes.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
Cc: Manfred Spraul <manfred@colorfullife.com>
---
 drivers/mtd/devices/Kconfig  | 19 +++++++++++++++++++
 drivers/mtd/devices/mtdram.c |  7 +++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 6def5445e03e..d8b67ba0b5de 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -181,6 +181,25 @@ config MTDRAM_ERASE_SIZE
 	  as a module, it is also possible to specify this as a parameter when
 	  loading the module.
 
+config MTDRAM_WRITE_SIZE
+	int "MTDRAM write size in bytes"
+	depends on MTD_MTDRAM
+	default "1"
+	help
+	  This allows you to configure the minimum write size in the device
+	  emulated by the MTDRAM driver.  If the MTDRAM driver is built
+	  as a module, it is also possible to specify this as a parameter when
+	  loading the module. Common values are 1 (NOR), 512 (NAND with sub-
+	  page writes) or 2048 (NAND without sub-page writes).
+
+config MTDRAM_WRITEBUF_SIZE
+	int "MTDRAM writebuf size in bytes"
+	depends on MTD_MTDRAM
+	default "64"
+	help
+	  This allows you to specify the writebuf size that is reported
+	  by the device emulated by the MTDRAM driver.
+
 config MTD_BLOCK2MTD
 	tristate "MTD using block device"
 	depends on BLOCK
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 0bf4aeaf0cb8..0c8652ac0395 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -20,7 +20,8 @@
 
 static unsigned long total_size = CONFIG_MTDRAM_TOTAL_SIZE;
 static unsigned long erase_size = CONFIG_MTDRAM_ERASE_SIZE;
-static unsigned long writebuf_size = 64;
+static unsigned long writebuf_size = CONFIG_MTDRAM_WRITEBUF_SIZE;
+static unsigned long write_size = CONFIG_MTDRAM_WRITE_SIZE;
 #define MTDRAM_TOTAL_SIZE (total_size * 1024)
 #define MTDRAM_ERASE_SIZE (erase_size * 1024)
 
@@ -31,6 +32,8 @@ module_param(erase_size, ulong, 0);
 MODULE_PARM_DESC(erase_size, "Device erase block size in KiB");
 module_param(writebuf_size, ulong, 0);
 MODULE_PARM_DESC(writebuf_size, "Device write buf size in Bytes (Default: 64)");
+module_param(write_size, ulong, 0);
+MODULE_PARM_DESC(write_size, "Device write size in Bytes (Default: 1)");
 #endif
 
 // We could store these in the mtd structure, but we only support 1 device..
@@ -134,7 +137,7 @@ int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
 	mtd->type = MTD_RAM;
 	mtd->flags = MTD_CAP_RAM;
 	mtd->size = size;
-	mtd->writesize = 1;
+	mtd->writesize = write_size;
 	mtd->writebufsize = writebuf_size;
 	mtd->erasesize = MTDRAM_ERASE_SIZE;
 	mtd->priv = mapped_address;
-- 
2.14.1
