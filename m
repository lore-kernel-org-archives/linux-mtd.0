Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B92FC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:32:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB3C0651EB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB3C0651EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oUZg77lF7THHjE3XNLlmwm9ZGNj7IKabBe+3JGnxa9Q=; b=myFTA8O2jM/G+f0GuABvZ3mVF
	8F0kDbz57LUihc8TYinSe/On6VjRiZPNcNlnZGBiRxvX6ht4AYfoQZAaoa+qbGAeSP0tXKwHNeEOr
	QsCRj+Lg9FR0PQXm44On+jgacTfK0GGsN7/4ZbkvreN1OWypYYDQMnTj5umsR1nwzJG8iMGAwVdfX
	iGYQzokhLFaKkCGK8P4a3xTXLFlZOvEC59OyVHdrR/RA8y55NiKAvTKvmPFIEIUasPJ96yTIGMyjd
	mBQW4Cqbq6/2IgBOvcPrG+gpeNlv4+fIcOvstOg/8htojnv2TuwOI0Aym95PXWDPw/RN2n0vAXUGg
	7Ek6mvc+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9QN-00FV1j-2x; Mon, 08 Mar 2021 06:31:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9P2-00FUib-9s
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=MW/IlGjXvKYxdjWrvpcp89fbsZdJ18tbHtOTDF5EYBk=; b=Hbbam5xS9Ge2cyXbAsmAQcdTLG
 8RXn0bBAC/JKPbBVaa63DIitia2uPn6BVXrsxg7fimTyWWWqhlDw+MoKsO4APgnE84jnK8K040ZyA
 Kt+tEAwCVfHFGZdkWNVkK5C1plfGggdp5ss01UD6FSOTFYYOmSUv2DdIhGFVoVJjOn0MFJRR5ztwI
 X+lIGwfg9Ubi7bwy/yxhAuYt9zHtH/9kMwVWfZydG53UE9Je7Tj9Su/gGAHI2RUmuWVUYE2s5tBMP
 UEyZjEJdgcU9DpDq/yLdN218yb/R0xJ0csQSzdXUdoA6tmW5iUGLlsTp7ez41UGFfrjBAwFHY86gC
 kCpQznVw==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Oq-00F81V-2O
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:30:00 +0000
IronPort-SDR: zC72X+MJ7/61rDyc0R9uQ2+S8OcXRzNNfO1R3VuhSE8DG/T7TClQxZCbs84Fica5q50DXwGPK0
 ZIb0DN4NSj9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084472"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084472"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:12 -0800
IronPort-SDR: B4CF5Iefunq3yJXZu0+lDtkFaUCiArcd58Uw/Q+9JuNwnzdRe4DQ0+/+o2WXMq0wrtdAsF71cn
 84YFiiKQmbmw==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409181924"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:08 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, linux-mtd@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC PATCH 03/10 v2] drm/i915/spi: add driver for on-die spi device
Date: Mon,  8 Mar 2021 08:27:41 +0200
Message-Id: <20210308062748.208017-4-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308062748.208017-1-tomas.winkler@intel.com>
References: <20210308062748.208017-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_062953_260907_12AF9C3B 
X-CRM114-Status: GOOD (  21.15  )
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

Add the platform driver for i915 on-die spi device, exposed via mfd
framework.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---

V2:
1. Add own Kconfig and Makefile
2. Rename intel_spi_drv.c to i915_spi.c

 drivers/gpu/drm/i915/Kconfig        |   2 +
 drivers/gpu/drm/i915/Makefile       |   1 +
 drivers/gpu/drm/i915/spi/Kconfig    |  17 ++++
 drivers/gpu/drm/i915/spi/Makefile   |   7 ++
 drivers/gpu/drm/i915/spi/i915_spi.c | 116 ++++++++++++++++++++++++++++
 5 files changed, 143 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/spi/Kconfig
 create mode 100644 drivers/gpu/drm/i915/spi/Makefile
 create mode 100644 drivers/gpu/drm/i915/spi/i915_spi.c

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index abcaa8da45ac..d5062fbb6d25 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -131,6 +131,8 @@ config DRM_I915_GVT_KVMGT
 	  Choose this option if you want to enable KVMGT support for
 	  Intel GVT-g.
 
+source "drivers/gpu/drm/i915/spi/Kconfig"
+
 menu "drm/i915 Debugging"
 depends on DRM_I915
 depends on EXPERT
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 7f504475fde7..9377a593364f 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -297,6 +297,7 @@ endif
 
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
+obj-$(CONFIG_DRM_I915_SPI) += spi/
 
 # header test
 
diff --git a/drivers/gpu/drm/i915/spi/Kconfig b/drivers/gpu/drm/i915/spi/Kconfig
new file mode 100644
index 000000000000..7e6b82f8a59b
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2021, Intel Corporation. All rights reserved.
+#
+config DRM_I915_SPI
+	tristate "I915 SPI driver for discrete devices"
+	select MTD
+	select MTD_PARTITIONED_MASTER
+	depends on DRM_I915
+	help
+	  I915 SPI driver for i915 discrete devices.
+
+	  This enables support for the SPI devices present on some
+	  discrete i915 cards. This driver makes possible to
+	  flush firmware during manufacturing process directly from
+	  the operating system, and can be used by device health check
+	  applications.
+
diff --git a/drivers/gpu/drm/i915/spi/Makefile b/drivers/gpu/drm/i915/spi/Makefile
new file mode 100644
index 000000000000..0a2dab0aba03
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021, Intel Corporation. All rights reserved.
+#
+# Makefile - I915 SPI driver
+
+obj-$(CONFIG_DRM_I915_SPI) +=  i915_spi.o
diff --git a/drivers/gpu/drm/i915/spi/i915_spi.c b/drivers/gpu/drm/i915/spi/i915_spi.c
new file mode 100644
index 000000000000..23261f35b71f
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/i915_spi.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2021, Intel Corporation. All rights reserved.
+ */
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/io.h>
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <spi/intel_spi.h>
+
+struct i915_spi {
+	void __iomem *base;
+	size_t size;
+	unsigned int nregions;
+	struct {
+		const char *name;
+		u8 id;
+		u64 offset;
+		u64 size;
+	} regions[];
+};
+
+static int i915_spi_probe(struct platform_device *platdev)
+{
+	struct resource *bar;
+	struct device *device;
+	struct i915_spi *spi;
+	struct i915_spi_region *regions;
+	unsigned int nregions;
+	unsigned int i, n;
+	size_t size;
+	char *name;
+	size_t name_size;
+
+	device = &platdev->dev;
+
+	regions = dev_get_platdata(&platdev->dev);
+	if (!regions) {
+		dev_err(device, "no regions defined\n");
+		return -ENODEV;
+	}
+
+	/* count available regions */
+	for (nregions = 0, i = 0; i < I915_SPI_REGIONS; i++) {
+		if (regions[i].name)
+			nregions++;
+	}
+
+	if (!nregions) {
+		dev_err(device, "no regions defined\n");
+		return -ENODEV;
+	}
+
+	size = sizeof(*spi) + sizeof(spi->regions[0]) * nregions;
+	spi = devm_kzalloc(device, size, GFP_KERNEL);
+	if (!spi)
+		return -ENOMEM;
+
+	spi->nregions = nregions;
+	for (n = 0, i = 0; i < I915_SPI_REGIONS; i++) {
+		if (regions[i].name) {
+			name_size = strlen(dev_name(&platdev->dev)) +
+				    strlen(regions[i].name) + 2; /* for point */
+			name = devm_kzalloc(device, name_size, GFP_KERNEL);
+			if (!name)
+				continue;
+			snprintf(name, name_size, "%s.%s",
+				 dev_name(&platdev->dev), regions[i].name);
+			spi->regions[n].name = name;
+			spi->regions[n].id = i;
+			n++;
+		}
+	}
+
+	bar = platform_get_resource(platdev, IORESOURCE_MEM, 0);
+	if (!bar)
+		return -ENODEV;
+
+	spi->base = devm_ioremap_resource(device, bar);
+	if (IS_ERR(spi->base)) {
+		dev_err(device, "mmio not mapped\n");
+		return PTR_ERR(spi->base);
+	}
+
+	platform_set_drvdata(platdev, spi);
+
+	dev_dbg(device, "i915-spi is bound\n");
+
+	return 0;
+}
+
+static int i915_spi_remove(struct platform_device *platdev)
+{
+	platform_set_drvdata(platdev, NULL);
+
+	return 0;
+}
+
+MODULE_ALIAS("platform:i915-spi");
+static struct platform_driver i915_spi_driver = {
+	.probe  = i915_spi_probe,
+	.remove = i915_spi_remove,
+	.driver = {
+		.name = "i915-spi",
+	},
+};
+
+module_platform_driver(i915_spi_driver);
+
+MODULE_LICENSE("GPL and additional rights");
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION("Intel DGFX SPI driver");
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
