Return-Path: <SRS0=mbSa=ZF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FB3C432C3
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2019 17:16:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD56206DC
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2019 17:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U4vLaTEP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD56206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mfHpo1GxKiwy0+DiIp6HMkJnDY//hwq5M4HwKCE/E8=; b=U4vLaTEPLqUTCC
	LKTLrJAN8ALQB4LpLn4/sRZLLUDWi7pBZ28/p5QAUbKZ5BHCi7cMo+qbB8KZGptGrfrt3UnXTuVaI
	lGR3tHzG4QX97iyEUViTambmum5xVGBFsxA6nk96S7vPt8wkrmLry8hMXpSe6wk8qlXhZI6MZR7lu
	Ab6fXDoHq4lA1n5bqWiotBcmNkM1MtxEISaXKQ1Xml0vwXNqSBgUfFJWCSmN6AB3GnykJOuKqYd1d
	N7B+qv8q2Dp98uw/Oiw3MEUwDYZB1+PjsUtujqCn3n5Cwq2tf/keHiC72NAc4sYauy0VxDA2P5xWM
	VaLY4Zrnx3G97K+weopw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUwFi-0002Kn-6Z; Wed, 13 Nov 2019 17:16:22 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUwEk-0001SL-JM
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2019 17:15:26 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B183EE000A;
 Wed, 13 Nov 2019 17:15:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v4 4/4] mtd: Add driver for concatenating devices
Date: Wed, 13 Nov 2019 18:15:05 +0100
Message-Id: <20191113171505.26128-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113171505.26128-1-miquel.raynal@bootlin.com>
References: <20191113171505.26128-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_091522_912836_3DB23B8D 
X-CRM114-Status: GOOD (  19.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bernhard Frauendienst <kernel@nospam.obeliks.de>

Some MTD drivers like physmap variants have support for concatenating
multiple MTD devices, but there is no generic way to define such a
concatenated device from within the device tree.

This is useful for boards where memory range has been extended with
the use of multiple flash chips as memory banks of a single MTD
device, with partitions spanning chip borders.

Add a driver for creating virtual mtd-concat devices. They must have
the "mtd-concat" compatible, and define a list of 'devices' to
concatenate, ie:

        flash {
                compatible = "mtd-concat";
                devices = <&flash0 &flash1>;

                partitions {
                        ...
                };
        };

Signed-off-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
[<miquel.raynal@bootlin.com>:
Reword commit message a bit.
Use the word 'virtual' instead of 'composite'.
Do not probe the virtual device last: SPI is after MTD anyway.
Change the driver's location.
Update the driver logic and coding style.]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/Kconfig           |   8 +++
 drivers/mtd/Makefile          |   1 +
 drivers/mtd/mtd_virt_concat.c | 132 ++++++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/mtd/mtd_virt_concat.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 79a8ff542883..3e1e55e7158f 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -276,6 +276,14 @@ config MTD_PARTITIONED_MASTER
 	  the parent of the partition device be the master device, rather than
 	  what lies behind the master.
 
+config MTD_VIRT_CONCAT
+	tristate "Virtual concatenated MTD devices"
+	help
+	  This driver allows creation of a virtual MTD device, which
+	  concatenates multiple physical MTD devices into a single one.
+	  This is useful to create partitions bigger than the underlying
+	  physical chips by allowing cross-chip boundaries.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 58fc327a5276..c7ee13368a66 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_SSFDC)		+= ssfdc.o
 obj-$(CONFIG_SM_FTL)		+= sm_ftl.o
 obj-$(CONFIG_MTD_OOPS)		+= mtdoops.o
 obj-$(CONFIG_MTD_SWAP)		+= mtdswap.o
+obj-$(CONFIG_MTD_VIRT_CONCAT)	+= mtd_virt_concat.o
 
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
new file mode 100644
index 000000000000..d184c58f7e09
--- /dev/null
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Virtual concat MTD device driver
+ *
+ * Copyright (C) 2018 Bernhard Frauendienst
+ * Author: Bernhard Frauendienst <kernel@nospam.obeliks.de>
+ */
+
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/mtd/concat.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+
+/**
+ * struct mtd_virt_concat - platform device driver data.
+ * @vmtd: Virtual mtd_concat device
+ * @count: Number of physical underlaying devices in @devices
+ * @devices: Array of the physical devices used
+ */
+struct mtd_virt_concat {
+	struct mtd_info	*vmtd;
+	unsigned int count;
+	struct mtd_info	**devices;
+};
+
+static void mtd_virt_concat_put_devices(struct mtd_virt_concat *concat)
+{
+	int i;
+
+	for (i = 0; i < concat->count; i++)
+		put_mtd_device(concat->devices[i]);
+}
+
+static int mtd_virt_concat_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct mtd_virt_concat *concat;
+	struct of_phandle_iterator it;
+	struct mtd_info *mtd;
+	int ret, count;
+
+	count = of_count_phandle_with_args(node, "devices", NULL);
+	if (count < 2) {
+		dev_err(dev, "minimum 2 devices, given: %d\n", count);
+		return -EINVAL;
+	}
+
+	concat = devm_kzalloc(dev, sizeof(*concat), GFP_KERNEL);
+	if (!concat)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, concat);
+
+	concat->devices = devm_kcalloc(dev, count, sizeof(*concat->devices),
+				       GFP_KERNEL);
+	if (!concat->devices)
+		return -ENOMEM;
+
+	/* Aggregate the physical devices */
+	of_for_each_phandle(&it, ret, node, "devices", NULL, 0) {
+		mtd = get_mtd_device_by_node(it.node);
+		if (IS_ERR(mtd)) {
+			ret = -EPROBE_DEFER;
+			goto put_mtd_devices;
+		}
+
+		concat->devices[concat->count++] = mtd;
+	}
+
+	/* Create the virtual device */
+	concat->vmtd = mtd_concat_create(concat->devices, concat->count,
+					 dev_name(dev));
+	if (!concat->vmtd) {
+		ret = -ENXIO;
+		goto put_mtd_devices;
+	}
+
+	concat->vmtd->dev.parent = dev;
+	mtd_set_of_node(concat->vmtd, node);
+
+	/* Register the platform device */
+	ret = mtd_device_register(concat->vmtd, NULL, 0);
+	if (ret)
+		goto destroy_concat;
+
+	return 0;
+
+destroy_concat:
+	mtd_concat_destroy(concat->vmtd);
+put_mtd_devices:
+	mtd_virt_concat_put_devices(concat);
+
+	return ret;
+}
+
+static int mtd_virt_concat_remove(struct platform_device *pdev)
+{
+	struct mtd_virt_concat *concat = platform_get_drvdata(pdev);
+
+	mtd_device_unregister(concat->vmtd);
+	mtd_concat_destroy(concat->vmtd);
+	mtd_virt_concat_put_devices(concat);
+
+	return 0;
+}
+
+static const struct of_device_id mtd_virt_concat_of_match[] = {
+	{
+		.compatible = "mtd-concat",
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtd_virt_concat_of_match);
+
+static struct platform_driver mtd_virt_concat_driver = {
+	.probe = mtd_virt_concat_probe,
+	.remove = mtd_virt_concat_remove,
+	.driver	 = {
+		.name   = "mtd-virt-concat",
+		.of_match_table = mtd_virt_concat_of_match,
+	},
+};
+module_platform_driver(mtd_virt_concat_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Bernhard Frauendienst <kernel@nospam.obeliks.de>");
+MODULE_DESCRIPTION("Virtual concat MTD device driver");
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
