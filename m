Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXsjp-00055k-LM
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 12:03:39 +0000
Received: by mail-ee0-f49.google.com with SMTP id c1so3339724eek.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 04:03:37 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH V2 2/6] mtd: prepare place for BCMA NAND flash driver(s)
Date: Mon, 12 Nov 2012 13:03:21 +0100
Message-Id: <1352721805-14064-3-git-send-email-zajec5@gmail.com>
In-Reply-To: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
References: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
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

BCMA bus can contain NAND flash memory, it's registered in system as
platform device. This adds required hooks and place for controler
specific drivers.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
There is the only warning reported to this patchset:


checkpatch.pl results for patch "[PATCH 2/6] mtd: prepare place for BCMA NAND flash driver(s)"

WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#114: FILE: drivers/mtd/nand/bcm47xxnflash/main.c:24:
+static const char *probes[] = { "bcm47xxpart", NULL };

total: 0 errors, 1 warnings, 146 lines checked


AFAIK the code is correct, all the parsers I've checked have the same
definition of probes.
---
 drivers/mtd/nand/Kconfig                       |    9 ++
 drivers/mtd/nand/Makefile                      |    1 +
 drivers/mtd/nand/bcm47xxnflash/Makefile        |    3 +
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h |   14 +++
 drivers/mtd/nand/bcm47xxnflash/main.c          |  108 ++++++++++++++++++++++++
 5 files changed, 135 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/nand/bcm47xxnflash/Makefile
 create mode 100644 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
 create mode 100644 drivers/mtd/nand/bcm47xxnflash/main.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index a803d9b..3314e92 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -460,6 +460,15 @@ config MTD_NAND_GPMI_NAND
 	 block, such as SD card. So pay attention to it when you enable
 	 the GPMI.
 
+config MTD_NAND_BCM47XXNFLASH
+	tristate "R/O support for NAND flash on BCMA bus"
+	depends on BCMA_NFLASH
+	help
+	  BCMA bus can have various flash memories attached, they are
+	  registered by bcma as platform devices. This enables driver for
+	  NAND flash memories. For now only read mode for BCM4706 is
+	  implemented.
+
 config MTD_NAND_PLATFORM
 	tristate "Support for generic platform NAND driver"
 	depends on HAS_IOMEM
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 44fca05..3c3f215 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -54,5 +54,6 @@ obj-$(CONFIG_MTD_NAND_RICOH)		+= r852.o
 obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
 obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
 obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
+obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
 
 nand-objs := nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/bcm47xxnflash/Makefile b/drivers/mtd/nand/bcm47xxnflash/Makefile
new file mode 100644
index 0000000..1d0693a
--- /dev/null
+++ b/drivers/mtd/nand/bcm47xxnflash/Makefile
@@ -0,0 +1,3 @@
+bcm47xxnflash-y				+= main.o
+
+obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash.o
diff --git a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
new file mode 100644
index 0000000..2e8864a
--- /dev/null
+++ b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
@@ -0,0 +1,14 @@
+#ifndef __BCM47XXNFLASH_H
+#define __BCM47XXNFLASH_H
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+
+struct bcm47xxnflash {
+	struct bcma_drv_cc *cc;
+
+	struct nand_chip nand_chip;
+	struct mtd_info mtd;
+};
+
+#endif /* BCM47XXNFLASH */
diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
new file mode 100644
index 0000000..fc9139d
--- /dev/null
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -0,0 +1,108 @@
+/*
+ * BCM47XX NAND flash driver
+ *
+ * Copyright (C) 2012 Rafał Miłecki <zajec5@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/bcma/bcma.h>
+
+#include "bcm47xxnflash.h"
+
+MODULE_DESCRIPTION("NAND flash driver for BCMA bus");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Rafał Miłecki");
+
+static const char *probes[] = { "bcm47xxpart", NULL };
+
+static int bcm47xxnflash_probe(struct platform_device *pdev)
+{
+	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
+	struct bcm47xxnflash *b47n;
+	int err = 0;
+
+	b47n = kzalloc(sizeof(*b47n), GFP_KERNEL);
+	if (!b47n) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	b47n->nand_chip.priv = b47n;
+	b47n->mtd.owner = THIS_MODULE;
+	b47n->mtd.priv = &b47n->nand_chip; /* Required */
+	b47n->cc = container_of(nflash, struct bcma_drv_cc, nflash);
+
+	if (0) {
+		/* TODO: init device */
+	} else {
+		pr_err("Device not supported\n");
+		err = -ENOTSUPP;
+	}
+	if (err) {
+		pr_err("Initialization failed: %d\n", err);
+		goto err_init;
+	}
+
+	err = mtd_device_parse_register(&b47n->mtd, probes, NULL, NULL, 0);
+	if (err) {
+		pr_err("Failed to register MTD device: %d\n", err);
+		goto err_dev_reg;
+	}
+
+	return 0;
+
+err_dev_reg:
+err_init:
+	kfree(b47n);
+out:
+	return err;
+}
+
+static int __devexit bcm47xxnflash_remove(struct platform_device *pdev)
+{
+	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
+
+	if (nflash->mtd)
+		mtd_device_unregister(nflash->mtd);
+
+	return 0;
+}
+
+static struct platform_driver bcm47xxnflash_driver = {
+	.remove = __devexit_p(bcm47xxnflash_remove),
+	.driver = {
+		.name = "bcma_nflash",
+		.owner = THIS_MODULE,
+	},
+};
+
+static int __init bcm47xxnflash_init(void)
+{
+	int err;
+
+	/*
+	 * Platform device "bcma_nflash" exists on SoCs and is registered very
+	 * early, it won't be added during runtime (use platform_driver_probe).
+	 */
+	err = platform_driver_probe(&bcm47xxnflash_driver, bcm47xxnflash_probe);
+	if (err)
+		pr_err("Failed to register serial flash driver: %d\n", err);
+
+	return err;
+}
+
+static void __exit bcm47xxnflash_exit(void)
+{
+	platform_driver_unregister(&bcm47xxnflash_driver);
+}
+
+module_init(bcm47xxnflash_init);
+module_exit(bcm47xxnflash_exit);
-- 
1.7.7
