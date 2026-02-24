Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDEFF3C991
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Feb 2026 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jR6MI5H+NrGfDcFAcyojwb0ZxptYm4OOl/1iAG0zCic=; b=dL9ER5Ik7/xIjt
	IQ8G4rIy0ot4ToSBL+FK/2VDnfDuBN6P56atN4ellipggH4OI76uiiJd6fPp8oOViv5Ka7p+ghZNA
	N2sQQmN/VJZmgMpkIi/eHLowVDF56hoUS1M7GC8I2NI6Bba1qxJHX6epY3kjbFGbEWlav9W9as0dV
	k5wMPZRZiQmkCDNUsZrQcsQrhz/SDfb9lS7pDFkNzSVUE9G2jPwNhkmG7+xu1V5pQZDU3oPLSJb/S
	SQjUxtJRFu129CbTi+oUIxqc8AXpcodcMRU3Vh7yzcagQbXVBJMBXabaG8eEVw4EqGzW/UhVRcin1
	WZ3FU7qP63ROoZvPPEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuVc-00000002Kc3-1R2r;
	Tue, 24 Feb 2026 15:39:36 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuVZ-00000002Kbh-3Of6
	for linux-mtd@lists.infradead.org;
	Tue, 24 Feb 2026 15:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771947574; x=1803483574;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F33cmMw8QgcBvaDT7U3nVndApBI3V5VbWFuMOCfXKn8=;
  b=FkH6sP6IaABncTmcetqPIbVr/TLKyx4uZzdWwMpePnFj0GMTjISRpWVd
   m3yBR/ewAWcuoiV86Ot623VFnEEKqmA1snAY4X4sCFUPyEqwNKxFF8UwY
   vNxWzqamNoqWKLkZOIYk3tDprByru6p17zodbralSHBl6dsKMcvAWDhNO
   thAAXfLmFiMgtxfyh8s4O6Wlr2lK0c7yAFtDE0F9ak/5F4vrAE5ganDz/
   dd6ys+9Hr+lSK3mCZb88bu2BqYBDujYq+++F2RVSSMA9TXBOlFjGpwAAR
   Mz/wjOBFxJoTpo8aEyeej6NPuzCkyXTFs6OBe82nJ9ZMW+h+z8sDMvUs1
   Q==;
X-CSE-ConnectionGUID: AD9f0rsQTLeSNiNaKQUVGQ==
X-CSE-MsgGUID: ZE2zAmxMQoWOehUCH6oPOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84059197"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="84059197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 07:39:32 -0800
X-CSE-ConnectionGUID: QUDZCH6PTMOZf1+dcEKW1w==
X-CSE-MsgGUID: ZP1rp3ZzR1aQ4LvsAiHk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="215035154"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 24 Feb 2026 07:39:30 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5F7CA98; Tue, 24 Feb 2026 16:39:28 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] mtd: physmap: physmap-bt1-rom: Remove not-going-to-be-supported code for Baikal SoC
Date: Tue, 24 Feb 2026 16:39:27 +0100
Message-ID: <20260224153927.3627867-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_073933_939637_08A88F57 
X-CRM114-Status: GOOD (  20.00  )
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

As noticed in the discussion [1] the Baikal SoC and platforms
are not going to be finalized, hence remove stale code.

Link: https://lore.kernel.org/lkml/22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org/ [1]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/maps/Kconfig           |  11 ---
 drivers/mtd/maps/Makefile          |   1 -
 drivers/mtd/maps/physmap-bt1-rom.c | 125 -----------------------------
 drivers/mtd/maps/physmap-bt1-rom.h |  17 ----
 4 files changed, 154 deletions(-)
 delete mode 100644 drivers/mtd/maps/physmap-bt1-rom.c
 delete mode 100644 drivers/mtd/maps/physmap-bt1-rom.h

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 8a8b19874e23..99d5ff9a1fbe 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -75,17 +75,6 @@ config MTD_PHYSMAP_OF
 	  physically into the CPU's memory. The mapping description here is
 	  taken from OF device tree.
 
-config MTD_PHYSMAP_BT1_ROM
-	bool "Baikal-T1 Boot ROMs OF-based physical memory map handling"
-	depends on MTD_PHYSMAP_OF
-	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
-	select MTD_COMPLEX_MAPPINGS
-	select MULTIPLEXER
-	select MUX_MMIO
-	help
-	  This provides some extra DT physmap parsing for the Baikal-T1
-	  platforms, some detection and setting up ROMs-specific accessors.
-
 config MTD_PHYSMAP_VERSATILE
 	bool "ARM Versatile OF-based physical memory map handling"
 	depends on MTD_PHYSMAP_OF
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 019f1e92cc41..51af1d2ebd52 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
 physmap-y			:= physmap-core.o
-physmap-$(CONFIG_MTD_PHYSMAP_BT1_ROM) += physmap-bt1-rom.o
 physmap-$(CONFIG_MTD_PHYSMAP_VERSATILE) += physmap-versatile.o
 physmap-$(CONFIG_MTD_PHYSMAP_GEMINI) += physmap-gemini.o
 physmap-$(CONFIG_MTD_PHYSMAP_IXP4XX) += physmap-ixp4xx.o
diff --git a/drivers/mtd/maps/physmap-bt1-rom.c b/drivers/mtd/maps/physmap-bt1-rom.c
deleted file mode 100644
index 60dccc48f99e..000000000000
--- a/drivers/mtd/maps/physmap-bt1-rom.c
+++ /dev/null
@@ -1,125 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
- *
- * Authors:
- *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
- *
- * Baikal-T1 Physically Mapped Internal ROM driver
- */
-#include <linux/bits.h>
-#include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/xip.h>
-#include <linux/mux/consumer.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/string.h>
-#include <linux/types.h>
-
-#include "physmap-bt1-rom.h"
-
-/*
- * Baikal-T1 SoC ROMs are only accessible by the dword-aligned instructions.
- * We have to take this into account when implementing the data read-methods.
- * Note there is no need in bothering with endianness, since both Baikal-T1
- * CPU and MMIO are LE.
- */
-static map_word __xipram bt1_rom_map_read(struct map_info *map,
-					  unsigned long ofs)
-{
-	void __iomem *src = map->virt + ofs;
-	unsigned int shift;
-	map_word ret;
-	u32 data;
-
-	/* Read data within offset dword. */
-	shift = (uintptr_t)src & 0x3;
-	data = readl_relaxed(src - shift);
-	if (!shift) {
-		ret.x[0] = data;
-		return ret;
-	}
-	ret.x[0] = data >> (shift * BITS_PER_BYTE);
-
-	/* Read data from the next dword. */
-	shift = 4 - shift;
-	if (ofs + shift >= map->size)
-		return ret;
-
-	data = readl_relaxed(src + shift);
-	ret.x[0] |= data << (shift * BITS_PER_BYTE);
-
-	return ret;
-}
-
-static void __xipram bt1_rom_map_copy_from(struct map_info *map,
-					   void *to, unsigned long from,
-					   ssize_t len)
-{
-	void __iomem *src = map->virt + from;
-	unsigned int shift, chunk;
-	u32 data;
-
-	if (len <= 0 || from >= map->size)
-		return;
-
-	/* Make sure we don't go over the map limit. */
-	len = min_t(ssize_t, map->size - from, len);
-
-	/*
-	 * Since requested data size can be pretty big we have to implement
-	 * the copy procedure as optimal as possible. That's why it's split
-	 * up into the next three stages: unaligned head, aligned body,
-	 * unaligned tail.
-	 */
-	shift = (uintptr_t)src & 0x3;
-	if (shift) {
-		chunk = min_t(ssize_t, 4 - shift, len);
-		data = readl_relaxed(src - shift);
-		memcpy(to, (char *)&data + shift, chunk);
-		src += chunk;
-		to += chunk;
-		len -= chunk;
-	}
-
-	while (len >= 4) {
-		data = readl_relaxed(src);
-		memcpy(to, &data, 4);
-		src += 4;
-		to += 4;
-		len -= 4;
-	}
-
-	if (len) {
-		data = readl_relaxed(src);
-		memcpy(to, &data, len);
-	}
-}
-
-int of_flash_probe_bt1_rom(struct platform_device *pdev,
-			   struct device_node *np,
-			   struct map_info *map)
-{
-	struct device *dev = &pdev->dev;
-
-	/* It's supposed to be read-only MTD. */
-	if (!of_device_is_compatible(np, "mtd-rom")) {
-		dev_info(dev, "No mtd-rom compatible string\n");
-		return 0;
-	}
-
-	/* Multiplatform guard. */
-	if (!of_device_is_compatible(np, "baikal,bt1-int-rom"))
-		return 0;
-
-	/* Sanity check the device parameters retrieved from DTB. */
-	if (map->bankwidth != 4)
-		dev_warn(dev, "Bank width is supposed to be 32 bits wide\n");
-
-	map->read = bt1_rom_map_read;
-	map->copy_from = bt1_rom_map_copy_from;
-
-	return 0;
-}
diff --git a/drivers/mtd/maps/physmap-bt1-rom.h b/drivers/mtd/maps/physmap-bt1-rom.h
deleted file mode 100644
index 6782899598a4..000000000000
--- a/drivers/mtd/maps/physmap-bt1-rom.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#include <linux/mtd/map.h>
-#include <linux/of.h>
-
-#ifdef CONFIG_MTD_PHYSMAP_BT1_ROM
-int of_flash_probe_bt1_rom(struct platform_device *pdev,
-			   struct device_node *np,
-			   struct map_info *map);
-#else
-static inline
-int of_flash_probe_bt1_rom(struct platform_device *pdev,
-			   struct device_node *np,
-			   struct map_info *map)
-{
-	return 0;
-}
-#endif
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
