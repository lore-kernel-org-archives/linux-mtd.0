Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B1FC71136
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Jun 2025 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRTvd8nLw8IDsXEYdZ4r/5sB9PWFbYqevJbIczar8Qg=; b=j/2ip7oGQrcDFF
	EDlVc2T9ZoqCISKiT1OanIs4q36DKQTmekpiD1UYvrsKWplBhW7rnrky/bvqPLfDsG99Sh0ZMbrcR
	XOZyZh3017OHYieH6uGRIrVKqI6CQRJZQRqiOFy20p0eC4PtIgZqX9zDVJLp8NNMpkgI7IqTYjyOI
	uFeCbMyNBKHhehP1IANqlj30GG2NaFkfd4QoKNU+XlSG7y98u1TktIYRSRNCGpdknwjAmfkTCOL1/
	LVk+LyTlIxX4WZn/mgxLtUaxiSQVqOAhDgbJE5KPaMvBUTeEMkIL4NAD0I7syjkj01KZvESfqphgU
	WUnpt4NAfH4ij/YqYzOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZpw-00000007yAP-03cY;
	Tue, 17 Jun 2025 17:11:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXsa-00000007h1V-1g7f
	for linux-mtd@bombadil.infradead.org;
	Tue, 17 Jun 2025 15:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jzXLudO38+lyhLHAgp1aoJaPEahCEtokdiQcJG7KY0I=; b=iy8kUl+xfvlK4Q1xq+ZpdDq7BX
	hIPY2hqIjjrKX6gMyCpiwGyl4wn9/pjlWHTwz1yoLiHCsRlJfAQCvIovKN0dXNc5GrNu/rlqkjZlb
	oUYjPoKNXCT8uIH/r55TGxRwcvZChX99K9Qqe7By7kbSdP5SAWWuElhQ19/+en0C9lz+iD1nvr9Ee
	AYkvtJ0thLiuTyCkt8lzdfiZ5KF+ykbUyeSFHpXPnX4GzGO+HZZYlaEX8YK9YynMy2UGm9oQxuE0g
	EktR3hSKmlEM4L5Fuy/85QUFJP5kuJ8f90QE8O5WCf9YrnUZj8RV1iN7qBqyoiOs+SQF/tNJ4wxpO
	GkwOL/mw==;
Received: from mgamail.intel.com ([192.198.163.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXsX-00000003pW6-3l52
	for linux-mtd@lists.infradead.org;
	Tue, 17 Jun 2025 15:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750172737; x=1781708737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=whBs2iAagZKltqwmIXWaToW4Srekvx9gqm0G/7aOwhc=;
  b=YjZ75WEWMSyusE5PPF/QhyiexgsFrrY2h09x7hDFGyRz0VbN2+WdDgTE
   hQBclWf4lm2ASpFU4XxHxaEewWer8aNt9Pr2h5RRyb9jG7UneaWhZpQu6
   5u1nSUPIEwptHivovvNSj8b2Pe3zr+Rxfk5gDXLeBIqAdCjKr5qt8Mpga
   mPxSb0nPHYD3wuzxERc1l+U9nKhhdf8gXdNMUayxJwonIG9O2Y+36h0fJ
   JrXM+V3Xa5RPY2h+/YcBy82KH657E3sLJmHVGxJbgqSgnxhf01BExBuWJ
   ExXc/VzQn5HvEukTLNwlQuO9RbbX7N3tDCjkCtwgwjB1dd4XYNYlTisIC
   Q==;
X-CSE-ConnectionGUID: pn/c6260QVa93yz0Gmp2AQ==
X-CSE-MsgGUID: zz/tG2lUSLSdyTjPxVgjnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63008746"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="63008746"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 08:05:37 -0700
X-CSE-ConnectionGUID: kdMoRDLJTxGzpmGblCnDKw==
X-CSE-MsgGUID: Eeux6R3QT4+Zehgvx1wkWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="152672151"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 08:05:30 -0700
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
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tomas Winkler <tomasw@gmail.com>
Subject: [PATCH v14 1/8] mtd: add driver for intel graphics non-volatile memory device
Date: Tue, 17 Jun 2025 17:51:51 +0300
Message-ID: <20250617145159.3803852-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617145159.3803852-1-alexander.usyskin@intel.com>
References: <20250617145159.3803852-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_160538_567797_332E13FF 
X-CRM114-Status: GOOD (  25.88  )
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

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 MAINTAINERS                        |   7 ++
 drivers/mtd/devices/Kconfig        |  11 +++
 drivers/mtd/devices/Makefile       |   1 +
 drivers/mtd/devices/mtd_intel_dg.c | 134 +++++++++++++++++++++++++++++
 include/linux/intel_dg_nvm_aux.h   |  30 +++++++
 5 files changed, 183 insertions(+)
 create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
 create mode 100644 include/linux/intel_dg_nvm_aux.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e7515a412e9..521730530243 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12086,6 +12086,13 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	arch/x86/include/asm/intel-family.h
 
+INTEL DISCRETE GRAPHICS NVM MTD DRIVER
+M:	Alexander Usyskin <alexander.usyskin@intel.com>
+L:	linux-mtd@lists.infradead.org
+S:	Supported
+F:	drivers/mtd/devices/mtd_intel_dg.c
+F:	include/linux/intel_dg_nvm_aux.h
+
 INTEL DRM DISPLAY FOR XE AND I915 DRIVERS
 M:	Jani Nikula <jani.nikula@linux.intel.com>
 M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index aed653ce8fa2..46cebde79f34 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -183,6 +183,17 @@ config MTD_POWERNV_FLASH
 	  platforms from Linux. This device abstracts away the
 	  firmware interface for flash access.
 
+config MTD_INTEL_DG
+	tristate "Intel Discrete Graphics non-volatile memory driver"
+	depends on AUXILIARY_BUS
+	depends on MTD
+	help
+	  This provides an MTD device to access Intel Discrete Graphics
+	  non-volatile memory.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mtd-intel-dg.
+
 comment "Disk-On-Chip Device Drivers"
 
 config MTD_DOCG3
diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
index d11eb2b8b6f8..9fe4ce9cffde 100644
--- a/drivers/mtd/devices/Makefile
+++ b/drivers/mtd/devices/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
 obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
 obj-$(CONFIG_MTD_ST_SPI_FSM)    += st_spi_fsm.o
 obj-$(CONFIG_MTD_POWERNV_FLASH)	+= powernv_flash.o
+obj-$(CONFIG_MTD_INTEL_DG)	+= mtd_intel_dg.o
 
 
 CFLAGS_docg3.o			+= -I$(src)
diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
new file mode 100644
index 000000000000..c2d0dbfb0378
--- /dev/null
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
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
+	} regions[] __counted_by(nregions);
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
+	struct intel_dg_nvm *nvm;
+	struct device *device;
+	unsigned int nregions;
+	unsigned int i, n;
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
+	nvm = kzalloc(struct_size(nvm, regions, nregions), GFP_KERNEL);
+	if (!nvm)
+		return -ENOMEM;
+
+	kref_init(&nvm->refcnt);
+
+	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
+		if (!invm->regions[i].name)
+			continue;
+
+		char *name = kasprintf(GFP_KERNEL, "%s.%s",
+				       dev_name(&aux_dev->dev), invm->regions[i].name);
+		if (!name)
+			continue;
+		nvm->regions[n].name = name;
+		nvm->regions[n].id = i;
+		n++;
+	}
+	nvm->nregions = n; /* in case where kasprintf fail */
+
+	nvm->base = devm_ioremap_resource(device, &invm->bar);
+	if (IS_ERR(nvm->base)) {
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
+module_auxiliary_driver(intel_dg_mtd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION("Intel DGFX MTD driver");
diff --git a/include/linux/intel_dg_nvm_aux.h b/include/linux/intel_dg_nvm_aux.h
new file mode 100644
index 000000000000..00b6c1301bd8
--- /dev/null
+++ b/include/linux/intel_dg_nvm_aux.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_DG_NVM_AUX_H__
+#define __INTEL_DG_NVM_AUX_H__
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+#include <linux/ioport.h>
+#include <linux/types.h>
+
+#define INTEL_DG_NVM_REGIONS 13
+
+struct intel_dg_nvm_region {
+	const char *name;
+};
+
+struct intel_dg_nvm_dev {
+	struct auxiliary_device aux_dev;
+	bool writable_override;
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
