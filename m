Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBC3ECAAA3
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 21:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57DgP1Tb6Cf1x/xiieepRVnDBzJEkgtKNEemU8EQ63A=; b=Nd7loa8ajCtct5
	Pe/RdpYWN5daiPUbZd3rkNY+0gKV4Dm46cRnPD3gT5G37I3qMS+iM+uW2BJw2VIP7R1RGuDpf7flz
	dgOpPUUAGhKfiKhQ+rZgz4096SMkoSLSJXo0PDQVBedZ7PCK3J4jsxLrRZPe9pbAhKMTImj0qdbcU
	+KgZmfb8PC4Zq4k4pe7lPLQEC8AJs/J7b+BMIuFe7VmFpk7F2Ot7+kjLGtKpjjKcGgsowc7lmuKOH
	KrVMfAu/WQH5DtWALTN801jGlv1wwxDWE8q94y9tfyqrfmr58bfrDGQQx5jRsHyY6QmrGMk56IVTU
	oN22IOS53XOMLf7oGbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKlX-003bUI-Oc; Thu, 25 Aug 2022 21:51:56 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKea-003XUm-Fk; Thu, 25 Aug 2022 21:44:47 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E59DC8C9D;
	Thu, 25 Aug 2022 23:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661463881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVSzhN6KKCFPXc5996fr2hSQeP6CmBkdoV2ZMR9sMMs=;
	b=2J5leXoMQ6nsA0A4QIH3vU0VEajaUnRKGXObJv1yXLIG9mhbXD2JylSF+fnXOgnTtErOC2
	oL+ZYrmqxFArzTdHsHZCh0+DRfAVHtg7SLREm/2kihNCy8Z1SJeartw8Qi/q6ptFi3aa6C
	YXvx4NhkjNmSoRjYGrCqt02NhlktHzmJTknT5ebu7LNuFcwOcAYt7kAXB+YUhBJzwFCbFm
	TcBtEMwUwshXVCvl6hGQamHcAvUVpwcB0AzW0ItLm8KmyiZuf4kOfMJcWqgrbnIsncoOfB
	w97ktSLP2zWqShZ1yLZnOrgnPZEnU7QrZFdRGO8WugiAeWs3r99uS3Q1WGKHdw==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v1 10/14] nvmem: layouts: add sl28vpd layout
Date: Thu, 25 Aug 2022 23:44:19 +0200
Message-Id: <20220825214423.903672-11-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825214423.903672-1-michael@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_144444_740263_E6EDC63C 
X-CRM114-Status: GOOD (  21.10  )
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

This layout applies to the VPD of the Kontron sl28 boards. The VPD only
contains a base MAC address. Therefore, we have to add an individual
offset to it. This is done by taking the second argument of the nvmem
phandle into account. Also this let us checking the VPD version and the
checksum.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/nvmem/layouts/Kconfig   |   9 ++
 drivers/nvmem/layouts/Makefile  |   2 +
 drivers/nvmem/layouts/sl28vpd.c | 144 ++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+)
 create mode 100644 drivers/nvmem/layouts/sl28vpd.c

diff --git a/drivers/nvmem/layouts/Kconfig b/drivers/nvmem/layouts/Kconfig
index 9ad3911d1605..75082f6b471d 100644
--- a/drivers/nvmem/layouts/Kconfig
+++ b/drivers/nvmem/layouts/Kconfig
@@ -2,4 +2,13 @@
 
 menu "Layout Types"
 
+config NVMEM_LAYOUT_SL28_VPD
+	bool "Kontron sl28 VPD layout support"
+	select CRC8
+	help
+	  Say Y here if you want to support the VPD layout of the Kontron
+	  SMARC-sAL28 boards.
+
+	  If unsure, say N.
+
 endmenu
diff --git a/drivers/nvmem/layouts/Makefile b/drivers/nvmem/layouts/Makefile
index 6fdb3c60a4fa..fc617b9e87d0 100644
--- a/drivers/nvmem/layouts/Makefile
+++ b/drivers/nvmem/layouts/Makefile
@@ -2,3 +2,5 @@
 #
 # Makefile for nvmem layouts.
 #
+
+obj-$(CONFIG_NVMEM_LAYOUT_SL28_VPD) += sl28vpd.o
diff --git a/drivers/nvmem/layouts/sl28vpd.c b/drivers/nvmem/layouts/sl28vpd.c
new file mode 100644
index 000000000000..e6ec673aa58a
--- /dev/null
+++ b/drivers/nvmem/layouts/sl28vpd.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/crc8.h>
+#include <linux/etherdevice.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <uapi/linux/if_ether.h>
+
+#define SL28VPD_MAGIC 'V'
+
+struct sl28vpd_header {
+	u8 magic;
+	u8 version;
+} __packed;
+
+struct sl28vpd_v1 {
+	struct sl28vpd_header header;
+	char serial_number[15];
+	u8 base_mac_address[ETH_ALEN];
+	u8 crc8;
+} __packed;
+
+static int sl28vpd_mac_address_pp(void *priv, const char *id, int index,
+				  unsigned int offset, void *buf,
+				  size_t bytes)
+{
+	if (bytes != ETH_ALEN)
+		return -EINVAL;
+
+	if (index < 0)
+		return -EINVAL;
+
+	if (!is_valid_ether_addr(buf))
+		return -EINVAL;
+
+	eth_addr_add(buf, index);
+
+	return 0;
+}
+
+static const struct nvmem_cell_info sl28vpd_v1_entries[] = {
+	{
+		.name = "serial-number",
+		.offset = offsetof(struct sl28vpd_v1, serial_number),
+		.bytes = sizeof_field(struct sl28vpd_v1, serial_number),
+	},
+	{
+		.name = "base-mac-address",
+		.offset = offsetof(struct sl28vpd_v1, base_mac_address),
+		.bytes = sizeof_field(struct sl28vpd_v1, base_mac_address),
+		.post_process = sl28vpd_mac_address_pp,
+	},
+};
+
+static int sl28vpd_v1_check_crc(struct device *dev, struct nvmem_device *nvmem)
+{
+	struct sl28vpd_v1 data_v1;
+	u8 table[CRC8_TABLE_SIZE];
+	int ret;
+	u8 crc;
+
+	crc8_populate_msb(table, 0x07);
+
+	ret = nvmem_device_read(nvmem, 0, sizeof(data_v1), &data_v1);
+	if (ret < 0)
+		return ret;
+	else if (ret != sizeof(data_v1))
+		return -EIO;
+
+	crc = crc8(table, (void *)&data_v1, sizeof(data_v1) - 1, 0);
+
+	if (crc != data_v1.crc8) {
+		dev_err(dev,
+			"Checksum is invalid (got %02x, expected %02x).\n",
+			crc, data_v1.crc8);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sl28vpd_add_cells(struct device *dev, struct nvmem_device *nvmem,
+			     struct nvmem_layout *layout)
+{
+	const struct nvmem_cell_info *pinfo;
+	struct nvmem_cell_info info = {0};
+	struct sl28vpd_header hdr;
+	int ret, i;
+
+	/* check header */
+	ret = nvmem_device_read(nvmem, 0, sizeof(hdr), &hdr);
+	if (ret < 0)
+		return ret;
+	else if (ret != sizeof(hdr))
+		return -EIO;
+
+	if (hdr.magic != SL28VPD_MAGIC) {
+		dev_err(dev, "Invalid magic value (%02x)\n", hdr.magic);
+		return -EINVAL;
+	}
+
+	if (hdr.version != 1) {
+		dev_err(dev, "Version %d is unsupported.\n", hdr.version);
+		return -EINVAL;
+	}
+
+	ret = sl28vpd_v1_check_crc(dev, nvmem);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(sl28vpd_v1_entries); i++) {
+		pinfo = &sl28vpd_v1_entries[i];
+
+		info.name = pinfo->name;
+		info.offset = pinfo->offset;
+		info.bytes = pinfo->bytes;
+		info.post_process = pinfo->post_process;
+		info.np = of_get_child_by_name(dev->of_node, pinfo->name);
+
+		ret = nvmem_add_one_cell(nvmem, &info);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id sl28vpd_of_match_table[] = {
+	{ .compatible = "kontron,sl28-vpd" },
+	{},
+};
+
+struct nvmem_layout sl28vpd_layout = {
+	.name = "sl28-vpd",
+	.of_match_table = sl28vpd_of_match_table,
+	.add_cells = sl28vpd_add_cells,
+};
+
+static int __init sl28vpd_init(void)
+{
+	return nvmem_register_layout(&sl28vpd_layout);
+}
+subsys_initcall(sl28vpd_init);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
