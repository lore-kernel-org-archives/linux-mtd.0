Return-Path: <SRS0=zboj=YN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F61CA9EAD
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Oct 2019 23:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0649421929
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Oct 2019 23:01:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qQ6TFiH6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CdDypfBC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0649421929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAz6yppxZlV8BlrCTxMGBIhHmgSO9GAgPJduQTOxKCk=; b=qQ6TFiH6X23/gp
	BLAFwP4guCSa05FphXxtLs/JjVJ05i2woYKfIahfEKb21klnCE0l3JmA3zja4at/ubS3ehQzO69DQ
	cvNpvf7DWvD5ylMfK9ODNT4/AZolaupDL9k6Ry3wYjobSGzYJPnKH3HbdoSV6bnddhLSnZCzBLQQz
	eZorthr8vVOxyVdO8DcqXBBJZGvsXehffMkFhEe0wtdjTafdFhG48T9tf85NPR/V38zUYSzrrys4C
	euC+uDbVFCBsTnc7kbiHsm0Q00SJx8IcgozdumAjd/+jdMQSkm2whVI+t7YHYC2JypKXcFgxFyc03
	U8tE/5cpf2BLOqOPyjDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMKCI-0006ud-8b; Sun, 20 Oct 2019 23:01:14 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMKBz-0005hU-MT
 for linux-mtd@lists.infradead.org; Sun, 20 Oct 2019 23:01:03 +0000
Received: by mail-lf1-x144.google.com with SMTP id 195so8500040lfj.6
 for <linux-mtd@lists.infradead.org>; Sun, 20 Oct 2019 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RCec293SgcM64NtneWJVSHGCnM5fSyWUR46qDu1bvc0=;
 b=CdDypfBCb5a0g2zJwncgmiNN56RUvPwJ0IAF8VF6p28mCMejzkHNONON8fYkFHklvk
 Fx5pfrLX81StvYikO645HdK/02/O6E/j69o37onfPhiFF4kua/0G0wXGwXSqP49komsH
 dZua44ajOQyDd+aL8Zw/SZTQakG+/BWhQGTAidWDc6kzZDzQ9roAmv2f+rfp+3rRqsj8
 BDO2RLv+eTHZAOSNolprRlTbEHvnFoCh0byAjZ4XWkYJ0hzQptaVATkLqy9vSlblyuGU
 NGyJkI8rwPmymThKflH8p28IlqxbkXMQW50F/4LX8bprf3GduG8Go6Xg7LJNY7W/tJdq
 W22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RCec293SgcM64NtneWJVSHGCnM5fSyWUR46qDu1bvc0=;
 b=TJcrXWkjXhrgRR+OD2Odp+CaON39Fy/ilOorswxQP0wTs+mrDGyJmdo+QHUTBAsNah
 Ry7Y6XA208h9GjHu4xk1x8aNOoIEjiDSmNLcFurZ5g3sY3BWHWlGjrt9EXstEsAcvdG7
 sXNfofpkuIgSrF+lnmQProyrJXOGvgBIdwYMwenQI68chYqyuiIeCvozmipyD8fkwgtz
 /hAcYdT8emoPO9b0Jp1LAnfokzIMPZn8PWBCporLVdnYvlue6UbUDcSR3ZMNJSyikYa8
 4QzIy3yrbi8Ami4ARxomu57vWUx3ifdnsTtapA8KpCuZwMvazjlC5FwjFPe5S0OAR17V
 CVHw==
X-Gm-Message-State: APjAAAV8wzKeDkrU5q7Dzr1hVFzRqWy6wQMV7GzqFr83Z8Lj1hnOQlBY
 RXlS43zgdcIV25pFgcpuQnBzXA==
X-Google-Smtp-Source: APXvYqw7lSX28do7mOeegcHGaW3+MHD9rH3473pTVhkZRMOH4KabJK6jabadFHJOEw5L4H3A4rxJ7g==
X-Received: by 2002:a19:6b07:: with SMTP id d7mr2846567lfa.62.1571612453690;
 Sun, 20 Oct 2019 16:00:53 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
 by smtp.gmail.com with ESMTPSA id 77sm6011174ljf.85.2019.10.20.16.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2019 16:00:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/2 v4] mtd: physmap_of: add a hook for Intel IXP4xx flash
 probing
Date: Mon, 21 Oct 2019 01:00:42 +0200
Message-Id: <20191020230042.7364-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191020230042.7364-1-linus.walleij@linaro.org>
References: <20191020230042.7364-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_160055_742165_E7C807B1 
X-CRM114-Status: GOOD (  28.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org
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
ChangeLog v3->v4:
- Rebase on v5.4-rc1
- Resend
ChangeLog v2->v3:
- Restrict option to ARM machines as LE on X86 does not
  feel very good about this code.
ChangeLog v1->v2:
- Simply select MTD_CFI_BE_BYTE_SWAP on big endian in Kconfig
- Rebase on v5.1-rc1
---
 drivers/mtd/maps/Kconfig          |  11 +++
 drivers/mtd/maps/Makefile         |   1 +
 drivers/mtd/maps/physmap-core.c   |   5 ++
 drivers/mtd/maps/physmap-ixp4xx.c | 132 ++++++++++++++++++++++++++++++
 drivers/mtd/maps/physmap-ixp4xx.h |  17 ++++
 5 files changed, 166 insertions(+)
 create mode 100644 drivers/mtd/maps/physmap-ixp4xx.c
 create mode 100644 drivers/mtd/maps/physmap-ixp4xx.h

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index bc82305ebb4c..b28225a7c4f3 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -96,6 +96,17 @@ config MTD_PHYSMAP_GEMINI
 	  platforms, some detection and setting up parallel mode on the
 	  external interface.
 
+config MTD_PHYSMAP_IXP4XX
+	bool "Intel IXP4xx OF-based physical memory map handling"
+	depends on MTD_PHYSMAP_OF
+	depends on ARM
+	select MTD_COMPLEX_MAPPINGS
+	select MTD_CFI_BE_BYTE_SWAP if CPU_BIG_ENDIAN
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
index 21b556afc305..a9f7964e2edb 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -41,6 +41,7 @@
 #include <linux/gpio/consumer.h>
 
 #include "physmap-gemini.h"
+#include "physmap-ixp4xx.h"
 #include "physmap-versatile.h"
 
 struct physmap_flash_info {
@@ -370,6 +371,10 @@ static int physmap_flash_of_init(struct platform_device *dev)
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
index 000000000000..6a054229a8a0
--- /dev/null
+++ b/drivers/mtd/maps/physmap-ixp4xx.c
@@ -0,0 +1,132 @@
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
+#ifndef CONFIG_CPU_BIG_ENDIAN
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
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
