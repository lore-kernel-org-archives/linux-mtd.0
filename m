Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6750C19F32
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23Asv4IvtINR594J/EmQSacR33bgdj8/hCzA7VQuM4Y=; b=S4VoVsy/1jolpt
	Fw+MzN/XaiZezW26sDEgksJ3RaBcye0MplVnmygUzybhvipSzHUemvlCz45JN90D8Lx/Ajj6unSEn
	qGx1HgSZLPMkwIVd4OpxXhltgX6P39Q8RLBb8NmTmZFyCK4NroOou349umFGXHbiPEna5bEeCTEse
	5pueq8DuBqQkrx/Hi8pTdiP9dvwczaKdqHz+cS/c+QgTJP1AIZzx/jw69uHeSJTpQs6h8ukgsZ3O/
	G6g7UQsfbUqS0NtDmj1JNjj68ekb6IecHBn/6G2E3XADm61hsr321Hnd+RlxOl6bWcDc2VBfLDZDY
	nDUWNDKflmFMO9uwiBGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIYH-0000000484j-0o2S;
	Wed, 26 Feb 2025 14:38:21 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnH4v-00000003llI-2S7I
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 13:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740575038; x=1772111038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8jiS+kPdQZP7EWPxn7Of1UXgpTQ62xuev1qCkeye9+0=;
  b=WD4V6KQ3kyWGM6cnCyLpCh7sjJY4oHtn/27WBchHJxPSKRi8ffPjdELj
   C0C+24eC5HI82UjPY/ZV0IT/n8vr5h2x+OKemaacv0Ig7PDVb/trGfGJm
   6Md/y9pONLsjEd/trGCLmkk+TbUjjHXZiIZS64zApraqAcKlUW21ix8kb
   Sz4SeR15MCCYKwyLKbd87HtjNO2HZ4CGPgc+ZlYrPDhHCdY93RfS4ddCm
   Aqnp67R/RDt7JTF/4cqFt7I1DsoVw3rbYVSuYIWKOsmBI+IIUT+3+9vVd
   5HQCAKzY2s6tI9BYM75KrDt47X6UsuGB7eSKN7ZZK6U5ID2IjYQ14bX2V
   A==;
X-CSE-ConnectionGUID: 2PdOa7dHQ4CeNN5T4ZntIQ==
X-CSE-MsgGUID: w0ne2Z0ZRDO0Uz2UMvlPRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41341680"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41341680"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:03:58 -0800
X-CSE-ConnectionGUID: kh+122C9SgecQqqNpusQEg==
X-CSE-MsgGUID: A21xIJetS9CbUuTMCxUurQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121691034"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:03:52 -0800
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
Subject: [PATCH v5 11/11] drm/xe/nvm: add support for access mode
Date: Wed, 26 Feb 2025 14:51:43 +0200
Message-ID: <20250226125143.3791515-12-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226125143.3791515-1-alexander.usyskin@intel.com>
References: <20250226125143.3791515-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_050357_664735_49680B29 
X-CRM114-Status: GOOD (  14.54  )
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
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_heci_gsc.c      |  5 +----
 drivers/gpu/drm/xe/xe_nvm.c           | 32 ++++++++++++++++++++++++++-
 3 files changed, 36 insertions(+), 5 deletions(-)

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
index 3ea325d3db99..266097a5b98b 100644
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
index 26de7d4472c8..08fe3bf04cf0 100644
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
@@ -25,6 +28,33 @@ static void xe_nvm_release_dev(struct device *dev)
 {
 }
 
+static bool xe_nvm_writeable_override(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	resource_size_t base;
+	bool writeable_override;
+
+	if (xe->info.platform == XE_BATTLEMAGE) {
+		base = DG2_GSC_HECI2_BASE;
+	} else if (xe->info.platform == XE_PVC) {
+		base = PVC_GSC_HECI2_BASE;
+	} else if (xe->info.platform == XE_DG2) {
+		base = DG2_GSC_HECI2_BASE;
+	} else if (xe->info.platform == XE_DG1) {
+		base = DG1_GSC_HECI2_BASE;
+	} else {
+		drm_err(&xe->drm, "Unknown platform\n");
+		return true;
+	}
+
+	writeable_override =
+		!(xe_mmio_read32(&gt->mmio, HECI_FWSTS2(base)) &
+		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
+	if (writeable_override)
+		drm_info(&xe->drm, "NVM access overridden by jumper\n");
+	return writeable_override;
+}
+
 void xe_nvm_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -49,7 +79,7 @@ void xe_nvm_init(struct xe_device *xe)
 
 	nvm = xe->nvm;
 
-	nvm->writeable_override = false;
+	nvm->writeable_override = xe_nvm_writeable_override(xe);
 	nvm->bar.parent = &pdev->resource[0];
 	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
 	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
