Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26220C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:30:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CDF3651F7
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CDF3651F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KaYEnUSpSy8CluOtL+TqN93+LszHNforFAXvwihx7Lg=; b=b7irF+KjUT4xMGd5gPEysrdSa
	aYGliPjYTOOZ4C6HLbGGL/2jSsWadDGE528e4MPoNTsidjGHc9881rZv9U6/AJCRHnh4ijAUUsv/y
	Rv2Zf/ocKc0a+NqAKg2tbQ0x7dWT5g5mj6fe/2R7XQdBlXTI32ua+BDRSTii9HeFam1u7PxOpt9+g
	3po1WckbaqqJKQ0TZvI3iyWhSvLQbH2ivWH1XJbaEWQ1m0+CBvL1vdL7aglDl3VUXg9IZFOS32jep
	ygC8018T90n4HTRyZza7BTK0LlRwy5w5UrIavWuB+JKx6J1542SC1HxV88/c3cZCBqC4DtZg0NCJZ
	TT82Gx0Rw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9Oy-00FUh4-3T; Mon, 08 Mar 2021 06:30:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Og-00FUdk-G8
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Kng1q8kdpvviUNYlklWp7FBeDZZKsbuAujQSOzAvzKQ=; b=dI1KzxUBByVB0/id1BoveTOEmt
 IHurqJxmiE31k5t1g0wiPut34AWn1fdBMp7lWQBBmQLSZb0KdYpYJuyz5/ecnR4qLN+tOeYbZ4VqO
 tS+tXPn5sgxic7i5gUQhCvzuazQ6cHwXBPnW0PAiVP45iSgeyUjYHemFOU2/ylGQlD8zMKVD9uLTE
 vITKYPQT8Lh2uWefRAG5HdHxcrUOrm4gKucXMZHpD/tFO95OxYBRSjNWNJORdAzGi22dlLNqnHQKF
 wLRz1LY3VUmC4lR1JjUYeIp19EAxKByTGzXaeZ8VA6K2eu/Xujvmm67m4y3TsDEqQri0dHvdjxVTr
 zSn81NpQ==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9OO-00F81V-9i
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:29:34 +0000
IronPort-SDR: vabXTyoUEAbXXfNvNpJkJk34DImfCSe1cwUV0EFUUdydW2T0Gdkd6YdhsvL7AY4v2n6pVf+hff
 pf1OGL8tGQ+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084463"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084463"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:05 -0800
IronPort-SDR: KQs3aCQlzK1iwXW7swPP7kUMANTwB3lBtsP2SOeF0qtbiUruJB7WyBc+sjQoU57nNRL0wLbxTR
 I6r34H/k8m2A==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409181902"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:01 -0800
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
Subject: [RFC PATCH 01/10 v2] drm/i915/spi: add spi device for discrete
 graphics
Date: Mon,  8 Mar 2021 08:27:39 +0200
Message-Id: <20210308062748.208017-2-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308062748.208017-1-tomas.winkler@intel.com>
References: <20210308062748.208017-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_062927_898921_0D3BF38D 
X-CRM114-Status: GOOD (  20.44  )
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

Enable access to internal spi on descrete devices via a child device.
The spi child device is exposed via MFD framework.


Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com> # v3
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
V2:
1. Fix header include guards name to match the file name
2. Drop intel_spi_fini() it was noop

 drivers/gpu/drm/i915/Kconfig         |  1 +
 drivers/gpu/drm/i915/Makefile        |  3 +++
 drivers/gpu/drm/i915/i915_drv.c      |  7 +++++
 drivers/gpu/drm/i915/i915_drv.h      |  4 +++
 drivers/gpu/drm/i915/i915_reg.h      |  1 +
 drivers/gpu/drm/i915/spi/intel_spi.c | 40 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/spi/intel_spi.h | 17 ++++++++++++
 7 files changed, 73 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.c
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.h

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 1e1cb245fca7..abcaa8da45ac 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -26,6 +26,7 @@ config DRM_I915
 	select SND_HDA_I915 if SND_HDA_CORE
 	select CEC_CORE if CEC_NOTIFIER
 	select VMAP_PFN
+	select MFD_CORE
 	help
 	  Choose this option if you have a system that has "Intel Graphics
 	  Media Accelerator" or "HD Graphics" integrated graphics,
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index bc6138880c67..7f504475fde7 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -190,6 +190,9 @@ i915-y += gt/uc/intel_uc.o \
 	  gt/uc/intel_huc_debugfs.o \
 	  gt/uc/intel_huc_fw.o
 
+# graphics spi device (DGFX) support
+i915-y += spi/intel_spi.o
+
 # modesetting core code
 i915-y += \
 	display/intel_atomic.o \
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 3edd5e47ad68..2719a92a8dd9 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -38,6 +38,7 @@
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/vt.h>
+#include <linux/mfd/core.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
@@ -67,6 +68,8 @@
 #include "gt/intel_gt_pm.h"
 #include "gt/intel_rc6.h"
 
+#include "spi/intel_spi.h"
+
 #include "i915_debugfs.h"
 #include "i915_drm_client.h"
 #include "i915_drv.h"
@@ -684,6 +687,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 
 	intel_gt_driver_register(&dev_priv->gt);
 
+	intel_spi_init(&dev_priv->spi, dev_priv);
+
 	intel_display_driver_register(dev_priv);
 
 	intel_power_domains_enable(dev_priv);
@@ -710,6 +715,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	intel_display_driver_unregister(dev_priv);
 
+	mfd_remove_devices(&dev_priv->drm.pdev->dev);
+
 	intel_gt_driver_unregister(&dev_priv->gt);
 
 	i915_perf_unregister(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 1d45d7492d10..1a1803a84432 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -85,6 +85,8 @@
 #include "gt/intel_workarounds.h"
 #include "gt/uc/intel_uc.h"
 
+#include "spi/intel_spi.h"
+
 #include "intel_device_info.h"
 #include "intel_pch.h"
 #include "intel_runtime_pm.h"
@@ -1117,6 +1119,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct intel_spi spi;
+
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
 	struct intel_gt gt;
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e5dd0203991b..9e314393c593 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2510,6 +2510,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define VEBOX_RING_BASE		0x1a000
 #define GEN11_VEBOX_RING_BASE		0x1c8000
 #define GEN11_VEBOX2_RING_BASE		0x1d8000
+#define GEN12_GUNIT_SPI_BASE	0x00102040
 #define BLT_RING_BASE		0x22000
 #define RING_TAIL(base)		_MMIO((base) + 0x30)
 #define RING_HEAD(base)		_MMIO((base) + 0x34)
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
new file mode 100644
index 000000000000..932221dff1c1
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/intel_spi.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2021, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/irq.h>
+#include "i915_reg.h"
+#include "i915_drv.h"
+#include "gt/intel_gt.h"
+#include "spi/intel_spi.h"
+
+static const struct resource spi_resources[] = {
+	DEFINE_RES_MEM_NAMED(GEN12_GUNIT_SPI_BASE, 0x80, "i915-spi-mmio"),
+};
+
+static const struct mfd_cell intel_spi_cell = {
+	.id = 2,
+	.name = "i915-spi",
+	.num_resources = ARRAY_SIZE(spi_resources),
+	.resources = spi_resources,
+};
+
+void intel_spi_init(struct intel_spi *spi, struct drm_i915_private *dev_priv)
+{
+	struct pci_dev *pdev = dev_priv->drm.pdev;
+	int ret;
+
+	/* Only the DGFX devices have internal SPI */
+	if (!IS_DGFX(dev_priv))
+		return;
+
+	ret = mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+			      &intel_spi_cell, 1,
+			      &pdev->resource[0], -1, NULL);
+	if (ret)
+		dev_err(&pdev->dev, "creating i915-spi cell failed\n");
+
+	spi->i915 = dev_priv;
+}
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.h b/drivers/gpu/drm/i915/spi/intel_spi.h
new file mode 100644
index 000000000000..237724fe9d50
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/intel_spi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2021, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_SPI_H__
+#define __INTEL_SPI_H__
+
+struct drm_i915_private;
+
+struct intel_spi {
+	struct drm_i915_private *i915;
+};
+
+void intel_spi_init(struct intel_spi *spi, struct drm_i915_private *i915);
+
+#endif /* __INTEL_SPI_H__ */
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
