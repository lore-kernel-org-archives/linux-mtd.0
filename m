Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFC5CD1284
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 12:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yj2L3SwDM2t/f3vxi5QHYml9Ggdy00jYw0DiUFzjYHc=; b=dNZDFBnwJKpMG+
	tQLTU5x5BERhLjv7WGyIJ7J1WJ8x57gNitdOx/BmWxyQvDxsAwN6PnQK6OE1VVFzZRJAvJ+ifeXYC
	M7BkLjKDDSafagQQi6oGbzN+Xx8QR+l/XyIPsr91GCMolssjRCvMpbYYmW+eVqC9FeyTETlYM0z7Q
	MVC6zaKGxuh8WvUnglOkbWCO/HzSzQ+vskn8NNl7ouR9cs4DenfOxkU0Zge4b7o/7WuPoNbvYP0lC
	4iCynkbvti3tkHF8RGcogS9eExZ06Ly5rWMvfbaLJ8OrZGZrcgpRAIG4SsVvbLJX8HF6Hjf15gTa8
	g/1Lf0tkJMqNufKFPodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpopv-0000000DtFs-0elY;
	Thu, 28 Mar 2024 12:26:27 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpopr-0000000DtED-0ehr
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 12:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711628783; x=1743164783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+l5HV3zC1lqNb/d0RlBIdQl9EOvfaUBG/49zCzdRb7Y=;
  b=b78tK3w9PySwSWgPUQay9A9/vgdIHdu6ILAlojXOfwF14SPePAJuypvZ
   rH8HDrIw5VKSgZ7ixGWiRbrd12PkbId7+xlTyzpH2+gaN/RYXNkaOmpAF
   t7w5u8DtZAM2L8W1aBs0o4pdgPoX0N7B2sSD7iC4NAiidulQMevDMBsIH
   6qjm2z5OMgN2jwQ+QI+VWbuwju1hmz2Py5gLNngxOh7IkybFB2T5dvi/z
   NvZvQLTAH/eksXO5PZAp8AKfpG5S8kOAk9Nk8Qij1EjpIlxpQmLyUKrKe
   EoSNjNNMCG5dpV4BM7nCmDLXTTK1zeOnHt4rkAEmT8koNjPbs6XDgq+40
   A==;
X-CSE-ConnectionGUID: h8BP8cDnQuOUuzGcYbOSLQ==
X-CSE-MsgGUID: /KbtML9uSgqbnVN8covOGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17505459"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="17505459"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16657566"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:20 -0700
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
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH 02/13] drm/i915/spi: add spi device for discrete graphics
Date: Thu, 28 Mar 2024 14:22:25 +0200
Message-Id: <20240328122236.1718111-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328122236.1718111-1-alexander.usyskin@intel.com>
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_052623_232222_F3CEEE05 
X-CRM114-Status: GOOD (  20.14  )
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

Enable access to internal spi on DGFX devices via a child device.
The spi child device is exposed via auxiliary bus.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/Makefile        |  4 ++
 drivers/gpu/drm/i915/i915_driver.c   |  6 +++
 drivers/gpu/drm/i915/i915_drv.h      |  4 ++
 drivers/gpu/drm/i915/i915_reg.h      |  1 +
 drivers/gpu/drm/i915/spi/intel_spi.c | 64 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/spi/intel_spi.h | 15 +++++++
 6 files changed, 94 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.c
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index e777686190ca..2bd481862a48 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -239,6 +239,10 @@ i915-y += \
 i915-y += \
 	gt/intel_gsc.o
 
+# graphics spi device (DGFX) support
+i915-y += \
+	spi/intel_spi.o
+
 # graphics hardware monitoring (HWMON) support
 i915-$(CONFIG_HWMON) += \
 	i915_hwmon.o
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c7d7c3b7ecc6..716fa20c52ce 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -81,6 +81,8 @@
 #include "soc/intel_dram.h"
 #include "soc/intel_gmch.h"
 
+#include "spi/intel_spi.h"
+
 #include "i915_debugfs.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
@@ -619,6 +621,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 	/* Depends on sysfs having been initialized */
 	i915_perf_register(dev_priv);
 
+	intel_spi_init(dev_priv);
+
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_register(gt);
 
@@ -662,6 +666,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	i915_hwmon_unregister(dev_priv);
 
+	intel_spi_fini(dev_priv);
+
 	i915_perf_unregister(dev_priv);
 	i915_pmu_unregister(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 861567362abd..e8e0d9ff4e66 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -34,6 +34,8 @@
 
 #include <linux/pm_qos.h>
 
+#include <linux/intel_dg_spi_aux.h>
+
 #include <drm/ttm/ttm_device.h>
 
 #include "display/intel_display_limits.h"
@@ -330,6 +332,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct intel_dg_spi_dev spi;
+
 	struct i915_hwmon *hwmon;
 
 	struct intel_gt *gt[I915_MAX_GT];
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 27dc903f0553..8b2935e384e3 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -928,6 +928,7 @@
 #define DG2_GSC_HECI2_BASE	0x00374000
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
+#define GEN12_GUNIT_SPI_BASE	0x00102040
 
 #define HECI_H_CSR(base)	_MMIO((base) + 0x4)
 #define   HECI_H_CSR_IE		REG_BIT(0)
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
new file mode 100644
index 000000000000..17e4c7861ef5
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/intel_spi.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/intel_dg_spi_aux.h>
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
+void intel_spi_init(struct drm_i915_private *dev_priv)
+{
+	struct intel_dg_spi_dev *spi = &dev_priv->spi;
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
+}
+
+void intel_spi_fini(struct drm_i915_private *dev_priv)
+{
+	struct intel_dg_spi_dev *spi = &dev_priv->spi;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+
+	dev_dbg(&pdev->dev, "removing i915-spi cell\n");
+
+	auxiliary_device_delete(&spi->aux_dev);
+	auxiliary_device_uninit(&spi->aux_dev);
+}
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.h b/drivers/gpu/drm/i915/spi/intel_spi.h
new file mode 100644
index 000000000000..ed4153401f5d
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/intel_spi.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_SPI_H__
+#define __INTEL_SPI_H__
+
+struct drm_i915_private;
+
+void intel_spi_init(struct drm_i915_private *i915);
+
+void intel_spi_fini(struct drm_i915_private *i915);
+
+#endif /* __INTEL_SPI_H__ */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
