Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273D3C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 21:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yQNitKrJd4THhoHURR5X7+t6+TeHodiw2SBuBNPAo/U=; b=d5+Z237k25vTHL
	ri6jveZ1+aCYLPj8jXKlwe7UvJxGUGq/BUGLRG/vEe8QYVyhua8sMFwjLds2j2IbJl1Fo/ZLIxUyH
	qaLo4BJo1WXA6dPoXhY1zoXkDTYW79brpwLP8HNaC1XvTYNDtICq6Mh3EjiOmcWdtDMwOrN/dT7hx
	VfgXAI75S/1HqK2EK4eSXSeDmPWdafOaNa4wZYhwmvsqlQN8ZNR7TQRj1Vyp2rqsxo1gFe7P3Qc2q
	tJMElVgIsIhoN8I4TOkbvAGUyjiJ8TvZOZgcyCtlPhlSgIljIIKKESMkt4R1DCZzT9TfqwVwzxZa4
	tKYdJNwJ44r46bcOcBgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncZP4-00E5t6-Pq; Thu, 07 Apr 2022 21:10:54 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncZP1-00E5rr-Ak
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 21:10:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id bx37so9052520ljb.4
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 14:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5VbibI3Pd6LGjoUlXf5P0YYpkJWMUII6I//Tt2Qilew=;
 b=hRtt++g2uVoklSfir9fRJmkTkjktQ8RR+h/rJEw4xEHCkGJOGUjqfYCgoTzh0/quAm
 6xwkjkLJhieRKZcNMGUEfXfs/UKo3ISOvXLlunrruOKepp2DIbdyA3MzYFlTLzMmu0+k
 zJEZFtVrHd122oWpq7dTl36pl+7gKdH0M9vwgnaMHxOxtC86oyh9tHsvDkbEZZyK3o62
 x8Tc6RB7IN5tGqc1PU9woJgdMxGUCFhIEvS3qs4FLm2uQqCV0DVFdzub9loRwP5ka2QJ
 quxq7BnieY8ePeIVc+wXV22qbvrQWJCR91Vl8QWYGooLm7Wv6+zNOqVUiDGVibaIbZ5Y
 GdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5VbibI3Pd6LGjoUlXf5P0YYpkJWMUII6I//Tt2Qilew=;
 b=d0EebK0CNHjx1q7Sfaobw2BwfGbH0hgO8zyCM/BHNG6UKjYKm1b/rHgzlC3Q8MIbRS
 lnpEXi2OlpkqEz6luCZMnYPsO893Ix1jp16rc3sqwSGwKi5NJjMbVsSEPb7KoIbN1hg+
 eH8HwrIY1ilNL8NS0FjkCf8RFoUQm/ghjnkKqZvBil6fY6M5u9UfgiKC5eWfEr9yvHeD
 gpaKhPJHF+bwZICcSh28dNkmbWREup0jHCSdzDU7vJ0WG+MmUB5hhFOGb/nm1y1OrvwS
 38/CFTdBfl9CAE1mMwD8xNiVGye6pnbYLeByhQHGYaJF2vwmlK0kx+vV1Ev0SSms3OfT
 5c5A==
X-Gm-Message-State: AOAM5309wr57OkWLvDXS+52kWCPAljPdlCrieAP17zchRZmhIxrZL7KW
 M3fePqjw+F+RODY93+tuGFuIMdgLi7fQZw==
X-Google-Smtp-Source: ABdhPJxnIKVBU/RhltOzjc6Cy2DLlc6OWklogfSPk6cLmeWe8YqhY+7RH9alQToJwogB3OxlZa4X1Q==
X-Received: by 2002:a2e:b94b:0:b0:24a:eacb:ad43 with SMTP id
 11-20020a2eb94b000000b0024aeacbad43mr9715670ljs.486.1649365847134; 
 Thu, 07 Apr 2022 14:10:47 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a193846000000b0044a589efadbsm2271440lfj.2.2022.04.07.14.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 14:10:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] mtd: maps: ixp4xx: Drop driver
Date: Thu,  7 Apr 2022 23:08:44 +0200
Message-Id: <20220407210844.2489682-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_141051_414387_7BE7A1AC 
X-CRM114-Status: GOOD (  32.40  )
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

This custom maps driver was never used with the device tree
enabled IXP4xx systems, which use the physmap add-on from
commit 2aba2f2a704d
("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")

Since kernel v5.18-rc1 IXP4xx is only booting from the device
tree so drop this old driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/maps/Kconfig  |   9 --
 drivers/mtd/maps/Makefile |   1 -
 drivers/mtd/maps/ixp4xx.c | 262 --------------------------------------
 3 files changed, 272 deletions(-)
 delete mode 100644 drivers/mtd/maps/ixp4xx.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 6a099bbcd8be..e098ae937ce8 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -300,15 +300,6 @@ config MTD_DC21285
 	  21285 bridge used with Intel's StrongARM processors. More info at
 	  <https://www.intel.com/design/bridge/docs/21285_documentation.htm>.
 
-config MTD_IXP4XX
-	tristate "CFI Flash device mapped on Intel IXP4xx based systems"
-	depends on MTD_CFI && MTD_COMPLEX_MAPPINGS && ARCH_IXP4XX && MTD_CFI_ADV_OPTIONS
-	help
-	  This enables MTD access to flash devices on platforms based
-	  on Intel's IXP4xx family of network processors such as the
-	  IXDP425 and Coyote. If you have an IXP4xx based board and
-	  would like to use the flash chips on it, say 'Y'.
-
 config MTD_IMPA7
 	tristate "JEDEC Flash device mapped on impA7"
 	depends on ARM && MTD_JEDECPROBE
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 2240b100f66a..094cfb244086 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -39,7 +39,6 @@ obj-$(CONFIG_MTD_IMPA7)		+= impa7.o
 obj-$(CONFIG_MTD_UCLINUX)	+= uclinux.o
 obj-$(CONFIG_MTD_NETtel)	+= nettel.o
 obj-$(CONFIG_MTD_SCB2_FLASH)	+= scb2_flash.o
-obj-$(CONFIG_MTD_IXP4XX)	+= ixp4xx.o
 obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
 obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
 obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
deleted file mode 100644
index d8543201ab94..000000000000
--- a/drivers/mtd/maps/ixp4xx.c
+++ /dev/null
@@ -1,262 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * drivers/mtd/maps/ixp4xx.c
- *
- * MTD Map file for IXP4XX based systems. Please do not make per-board
- * changes in here. If your board needs special setup, do it in your
- * platform level code in arch/arm/mach-ixp4xx/board-setup.c
- *
- * Original Author: Intel Corporation
- * Maintainer: Deepak Saxena <dsaxena@mvista.com>
- *
- * Copyright (C) 2002 Intel Corporation
- * Copyright (C) 2003-2004 MontaVista Software, Inc.
- *
- */
-
-#include <linux/err.h>
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/slab.h>
-#include <linux/ioport.h>
-#include <linux/device.h>
-#include <linux/platform_device.h>
-
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-
-#include <asm/io.h>
-#include <asm/mach/flash.h>
-
-#include <linux/reboot.h>
-
-/*
- * Read/write a 16 bit word from flash address 'addr'.
- *
- * When the cpu is in little-endian mode it swizzles the address lines
- * ('address coherency') so we need to undo the swizzling to ensure commands
- * and the like end up on the correct flash address.
- *
- * To further complicate matters, due to the way the expansion bus controller
- * handles 32 bit reads, the byte stream ABCD is stored on the flash as:
- *     D15    D0
- *     +---+---+
- *     | A | B | 0
- *     +---+---+
- *     | C | D | 2
- *     +---+---+
- * This means that on LE systems each 16 bit word must be swapped. Note that
- * this requires CONFIG_MTD_CFI_BE_BYTE_SWAP to be enabled to 'unswap' the CFI
- * data and other flash commands which are always in D7-D0.
- */
-#ifndef __ARMEB__
-#ifndef CONFIG_MTD_CFI_BE_BYTE_SWAP
-#  error CONFIG_MTD_CFI_BE_BYTE_SWAP required
-#endif
-
-static inline u16 flash_read16(void __iomem *addr)
-{
-	return be16_to_cpu(__raw_readw((void __iomem *)((unsigned long)addr ^ 0x2)));
-}
-
-static inline void flash_write16(u16 d, void __iomem *addr)
-{
-	__raw_writew(cpu_to_be16(d), (void __iomem *)((unsigned long)addr ^ 0x2));
-}
-
-#define	BYTE0(h)	((h) & 0xFF)
-#define	BYTE1(h)	(((h) >> 8) & 0xFF)
-
-#else
-
-static inline u16 flash_read16(const void __iomem *addr)
-{
-	return __raw_readw(addr);
-}
-
-static inline void flash_write16(u16 d, void __iomem *addr)
-{
-	__raw_writew(d, addr);
-}
-
-#define	BYTE0(h)	(((h) >> 8) & 0xFF)
-#define	BYTE1(h)	((h) & 0xFF)
-#endif
-
-static map_word ixp4xx_read16(struct map_info *map, unsigned long ofs)
-{
-	map_word val;
-	val.x[0] = flash_read16(map->virt + ofs);
-	return val;
-}
-
-/*
- * The IXP4xx expansion bus only allows 16-bit wide acceses
- * when attached to a 16-bit wide device (such as the 28F128J3A),
- * so we can't just memcpy_fromio().
- */
-static void ixp4xx_copy_from(struct map_info *map, void *to,
-			     unsigned long from, ssize_t len)
-{
-	u8 *dest = (u8 *) to;
-	void __iomem *src = map->virt + from;
-
-	if (len <= 0)
-		return;
-
-	if (from & 1) {
-		*dest++ = BYTE1(flash_read16(src-1));
-		src++;
-		--len;
-	}
-
-	while (len >= 2) {
-		u16 data = flash_read16(src);
-		*dest++ = BYTE0(data);
-		*dest++ = BYTE1(data);
-		src += 2;
-		len -= 2;
-	}
-
-	if (len > 0)
-		*dest++ = BYTE0(flash_read16(src));
-}
-
-/*
- * Unaligned writes are ignored, causing the 8-bit
- * probe to fail and proceed to the 16-bit probe (which succeeds).
- */
-static void ixp4xx_probe_write16(struct map_info *map, map_word d, unsigned long adr)
-{
-	if (!(adr & 1))
-		flash_write16(d.x[0], map->virt + adr);
-}
-
-/*
- * Fast write16 function without the probing check above
- */
-static void ixp4xx_write16(struct map_info *map, map_word d, unsigned long adr)
-{
-	flash_write16(d.x[0], map->virt + adr);
-}
-
-struct ixp4xx_flash_info {
-	struct mtd_info *mtd;
-	struct map_info map;
-	struct resource *res;
-};
-
-static const char * const probes[] = { "RedBoot", "cmdlinepart", NULL };
-
-static int ixp4xx_flash_remove(struct platform_device *dev)
-{
-	struct flash_platform_data *plat = dev_get_platdata(&dev->dev);
-	struct ixp4xx_flash_info *info = platform_get_drvdata(dev);
-
-	if(!info)
-		return 0;
-
-	if (info->mtd) {
-		mtd_device_unregister(info->mtd);
-		map_destroy(info->mtd);
-	}
-
-	if (plat->exit)
-		plat->exit();
-
-	return 0;
-}
-
-static int ixp4xx_flash_probe(struct platform_device *dev)
-{
-	struct flash_platform_data *plat = dev_get_platdata(&dev->dev);
-	struct ixp4xx_flash_info *info;
-	struct mtd_part_parser_data ppdata = {
-		.origin = dev->resource->start,
-	};
-	int err = -1;
-
-	if (!plat)
-		return -ENODEV;
-
-	if (plat->init) {
-		err = plat->init();
-		if (err)
-			return err;
-	}
-
-	info = devm_kzalloc(&dev->dev, sizeof(struct ixp4xx_flash_info),
-			    GFP_KERNEL);
-	if(!info) {
-		err = -ENOMEM;
-		goto Error;
-	}
-
-	platform_set_drvdata(dev, info);
-
-	/*
-	 * Tell the MTD layer we're not 1:1 mapped so that it does
-	 * not attempt to do a direct access on us.
-	 */
-	info->map.phys = NO_XIP;
-	info->map.size = resource_size(dev->resource);
-
-	/*
-	 * We only support 16-bit accesses for now. If and when
-	 * any board use 8-bit access, we'll fixup the driver to
-	 * handle that.
-	 */
-	info->map.bankwidth = 2;
-	info->map.name = dev_name(&dev->dev);
-	info->map.read = ixp4xx_read16;
-	info->map.write = ixp4xx_probe_write16;
-	info->map.copy_from = ixp4xx_copy_from;
-
-	info->map.virt = devm_ioremap_resource(&dev->dev, dev->resource);
-	if (IS_ERR(info->map.virt)) {
-		err = PTR_ERR(info->map.virt);
-		goto Error;
-	}
-
-	info->mtd = do_map_probe(plat->map_name, &info->map);
-	if (!info->mtd) {
-		printk(KERN_ERR "IXP4XXFlash: map_probe failed\n");
-		err = -ENXIO;
-		goto Error;
-	}
-	info->mtd->dev.parent = &dev->dev;
-
-	/* Use the fast version */
-	info->map.write = ixp4xx_write16;
-
-	err = mtd_device_parse_register(info->mtd, probes, &ppdata,
-			plat->parts, plat->nr_parts);
-	if (err) {
-		printk(KERN_ERR "Could not parse partitions\n");
-		goto Error;
-	}
-
-	return 0;
-
-Error:
-	ixp4xx_flash_remove(dev);
-	return err;
-}
-
-static struct platform_driver ixp4xx_flash_driver = {
-	.probe		= ixp4xx_flash_probe,
-	.remove		= ixp4xx_flash_remove,
-	.driver		= {
-		.name	= "IXP4XX-Flash",
-	},
-};
-
-module_platform_driver(ixp4xx_flash_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("MTD map driver for Intel IXP4xx systems");
-MODULE_AUTHOR("Deepak Saxena");
-MODULE_ALIAS("platform:IXP4XX-Flash");
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
