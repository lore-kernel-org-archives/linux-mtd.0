Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F40EEB58F
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Sep 2023 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU9GsVixQckGIt6B/6UFDff4JhhVBYtsoB7IV9onsb0=; b=RDEqz1oQIdbzto
	UnRpbKBF8uhqlSLZYSE1hZ+ZUDJJvbkbiilypvTIwKRuIVzSEazvxASNvDaqlV/trfWMeNeWriLR+
	W3pdb8eFv3qyxC1ZQtAFyh/b3TxCmpGSNYUIQztTrlBpo8xnKcSdaG4it9bQ257Ko75Gs8acjTR8y
	LEEv0eEdJrnM0KeMvAUxCWIZ6bqent//4u9cI8Id55Pj6aCJjO0G564VHpArzikf6b4LcWaeu9rfd
	Bws1ZFSsdedqgyZBz28AC0db9ctnkWweXNLTmaGGxUtsix3a6rmYVvbpR5s3pde8AqgLtj762r/86
	g2H5np06Uu0tJ5ms+i3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJnk-00Gb8h-1l;
	Sun, 10 Sep 2023 12:44:32 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJnh-00Gb7b-2n
	for linux-mtd@lists.infradead.org;
	Sun, 10 Sep 2023 12:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694349869; x=1725885869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b+WVuxJ/7+WYK1mZRK+a0uoxf1QizTn6DptWsCSQOcs=;
  b=hJLMWRxQYOAKl2pn2CjNQBvvuADFDzGMY3W0sheu3yx2sA+bim7PIR03
   r/Buz6wIQMItScDRcOnxyg5aVMa6OtSAC4RkYMQdNNyXLkZuKfCD25Sun
   zf+q4LdMooh1N3VZRZY7cmRGKcgem1s3DJ+r8kyjmu6TBR8uH0vCCkBJQ
   uKDOpiADy5l1SDbx4iKoZ8JJLWxnzO9JkJhX0O8DYmqL4G/bKjPNCl4QY
   k/X2j+aQQA9JxhweUcltLqxCMxZg6OsQn0RAozTA/ydpJgHEI3qE1E58E
   Cn5SWAma9Hssc8FRdnzIIEZ62FlpB3jBDaLzAWfFKfbZ3tZBIQIxTpBIP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="441907080"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="441907080"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="1073814990"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="1073814990"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:44:25 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH 01/10] drm/i915/spi: add spi device for discrete graphics
Date: Sun, 10 Sep 2023 15:39:40 +0300
Message-Id: <20230910123949.1251964-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230910123949.1251964-1-alexander.usyskin@intel.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_054430_028516_A138B822 
X-CRM114-Status: GOOD (  21.19  )
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

From: Jani Nikula <jani.nikula@intel.com>

Enable access to internal spi on DGFX devices via a child device.
The spi child device is exposed via auxiliary bus.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/Makefile        |  3 ++
 drivers/gpu/drm/i915/i915_driver.c   |  7 +++
 drivers/gpu/drm/i915/i915_drv.h      |  4 ++
 drivers/gpu/drm/i915/i915_reg.h      |  1 +
 drivers/gpu/drm/i915/spi/intel_spi.c | 68 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/spi/intel_spi.h | 26 +++++++++++
 6 files changed, 109 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.c
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 79f65eff6bb2..f16870ad2615 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -222,6 +222,9 @@ i915-y += \
 # graphics system controller (GSC) support
 i915-y += gt/intel_gsc.o
 
+# graphics spi device (DGFX) support
+i915-y += spi/intel_spi.o
+
 # graphics hardware monitoring (HWMON) support
 i915-$(CONFIG_HWMON) += i915_hwmon.o
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index f8dbee7a5af7..aeeb34a8dde2 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -80,6 +80,8 @@
 #include "soc/intel_dram.h"
 #include "soc/intel_gmch.h"
 
+#include "spi/intel_spi.h"
+
 #include "i915_debugfs.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
@@ -666,6 +668,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	i915_hwmon_unregister(dev_priv);
 
+	intel_spi_fini(&dev_priv->spi);
+
 	i915_perf_unregister(dev_priv);
 	i915_pmu_unregister(dev_priv);
 
@@ -1133,6 +1137,9 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 
 	i915_gem_suspend_late(dev_priv);
 
+
+	intel_spi_init(&dev_priv->spi, dev_priv);
+
 	for_each_gt(gt, dev_priv, i)
 		intel_uncore_suspend(gt->uncore);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 87ffc477c3b1..abc601200cb4 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -51,6 +51,8 @@
 
 #include "soc/intel_pch.h"
 
+#include "spi/intel_spi.h"
+
 #include "i915_drm_client.h"
 #include "i915_gem.h"
 #include "i915_gpu_error.h"
@@ -315,6 +317,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct intel_spi spi;
+
 	struct i915_hwmon *hwmon;
 
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e00e4d569ba9..0f8b01495b77 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -930,6 +930,7 @@
 #define DG2_GSC_HECI2_BASE	0x00374000
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
+#define GEN12_GUNIT_SPI_BASE	0x00102040
 
 #define HECI_H_CSR(base)	_MMIO((base) + 0x4)
 #define   HECI_H_CSR_IE		REG_BIT(0)
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
new file mode 100644
index 000000000000..9eb5ab6bc4b9
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/intel_spi.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2022, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/irq.h>
+#include "i915_reg.h"
+#include "i915_drv.h"
+#include "spi/intel_spi.h"
+
+#define GEN12_GUNIT_SPI_SIZE 0x80
+
+static void i915_spi_release_dev(struct device *dev)
+{
+}
+
+void intel_spi_init(struct intel_spi *spi, struct drm_i915_private *dev_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+	struct auxiliary_device *aux_dev = &spi->aux_dev;
+	int ret;
+
+	/* Only the DGFX devices have internal SPI */
+	if (!IS_DGFX(dev_priv))
+		return;
+
+	spi->bar.parent = &pdev->resource[0];
+	spi->bar.start = GEN12_GUNIT_SPI_BASE + pdev->resource[0].start;
+	spi->bar.end = spi->bar.start + GEN12_GUNIT_SPI_SIZE - 1;
+	spi->bar.flags = IORESOURCE_MEM;
+	spi->bar.desc = IORES_DESC_NONE;
+
+	aux_dev->name = "spi";
+	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
+		       PCI_DEVID(pdev->bus->number, pdev->devfn);
+	aux_dev->dev.parent = &pdev->dev;
+	aux_dev->dev.release = i915_spi_release_dev;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "i915-spi aux init failed %d\n", ret);
+		return;
+	}
+
+	ret = auxiliary_device_add(aux_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "i915-spi aux add failed %d\n", ret);
+		auxiliary_device_uninit(aux_dev);
+		return;
+	}
+
+	spi->i915 = dev_priv;
+}
+
+void intel_spi_fini(struct intel_spi *spi)
+{
+	struct pci_dev *pdev;
+
+	if (!spi->i915)
+		return;
+
+	pdev = to_pci_dev(spi->i915->drm.dev);
+
+	dev_dbg(&pdev->dev, "removing i915-spi cell\n");
+
+	auxiliary_device_delete(&spi->aux_dev);
+	auxiliary_device_uninit(&spi->aux_dev);
+}
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.h b/drivers/gpu/drm/i915/spi/intel_spi.h
new file mode 100644
index 000000000000..a58bf79dcbc9
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/intel_spi.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2022, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_SPI_DEV_H__
+#define __INTEL_SPI_DEV_H__
+
+#include <linux/auxiliary_bus.h>
+
+struct drm_i915_private;
+
+struct intel_spi {
+	struct auxiliary_device aux_dev;
+	struct drm_i915_private *i915;
+	struct resource bar;
+};
+
+#define auxiliary_dev_to_intel_spi_dev(auxiliary_dev) \
+	container_of(auxiliary_dev, struct intel_spi, aux_dev)
+
+void intel_spi_init(struct intel_spi *spi, struct drm_i915_private *i915);
+
+void intel_spi_fini(struct intel_spi *spi);
+
+#endif /* __INTEL_SPI_DEV_H__ */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
