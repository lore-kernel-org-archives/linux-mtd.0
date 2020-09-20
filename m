Return-Path: <SRS0=3Hr+=C5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D91C43469
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 11:23:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E231720EDD
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 11:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zedWSVmq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E231720EDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ei9sZKgG3trprmC4C9CbijA9Gr+hs5abQgYu0YsValw=; b=zedWSVmq5hvP2LG5FxCf7Knd8T
	1kK+pranlBv6EfU88NHJ7QYSt8ve8tkmn851lOzxFt5VbLAm8E6C4vfsRcZ3NSgiGAgDqBywYjMCy
	t54wxeWkb7Q32Esr53UFJlfCqrYacq/2gG6SqhIEyHpBewqQGyiP/OCZriwIeNxRfIGpZhz4htdbv
	RoYBW6cwI6KbFpWxsQ9uavu61u3JobZyLQEVrEEWjIrw9gVCEjKyaxCR+liI6WCJHxpc19rcAJufE
	8yNltNVlMN/fJ4Md//xAiDtxoFhljiyoVGyGzraeEOMM+B5aTuw+PN78sU60S3MCHuBwNUGkLy4kq
	PwX40GZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJxQI-0003JL-Ds; Sun, 20 Sep 2020 11:22:26 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJxQD-0003Ik-Ov
 for linux-mtd@lists.infradead.org; Sun, 20 Sep 2020 11:22:23 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id C6DF2803073F;
 Sun, 20 Sep 2020 11:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8uDbgm43KziS; Sun, 20 Sep 2020 14:15:15 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3] mtd: physmap: Add Baikal-T1 physically mapped ROM support
Date: Sun, 20 Sep 2020 14:14:44 +0300
Message-ID: <20200920111445.21816-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_072222_111658_C7A89CE6 
X-CRM114-Status: GOOD (  25.95  )
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
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, linux-mtd@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Baikal-T1 Boot Controller provides an access to a RO storages, which are
physically mapped into the SoC MMIO space. In particularly there are
Internal ROM embedded into the SoC with a pre-installed firmware,
externally attached SPI flash (also accessed in the read-only mode) and a
memory region, which mirrors one of them in accordance with the currently
enabled system boot mode (also called Boot ROM).

This commit adds the Internal ROM support to the physmap driver of the MTD
kernel subsystem. The driver will create the Internal ROM MTD as long as
it is defined in the system dts file. The physically mapped SPI flash
region will be used to implement the SPI-mem interface. The mirroring
memory region won't be accessible directly since it's redundant due to
both bootable regions being exposed anyway.

Note we had to create a dedicated code for the ROMs since read from the
corresponding memory regions must be done via the dword-aligned addresses.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-mips@vger.kernel.org

---

Link: https://lore.kernel.org/linux-mtd/20200508100905.5854-1-Sergey.Semin@baikalelectronics.ru/
Changelog v2:
- Resend.

Link: https://lore.kernel.org/linux-mtd/20200526225849.20985-1-Sergey.Semin@baikalelectronics.ru
Changelog v3:
- Alphabetically order the include statements.
- Discard dummy IOs.
- Discard Baikal-T1 Boot ROM support. The directly mapped SPI flash
  memory will be used in the DW APB SSI driver instead.
---
 drivers/mtd/maps/Kconfig           |  11 +++
 drivers/mtd/maps/Makefile          |   1 +
 drivers/mtd/maps/physmap-bt1-rom.c | 126 +++++++++++++++++++++++++++++
 drivers/mtd/maps/physmap-bt1-rom.h |  17 ++++
 drivers/mtd/maps/physmap-core.c    |   5 ++
 5 files changed, 160 insertions(+)
 create mode 100644 drivers/mtd/maps/physmap-bt1-rom.c
 create mode 100644 drivers/mtd/maps/physmap-bt1-rom.h

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index fd37553f1b07..6650acbc961e 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -75,6 +75,17 @@ config MTD_PHYSMAP_OF
 	  physically into the CPU's memory. The mapping description here is
 	  taken from OF device tree.
 
+config MTD_PHYSMAP_BT1_ROM
+	bool "Baikal-T1 Boot ROMs OF-based physical memory map handling"
+	depends on MTD_PHYSMAP_OF
+	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
+	select MTD_COMPLEX_MAPPINGS
+	select MULTIPLEXER
+	select MUX_MMIO
+	help
+	  This provides some extra DT physmap parsing for the Baikal-T1
+	  platforms, some detection and setting up ROMs-specific accessors.
+
 config MTD_PHYSMAP_VERSATILE
 	bool "ARM Versatile OF-based physical memory map handling"
 	depends on MTD_PHYSMAP_OF
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index c0da86a5d26f..79f018cf412f 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_MTD_CK804XROM)	+= ck804xrom.o
 obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
 physmap-objs-y			+= physmap-core.o
+physmap-objs-$(CONFIG_MTD_PHYSMAP_BT1_ROM) += physmap-bt1-rom.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_VERSATILE) += physmap-versatile.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_GEMINI) += physmap-gemini.o
 physmap-objs-$(CONFIG_MTD_PHYSMAP_IXP4XX) += physmap-ixp4xx.o
diff --git a/drivers/mtd/maps/physmap-bt1-rom.c b/drivers/mtd/maps/physmap-bt1-rom.c
new file mode 100644
index 000000000000..27cfe1c63a2e
--- /dev/null
+++ b/drivers/mtd/maps/physmap-bt1-rom.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *
+ * Baikal-T1 Physically Mapped Internal ROM driver
+ */
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/xip.h>
+#include <linux/mux/consumer.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "physmap-bt1-rom.h"
+
+/*
+ * Baikal-T1 SoC ROMs are only accessible by the dword-aligned instructions.
+ * We have to take this into account when implementing the data read-methods.
+ * Note there is no need in bothering with endianness, since both Baikal-T1
+ * CPU and MMIO are LE.
+ */
+static map_word __xipram bt1_rom_map_read(struct map_info *map,
+					  unsigned long ofs)
+{
+	void __iomem *src = map->virt + ofs;
+	unsigned long shift;
+	map_word ret;
+	u32 data;
+
+	/* Read data within offset dword. */
+	shift = (unsigned long)src & 0x3;
+	data = readl_relaxed(src - shift);
+	if (!shift) {
+		ret.x[0] = data;
+		return ret;
+	}
+	ret.x[0] = data >> (shift * BITS_PER_BYTE);
+
+	/* Read data from the next dword. */
+	shift = 4 - shift;
+	if (ofs + shift >= map->size)
+		return ret;
+
+	data = readl_relaxed(src + shift);
+	ret.x[0] |= data << (shift * BITS_PER_BYTE);
+
+	return ret;
+}
+
+static void __xipram bt1_rom_map_copy_from(struct map_info *map,
+					   void *to, unsigned long from,
+					   ssize_t len)
+{
+	void __iomem *src = map->virt + from;
+	ssize_t shift, chunk;
+	u32 data;
+
+	if (len <= 0 || from >= map->size)
+		return;
+
+	/* Make sure we don't go over the map limit. */
+	len = min_t(ssize_t, map->size - from, len);
+
+	/*
+	 * Since requested data size can be pretty big we have to implement
+	 * the copy procedure as optimal as possible. That's why it's split
+	 * up into the next three stages: unaligned head, aligned body,
+	 * unaligned tail.
+	 */
+	shift = (ssize_t)src & 0x3;
+	if (shift) {
+		chunk = min_t(ssize_t, 4 - shift, len);
+		data = readl_relaxed(src - shift);
+		memcpy(to, &data + shift, chunk);
+		src += chunk;
+		to += chunk;
+		len -= chunk;
+	}
+
+	while (len >= 4) {
+		data = readl_relaxed(src);
+		memcpy(to, &data, 4);
+		src += 4;
+		to += 4;
+		len -= 4;
+	}
+
+	if (len) {
+		data = readl_relaxed(src);
+		memcpy(to, &data, len);
+	}
+}
+
+int of_flash_probe_bt1_rom(struct platform_device *pdev,
+			   struct device_node *np,
+			   struct map_info *map)
+{
+	struct device *dev = &pdev->dev;
+
+	/* It's supposed to be read-only MTD. */
+	if (!of_device_is_compatible(np, "mtd-rom")) {
+		dev_info(dev, "No mtd-rom compatible string\n");
+		return 0;
+	}
+
+	/* Multiplatform guard. */
+	if (!of_device_is_compatible(np, "baikal,bt1-int-rom"))
+		return 0;
+
+	/* Sanity check the device parameters retrieved from DTB. */
+	if (map->bankwidth != 4)
+		dev_warn(dev, "Bank width is supposed to be 32 bits wide\n");
+
+	map->read = bt1_rom_map_read;
+	map->copy_from = bt1_rom_map_copy_from;
+
+	return 0;
+}
diff --git a/drivers/mtd/maps/physmap-bt1-rom.h b/drivers/mtd/maps/physmap-bt1-rom.h
new file mode 100644
index 000000000000..6782899598a4
--- /dev/null
+++ b/drivers/mtd/maps/physmap-bt1-rom.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/mtd/map.h>
+#include <linux/of.h>
+
+#ifdef CONFIG_MTD_PHYSMAP_BT1_ROM
+int of_flash_probe_bt1_rom(struct platform_device *pdev,
+			   struct device_node *np,
+			   struct map_info *map);
+#else
+static inline
+int of_flash_probe_bt1_rom(struct platform_device *pdev,
+			   struct device_node *np,
+			   struct map_info *map)
+{
+	return 0;
+}
+#endif
diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 8f7f966fa9a7..8843e780f5c8 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -41,6 +41,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
 
+#include "physmap-bt1-rom.h"
 #include "physmap-gemini.h"
 #include "physmap-ixp4xx.h"
 #include "physmap-versatile.h"
@@ -371,6 +372,10 @@ static int physmap_flash_of_init(struct platform_device *dev)
 		info->maps[i].bankwidth = bankwidth;
 		info->maps[i].device_node = dp;
 
+		err = of_flash_probe_bt1_rom(dev, dp, &info->maps[i]);
+		if (err)
+			return err;
+
 		err = of_flash_probe_gemini(dev, dp, &info->maps[i]);
 		if (err)
 			return err;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
