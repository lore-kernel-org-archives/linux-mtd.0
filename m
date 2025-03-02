Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F53C282D1
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Mar 2025 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJTmsBcjO/xT5y0y0R2sMnGOHDeDiGy/K0gFFLTAShg=; b=MxNUexv8YhO+V7
	B87s6H+DR9Nr9dSiPcGQHe1ePxML6JRQHPtd8XCSKnvOHlolH4bjb3SvOXTKFjKA2o0hRujf2B1D5
	6pvAlVZCGwzmDKZKUaB7EQNtv7fEZcBaFWtFwBBNi8N/qV72//Z88HBFwZkHB08JbLXQOStSPlcBl
	hunxb75W6pbe9SsLUuBSMEEL++mT9+iCyLiBreEDLmiszFbTUP0jBePamtsBOaA+5rAs+PXGiBGp/
	z5SdyPDCG0caQTXzl2ndu4NPnIy7PWT/1xlc8ssaRMAs1AtNxJf2JkKPY6eUp9C4CedneEPalicxi
	a+W6sYN7mCI0CrzcTQjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tokCO-0000000G8Bh-1s94;
	Sun, 02 Mar 2025 14:21:44 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tokCL-0000000G83h-3RCN
	for linux-mtd@lists.infradead.org;
	Sun, 02 Mar 2025 14:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740925302; x=1772461302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rjKY1l/SEQEYfQRD5GQW4b/ZP8WwEI3BeQdcMqQ/5zY=;
  b=kILuXNbVbAMi9EXdzbaD1SHyiNu688MmHA+t94CcjDJdult81xY2bzGa
   cRyq0kGotRjWC5oUVB6SSQ3NKnQxoYL874JyZlxfSrEgZau1g5MpbdWTU
   ryuZaLQ1VlJveuPIaZJVcigMT/lctaGThE7Pt5pgxzSChX35X5UjooSxo
   EpbXj7b5fu1xR3ANpmF13I2+qgpVm9fgO7kqapAU+H400KywbM3lcZ1N3
   VoYS5MgE0uBhpIoD1TMCjMwtolULHghKhbtF6OHmts+bs7w3/rrgoCDjp
   GoJjVbw19QbNyDaSoXEz3puPPZHv7YZyDuBxU86Hl5i6FnteupW1w4hco
   w==;
X-CSE-ConnectionGUID: UyN5mybVR0S+ogkG6zB0vQ==
X-CSE-MsgGUID: MRL2sUo3RfuW8Lqb0FZLQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="67176513"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="67176513"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 06:21:42 -0800
X-CSE-ConnectionGUID: F0lrrH2LR3aSZOIBrkpqvQ==
X-CSE-MsgGUID: MrjAYm3+RlKBPEaAyAr+3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="122737475"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 06:21:35 -0800
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
	Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v6 11/11] drm/xe/nvm: add support for access mode
Date: Sun,  2 Mar 2025 16:09:21 +0200
Message-ID: <20250302140921.504304-12-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302140921.504304-1-alexander.usyskin@intel.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_062141_869279_4C9002B2 
X-CRM114-Status: GOOD (  13.70  )
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

Check NVM access mode from GSC FW status registers
and overwrite access status read from SPI descriptor, if needed.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  4 +++
 drivers/gpu/drm/xe/xe_heci_gsc.c      |  5 +---
 drivers/gpu/drm/xe/xe_nvm.c           | 37 ++++++++++++++++++++++++++-
 3 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 7702364b65f1..9b66cc972a63 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -16,6 +16,10 @@
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
 
+#define DG1_GSC_HECI2_BASE	0x00259000
+#define PVC_GSC_HECI2_BASE	0x00285000
+#define DG2_GSC_HECI2_BASE	0x00374000
+
 #define HECI_H_CSR(base)	XE_REG((base) + 0x4)
 #define   HECI_H_CSR_IE		REG_BIT(0)
 #define   HECI_H_CSR_IS		REG_BIT(1)
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 27d11e06a82b..6d7b62724126 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -11,15 +11,12 @@
 #include "xe_device_types.h"
 #include "xe_drv.h"
 #include "xe_heci_gsc.h"
+#include "regs/xe_gsc_regs.h"
 #include "xe_platform_types.h"
 #include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
 
-#define DG1_GSC_HECI2_BASE			0x259000
-#define PVC_GSC_HECI2_BASE			0x285000
-#define DG2_GSC_HECI2_BASE			0x374000
-
 static void heci_gsc_irq_mask(struct irq_data *d)
 {
 	/* generic irq handling */
diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 26de7d4472c8..8aec20bc629a 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -6,8 +6,11 @@
 #include <linux/intel_dg_nvm_aux.h>
 #include <linux/pci.h>
 
+#include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_mmio.h"
 #include "xe_nvm.h"
+#include "regs/xe_gsc_regs.h"
 #include "xe_sriov.h"
 
 #define GEN12_GUNIT_NVM_BASE 0x00102040
@@ -25,6 +28,38 @@ static void xe_nvm_release_dev(struct device *dev)
 {
 }
 
+static bool xe_nvm_writable_override(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	resource_size_t base;
+	bool writable_override;
+
+	switch (xe->info.platform) {
+	case XE_BATTLEMAGE:
+		base = DG2_GSC_HECI2_BASE;
+		break;
+	case XE_PVC:
+		base = PVC_GSC_HECI2_BASE;
+		break;
+	case XE_DG2:
+		base = DG2_GSC_HECI2_BASE;
+		break;
+	case XE_DG1:
+		base = DG1_GSC_HECI2_BASE;
+		break;
+	default:
+		drm_err(&xe->drm, "Unknown platform\n");
+		return true;
+	}
+
+	writable_override =
+		!(xe_mmio_read32(&gt->mmio, HECI_FWSTS2(base)) &
+		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
+	if (writable_override)
+		drm_info(&xe->drm, "NVM access overridden by jumper\n");
+	return writable_override;
+}
+
 void xe_nvm_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -49,7 +84,7 @@ void xe_nvm_init(struct xe_device *xe)
 
 	nvm = xe->nvm;
 
-	nvm->writeable_override = false;
+	nvm->writable_override = xe_nvm_writable_override(xe);
 	nvm->bar.parent = &pdev->resource[0];
 	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
 	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
