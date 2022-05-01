Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE098C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 18:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jAUqBDc4eVs7YIFD88n9uYxeDHECi8LPh4K7L9YKmwg=; b=o88Mt/9Ih/peTy
	m9XBfaSdiwyEbW3vMM1HWijvUP2tjdAe7tV3To50SAF4W+Ip2aAPwKy5tWseYhTIYz/dGmj1Z5nqY
	vOHx/xHsS5uTSTE7UiNWiqm3C/z7+MRAyDJsrLMAvwauOYol0mGYUlOjL2qL0h+Edo4doMCiMlSwl
	RXkY6xxMmbrRhZrtLCCeu2Yid+kYIBOX3BDYXgX6+UhPfg3Du7jY+BLUnKGMmvqe6q+8QV5KMXm12
	qYuLj0JUgAcmhl+Kkm7j/h6judOboFMyJTe8HoA6N0cEC0B5aKkutlbfJStEnlrY18rqXzV+2dYVI
	JQQwaK+O473QbvvH6ESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlEjA-00GkXQ-JO; Sun, 01 May 2022 18:55:28 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlEj6-00GkWu-NK
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 18:55:27 +0000
X-IronPort-AV: E=Sophos;i="5.91,190,1647270000"; d="scan'208";a="118526525"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 02 May 2022 03:55:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2ED124006181;
 Mon,  2 May 2022 03:55:14 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Date: Sun,  1 May 2022 19:55:12 +0100
Message-Id: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_115524_923272_D013A27D 
X-CRM114-Status: GOOD (  18.86  )
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

Add support for Renesas AT25QL128A serial nor flash.
Details of flash chip can be found here [1]

[1] https://www.dialog-semiconductor.com/sites/default/files/2022-04/DS-AT25QL128A-129F-022022.pdf

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Hi All,
 AT25QL128A serial nor flash is connected to RZ/G2UL SMARC EVK.
But with the current mtd support in mainline, I get the below error
[    3.928906] spi-nor spi1.0: unrecognized JEDEC id bytes: 1f 42 18 1f 42 18
[    3.937312] spi-nor: probe of spi1.0 failed with error -2

Then, I created a patch and the issue gone, It can detect the flash
[    3.937168] spi-nor spi1.0: at25ql128a (16384 Kbytes)
[    3.942902] 2 fixed-partitions partitions found on MTD device spi1.0
[    3.949459] Creating 2 MTD partitions on "spi1.0":
[    3.957540] 0x000000000000-0x000000200000 : "boot"
[    3.973740] 0x000000200000-0x000001000000 : "user"


Able to do read/write/format the partition with this patch.
So please provide your feedback on this patch.

&sbc {
	pinctrl-0 = <&qspi0_pins>;
	pinctrl-names = "default";
	status = "okay";

	flash@0 {
		compatible = "jedec,spi-nor";
		reg = <0>;
		spi-max-frequency = <50000000>;
		spi-tx-bus-width = <1>;
		spi-rx-bus-width = <4>;

		spi-cpol;
		spi-cpha;
		m25p,fast-read;

		partitions {
			compatible = "fixed-partitions";
			#address-cells = <1>;
			#size-cells = <1>;

			boot@0 {
				reg = <0x00000000 0x200000>;
				read-only;
			};
			user@200000 {
				reg = <0x200000 0xE00000>;
			};
		};
	};
};
---
 drivers/mtd/spi-nor/Makefile  |  1 +
 drivers/mtd/spi-nor/core.c    |  1 +
 drivers/mtd/spi-nor/core.h    |  1 +
 drivers/mtd/spi-nor/renesas.c | 57 +++++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/renesas.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 6b904e439372..2c2fce8e6132 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -12,6 +12,7 @@ spi-nor-objs			+= intel.o
 spi-nor-objs			+= issi.o
 spi-nor-objs			+= macronix.o
 spi-nor-objs			+= micron-st.o
+spi-nor-objs			+= renesas.o
 spi-nor-objs			+= spansion.o
 spi-nor-objs			+= sst.o
 spi-nor-objs			+= winbond.o
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b4f141ad9c9c..ba9f222da00b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1621,6 +1621,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_issi,
 	&spi_nor_macronix,
 	&spi_nor_micron,
+	&spi_nor_renesas,
 	&spi_nor_st,
 	&spi_nor_spansion,
 	&spi_nor_sst,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index b7fd760e3b47..3d2e39329079 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -511,6 +511,7 @@ extern const struct spi_nor_manufacturer spi_nor_intel;
 extern const struct spi_nor_manufacturer spi_nor_issi;
 extern const struct spi_nor_manufacturer spi_nor_macronix;
 extern const struct spi_nor_manufacturer spi_nor_micron;
+extern const struct spi_nor_manufacturer spi_nor_renesas;
 extern const struct spi_nor_manufacturer spi_nor_st;
 extern const struct spi_nor_manufacturer spi_nor_spansion;
 extern const struct spi_nor_manufacturer spi_nor_sst;
diff --git a/drivers/mtd/spi-nor/renesas.c b/drivers/mtd/spi-nor/renesas.c
new file mode 100644
index 000000000000..091542c8c088
--- /dev/null
+++ b/drivers/mtd/spi-nor/renesas.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info renesas_nor_parts[] = {
+	{ "at25ql128a", INFO(0x1f4218, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+};
+
+/**
+ * renesas_nor_set_4byte_addr_mode() - Set 4-byte address mode for Renesas
+ * flashes.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
+ *		address mode.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int renesas_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_set_4byte_addr_mode(nor, enable);
+	if (ret)
+		return ret;
+
+	return spi_nor_write_disable(nor);
+}
+
+static void renesas_nor_default_init(struct spi_nor *nor)
+{
+	nor->flags |= SNOR_F_HAS_LOCK;
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+	nor->params->quad_enable = NULL;
+	nor->params->set_4byte_addr_mode = renesas_nor_set_4byte_addr_mode;
+}
+
+static const struct spi_nor_fixups renesas_nor_fixups = {
+	.default_init = renesas_nor_default_init,
+};
+
+const struct spi_nor_manufacturer spi_nor_renesas = {
+	.name = "renesas",
+	.parts = renesas_nor_parts,
+	.nparts = ARRAY_SIZE(renesas_nor_parts),
+	.fixups = &renesas_nor_fixups,
+};
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
