Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF25BD1CDD5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2024 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ft7W7mhLY1JHkhTwHcnb0QCSYQCZE7meBw5s2kYs0VI=; b=N5E4ivyOZKNv88
	1AcmzFwHzr8sQTeTZzWnSx8VjM3Y0JawivmYUqZ6bNzWDnLBCFFc3FsA3uGw1/AIziWlIqDK8Qtky
	GP7yATYcpxRmM+QgByM2hUWmVuEuKsMiVqQdhHx93OB9iUdrmxHKgk6I5xjc4cCYEH+WEBswcG/ED
	VH+xXUfzBEETk/TZoWx3P7iVOwsb8WupnVjiu00rHAA7rlQiSSxlENTrUCQ5GpRRu65zPvP46sBZf
	f78xUQymN8yQFzovRiYiqG6FgKgpTo9uSeldrKP3ix5FgchyKuOXcBQICkFMHFAwc2iB55N/EAN5W
	rHTk8YXxrMag8T4UGs3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CWn-0000000Ab3Y-1dlA;
	Tue, 22 Oct 2024 10:54:17 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CWU-0000000AajQ-09TB
	for linux-mtd@lists.infradead.org;
	Tue, 22 Oct 2024 10:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729594438; x=1761130438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kz66ZBvdDfnbLzNXF5AzvRxd5T6+xWlmdNEg3YMnw0g=;
  b=f+mTZsl3X5cP/MouGDK0HSmPCvds+34IvzBVwZrisCpL9tgS3U8NPymT
   2NIjEbmiBfH3FyUlyUGcw7OS6SShFdoc9QpKatDUB+NqYJASM7Nke6+0I
   jrx5v5sIiUVEtXs5pPUIMCBQa6kVi/A1+G50NSbqQ1gVhwGY9XoydV8J9
   /1S/PIhaKIQc2rPU+LMWKnvENOndABGTZ6BcUDsr7tYFQLZoOKFowflyJ
   ut0DGt/a+7uR/SYuE/I8YD/e//fyc/yzwZ34VgdZRTGtd9BXFoBLwjHoC
   ujgXjvI1JhibBMZmHvWukw3DV9L7lEBivPaYcQFWZcMZKeLb6ruaEALpI
   w==;
X-CSE-ConnectionGUID: 1cLMcPhJSdaWWHxgOPZTZw==
X-CSE-MsgGUID: hQ1Y4vjbQ3aLADB07FU0JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39705105"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="39705105"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 03:53:51 -0700
X-CSE-ConnectionGUID: FaLlAvxpTDqRghBFYvas2w==
X-CSE-MsgGUID: +jwW4OFnSHSIwBLP+OAVog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79847687"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 03:53:46 -0700
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
Subject: [PATCH 08/10] drm/i915/nvm: add support for access mode
Date: Tue, 22 Oct 2024 13:41:17 +0300
Message-ID: <20241022104119.3149051-9-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022104119.3149051-1-alexander.usyskin@intel.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_035358_200326_164D9C4A 
X-CRM114-Status: GOOD (  13.39  )
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
 drivers/gpu/drm/i915/intel_nvm.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_nvm.c b/drivers/gpu/drm/i915/intel_nvm.c
index 003c89cbcb88..98c11e027b76 100644
--- a/drivers/gpu/drm/i915/intel_nvm.c
+++ b/drivers/gpu/drm/i915/intel_nvm.c
@@ -10,6 +10,7 @@
 #include "intel_nvm.h"
 
 #define GEN12_GUNIT_NVM_SIZE 0x80
+#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
 
 static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
 	[0] = { .name = "DESCRIPTOR", },
@@ -22,6 +23,29 @@ static void i915_nvm_release_dev(struct device *dev)
 {
 }
 
+static bool i915_nvm_writeable_override(struct drm_i915_private *i915)
+{
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	resource_size_t base;
+	bool writeable_override;
+
+	if (IS_DG1(i915)) {
+		base = DG1_GSC_HECI2_BASE;
+	} else if (IS_DG2(i915)) {
+		base = DG2_GSC_HECI2_BASE;
+	} else {
+		dev_err(&pdev->dev, "Unknown platform\n");
+		return true;
+	}
+
+	writeable_override =
+		!(intel_uncore_read(&i915->uncore, HECI_FWSTS(base, 2)) &
+		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
+	if (writeable_override)
+		dev_info(&pdev->dev, "NVM access overridden by jumper\n");
+	return writeable_override;
+}
+
 void intel_nvm_init(struct drm_i915_private *i915)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
@@ -43,7 +67,7 @@ void intel_nvm_init(struct drm_i915_private *i915)
 
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
