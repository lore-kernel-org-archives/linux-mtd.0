Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2298C7618E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Apr 2023 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wK/HrhIZE2y/Zm/aCpZtAio1qExiF5ub3ZaIBsoxCS8=; b=LEmN+4bWlA/b1s
	xRmqQdMpH2BQDYvtNmQ46uuOyDFoCshIi2xxw10rR9Y15P8ryaK51yH59WA/dpNPXNcUb63Wgh8Xc
	QgnkXXIMEppVuiBZExGKJ18PWbMqcj4PE8Ka69MEYPfGAUEvvVJ19Fze9wX6aqrBf8q0Hcp5t0voi
	budDC7VvZs7Rj+W27onSyYMGBiVkF150KyUbpTd9wuAYscW/+c/7a+dDeau6UJ7AIAcAzB0Mt8XMG
	RJNfu2Lh3MwabuAKXBcEEFTrJxMdy+WOQK66SPumsJ0BP1Q5Y0JSjydWy9cl+DuUj4wfuF3R1yRUH
	jezBWFE9/WqfPLr3B7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsc7-00FoPI-24;
	Mon, 24 Apr 2023 09:36:03 +0000
Received: from forward501c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d501])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsc3-00FoLj-35
	for linux-mtd@lists.infradead.org;
	Mon, 24 Apr 2023 09:36:02 +0000
Received: from mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:261e:0:640:2e3d:0])
	by forward501c.mail.yandex.net (Yandex) with ESMTP id 8845C5EBF7;
	Mon, 24 Apr 2023 12:35:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id JZBb1pbWwKo0-qs8Ysl2n;
	Mon, 24 Apr 2023 12:35:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1682328957;
	bh=26jP1z6kJxd8ER1tdQvbAbkoWyGDLjC4In1lvVJLLi0=;
	h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=sG8MZrtDcSveu1AzqOtwAzYRoYdrobB5Ta8zWmDhb+TvBCgPhPXlAoI1ia0VWrbgP
	 DKobaaCytaGR+RiMIBK+PWCikaBjg1Ckrh8ML7KhQbPBo6XIRK8od48iHIZlYjSjyB
	 LEQj79fbsT2LZiyJz3r7ghpUMR22Eh97qB5XqjCQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: Arnd Bergmann <arnd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chuanhong Guo <gch981213@gmail.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Jean Delvare <jdelvare@suse.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 23/43] mtd: ts72xx_nand: add platform helper
Date: Mon, 24 Apr 2023 15:34:39 +0300
Message-Id: <20230424123522.18302-24-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424123522.18302-1-nikita.shubin@maquefel.me>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_023600_166546_34029999 
X-CRM114-Status: GOOD (  19.57  )
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

The only purpose of this code to provide platform_nand_data to gen_nand
driver which requires .cmd_ctrl and .dev_ready.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---

Notes:
    rfc->v0
    Alexander Sverdlin:
    - platfrom -> platform
    
    Linus Walleij:
    - __raw_read/write[w|l] -> readb/writeb
    
    Arnd Bergmann:
    - name match node ts7250 instead of wildcard

 drivers/mtd/nand/raw/Kconfig       |  8 +++
 drivers/mtd/nand/raw/Makefile      |  1 +
 drivers/mtd/nand/raw/ts72xx_nand.c | 94 ++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 drivers/mtd/nand/raw/ts72xx_nand.c

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 170f1185ddc4..08f88c34ce53 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -456,6 +456,14 @@ config MTD_NAND_RENESAS
 	  Enables support for the NAND controller found on Renesas R-Car
 	  Gen3 and RZ/N1 SoC families.
 
+config MTD_NAND_TS72XX
+	bool "ts72xx NAND controller"
+	depends on ARCH_EP93XX && HAS_IOMEM
+	select MTD_NAND_PLATFORM
+	help
+	  Enables support for NAND controller on ts72xx SBCs.
+	  These only set's platform data. The real driver is gen_nand.
+
 comment "Misc"
 
 config MTD_SM_COMMON
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 917cdfb815b9..b1d5cec84519 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -23,6 +23,7 @@ omap2_nand-objs := omap2.o
 obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o
 obj-$(CONFIG_MTD_NAND_OMAP_BCH_BUILD)	+= omap_elm.o
 obj-$(CONFIG_MTD_NAND_MARVELL)		+= marvell_nand.o
+obj-$(CONFIG_MTD_NAND_TS72XX)		+= ts72xx_nand.o
 obj-$(CONFIG_MTD_NAND_PLATFORM)		+= plat_nand.o
 obj-$(CONFIG_MTD_NAND_PASEMI)		+= pasemi_nand.o
 obj-$(CONFIG_MTD_NAND_ORION)		+= orion_nand.o
diff --git a/drivers/mtd/nand/raw/ts72xx_nand.c b/drivers/mtd/nand/raw/ts72xx_nand.c
new file mode 100644
index 000000000000..1c1c06c6e71a
--- /dev/null
+++ b/drivers/mtd/nand/raw/ts72xx_nand.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Technologic Systems TS72xx NAND driver platform code
+ * Copyright (C) 2021 Nikita Shubin <nikita.shubin@maquefel.me>
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/platnand.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+
+#define TS72XX_NAND_CONTROL_ADDR_LINE	22	/* 0xN0400000 */
+#define TS72XX_NAND_BUSY_ADDR_LINE	23	/* 0xN0800000 */
+
+static void ts72xx_nand_hwcontrol(struct nand_chip *chip,
+				  int cmd, unsigned int ctrl)
+{
+	if (ctrl & NAND_CTRL_CHANGE) {
+		void __iomem *addr = chip->legacy.IO_ADDR_R;
+		unsigned char bits;
+
+		addr += (1 << TS72XX_NAND_CONTROL_ADDR_LINE);
+
+		bits = readb(addr) & ~0x07;
+		bits |= (ctrl & NAND_NCE) << 2;	/* bit 0 -> bit 2 */
+		bits |= (ctrl & NAND_CLE);	/* bit 1 -> bit 1 */
+		bits |= (ctrl & NAND_ALE) >> 2;	/* bit 2 -> bit 0 */
+
+		writeb(bits, addr);
+	}
+
+	if (cmd != NAND_CMD_NONE)
+		writeb(cmd, chip->legacy.IO_ADDR_W);
+}
+
+static int ts72xx_nand_device_ready(struct nand_chip *chip)
+{
+	void __iomem *addr = chip->legacy.IO_ADDR_R;
+
+	addr += (1 << TS72XX_NAND_BUSY_ADDR_LINE);
+
+	return !!(readb(addr) & 0x20);
+}
+
+static struct platform_nand_data ts72xx_nand_data = {
+	.chip = {
+		.nr_chips	= 1,
+		.chip_offset	= 0,
+		.chip_delay	= 15,
+	},
+	.ctrl = {
+		.cmd_ctrl	= ts72xx_nand_hwcontrol,
+		.dev_ready	= ts72xx_nand_device_ready,
+	},
+};
+
+static int __init ts72xx_nand_setup(void)
+{
+	struct device_node *np;
+	struct platform_device *pdev;
+
+	/* Multiplatform guard, only proceed on ts7250 */
+	if (!of_machine_is_compatible("technologic,ts7250"))
+		return 0;
+
+	np = of_find_compatible_node(NULL, NULL, "technologic,ts7200-nand");
+	if (!np) {
+		pr_err("%s : nand device tree node not found.\n", __func__);
+		return -EINVAL;
+	}
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev) {
+		pr_err("%s : nand device not found.\n", __func__);
+		return -EINVAL;
+	}
+
+	pdev->dev.platform_data = &ts72xx_nand_data;
+	put_device(&pdev->dev);
+	of_node_put(np);
+
+	return 0;
+}
+
+subsys_initcall(ts72xx_nand_setup);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
