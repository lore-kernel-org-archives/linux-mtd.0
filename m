Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsKwJ-0004xi-1l
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 00:54:24 +0000
Received: by pdbnk13 with SMTP id nk13so32804094pdb.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 17:54:01 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 03/11] mtd: brcmnand: add support for STB chips
Date: Tue, 12 May 2015 17:53:36 -0700
Message-Id: <1431478424-29230-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>,
 Kevin Cernekee <cernekee@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

BCM7xxx chips are supported entirely by the library code, since they use
generic irqchip interfaces and don't need any extra SoC-specific
configuration.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v4: pulled stub platform driver into its own file as part of the
    library-ization. This is also important, to keep the STB driver from
    overriding the iproc_nand driver, when seeing a compatible property like:

      compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";

 drivers/mtd/nand/brcmnand/Makefile       |  1 +
 drivers/mtd/nand/brcmnand/brcmstb_nand.c | 44 ++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 drivers/mtd/nand/brcmnand/brcmstb_nand.c

diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/brcmnand/Makefile
index a1b3e3ebe440..b7b24f8277cc 100644
--- a/drivers/mtd/nand/brcmnand/Makefile
+++ b/drivers/mtd/nand/brcmnand/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= brcmstb_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= brcmnand.o
diff --git a/drivers/mtd/nand/brcmnand/brcmstb_nand.c b/drivers/mtd/nand/brcmnand/brcmstb_nand.c
new file mode 100644
index 000000000000..5c271077ac87
--- /dev/null
+++ b/drivers/mtd/nand/brcmnand/brcmstb_nand.c
@@ -0,0 +1,44 @@
+/*
+ * Copyright © 2015 Broadcom Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "brcmnand.h"
+
+static const struct of_device_id brcmstb_nand_of_match[] = {
+	{ .compatible = "brcm,brcmnand" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, brcmstb_nand_of_match);
+
+static int brcmstb_nand_probe(struct platform_device *pdev)
+{
+	return brcmnand_probe(pdev, NULL);
+}
+
+static struct platform_driver brcmstb_nand_driver = {
+	.probe			= brcmstb_nand_probe,
+	.remove			= brcmnand_remove,
+	.driver = {
+		.name		= "brcmstb_nand",
+		.pm		= &brcmnand_pm_ops,
+		.of_match_table = brcmstb_nand_of_match,
+	}
+};
+module_platform_driver(brcmstb_nand_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Brian Norris");
+MODULE_DESCRIPTION("NAND driver for Broadcom STB chips");
-- 
1.9.1
