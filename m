Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TDXyZ-0004Kn-62
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2012 09:50:48 +0000
Received: by bkcji2 with SMTP id ji2so2440955bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2012 02:50:44 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH V3] mtd: basic (read only) driver for BCMA serial flash
Date: Mon, 17 Sep 2012 11:50:49 +0200
Message-Id: <1347875449-19318-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
V2: fix mem leak (add failure path in init)
    signed-off-by
V3: drop BROKEN
    drop useless check in bcm47xxsflash_remove
    marm flash memory as ROM (until we implement writing)
---
 drivers/mtd/devices/Kconfig                 |    8 ++
 drivers/mtd/devices/Makefile                |    1 +
 drivers/mtd/devices/bcm47xxsflash.c         |  131 +++++++++++++++++++++++++++
 include/linux/bcma/bcma_driver_chipcommon.h |    2 +
 4 files changed, 142 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/devices/bcm47xxsflash.c

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 6cc5a1a..ce6e3d4 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -120,6 +120,14 @@ config MTD_SST25L
 	  Set up your spi devices with the right board-specific platform data,
 	  if you want to specify device partitioning.
 
+config MTD_BCM47XXSFLASH
+	tristate "Support for serial flash on BCMA bus"
+	depends on BCMA_SFLASH
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
index 0000000..f711a51
--- /dev/null
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -0,0 +1,131 @@
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
+
+	/* TODO: implement writing support and verify/change following code */
+	mtd->flags = MTD_CAP_ROM;
+	mtd->writebufsize = mtd->writesize = 1;
+}
+
+static int bcm47xxsflash_probe(struct platform_device *pdev)
+{
+	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
+	int err;
+
+	sflash->mtd = kzalloc(sizeof(struct mtd_info), GFP_KERNEL);
+	if (!sflash->mtd) {
+		err = -ENOMEM;
+		goto out;
+	}
+	bcm47xxsflash_fill_mtd(sflash, sflash->mtd);
+
+	err = mtd_device_parse_register(sflash->mtd, probes, NULL, NULL, 0);
+	if (err) {
+		pr_err("Failed to register MTD device: %d\n", err);
+		goto err_dev_reg;
+	}
+
+	return 0;
+
+err_dev_reg:
+	kfree(sflash->mtd);
+out:
+	return err;
+}
+
+static int __devexit bcm47xxsflash_remove(struct platform_device *pdev)
+{
+	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
+
+	mtd_device_unregister(sflash->mtd);
+	kfree(sflash->mtd);
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
+		pr_err("Failed to register BCMA serial flash driver: %d\n",
+		       err);
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
diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/bcma/bcma_driver_chipcommon.h
index 6ba45d2..1cf1749 100644
--- a/include/linux/bcma/bcma_driver_chipcommon.h
+++ b/include/linux/bcma/bcma_driver_chipcommon.h
@@ -522,6 +522,8 @@ struct bcma_sflash {
 	u32 blocksize;
 	u16 numblocks;
 	u32 size;
+
+	struct mtd_info *mtd;
 };
 #endif
 
-- 
1.7.7
