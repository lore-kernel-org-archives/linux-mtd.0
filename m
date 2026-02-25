Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2E2FD3770
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cNQtMQtRSbk18w/k7Ti8eixHmeFNv53Oc3hI52BjvFA=; b=Y/0TltQ93GTk1Q
	wLreYYY74H3/GWWqxSMebMqV4ifn21gUnIn/kMSPYwTALSYXI+A1k9deo3fMFG/WMTYp4mCqOD/WL
	14Gj12iOPHuRW4ZwtqNU9I+GuHAqmNoYnAMgcgsWF2J75vL8mVox2J+vuRYuGmFz8NO9wYFZF2pcc
	y24z9zndMU3bUAt9EDqcg+9MOP4KOpK95KFbD3O1Hs9fi9JStS26gP30J9Qsgmo30q6uTxZSyIeK/
	Fj5MqUs/7yMuOr7+RRLegK3KexdfVVwfwuxkKZfExEoGvNlLDWTL1Pob4sNAts2QG/mvmLrttINrT
	lHOCFXfd8engp4Aet4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHgN-00000004VXd-1FUr;
	Wed, 25 Feb 2026 16:24:15 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHgK-00000004VX3-10OD
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772036652; x=1803572652;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bfSlPjd3/kSsyuBazjL99bTPJw/YIKkO6gUW1x5G2LU=;
  b=UHchzxM0oHqGYp1rAnl0CnUG9jumaQnO4agHuPUgCOy9bb1JdkVJoPOp
   zXwBhao9ZpTTqZU2UPUIsMq8lRo2Yg+S16q5o8LddUgtakW7WKUR6a5hD
   AAkWIWEqqnMM9sEX9OMrcCTAxHM2z0wTAIVVhEmOyIx/SyGqoW+DBwIJ2
   iC3oF+baYjM/6HCfGFESVNLewK4HfhzdBpxPSvmNaGgH3mbPaFZYLS7dl
   5wub9jfO5KyYhRZQ8iiFknBG2eoECK5CmdWeE7+5uknc9JkOUTBKwwkIj
   8wtm8ygu7CuvC/czDBCO/u902WyqgZywlRFeZw1O2uVYJOAcNtiSQ5SZh
   w==;
X-CSE-ConnectionGUID: HKU8kYvyQVyyXDh5SidSyQ==
X-CSE-MsgGUID: zV93yY86SQ6Z35myn/T7ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73186578"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="73186578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:24:11 -0800
X-CSE-ConnectionGUID: mOZkFZigSLusNFxRTd1Iag==
X-CSE-MsgGUID: 3K2uaGCmSLCbKavmdcgUnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="215501839"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 25 Feb 2026 08:24:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 98C0298; Wed, 25 Feb 2026 17:24:08 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/1] mtd: physmap: physmap-bt1-rom: Remove not-going-to-be-supported code for Baikal SoC
Date: Wed, 25 Feb 2026 17:23:34 +0100
Message-ID: <20260225162406.3815267-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_082412_290201_13A6E0A2 
X-CRM114-Status: GOOD (  21.34  )
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
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: removed online leftover (Randy), added tag (Randy)

 drivers/mtd/maps/Kconfig           |  11 ---
 drivers/mtd/maps/Makefile          |   1 -
 drivers/mtd/maps/physmap-bt1-rom.c | 125 -----------------------------
 drivers/mtd/maps/physmap-bt1-rom.h |  17 ----
 drivers/mtd/maps/physmap-core.c    |   1 -
 5 files changed, 155 deletions(-)
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
diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 0dcc25b7ff98..2e31c30d266c 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -42,7 +42,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
 
-#include "physmap-bt1-rom.h"
 #include "physmap-gemini.h"
 #include "physmap-ixp4xx.h"
 #include "physmap-versatile.h"
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
