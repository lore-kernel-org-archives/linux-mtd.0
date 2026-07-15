Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A15C44501
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2026 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAl3IBBJvs/8Ub1chsiGhP3PdSATDsGOzKdNL+O2SFA=; b=egj0QXqLGbKyVJ
	xjvWlJU61za2yhlo8hbiXA4V6z05Vr7HyNvb/SZsl2hEYwRr7XSioSKGSYggklGsu+T5UESuBJnqi
	FcDtgAK6c+x7putlUf4DfvKq8BYUP3bnUcI2j98Woia0XO1wB7n9BZ9U1G072ZpJVIVrNHBdNx9dt
	2sesf9YE0L78OrR2f8Z+shyNXIus/lXs/wVWLiSQXwyq7N08pLNxX9U92Y7uR4sK5K0cVbCgcrpsA
	adPVWHoA8Ka7iURvgj8iV+moR6fD2Cb4x0HS9aAgUUmkUicWJZfYmQBJlFvbeGGk16OnMGscm5CZA
	oQOrHmqz0ArWvXI3a62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0IQ-0000000F4A4-07XC;
	Wed, 15 Jul 2026 14:09:10 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0IM-0000000F45U-2gf5
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jul 2026 14:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784124546; x=1815660546;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=3UKX+8BIib6UlKTc8Qmw7hs4FxBN9EUwfGAbz940ins=;
  b=ncLrHfqMDoMu19d/6T5BhhVq73XKz+1pbCTdg+ka/FDjhWInLxhbk+of
   +PjSt/PVivHofskJh7AOiaV/AHRvtB8kyWu9IzXQAt5p4LJ0uB4NJ+/Y8
   kCH9/SaWVQo3BTdeRAv/dYlWL+/md5pLOoll2SGU8KbDB5L+TRTmBsT/x
   uG5eJQObhDHgvPnzQY94kjsKHG/ZYYrTtUdSLjcOOSJO7W+csjAcVP9f4
   RNrfutXcKB8+pFOAChKVwnJcwg9kze23j3D0OA0HwCGOhFWu9ASDg/GIW
   647rE6M88RxCp/xfiq65ndbDQhol8j8t/hcSonuDH0gMzKAAJ4e2qHnYQ
   g==;
X-CSE-ConnectionGUID: Tq2h78dRQVi+lNxFIRxuww==
X-CSE-MsgGUID: 4IjbW6FzRbyCAZw9KidJtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84615791"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84615791"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:09:06 -0700
X-CSE-ConnectionGUID: +IBRNAOvTkmok3aAbVjY0Q==
X-CSE-MsgGUID: C0clNgblQhOi596HulJy8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="251777934"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:09:03 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Wed, 15 Jul 2026 16:45:30 +0300
Subject: [PATCH 2/2] drm/xe/nvm: define survivabilty partition
MIME-Version: 1.0
Message-Id: <20260715-cri_surviv-v1-2-61763a6f1076@intel.com>
References: <20260715-cri_surviv-v1-0-61763a6f1076@intel.com>
In-Reply-To: <20260715-cri_surviv-v1-0-61763a6f1076@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784123168; l=2005;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=3UKX+8BIib6UlKTc8Qmw7hs4FxBN9EUwfGAbz940ins=;
 b=yBx5lijfUBZz4oift9rnzndtHkCCy3xKlLYsITWioGCl4uyc4tYgpj3ZLIhssSD9L3pQC2qNL
 KXUTlq2cfcNCG/AYXaSv7p22JnFHy3Xv6Dw2x9XecWSz1OZ12+TtWgk
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_070906_793640_52148389 
X-CRM114-Status: GOOD (  11.13  )
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

Define 8M survivability partition for CRI when
storage is open for write.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 1ea67eaeae24..54de0dbe1fa4 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -55,10 +55,11 @@ static bool xe_nvm_non_posted_erase(struct xe_device *xe)
 	}
 }
 
-static bool xe_nvm_writable_override(struct xe_device *xe)
+static bool xe_nvm_writable_override(struct xe_device *xe, size_t *survivability_size)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	bool writable_override;
+	size_t s_size = 0;
 	struct xe_reg reg;
 	u32 test_bit, test_val;
 
@@ -67,6 +68,7 @@ static bool xe_nvm_writable_override(struct xe_device *xe)
 		reg = PCODE_SCRATCH(0);
 		test_bit = FDO_MODE;
 		test_val = FDO_MODE;
+		s_size = SZ_8M;
 		break;
 	case XE_BATTLEMAGE:
 		reg = HECI_FWSTS2(DG2_GSC_HECI2_BASE);
@@ -90,12 +92,17 @@ static bool xe_nvm_writable_override(struct xe_device *xe)
 		break;
 	default:
 		drm_err(&xe->drm, "Unknown platform\n");
+		*survivability_size = 0;
 		return true;
 	}
 
 	writable_override = (xe_mmio_read32(mmio, reg) & test_bit) == test_val;
-	if (writable_override)
+	if (writable_override) {
 		drm_info(&xe->drm, "NVM access overridden by jumper\n");
+		*survivability_size = s_size;
+	} else {
+		*survivability_size = 0;
+	}
 	return writable_override;
 }
 
@@ -142,7 +149,7 @@ int xe_nvm_init(struct xe_device *xe)
 	if (!nvm)
 		return -ENOMEM;
 
-	nvm->writable_override = xe_nvm_writable_override(xe);
+	nvm->writable_override = xe_nvm_writable_override(xe, &nvm->survivability_size);
 	nvm->non_posted_erase = xe_nvm_non_posted_erase(xe);
 	nvm->bar.parent = &pdev->resource[0];
 	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
