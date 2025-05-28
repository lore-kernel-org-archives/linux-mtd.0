Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE04C5AD49
	for <linux-mtd@archiver.kernel.org>; Wed, 28 May 2025 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0o+TYgonk6+ipCQ4in24OJnY1VscgiGo0iMqinKg0U0=; b=tsBS4HKB9V0qXA
	pMN9oD4r/NgMgiN/7GWtW7di1v7NpNlguesGh2KZ7WImluYaf5dasDz6BlVpfQ++G3Nlu/OnvsVUU
	Af0Be2XrDxm6rU40wchiInPYwtrQgNRkvUK7yPi9voQQ/05Bq9nR+guH8S+aJmmahqSQ+H7UQ5m7I
	Fqds78ZdD2fe8FQlcvCzrOF6NfkD0gRm2KeHAZSS1xv8r4XPOv17zxRRlJROE7j8Cku1HZINPtf7y
	62rVAap8vW2KUz87m7tbvglhdn+KC+Yq+P1EZRim69JmUacdY8RQ28GiQR+UiMHAX1K6xGXyMtQK/
	xqVvKaruURRIg1ZrQi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHb7-0000000DLl6-16H2;
	Wed, 28 May 2025 14:17:37 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHPb-0000000DJdw-0Q1S
	for linux-mtd@lists.infradead.org;
	Wed, 28 May 2025 14:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748441143; x=1779977143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qJ+24LbrBZuds95I+vzHtz82YkOFfVavJUczZuOdlR4=;
  b=SEh7LNKkpbMR2wF5Jq2iYafhKF1YFL9tkS6N+ILJgMhyLiLgi2YQzoW3
   khPIQz/UQ1Wk0RsX0Sy0/FjXTN/QEc1kFcC6+asiz1d8Irmmuc4ldmY3J
   0vgGgGvnyIS+SYd6tDcNEPCGak2w2YUj4Oav6adwzknzIRS22XgloI29R
   DC9jUpc/MY//z7fDBIBtPXTgTY8/Xk48LaA/pav1DSsfSEMWkNqT1Lh7N
   22SiR+//kNeKWtB9ayNZhr3uxOHtE8zBKoHt8Nx01l3AxjbW7hAbHhcYh
   VtS0GzUX99ZB34MGtUaz1sl5YynWbTPFiqUDtsEn54Dzh6VVMHQD40xNa
   w==;
X-CSE-ConnectionGUID: F6MRSxezRiOYagklzHWV9g==
X-CSE-MsgGUID: SCNuRDrVT6qmcrqXwCJzKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61525109"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61525109"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 07:05:43 -0700
X-CSE-ConnectionGUID: tzwX/n3BTP29rveybZrAPA==
X-CSE-MsgGUID: byJCCZIVTfOgyqZtYvPfug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143239073"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 07:05:37 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>,
	Raag Jadav <raag.jadav@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tomas Winkler <tomasw@gmail.com>
Subject: [PATCH v11 06/10] drm/i915/nvm: add nvm device for discrete graphics
Date: Wed, 28 May 2025 16:51:11 +0300
Message-ID: <20250528135115.2512429-7-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528135115.2512429-1-alexander.usyskin@intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_070543_192364_D0C03705 
X-CRM114-Status: GOOD (  22.73  )
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

Enable access to internal non-volatile memory on
DGFX devices via a child device.
The nvm child device is exposed via auxiliary bus.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/Makefile      |  4 ++
 drivers/gpu/drm/i915/i915_driver.c |  6 ++
 drivers/gpu/drm/i915/i915_drv.h    |  3 +
 drivers/gpu/drm/i915/i915_reg.h    |  1 +
 drivers/gpu/drm/i915/intel_nvm.c   | 98 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_nvm.h   | 15 +++++
 6 files changed, 127 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1a90eb1f180a..2e0fa85491a8 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -212,6 +212,10 @@ i915-y += \
 i915-y += \
 	gt/intel_gsc.o
 
+# graphics nvm device (DGFX) support
+i915-y += \
+	intel_nvm.o
+
 # graphics hardware monitoring (HWMON) support
 i915-$(CONFIG_HWMON) += \
 	i915_hwmon.o
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 2b0bcb9aa3c7..c7ab0352d31d 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -82,6 +82,8 @@
 #include "soc/intel_dram.h"
 #include "soc/intel_gmch.h"
 
+#include "intel_nvm.h"
+
 #include "i915_debugfs.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
@@ -646,6 +648,8 @@ static int i915_driver_register(struct drm_i915_private *dev_priv)
 	/* Depends on sysfs having been initialized */
 	i915_perf_register(dev_priv);
 
+	intel_nvm_init(dev_priv);
+
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_register(gt);
 
@@ -688,6 +692,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	i915_hwmon_unregister(dev_priv);
 
+	intel_nvm_fini(dev_priv);
+
 	i915_perf_unregister(dev_priv);
 	i915_pmu_unregister(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 93b4c504b710..1212117d07ef 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -65,6 +65,7 @@
 struct drm_i915_clock_gating_funcs;
 struct vlv_s0ix_state;
 struct intel_pxp;
+struct intel_dg_nvm_dev;
 
 #define GEM_QUIRK_PIN_SWIZZLED_PAGES	BIT(0)
 
@@ -310,6 +311,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct intel_dg_nvm_dev *nvm;
+
 	struct i915_hwmon *hwmon;
 
 	struct intel_gt *gt[I915_MAX_GT];
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 2e4190da3e0d..7f538ef3cbb5 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -321,6 +321,7 @@
 #define DG2_GSC_HECI2_BASE	0x00374000
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
+#define GEN12_GUNIT_NVM_BASE	0x00102040
 
 #define HECI_H_CSR(base)	_MMIO((base) + 0x4)
 #define   HECI_H_CSR_IE		REG_BIT(0)
diff --git a/drivers/gpu/drm/i915/intel_nvm.c b/drivers/gpu/drm/i915/intel_nvm.c
new file mode 100644
index 000000000000..ae7f9f2c01bf
--- /dev/null
+++ b/drivers/gpu/drm/i915/intel_nvm.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/intel_dg_nvm_aux.h>
+#include <linux/irq.h>
+#include <linux/pci.h>
+#include "i915_reg.h"
+#include "i915_drv.h"
+#include "intel_nvm.h"
+
+#define GEN12_GUNIT_NVM_SIZE 0x80
+
+static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
+static void i915_nvm_release_dev(struct device *dev)
+{
+}
+
+int intel_nvm_init(struct drm_i915_private *i915)
+{
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	struct auxiliary_device *aux_dev;
+	struct intel_dg_nvm_dev *nvm;
+	int ret;
+
+	/* Only the DGFX devices have internal NVM */
+	if (!IS_DGFX(i915))
+		return 0;
+
+	/* Nvm pointer should be NULL here */
+	if (WARN_ON(i915->nvm))
+		return -EFAULT;
+
+	i915->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
+	if (!i915->nvm)
+		return -ENOMEM;
+
+	nvm = i915->nvm;
+
+	nvm->writable_override = true;
+	nvm->bar.parent = &pdev->resource[0];
+	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
+	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
+	nvm->bar.flags = IORESOURCE_MEM;
+	nvm->bar.desc = IORES_DESC_NONE;
+	nvm->regions = regions;
+
+	aux_dev = &nvm->aux_dev;
+
+	aux_dev->name = "nvm";
+	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) | pci_dev_id(pdev);
+	aux_dev->dev.parent = &pdev->dev;
+	aux_dev->dev.release = i915_nvm_release_dev;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret) {
+		drm_err(&i915->drm, "i915-nvm aux init failed %d\n", ret);
+		goto err;
+	}
+
+	ret = auxiliary_device_add(aux_dev);
+	if (ret) {
+		drm_err(&i915->drm, "i915-nvm aux add failed %d\n", ret);
+		auxiliary_device_uninit(aux_dev);
+		goto err;
+	}
+	return 0;
+
+err:
+	kfree(nvm);
+	i915->nvm = NULL;
+	return ret;
+}
+
+void intel_nvm_fini(struct drm_i915_private *i915)
+{
+	struct intel_dg_nvm_dev *nvm = i915->nvm;
+
+	/* Only the DGFX devices have internal NVM */
+	if (!IS_DGFX(i915))
+		return;
+
+	/* Nvm pointer should not be NULL here */
+	if (WARN_ON(!nvm))
+		return;
+
+	auxiliary_device_delete(&nvm->aux_dev);
+	auxiliary_device_uninit(&nvm->aux_dev);
+	kfree(nvm);
+	i915->nvm = NULL;
+}
diff --git a/drivers/gpu/drm/i915/intel_nvm.h b/drivers/gpu/drm/i915/intel_nvm.h
new file mode 100644
index 000000000000..a9e4046b830f
--- /dev/null
+++ b/drivers/gpu/drm/i915/intel_nvm.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_NVM_H__
+#define __INTEL_NVM_H__
+
+struct drm_i915_private;
+
+int intel_nvm_init(struct drm_i915_private *i915);
+
+void intel_nvm_fini(struct drm_i915_private *i915);
+
+#endif /* __INTEL_NVM_H__ */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
