Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D1DCD1283
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tn1o2MC09BK0GacXdpDzIAGKtj+kB5CRI5xprgqhpH4=; b=IHzPWbS8m/pwGF
	sqjKRKGadRrXzRHrGq2Ex4FzTJKPT6HmmiJ4x0qLg1BeKj/a2fde4hrUQ8WusZ3KpSYxx68tgKmld
	xdxnL7fJeXHC1r05Z4jrba2djx+6ehGs2yCAG4b/HCbo50RW4zQSgHqAqsBnNA01SaXOtQwL8/uur
	WBjx82/DrIGuok2MjmVCuMVvMQhZXpcDR1cD20Gd1GaXVkyMip/vFaTX27xXPOrE6VsDTSWnR6/mp
	CLZ+I90YOTNFV36UslhBsICTW0MdsyEc0aQpEN30thjy223k+4HIdSOzNxdrhalAMO5HRtxBsDkTr
	DH9oF6BpgjM+oOxEGg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpops-0000000DtEh-1tIA;
	Thu, 28 Mar 2024 12:26:24 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpopo-0000000DtCy-0v8b
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 12:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711628780; x=1743164780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8/ixFWtHZGV2ouT+71ybMHWWwBbswNk2afT9YSZgxFo=;
  b=NLiYdoPDdfq+P9CliYPfCWlpDh4OhMwPOgbH5YXRW8aasx6U2RnRiK2A
   +VZYhRtRg1YNhburWDvxRhvFD8zrp9iAr0SR7LmQaGSwc4UG8utmOZVIp
   sdgh8oQllUdEIb97IWTKCED32OG4WBr5j/LX1Zr+FwJZW+5zCqcdK8frr
   dUVO0G1Oi2qHlA2bF+Xt37SWiI6L9qA7pEe+xZEekQCp0jH30x5p7g5Qh
   nTH26TLi1d/BGG87aX6qRCXtwhFeyWJXRl+T44W8KePv4s47/4BSKiuY6
   fntNXC5nBCuukToD6b/TJ2G4dFRxXzkiLoSivh3erO+YgcGSKqiPyhcKU
   A==;
X-CSE-ConnectionGUID: kMHOVDr1TCGRIuZp0FqPFQ==
X-CSE-MsgGUID: VtRNfoAyR6yaOYw3f3xYkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17505452"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="17505452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16657563"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:17 -0700
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
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/13] spi: add auxiliary device for intel dg spi
Date: Thu, 28 Mar 2024 14:22:24 +0200
Message-Id: <20240328122236.1718111-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328122236.1718111-1-alexander.usyskin@intel.com>
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_052620_296270_FB11A411 
X-CRM114-Status: GOOD (  12.32  )
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

Add auxilary bus device structure for
Intel Discrete Graphics SPI device.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 include/linux/intel_dg_spi_aux.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 include/linux/intel_dg_spi_aux.h

diff --git a/include/linux/intel_dg_spi_aux.h b/include/linux/intel_dg_spi_aux.h
new file mode 100644
index 000000000000..d4c3830d56d6
--- /dev/null
+++ b/include/linux/intel_dg_spi_aux.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_DG_SPI_AUX_H__
+#define __INTEL_DG_SPI_AUX_H__
+
+#include <linux/auxiliary_bus.h>
+
+#define INTEL_DG_SPI_REGIONS 13
+
+struct intel_dg_spi_region {
+	const char *name;
+};
+
+struct intel_dg_spi_dev {
+	struct auxiliary_device aux_dev;
+	bool writeable_override;
+	struct resource bar;
+	const struct intel_dg_spi_region *regions;
+};
+
+#define auxiliary_dev_to_intel_dg_spi_dev(auxiliary_dev) \
+	container_of(auxiliary_dev, struct intel_dg_spi_dev, aux_dev)
+
+#endif /* __INTEL_DG_SPI_AUX_H__ */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
