Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1308FD0E6FC
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2024 10:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZAjetRvrOvknYngHZb+oeU1w+ekgt7m8g90aXtNaMg=; b=PMH+CYLd0JNNiv
	mDwvYCvlfW+hFAqU1ZEKxE91t0WIEML10/F1G72RXUH2gyoxm5/iQa2NADPfqjorFn10kIyOkhkx7
	Y7rCkPQydkeVFPm01Fuqk09AZ9gBKm8AMgJm4OetOdE2+b1kerVThZTuIc7Tk5wWUKhq7xyuLUuOS
	2+itn7Nv2Oi7kze8C/mp8PK/XSiN4krI10hB7KYBHZfJDUvARndzJFfc0czhSIPKUa/M5dnkn5bJr
	3p44s9i/nYmn8EUjezGs9LQXY/6rgDR+tsGJl1V0F0DEAeB9X1n/pK7IUotXhdrDKTUaOdIEF9psI
	p7mXGpaFDM+8CLfEC8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CWU-0000000Aan3-2eMQ;
	Tue, 22 Oct 2024 10:53:58 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CWP-0000000Aait-0sCr
	for linux-mtd@lists.infradead.org;
	Tue, 22 Oct 2024 10:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729594433; x=1761130433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GqrDGuqzDvLuKCL7Jp1oCRPqbW0R8SjevZBtt8aO7Cc=;
  b=FbdW5jSDDluOShOTwSBTXbTt4rRUmEBjlzzxhtcf7DMtCh7Bdr1DwBHK
   77or87Z2U7SaIKrnqb8g8e5VsA8iE/PP2yND/MpBIR80MDve6462EhpgT
   i8IJmHicQCaB81WX6LetlWoG1FFf+S4TmWMDpxOe/j/+ur2vKVf0u0lJM
   MWHMV4zq3G9/MQC579wcIxQfLeW0jUjT+1rd8JUAaXjmAhQg7jakEoijz
   dLEhSlIKORyEKjlcw4h5xIWcCxtJps02KC6f87bcynJofYkHx4c8QpGk5
   rwTfEcy8w4zIWv7w3/NW/POIZpMpJqXqUkzpd3GEbNXBPnYIN4fq1jz77
   Q==;
X-CSE-ConnectionGUID: lgAVjGWSR1Gzua9HWzVOtA==
X-CSE-MsgGUID: M3ZAuIDlQgih7hz7jEK9Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39704965"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="39704965"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP; 22 Oct 2024 03:53:40 -0700
X-CSE-ConnectionGUID: TcMY7DG9Rvqi/Fm8HTdOsQ==
X-CSE-MsgGUID: xcgG0WgkSwKGlq7zB8CO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79847586"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 03:53:11 -0700
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
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tomas Winkler <tomasw@gmail.com>
Subject: [PATCH 01/10] mtd: add driver for intel graphics non-volatile memory device
Date: Tue, 22 Oct 2024 13:41:10 +0300
Message-ID: <20241022104119.3149051-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022104119.3149051-1-alexander.usyskin@intel.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_035353_623352_70DC6B1D 
X-CRM114-Status: GOOD (  26.16  )
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

Add auxiliary driver for intel discrete graphics
non-volatile memory device.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 MAINTAINERS                        |   7 ++
 drivers/mtd/devices/Kconfig        |  11 +++
 drivers/mtd/devices/Makefile       |   1 +
 drivers/mtd/devices/mtd-intel-dg.c | 139 +++++++++++++++++++++++++++++
 include/linux/intel_dg_nvm_aux.h   |  27 ++++++
 5 files changed, 185 insertions(+)
 create mode 100644 drivers/mtd/devices/mtd-intel-dg.c
 create mode 100644 include/linux/intel_dg_nvm_aux.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..a09c035849ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11360,6 +11360,13 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	arch/x86/include/asm/intel-family.h
 
+INTEL DISCRETE GRAPHIC NVM MTD DRIVER
+M:	Alexander Usyskin <alexander.usyskin@intel.com>
+L:	linux-mtd@lists.infradead.org
+S:	Supported
+F:	drivers/mtd/devices/mtd-intel-dg.c
+F:	include/linux/intel_dg_nvm_aux.h
+
 INTEL DRM DISPLAY FOR XE AND I915 DRIVERS
 M:	Jani Nikula <jani.nikula@linux.intel.com>
 M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index ff2f9e55ef28..d93edf45c0bb 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -183,6 +183,17 @@ config MTD_POWERNV_FLASH
 	  platforms from Linux. This device abstracts away the
 	  firmware interface for flash access.
 
+config MTD_INTEL_DG
+	tristate "Intel Discrete Graphic non-volatile memory driver"
+	depends on AUXILIARY_BUS
+	depends on MTD
+	help
+	  This provides MTD device to access Intel Discrete Graphic
+	  non-volatile memory.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mtd-intel-dg.
+
 comment "Disk-On-Chip Device Drivers"
 
 config MTD_DOCG3
diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
index d11eb2b8b6f8..77c05d269034 100644
--- a/drivers/mtd/devices/Makefile
+++ b/drivers/mtd/devices/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
 obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
 obj-$(CONFIG_MTD_ST_SPI_FSM)    += st_spi_fsm.o
 obj-$(CONFIG_MTD_POWERNV_FLASH)	+= powernv_flash.o
+obj-$(CONFIG_MTD_INTEL_DG)	+= mtd-intel-dg.o
 
 
 CFLAGS_docg3.o			+= -I$(src)
diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
new file mode 100644
index 000000000000..746c963ea540
--- /dev/null
+++ b/drivers/mtd/devices/mtd-intel-dg.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/intel_dg_nvm_aux.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+struct intel_dg_nvm {
+	struct kref refcnt;
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
+static void intel_dg_nvm_release(struct kref *kref)
+{
+	struct intel_dg_nvm *nvm = container_of(kref, struct intel_dg_nvm, refcnt);
+	int i;
+
+	pr_debug("freeing intel_dg nvm\n");
+	for (i = 0; i < nvm->nregions; i++)
+		kfree(nvm->regions[i].name);
+	kfree(nvm);
+}
+
+static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
+			      const struct auxiliary_device_id *aux_dev_id)
+{
+	struct intel_dg_nvm_dev *invm = auxiliary_dev_to_intel_dg_nvm_dev(aux_dev);
+	struct device *device;
+	struct intel_dg_nvm *nvm;
+	unsigned int nregions;
+	unsigned int i, n;
+	size_t size;
+	char *name;
+	int ret;
+
+	device = &aux_dev->dev;
+
+	/* count available regions */
+	for (nregions = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
+		if (invm->regions[i].name)
+			nregions++;
+	}
+
+	if (!nregions) {
+		dev_err(device, "no regions defined\n");
+		return -ENODEV;
+	}
+
+	size = sizeof(*nvm) + sizeof(nvm->regions[0]) * nregions;
+	nvm = kzalloc(size, GFP_KERNEL);
+	if (!nvm)
+		return -ENOMEM;
+
+	kref_init(&nvm->refcnt);
+
+	nvm->nregions = nregions;
+	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
+		if (!invm->regions[i].name)
+			continue;
+
+		name = kasprintf(GFP_KERNEL, "%s.%s",
+				 dev_name(&aux_dev->dev), invm->regions[i].name);
+		if (!name)
+			continue;
+		nvm->regions[n].name = name;
+		nvm->regions[n].id = i;
+		n++;
+	}
+
+	nvm->base = devm_ioremap_resource(device, &invm->bar);
+	if (IS_ERR(nvm->base)) {
+		dev_err(device, "mmio not mapped\n");
+		ret = PTR_ERR(nvm->base);
+		goto err;
+	}
+
+	dev_set_drvdata(&aux_dev->dev, nvm);
+
+	return 0;
+
+err:
+	kref_put(&nvm->refcnt, intel_dg_nvm_release);
+	return ret;
+}
+
+static void intel_dg_mtd_remove(struct auxiliary_device *aux_dev)
+{
+	struct intel_dg_nvm *nvm = dev_get_drvdata(&aux_dev->dev);
+
+	if (!nvm)
+		return;
+
+	dev_set_drvdata(&aux_dev->dev, NULL);
+
+	kref_put(&nvm->refcnt, intel_dg_nvm_release);
+}
+
+static const struct auxiliary_device_id intel_dg_mtd_id_table[] = {
+	{
+		.name = "i915.nvm",
+	},
+	{
+		.name = "xe.nvm",
+	},
+	{
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(auxiliary, intel_dg_mtd_id_table);
+
+static struct auxiliary_driver intel_dg_mtd_driver = {
+	.probe  = intel_dg_mtd_probe,
+	.remove = intel_dg_mtd_remove,
+	.driver = {
+		/* auxiliary_driver_register() sets .name to be the modname */
+	},
+	.id_table = intel_dg_mtd_id_table
+};
+
+module_auxiliary_driver(intel_dg_mtd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION("Intel DGFX MTD driver");
diff --git a/include/linux/intel_dg_nvm_aux.h b/include/linux/intel_dg_nvm_aux.h
new file mode 100644
index 000000000000..2cc4179fbde2
--- /dev/null
+++ b/include/linux/intel_dg_nvm_aux.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_DG_NVM_AUX_H__
+#define __INTEL_DG_NVM_AUX_H__
+
+#include <linux/auxiliary_bus.h>
+
+#define INTEL_DG_NVM_REGIONS 13
+
+struct intel_dg_nvm_region {
+	const char *name;
+};
+
+struct intel_dg_nvm_dev {
+	struct auxiliary_device aux_dev;
+	bool writeable_override;
+	struct resource bar;
+	const struct intel_dg_nvm_region *regions;
+};
+
+#define auxiliary_dev_to_intel_dg_nvm_dev(auxiliary_dev) \
+	container_of(auxiliary_dev, struct intel_dg_nvm_dev, aux_dev)
+
+#endif /* __INTEL_DG_NVM_AUX_H__ */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
