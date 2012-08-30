Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T70zU-0007EV-Aa
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 09:24:45 +0000
Received: by bkcji2 with SMTP id ji2so720339bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 30 Aug 2012 02:24:40 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH] mtd: basic (read only) driver for BCMA serial flash
Date: Thu, 30 Aug 2012 11:24:35 +0200
Message-Id: <1346318675-5689-1-git-send-email-zajec5@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This registers MTD driver for serial flash platform device. Right now it
supports reading only, writing still has to be implemented.
At this point it's marked as BROKEN, because it requires code present in
net tree that wasn't mainlined yet.
---
As you can see, this driver can't be enabled yet, because it requires
some code that is present in net tree only right now.
Is this OK to take this anyway, and enable it later?

With this code I was able to succesfully scan my serial flash for parts:
[    0.956000] 10 bcm47xxpart partitions found on MTD device bcm47xxsflash
[    0.964000] Creating 10 MTD partitions on "bcm47xxsflash":
[    0.968000] 0x000000000000-0x000000150000 : "boot"
[    0.976000] 0x000000150000-0x000000160000 : "ML"
[    0.984000] 0x000000160000-0x000000170000 : "ML"
[    0.988000] 0x000000170000-0x000000180000 : "ML"
[    0.996000] 0x000000180000-0x000000190000 : "ML"
[    1.004000] 0x000000190000-0x0000001a0000 : "ML"
[    1.012000] 0x0000001a0000-0x0000001d0000 : "ML"
[    1.016000] 0x0000001d0000-0x0000001e0000 : "POT"
[    1.024000] 0x0000001e0000-0x0000001f0000 : "board_data"
[    1.032000] 0x0000001f0000-0x000000200000 : "nvram"

I have two questions, could you help me with them?

1) Is the following warning a valid one? How I can fix that?
WARNING: static const char * array should probably be static const char * const
#64: FILE: drivers/mtd/devices/bcm47xxsflash.c:11:
+static const char *probes[] = { "bcm47xxpart", NULL };

2) I alloc memory for mtd: sflash->mtd but don't free it. This is because it's
platform device that live "always", doesn't support unloading. Is that alright?
---
 drivers/mtd/devices/Kconfig         |    8 +++
 drivers/mtd/devices/Makefile        |    1 +
 drivers/mtd/devices/bcm47xxsflash.c |  120 +++++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/devices/bcm47xxsflash.c

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 4cdb2af..4b4f7d2 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -120,6 +120,14 @@ config MTD_SST25L
 	  Set up your spi devices with the right board-specific platform data,
 	  if you want to specify device partitioning.
 
+config MTD_BCM47XXSFLASH
+	tristate "Support for serial flash on BCMA bus"
+	depends on BCMA_SFLASH && BROKEN
+	help
+	  BCMA bus can have various flash memories attached, they are
+	  registered by bcma as platform devices. This enables driver for
+	  serial flash memories.
+
 config MTD_SLRAM
 	tristate "Uncached system RAM"
 	help
diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
index a4dd1d8..395733a 100644
--- a/drivers/mtd/devices/Makefile
+++ b/drivers/mtd/devices/Makefile
@@ -19,5 +19,6 @@ obj-$(CONFIG_MTD_DATAFLASH)	+= mtd_dataflash.o
 obj-$(CONFIG_MTD_M25P80)	+= m25p80.o
 obj-$(CONFIG_MTD_SPEAR_SMI)	+= spear_smi.o
 obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
+obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
 
 CFLAGS_docg3.o			+= -I$(src)
\ No newline at end of file
diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
new file mode 100644
index 0000000..a9a8b75
--- /dev/null
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -0,0 +1,120 @@
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/platform_device.h>
+#include <linux/bcma/bcma.h>
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Serial flash driver for BCMA bus");
+
+static const char *probes[] = { "bcm47xxpart", NULL };
+
+static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
+			      size_t *retlen, u_char *buf)
+{
+	struct bcma_sflash *sflash = mtd->priv;
+	size_t bytes_read = 0;
+	u8 *src = (u8 *)KSEG0ADDR(sflash->window + from);
+	int i;
+	size_t unaligned_before, unaligned_after;
+
+	/* Check address range */
+	if ((from + len) > mtd->size)
+		return -EINVAL;
+
+	unaligned_before = from & 0x3;
+	unaligned_after = (from + len) & 0x3;
+
+	for (i = 0; i < unaligned_before; i++) {
+		*buf = readb(src);
+		buf++;
+		src++;
+		bytes_read++;
+	}
+	for (i = from - unaligned_before; i < from + len - unaligned_after;
+	     i += 4) {
+		*(u32 *)buf = readl((u32 *)src);
+		buf += 4;
+		src += 4;
+		bytes_read += 4;
+	}
+	for (i = 0; i < unaligned_after; i++) {
+		*buf = readb(src);
+		buf++;
+		src++;
+		bytes_read++;
+	}
+
+	*retlen = bytes_read;
+
+	return 0;
+}
+
+static void bcm47xxsflash_fill_mtd(struct bcma_sflash *sflash,
+				   struct mtd_info *mtd)
+{
+	mtd->priv = sflash;
+	mtd->name = "bcm47xxsflash";
+	mtd->owner = THIS_MODULE;
+	mtd->type = MTD_ROM;
+	mtd->size = sflash->size;
+	mtd->_read = bcm47xxsflash_read;
+	mtd->writesize = 1; /* FIXME */
+}
+
+static int bcm47xxsflash_probe(struct platform_device *pdev)
+{
+	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
+	int err;
+
+	sflash->mtd = kzalloc(sizeof(struct mtd_info), GFP_KERNEL);
+	if (!sflash->mtd)
+		return -ENOMEM;
+	bcm47xxsflash_fill_mtd(sflash, sflash->mtd);
+
+	err = mtd_device_parse_register(sflash->mtd, probes, NULL, NULL, 0);
+	if (err) {
+		pr_err("Failed to register MTD device: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __devexit bcm47xxsflash_remove(struct platform_device *pdev)
+{
+	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
+
+	if (sflash->mtd)
+		mtd_device_unregister(sflash->mtd);
+
+	return 0;
+}
+
+static struct platform_driver bcma_sflash_driver = {
+	.remove = __devexit_p(bcm47xxsflash_remove),
+	.driver = {
+		.name = "bcma_sflash",
+		.owner = THIS_MODULE,
+	},
+};
+
+static int __init bcm47xxsflash_init(void)
+{
+	int err;
+
+	err = platform_driver_probe(&bcma_sflash_driver, bcm47xxsflash_probe);
+	if (err)
+		pr_err("Failed to register BCMA serial flash driver: %d\n", err);
+
+	return err;
+}
+
+static void __exit bcm47xxsflash_exit(void)
+{
+	platform_driver_unregister(&bcma_sflash_driver);
+}
+
+module_init(bcm47xxsflash_init);
+module_exit(bcm47xxsflash_exit);
-- 
1.7.7
