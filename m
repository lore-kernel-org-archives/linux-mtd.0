Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FA0C53200
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 04:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOveHC3aD2IZtJOZ2TYjsYg6lIMdsJ8C7Uanh8SnTko=; b=u+662ZR4tbzzO7
	bh87F90gudgz8bk3PfuYu1XOgMfTJgJKBV0E+LLKvlTqOO6nooVTp39la5ZYbz7Mp1FRZEljBOgGq
	v2n979wSebDDSZnLsXO1WdAJFnSGt/498v+BkFiR2cnukXAYdZLlTjPUQNN/J0ZPs2hpYIjR0D4OS
	/qgY0kD5MXGCb7tfPryJk3nzeFiKZQa4JzfWG0XGvdyAAaJeOFYV7nsGfjguBraZ4l/eQjRVRjPyK
	W64YR4zGJqvXd4oNZyQzjuH858++G52Ediu33iUgV1S6PmLVOv7QWdRgwZmMpMx0FfHuvlRS7aP4B
	VKVzu9/58b5RyOD4fq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovwy-00000006pe2-2qW7;
	Wed, 29 Jul 2026 04:31:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovwu-00000006pbB-3aYD;
	Wed, 29 Jul 2026 04:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785299483; x=1816835483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ylNmFZqCI2kgHG49ubb9zdoxRHTYw3l7vx/ZozMMP4=;
  b=fRLdv9OoP6GamsGDGKahzbWKbkJiMUqwBCFHAUwwt7x5H0kdFj3ZJnzU
   K8JBPSn6gOBnji2NoGQFZAt5zFGom3ZETtr96i/MYeovRw/M4Dg4qgN6i
   lnap2ccE1lu8m4Coqnk0AL4NTwr+sSB6PFRaTXBKm4Kf1xHDfzEhoS1do
   un1lv3nt6/KmWqgg4x5ny/hbHb7sc+++r75XZDqAzPU464m6FEW9fk9/u
   qEn5QFLq2mhjV3MgLmdDIT8xtGt16UOqeb+jk9SgEZU9nr9SAjySVfXiT
   xk65N/i1YYcb+dJ1Br6qLG3aLI2WWhRGnGTxd3TIyp978WvgByORWdz3l
   Q==;
X-CSE-ConnectionGUID: w5AlHoXiT3mQ71s19E8N7g==
X-CSE-MsgGUID: 4dBMshAoSiKzmP+bF891eg==
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="292693740"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jul 2026 21:31:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 28 Jul 2026 21:31:19 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 28 Jul 2026 21:31:11 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v6 4/7] nvmem: layouts: add Microchip/SST SFDP EUI layout driver
Date: Wed, 29 Jul 2026 10:00:23 +0530
Message-ID: <20260729043026.1811147-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729043026.1811147-1-manikandan.m@microchip.com>
References: <20260729043026.1811147-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_213120_962095_57126C66 
X-CRM114-Status: GOOD (  26.76  )
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
index 2f9472c1a090..dc7a141a046b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17816,6 +17816,12 @@ F:	Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
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
index 4940c9db0665..b99eac1f63f2 100644
--- a/drivers/nvmem/layouts/Makefile
+++ b/drivers/nvmem/layouts/Makefile
@@ -5,4 +5,5 @@
 
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
