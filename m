Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EA7C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C951264DA1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C951264DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S9UuOkhS13/QQyG4auwjlTtNKNeXzLH1m9n1+p52E6c=; b=gK5RaxEO7RetQqsKbS5efVFPC
	5ShFnz+5QQX+0L5trFwBrr0oG6dJLTSmEBZM1NIqtO933RUKu3HCIPdCk9zU6ek8i+9jH0vINKLDz
	BzT4HJCG0LO4xwIueNtjAlsTB918s7inv9jAiYLYSeeMci5be2NoM/UvSQ1RwQK2wykk3ykqJ5yj6
	1CieLKj4W/Psl8LuM2RVQ9EmdXR9v3YIg63OQpXpCnhjxBlXPRlIddEVmeAaeT7trRvqyOuHIUa5B
	pKMME0sIZ1MsPo1BGu1kBYhdEVzLbJ/HFMlNHOSvH6gg5FQ5E77mjDTePaEjVMY9kL4AeIxX/DC1A
	AbleWASAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC4xM-0005zt-Ae; Tue, 16 Feb 2021 18:20:16 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC4x8-0005uH-V0
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 18:20:05 +0000
IronPort-SDR: eslIQ0gZKZShIHqqb2Ivo26mB1GLRpuQNHV5pYsaGfVG6r7c5d1l4NT3/MhxkgZdUgNi4+LtYh
 tBtWX7XKunrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="202169402"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="202169402"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:20:00 -0800
IronPort-SDR: 5BrQ2ZVWZdJ0NteuRoXK7J04ErvcYqEn4+l3KNFXUA+xpeokt7oIdSeXnRdjzgsLkv/sn+efeJ
 0uDHt7ZK5s/g==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399609099"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:19:57 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC PATCH 3/9] drm/i915/spi: add driver for on-die spi device
Date: Tue, 16 Feb 2021 20:19:19 +0200
Message-Id: <20210216181925.650082-4-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216181925.650082-1-tomas.winkler@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_132003_312971_864EEC20 
X-CRM114-Status: GOOD (  18.45  )
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
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-mtd@lists.infradead.org, Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>
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
 drivers/gpu/drm/i915/Kconfig             |   2 +
 drivers/gpu/drm/i915/Makefile            |   3 +
 drivers/gpu/drm/i915/spi/intel_spi_drv.c | 116 +++++++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi_drv.c

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index abcaa8da45ac..13c870e5878e 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -27,6 +27,8 @@ config DRM_I915
 	select CEC_CORE if CEC_NOTIFIER
 	select VMAP_PFN
 	select MFD_CORE
+	select MTD
+	select MTD_PARTITIONED_MASTER
 	help
 	  Choose this option if you have a system that has "Intel Graphics
 	  Media Accelerator" or "HD Graphics" integrated graphics,
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 7fa9120feb8d..f209cd541eec 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -299,6 +299,9 @@ endif
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
 
+obj-m += i915_spi.o
+i915_spi-y := spi/intel_spi_drv.o
+
 # header test
 
 # exclude some broken headers from the test coverage
diff --git a/drivers/gpu/drm/i915/spi/intel_spi_drv.c b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
new file mode 100644
index 000000000000..23261f35b71f
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
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
