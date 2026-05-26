Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E81BCD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 10:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnPqW0LOrhkT8N7Pkn9v38/rk8JSoNGFkVc+ySkryP4=; b=OH+s82OQIHr69d
	DwP+59JTBsfbLBBlrr9HjZo8ElERP3+Od7KwUCLuZPoYt+PzLrWuqzNDzBrymy05hJCXekU64phrA
	gGVrTwu+Zv4/0Kx+QFgAoIQMwJoSwHA1HRfdm2HgbMHYKTNHTbYBiNEucuxRNs53FuFPZEoAdOuSt
	JMaB1WGu2QezJxmqNcbhWXvSTyCn6/19CqrBVfh38yFEKILrE9H84vnCUmGaqHmt3bK/3ne4OxlDk
	LNL87e0e0sRl+clpw6DcYpE/DTt0it9lXcZlhPGtJFZv2AGUEcP6HuXok+RSWL+uyd5X3Tp1zqWOc
	bM/4gUSmZpAomy7WWLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRp5y-00000001f0r-43K5;
	Tue, 26 May 2026 10:33:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRp5x-00000001f0e-0ZSS
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 10:33:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56F0F6008A;
	Tue, 26 May 2026 10:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF961F000E9;
	Tue, 26 May 2026 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791588;
	bh=Eeb8JkVlhod2vZp1rsrNLN9Ew1os/CigqB4ta7avtB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tcgno7aYSNXs/YN2HcrK8k9DoV+QeiMn6mY2dB0YVn8oTV6PsmGpAAy/2yoZvyqJr
	 x87x3xG+7+68O8CjLyHyf++uQo8/NyNFS1DPW3aAnn1T+/NfEY1vAbZ2QtF/BqoAcT
	 XguSORMolZPD/SoIQLSxoU8Lz2B5KNdlL/uaW3+7yEZgK0FP7lPJaNcZ53zGW7uAXh
	 cPXNhun2FyV6D/DF3HPcplkArmvgIOUEiMAGvdqsVPH5/lrGamndGtG2MWQm9J8zID
	 p060q/r2CCJYdLUY/AVgGSYUgvaUKjySNkPlA48z4cuCsNbhrCHU04hLfteeTUiVR6
	 mMoLj3bdwN8fA==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: maps: remove obsolete impa7 map driver
Date: Tue, 26 May 2026 12:32:06 +0200
Message-Id: <20260526103227.3152003-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260526103227.3152003-1-arnd@kernel.org>
References: <20260526103227.3152003-1-arnd@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

This driver was originally merged in 2002 for a board using
the Cirrus Logic CL/PS711x platform, but the actual board
file never made it upstream.

The SoC platform is still supported but uses devicetree
based probing, so if anyone ever wanted to upstream board
support, they would just use the regular physmap driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/maps/Kconfig  |   7 ---
 drivers/mtd/maps/Makefile |   1 -
 drivers/mtd/maps/impa7.c  | 115 --------------------------------------
 3 files changed, 123 deletions(-)
 delete mode 100644 drivers/mtd/maps/impa7.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 1e8f2b518ddd..dce5e67ce3c2 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -249,13 +249,6 @@ config MTD_DC21285
 	  21285 bridge used with Intel's StrongARM processors. More info at
 	  <https://www.intel.com/design/bridge/docs/21285_documentation.htm>.
 
-config MTD_IMPA7
-	tristate "JEDEC Flash device mapped on impA7"
-	depends on ARM && MTD_JEDECPROBE
-	help
-	  This enables access to the NOR Flash on the impA7 board of
-	  implementa GmbH. If you have such a board, say 'Y' here.
-
 # This needs CFI or JEDEC, depending on the cards found.
 config MTD_PCI
 	tristate "PCI MTD driver"
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index eff28fc0b60e..fbed278157f6 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -30,7 +30,6 @@ obj-$(CONFIG_MTD_SUN_UFLASH)	+= sun_uflash.o
 obj-$(CONFIG_MTD_SCx200_DOCFLASH)+= scx200_docflash.o
 obj-$(CONFIG_MTD_SOLUTIONENGINE)+= solutionengine.o
 obj-$(CONFIG_MTD_PCI)		+= pci.o
-obj-$(CONFIG_MTD_IMPA7)		+= impa7.o
 obj-$(CONFIG_MTD_SCB2_FLASH)	+= scb2_flash.o
 obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
 obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
diff --git a/drivers/mtd/maps/impa7.c b/drivers/mtd/maps/impa7.c
deleted file mode 100644
index b41401852fb7..000000000000
--- a/drivers/mtd/maps/impa7.c
+++ /dev/null
@@ -1,115 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Handle mapping of the NOR flash on implementa A7 boards
- *
- * Copyright 2002 SYSGO Real-Time Solutions GmbH
- */
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <asm/io.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-
-#define WINDOW_ADDR0 0x00000000      /* physical properties of flash */
-#define WINDOW_SIZE0 0x00800000
-#define WINDOW_ADDR1 0x10000000      /* physical properties of flash */
-#define WINDOW_SIZE1 0x00800000
-#define NUM_FLASHBANKS 2
-#define BUSWIDTH     4
-
-#define MSG_PREFIX "impA7:"   /* prefix for our printk()'s */
-#define MTDID      "impa7-%d"  /* for mtdparts= partitioning */
-
-static struct mtd_info *impa7_mtd[NUM_FLASHBANKS];
-
-static const char * const rom_probe_types[] = { "jedec_probe", NULL };
-
-static struct map_info impa7_map[NUM_FLASHBANKS] = {
-	{
-		.name = "impA7 NOR Flash Bank #0",
-		.size = WINDOW_SIZE0,
-		.bankwidth = BUSWIDTH,
-	},
-	{
-		.name = "impA7 NOR Flash Bank #1",
-		.size = WINDOW_SIZE1,
-		.bankwidth = BUSWIDTH,
-	},
-};
-
-/*
- * MTD partitioning stuff
- */
-static const struct mtd_partition partitions[] =
-{
-	{
-		.name = "FileSystem",
-		.size = 0x800000,
-		.offset = 0x00000000
-	},
-};
-
-static int __init init_impa7(void)
-{
-	const char * const *type;
-	int i;
-	static struct { u_long addr; u_long size; } pt[NUM_FLASHBANKS] = {
-	  { WINDOW_ADDR0, WINDOW_SIZE0 },
-	  { WINDOW_ADDR1, WINDOW_SIZE1 },
-        };
-	int devicesfound = 0;
-
-	for(i=0; i<NUM_FLASHBANKS; i++)
-	{
-		printk(KERN_NOTICE MSG_PREFIX "probing 0x%08lx at 0x%08lx\n",
-		       pt[i].size, pt[i].addr);
-
-		impa7_map[i].phys = pt[i].addr;
-		impa7_map[i].virt = ioremap(pt[i].addr, pt[i].size);
-		if (!impa7_map[i].virt) {
-			printk(MSG_PREFIX "failed to ioremap\n");
-			return -EIO;
-		}
-		simple_map_init(&impa7_map[i]);
-
-		impa7_mtd[i] = NULL;
-		type = rom_probe_types;
-		for(; !impa7_mtd[i] && *type; type++) {
-			impa7_mtd[i] = do_map_probe(*type, &impa7_map[i]);
-		}
-
-		if (impa7_mtd[i]) {
-			impa7_mtd[i]->owner = THIS_MODULE;
-			devicesfound++;
-			mtd_device_register(impa7_mtd[i], partitions,
-					    ARRAY_SIZE(partitions));
-		} else {
-			iounmap((void __iomem *)impa7_map[i].virt);
-		}
-	}
-	return devicesfound == 0 ? -ENXIO : 0;
-}
-
-static void __exit cleanup_impa7(void)
-{
-	int i;
-	for (i=0; i<NUM_FLASHBANKS; i++) {
-		if (impa7_mtd[i]) {
-			mtd_device_unregister(impa7_mtd[i]);
-			map_destroy(impa7_mtd[i]);
-			iounmap((void __iomem *)impa7_map[i].virt);
-			impa7_map[i].virt = NULL;
-		}
-	}
-}
-
-module_init(init_impa7);
-module_exit(cleanup_impa7);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Pavel Bartusek <pba@sysgo.de>");
-MODULE_DESCRIPTION("MTD map driver for implementa impA7");
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
