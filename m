Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627CCC5CFDB
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjknbCqm7fIn5wpOhmWSdI/EG4Y7y939bs8g5Lx27pQ=; b=oxmgL7Y4aOGGGw
	aurDW+ya9VtvKNcWuMiEQGztVWDJvC6ZJ7Y2fDmLdXrT97GC5IfucAzEY5oIbddr0ln+vQDAHl19y
	U8fpNFF/o5AovVwKiPKkS6K99ROG3Xsyw7foUBSqbvj4Cp5W12oGIWEvoZZLr6NSCu36lQuH2gJU1
	U9XYWkT+Qi+T2RGiStlCnxwKB+65YY7Z37dCXHJ1PFS2obrWcWt3/6Z18DmCJbtd39Jpw1mO6huE0
	X7S0zj5THa7tNjOktPWpm201QMvz2RTZvgVT1OBireYMAXRmpU6wpbkQP8kmFTueRWW/UEX0yCuzs
	jMAn+xyRoTXqBb0WyKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6YO-0000000FxAH-1gaI;
	Wed, 12 Aug 2026 10:51:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Y3-0000000Fx2w-2EzP;
	Wed, 12 Aug 2026 10:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786531863; x=1818067863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=30kJWTW3L7X9FlTOpyXHmfQV2ZJ7dUun8mJpq/L4+VM=;
  b=2B3NmgMWR7A8wwBgd1aRRQHG+k60FEJphIziT94HxAZR0dDPMQ1QTft1
   Tj0MmX+YZtiKSFJGE3khSJdKwW9rZ4YcWhZ7GvVFB0kzeOPmhjvaO66nw
   NBfDzbJdXBThYxi0SoyDmTe9PKDFvCvG2qD5uSyoO3eWcwg5gwWprYG4f
   A7EkfatEkiiDlQOwxmXMOQSrarKwXkHxE7U889181mulC2yGxCmooq7+x
   qEfSfwoX7TutHjcvKnRMQvbP1gAACwIAEN2LwktDpqm/w3VanTRHDi65v
   MpiJr+dIghi/Thygvd5upPel1Hsuc23MYF4GOkYqUOshrxHZEMV4jpArF
   g==;
X-CSE-ConnectionGUID: T6xG7j+wQ4eL23rLSQZQNA==
X-CSE-MsgGUID: 23bYlRNPSQWn0XG49lQ0tA==
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="62324128"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Aug 2026 03:51:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 12 Aug 2026 03:51:02 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 12 Aug 2026 03:50:51 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v7 4/7] nvmem: layouts: add Microchip/SST SFDP EUI layout driver
Date: Wed, 12 Aug 2026 16:19:52 +0530
Message-ID: <20260812104955.485667-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812104955.485667-1-manikandan.m@microchip.com>
References: <20260812104955.485667-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_035109_044339_EF545D46 
X-CRM114-Status: GOOD (  26.91  )
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

Add an NVMEM layout that exposes the factory-programmed EUI-48 identifier
from the Microchip/SST vendor SFDP parameter table (e.g. SST26VF064BEUI)
as a "mac-address" cell, for use as a network MAC address. The vendor
table is located at runtime via the SFDP NVMEM device (no offset in DT),
and a read_post_process callback reverses the LSB-first bytes into
canonical MAC order. Binds to an "nvmem-layout" node with compatible
"microchip,sst26vf-sfdp-eui".

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 MAINTAINERS                              |   6 +
 drivers/nvmem/layouts/Kconfig            |  10 ++
 drivers/nvmem/layouts/Makefile           |   1 +
 drivers/nvmem/layouts/sst26vf-sfdp-eui.c | 182 +++++++++++++++++++++++
 4 files changed, 199 insertions(+)
 create mode 100644 drivers/nvmem/layouts/sst26vf-sfdp-eui.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f8253e..c0eb6c16e2c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17813,6 +17813,12 @@ F:	Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
 F:	drivers/misc/atmel-ssc.c
 F:	include/linux/atmel-ssc.h
 
+MICROCHIP SST SFDP EUI NVMEM LAYOUT DRIVER
+M:	Manikandan Muralidharan <manikandan.m@microchip.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml
+F:	drivers/nvmem/layouts/sst26vf-sfdp-eui.c
+
 Microchip Timer Counter Block (TCB) Capture Driver
 M:	Kamel Bouhara <kamel.bouhara@bootlin.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/nvmem/layouts/Kconfig b/drivers/nvmem/layouts/Kconfig
index 5e586dfebe47..855c7db530da 100644
--- a/drivers/nvmem/layouts/Kconfig
+++ b/drivers/nvmem/layouts/Kconfig
@@ -26,6 +26,16 @@ config NVMEM_LAYOUT_ONIE_TLV
 
 	  If unsure, say N.
 
+config NVMEM_LAYOUT_SST26VF_SFDP_EUI
+	tristate "Microchip/SST SFDP EUI-48 layout support"
+	help
+	  Say Y here if you want to expose the factory-programmed EUI-48
+	  identifier stored in the Microchip/SST vendor-specific SFDP parameter
+	  table (e.g. SST26VF064BEUI) as NVMEM cells, so that network drivers
+	  can use them as a MAC address.
+
+	  If unsure, say N.
+
 config NVMEM_LAYOUT_U_BOOT_ENV
 	tristate "U-Boot environment variables layout"
 	select CRC32
diff --git a/drivers/nvmem/layouts/Makefile b/drivers/nvmem/layouts/Makefile
index dd6c6c70b1a9..ab4e996075b2 100644
--- a/drivers/nvmem/layouts/Makefile
+++ b/drivers/nvmem/layouts/Makefile
@@ -6,4 +6,5 @@
 obj-$(CONFIG_NVMEM_LAYOUTS) += fixed-layout.o
 obj-$(CONFIG_NVMEM_LAYOUT_SL28_VPD) += sl28vpd.o
 obj-$(CONFIG_NVMEM_LAYOUT_ONIE_TLV) += onie-tlv.o
+obj-$(CONFIG_NVMEM_LAYOUT_SST26VF_SFDP_EUI) += sst26vf-sfdp-eui.o
 obj-$(CONFIG_NVMEM_LAYOUT_U_BOOT_ENV) += u-boot-env.o
diff --git a/drivers/nvmem/layouts/sst26vf-sfdp-eui.c b/drivers/nvmem/layouts/sst26vf-sfdp-eui.c
new file mode 100644
index 000000000000..641318d6f0af
--- /dev/null
+++ b/drivers/nvmem/layouts/sst26vf-sfdp-eui.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NVMEM layout for the factory-programmed EUI-48 identifier stored in the
+ * Microchip/SST vendor-specific SFDP parameter table (e.g. SST26VF064BEUI).
+ *
+ * The whole SFDP is exposed as a read-only NVMEM device by the SPI NOR core.
+ * This layout locates the Microchip vendor parameter table at runtime and
+ * registers the EUI-48 address as an NVMEM cell, so that a network driver can
+ * consume it as a MAC address. No offset is hardcoded in the device tree.
+ *
+ * Copyright (C) 2026 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Manikandan Muralidharan <manikandan.m@microchip.com>
+ */
+
+#include <linux/etherdevice.h>
+#include <linux/minmax.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/unaligned.h>
+#include <uapi/linux/if_ether.h>
+
+/* SFDP header and parameter header, as laid out on the flash. */
+struct sfdp_header {
+	u8 signature[4];
+	u8 minor;
+	u8 major;
+	u8 nph;
+	u8 unused;
+};
+
+struct sfdp_parameter_header {
+	u8 id_lsb;
+	u8 minor;
+	u8 major;
+	u8 length;
+	u8 parameter_table_pointer[3];
+	u8 id_msb;
+};
+
+#define SFDP_SIGNATURE			0x50444653U
+
+#define SFDP_PARAM_HEADER_ID(h)		(((h)->id_msb << 8) | (h)->id_lsb)
+#define SFDP_PARAM_HEADER_PTP(h)	get_unaligned_le24((h)->parameter_table_pointer)
+
+/* Microchip (vendor) parameter table identifier: id_msb << 8 | id_lsb. */
+#define SFDP_MCHP_VENDOR_ID		0x01bf
+
+#define SFDP_MCHP_EUI48_MARKER_OFFSET	0x60
+#define SFDP_MCHP_EUI48_MARKER		0x30
+#define SFDP_MCHP_EUI48_OFFSET		0x61
+
+static int sfdp_eui_read_post_process(void *priv, const char *id, int index,
+				      unsigned int offset, void *buf,
+				      size_t bytes)
+{
+	u8 *data = buf;
+	int i;
+
+	/* SFDP stores the address least-significant octet first; reverse it. */
+	for (i = 0; i < bytes / 2; i++)
+		swap(data[i], data[bytes - 1 - i]);
+
+	if (bytes == ETH_ALEN && !is_valid_ether_addr(buf))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int sfdp_eui_find_vendor_table(struct nvmem_device *nvmem, u32 *ptp)
+{
+	struct sfdp_parameter_header ph;
+	struct sfdp_header hdr;
+	int nph, i, ret;
+
+	ret = nvmem_device_read(nvmem, 0, sizeof(hdr), &hdr);
+	if (ret < 0)
+		return ret;
+
+	if (get_unaligned_le32(hdr.signature) != SFDP_SIGNATURE)
+		return -EINVAL;
+
+	/* The number of parameter headers (NPH) field is zero-based. */
+	nph = hdr.nph;
+
+	for (i = 0; i <= nph; i++) {
+		ret = nvmem_device_read(nvmem, sizeof(hdr) + i * sizeof(ph),
+					sizeof(ph), &ph);
+		if (ret < 0)
+			return ret;
+
+		if (SFDP_PARAM_HEADER_ID(&ph) != SFDP_MCHP_VENDOR_ID)
+			continue;
+
+		*ptp = SFDP_PARAM_HEADER_PTP(&ph);
+		return 0;
+	}
+
+	return -ENOENT;
+}
+
+static int sfdp_eui_add_cells(struct nvmem_layout *layout)
+{
+	struct nvmem_device *nvmem = layout->nvmem;
+	struct device *dev = &layout->dev;
+	struct nvmem_cell_info info = { };
+	struct device_node *layout_np;
+	u32 base = 0;
+	u8 marker;
+	int ret;
+
+	ret = sfdp_eui_find_vendor_table(nvmem, &base);
+	if (ret == -ENOENT) {
+		dev_dbg(dev, "no Microchip SFDP vendor table found\n");
+		return 0;
+	}
+	if (ret)
+		return ret;
+
+	/* The EUI-48 is present only if its marker byte is programmed. */
+	ret = nvmem_device_read(nvmem, base + SFDP_MCHP_EUI48_MARKER_OFFSET,
+				1, &marker);
+	if (ret < 0)
+		return ret;
+	if (marker != SFDP_MCHP_EUI48_MARKER) {
+		dev_dbg(dev, "EUI-48 not programmed (marker 0x%02x)\n", marker);
+		return 0;
+	}
+
+	layout_np = of_nvmem_layout_get_container(nvmem);
+	if (!layout_np)
+		return -ENOENT;
+
+	info.name = "mac-address";
+	info.offset = base + SFDP_MCHP_EUI48_OFFSET;
+	info.bytes = ETH_ALEN;
+	info.np = of_get_child_by_name(layout_np, "mac-address");
+	info.read_post_process = sfdp_eui_read_post_process;
+
+	ret = nvmem_add_one_cell(nvmem, &info);
+	if (ret)
+		of_node_put(info.np);
+	else
+		dev_dbg(dev, "exposed EUI-48 at SFDP offset 0x%x\n", info.offset);
+
+	of_node_put(layout_np);
+
+	return ret;
+}
+
+static int sfdp_eui_probe(struct nvmem_layout *layout)
+{
+	layout->add_cells = sfdp_eui_add_cells;
+
+	return nvmem_layout_register(layout);
+}
+
+static void sfdp_eui_remove(struct nvmem_layout *layout)
+{
+	nvmem_layout_unregister(layout);
+}
+
+static const struct of_device_id sfdp_eui_of_match_table[] = {
+	{ .compatible = "microchip,sst26vf-sfdp-eui" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, sfdp_eui_of_match_table);
+
+static struct nvmem_layout_driver sfdp_eui_layout = {
+	.driver = {
+		.name = "microchip-sst26vf-sfdp-eui-layout",
+		.of_match_table = sfdp_eui_of_match_table,
+	},
+	.probe = sfdp_eui_probe,
+	.remove = sfdp_eui_remove,
+};
+module_nvmem_layout_driver(sfdp_eui_layout);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Manikandan Muralidharan <manikandan.m@microchip.com>");
+MODULE_DESCRIPTION("NVMEM layout for the EUI-48 in the Microchip/SST SFDP vendor table");
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
