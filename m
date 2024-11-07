Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069FFD43352
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pf8DJ52cDpvJAtG5A1PK6kiP90tUxf02jp4Filiuu8w=; b=ZAAP48M3j7wl/q
	7hYNe0E+1EL7NRyjRCW/wF7nIxXTX9oGvFJ2cyVGbhYxuxzXh5G5BLq1XEw07HPOvI6j49ShoLcio
	cabl2cyxuULTmGkvzZJh6HgSGlMBXJ5D3+HG6yHt2SkKAf8EPGuzBqo4/2ModyGb8T3mpUrsOuyCM
	/BOOmuqXZzNbZ9kKP/Ud/mX+BZGiXYlJcej6GCJl85BdrWY0DllMJNKQNF8tiAmRTBV5rvH8ccTuP
	79R/3eHyIjeXFPxY7NRJFKmBWmDHx7/HbCChh+yuGlSpbfkR9+qSyaAcJ7PiZOiWOiMfgi9cDFTAr
	Z/sq6sVHnoxZyWx+70XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92X7-000000075cq-3kcW;
	Thu, 07 Nov 2024 13:26:45 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92Wx-0000000759T-2Ob5
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 13:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730985995; x=1762521995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2geMWtR1gyVZ3pH9RD9xPM3qBW5E9vn9pyoLUI63Cz0=;
  b=At4fWGX2rCze9woElZwqRibIuStg8CKicO/tjtQRithPQBXwpsG4tg/Q
   SvUHVR0P7wArfxvdVdlQUN5T5pUwzB/fzOeIMfpWBuipRsHcxvwUSmhbj
   bFeZlQFkf6BjHGLln5bPKcLIJxfVprlENPnPls2sjelB40bikAZiTzGxi
   pQ/H8UzkBezZAwTWpOMbDY+HJHclY628GZeA4ptDRPjeudOCrokI/5qLT
   6HCkcp5QqOlJ7T7/FtNtmqUEZC9B+QZF3zS4gNkgKTi2BVO5kLdhAfLW+
   zNgIXSW5G1y3eRzvwQeJyFwgHT66usBwNWl5/L/2xJuVMoWyg0PR2jnrJ
   Q==;
X-CSE-ConnectionGUID: cEBbjNrvSf+AYPIMLfXM9Q==
X-CSE-MsgGUID: dKoOPLdzQ8+D+JqGDUfT6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34750806"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="34750806"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:26:35 -0800
X-CSE-ConnectionGUID: HHFEaR3FQOG3XdbS/smHvw==
X-CSE-MsgGUID: cVfj+kOWQayJ5r2SICi7jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="89921755"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:26:31 -0800
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
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v2 08/10] drm/i915/nvm: add support for access mode
Date: Thu,  7 Nov 2024 15:13:54 +0200
Message-ID: <20241107131356.2796969-9-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241107131356.2796969-1-alexander.usyskin@intel.com>
References: <20241107131356.2796969-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_052636_592358_3F0B5F11 
X-CRM114-Status: GOOD (  13.29  )
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

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/intel_nvm.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_nvm.c b/drivers/gpu/drm/i915/intel_nvm.c
index 214c4d47a9cd..cbd776e667ad 100644
--- a/drivers/gpu/drm/i915/intel_nvm.c
+++ b/drivers/gpu/drm/i915/intel_nvm.c
@@ -10,6 +10,7 @@
 #include "intel_nvm.h"
 
 #define GEN12_GUNIT_NVM_SIZE 0x80
+#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
 
 static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
 	[0] = { .name = "DESCRIPTOR", },
@@ -22,6 +23,28 @@ static void i915_nvm_release_dev(struct device *dev)
 {
 }
 
+static bool i915_nvm_writeable_override(struct drm_i915_private *i915)
+{
+	resource_size_t base;
+	bool writeable_override;
+
+	if (IS_DG1(i915)) {
+		base = DG1_GSC_HECI2_BASE;
+	} else if (IS_DG2(i915)) {
+		base = DG2_GSC_HECI2_BASE;
+	} else {
+		drm_err(&i915->drm, "Unknown platform\n");
+		return true;
+	}
+
+	writeable_override =
+		!(intel_uncore_read(&i915->uncore, HECI_FWSTS(base, 2)) &
+		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
+	if (writeable_override)
+		drm_info(&i915->drm, "NVM access overridden by jumper\n");
+	return writeable_override;
+}
+
 void intel_nvm_init(struct drm_i915_private *i915)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
@@ -43,7 +66,7 @@ void intel_nvm_init(struct drm_i915_private *i915)
 
 	nvm = i915->nvm;
 
-	nvm->writeable_override = true;
+	nvm->writeable_override = i915_nvm_writeable_override(i915);
 	nvm->bar.parent = &pdev->resource[0];
 	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
 	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
