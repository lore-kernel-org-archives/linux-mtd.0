Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F193FC282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 10:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE6521872
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 10:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RvwEKZs2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="HrbWztuI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE6521872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7CK/Pym0uIc8QZ4M2ubczwmpf3JbVN8+QNGG91W/uw=; b=RvwEKZs2QvoEKt
	GUckY2S6/TzS83y60pjOB57KydmKo5iL8daAPXpg2FGtTprBa9s7wqjWHWmWlthHkBkMVeZtI0XRm
	PVXVq+db1B03dXBgE0kPx4597Mz91vKvlsXmRHKgV8MpfCnxe8iW+u9KBchqT6713VdXWrb5PWQAr
	EB/F08/3mSUA/ji3QEPLgA7cLCBAAC2/K2e2TtCsUoLq1vHAQ+JBWLP21UJyV2Akn+djpjE5newqj
	KL48oZ7khhjEXHQABJWEEdHoWxwGOT5l6Czxn1rk+6+m3y4HUnnXkOaxq8FjibfZhj4z0wmYmHwgr
	ucz5PqGjORAVLtduMYaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpVgj-00080r-Sg; Fri, 01 Feb 2019 10:04:45 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpVgV-0007ne-6b
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2019 10:04:43 +0000
Received: by mail-lj1-x243.google.com with SMTP id u89-v6so5330993lje.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2019 02:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X3oyOJy7fWo1k4KstCcT5fnUK4qxZH9jnwVy5ty+Hk4=;
 b=HrbWztuIX1GrKT0JgDq3LmqP9UTvPs1ABKqQSgoBFtIeRhd8cA98LrPDCjAw4nJJOX
 B+xdYw4CX0e6H26Gj9SNwXHrGPAVXV6bNyeaJqktAmBHO6fUJUMQE954nUqdmJeqsFYV
 XSBwJPZnKruP96JrXQJ2CncGTxMxlbZEmvlh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X3oyOJy7fWo1k4KstCcT5fnUK4qxZH9jnwVy5ty+Hk4=;
 b=dbPo187wuOXJBn2zaklqYNDSxmpv9xFpfIHEZ8CqmHhJk6vpA2qqSVvpGNYH+JGG8G
 rWQKKzO6u+9DDb30wM4pOp9D0dmmkw3BQKNHFSoQEdPq4aYJSD1IRIoujeiJzzTTNi1F
 TUgVjQNBSqfP0QspNZVkUK4uFzQOOsIvSbJ0Wa75Dw8yCrHxrGxm1q5hIQi5R749TKjf
 nYfMbifTBVN+IQFH48xKAK/4Il3KZkc+L3eyRo0xlfbcaxYsps6znwAtjX9rMxViYA4k
 eSJ/DRZwmGmAByvZvkckZh8Na2OQhkBaO3EoP6p+zt53pKgSGjEpnl6Lj44LErVxJd81
 ulag==
X-Gm-Message-State: AJcUukc9TGTKfhCT/+5wHtqzFl2DyWjOnO3hh2+Z9THGSXw7F/Wt0XIB
 5Z/UzUiseV5XCRjaKQVz3Lna8g==
X-Google-Smtp-Source: ALg8bN6lGURej5KvvgLf5NDssJWW409pWp+8lcOy0Bws5pFgrMTAPZOqNMp+KtxSQWzFDqRIaEpJwg==
X-Received: by 2002:a2e:2909:: with SMTP id
 u9-v6mr30784487lje.28.1549015468808; 
 Fri, 01 Feb 2019 02:04:28 -0800 (PST)
Received: from linux.local (c-ae7b71d5.014-348-6c756e10.bbcust.telenor.se.
 [213.113.123.174])
 by smtp.gmail.com with ESMTPSA id g15sm1279197lfb.1.2019.02.01.02.04.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Feb 2019 02:04:27 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: physmap_of: add a hook for Intel IXP4xx flash probing
Date: Fri,  1 Feb 2019 11:04:21 +0100
Message-Id: <20190201100421.27504-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190201100421.27504-1-linus.walleij@linaro.org>
References: <20190201100421.27504-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_020431_248113_EB40F4D9 
X-CRM114-Status: GOOD (  29.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In order to support device tree probing of IXP4xx NOR flash
chips, a certain big-endian or mixed-endian memory access
pattern need to be used.

I have opted to use the pattern set by previous plug-ins
to physmap for Gemini and Versatile, just override some
functions and reuse most of the physmap core code as it
is to minimize maintenance.

Parts of drivers/mtd/ixp4xx.c are copied into this file.

After we have IXP4xx converted fully to device tree, the
drivers/mtd/ixp4xx.c file will be deleted and this will
be the only access pattern to the IXP4xx flash.

I did not keep the quirk in the flash write function
after probe, where the old code for a while checks for
access to odd addresses, fails and assigns a "faster"
write function once it has convinced probe to only use
2-byte accesses. As we mandate that this device should
be using bank-width = <2> this should not be a problem
unless misconfigured.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/maps/Kconfig          |   9 ++
 drivers/mtd/maps/Makefile         |   1 +
 drivers/mtd/maps/physmap-core.c   |   5 ++
 drivers/mtd/maps/physmap-ixp4xx.c | 135 ++++++++++++++++++++++++++++++
 drivers/mtd/maps/physmap-ixp4xx.h |  17 ++++
 5 files changed, 167 insertions(+)
 create mode 100644 drivers/mtd/maps/physmap-ixp4xx.c
 create mode 100644 drivers/mtd/maps/physmap-ixp4xx.h

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index e0cf869c8544..531db0aa8266 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -95,6 +95,15 @@ config MTD_PHYSMAP_GEMINI
 	  platforms, some detection and setting up parallel mode on the
 	  external interface.
 
+config MTD_PHYSMAP_IXP4XX
+	bool "Intel IXP4xx OF-based physical memory map handling"
+	depends on MTD_PHYSMAP_OF
+	select MTD_COMPLEX_MAPPINGS
+	default ARCH_IXP4XX
+	help
+	  This provides some extra DT physmap parsing for the Intel IXP4xx
+	  platforms, some elaborate endianness handling in particular.
+
 config MTD_PHYSMAP_GPIO_ADDR
 	bool "GPIO-assisted Flash Chip Support"
 	depends on MTD_PHYSMAP
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 1146009f41df..c0da86a5d26f 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
 physmap-objs-y			+= physmap-core.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_VERSATILE) += physmap-versatile.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_GEMINI) += physmap-gemini.o
+physmap-objs-$(CONFIG_MTD_PHYSMAP_IXP4XX) += physmap-ixp4xx.o
 physmap-objs			:= $(physmap-objs-y)
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
 obj-$(CONFIG_MTD_PISMO)		+= pismo.o
diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index d9a3e4bebe5d..1f0eafb02bb6 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -41,6 +41,7 @@
 #include <linux/gpio/consumer.h>
 
 #include "physmap-gemini.h"
+#include "physmap-ixp4xx.h"
 #include "physmap-versatile.h"
 
 struct physmap_flash_info {
@@ -368,6 +369,10 @@ static int physmap_flash_of_init(struct platform_device *dev)
 		if (err)
 			return err;
 
+		err = of_flash_probe_ixp4xx(dev, dp, &info->maps[i]);
+		if (err)
+			return err;
+
 		err = of_flash_probe_versatile(dev, dp, &info->maps[i]);
 		if (err)
 			return err;
diff --git a/drivers/mtd/maps/physmap-ixp4xx.c b/drivers/mtd/maps/physmap-ixp4xx.c
new file mode 100644
index 000000000000..2cce63eebcc0
--- /dev/null
+++ b/drivers/mtd/maps/physmap-ixp4xx.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel IXP4xx OF physmap add-on
+ * Copyright (C) 2019 Linus Walleij <linus.walleij@linaro.org>
+ *
+ * Based on the ixp4xx.c map driver, originally written by:
+ * Intel Corporation
+ * Deepak Saxena <dsaxena@mvista.com>
+ * Copyright (C) 2002 Intel Corporation
+ * Copyright (C) 2003-2004 MontaVista Software, Inc.
+ */
+#include <linux/export.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/xip.h>
+#include "physmap-ixp4xx.h"
+
+/*
+ * Read/write a 16 bit word from flash address 'addr'.
+ *
+ * When the cpu is in little-endian mode it swizzles the address lines
+ * ('address coherency') so we need to undo the swizzling to ensure commands
+ * and the like end up on the correct flash address.
+ *
+ * To further complicate matters, due to the way the expansion bus controller
+ * handles 32 bit reads, the byte stream ABCD is stored on the flash as:
+ *     D15    D0
+ *     +---+---+
+ *     | A | B | 0
+ *     +---+---+
+ *     | C | D | 2
+ *     +---+---+
+ * This means that on LE systems each 16 bit word must be swapped. Note that
+ * this requires CONFIG_MTD_CFI_BE_BYTE_SWAP to be enabled to 'unswap' the CFI
+ * data and other flash commands which are always in D7-D0.
+ */
+#ifndef __ARMEB__
+#ifndef CONFIG_MTD_CFI_BE_BYTE_SWAP
+#  error CONFIG_MTD_CFI_BE_BYTE_SWAP required for LE operation
+#endif
+
+static inline u16 flash_read16(void __iomem *addr)
+{
+	return be16_to_cpu(__raw_readw((void __iomem *)((unsigned long)addr ^ 0x2)));
+}
+
+static inline void flash_write16(u16 d, void __iomem *addr)
+{
+	__raw_writew(cpu_to_be16(d), (void __iomem *)((unsigned long)addr ^ 0x2));
+}
+
+#define	BYTE0(h)	((h) & 0xFF)
+#define	BYTE1(h)	(((h) >> 8) & 0xFF)
+
+#else
+
+static inline u16 flash_read16(const void __iomem *addr)
+{
+	return __raw_readw(addr);
+}
+
+static inline void flash_write16(u16 d, void __iomem *addr)
+{
+	__raw_writew(d, addr);
+}
+
+#define	BYTE0(h)	(((h) >> 8) & 0xFF)
+#define	BYTE1(h)	((h) & 0xFF)
+#endif
+
+static map_word ixp4xx_read16(struct map_info *map, unsigned long ofs)
+{
+	map_word val;
+
+	val.x[0] = flash_read16(map->virt + ofs);
+	return val;
+}
+
+/*
+ * The IXP4xx expansion bus only allows 16-bit wide acceses
+ * when attached to a 16-bit wide device (such as the 28F128J3A),
+ * so we can't just memcpy_fromio().
+ */
+static void ixp4xx_copy_from(struct map_info *map, void *to,
+			     unsigned long from, ssize_t len)
+{
+	u8 *dest = (u8 *) to;
+	void __iomem *src = map->virt + from;
+
+	if (len <= 0)
+		return;
+
+	if (from & 1) {
+		*dest++ = BYTE1(flash_read16(src-1));
+		src++;
+		--len;
+	}
+
+	while (len >= 2) {
+		u16 data = flash_read16(src);
+		*dest++ = BYTE0(data);
+		*dest++ = BYTE1(data);
+		src += 2;
+		len -= 2;
+	}
+
+	if (len > 0)
+		*dest++ = BYTE0(flash_read16(src));
+}
+
+static void ixp4xx_write16(struct map_info *map, map_word d, unsigned long adr)
+{
+	flash_write16(d.x[0], map->virt + adr);
+}
+
+int of_flash_probe_ixp4xx(struct platform_device *pdev,
+			  struct device_node *np,
+			  struct map_info *map)
+{
+	struct device *dev = &pdev->dev;
+
+	/* Multiplatform guard */
+	if (!of_device_is_compatible(np, "intel,ixp4xx-flash"))
+		return 0;
+
+	map->read = ixp4xx_read16;
+	map->write = ixp4xx_write16;
+	map->copy_from = ixp4xx_copy_from;
+	map->copy_to = NULL;
+
+	dev_info(dev, "initialized Intel IXP4xx-specific physmap control\n");
+
+	return 0;
+}
diff --git a/drivers/mtd/maps/physmap-ixp4xx.h b/drivers/mtd/maps/physmap-ixp4xx.h
new file mode 100644
index 000000000000..b0fc49b7f3ed
--- /dev/null
+++ b/drivers/mtd/maps/physmap-ixp4xx.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/of.h>
+#include <linux/mtd/map.h>
+
+#ifdef CONFIG_MTD_PHYSMAP_IXP4XX
+int of_flash_probe_ixp4xx(struct platform_device *pdev,
+			  struct device_node *np,
+			  struct map_info *map);
+#else
+static inline
+int of_flash_probe_ixp4xx(struct platform_device *pdev,
+			  struct device_node *np,
+			  struct map_info *map)
+{
+	return 0;
+}
+#endif
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
