Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63876CA5FC5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2026 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqkS2lVCkR+RRzYZK7tG4Fvjk0DFeQjDq3VT5XC2GzU=; b=qUAUeZc9HL1aPh
	4fjMDa61ph8bLzdqPzsI9YydmAlpTnH1WlpT/hq0L+l1WfWs4qjBPDibu7nV+bZ8W4U3RnxbTDIrS
	Ks1nmBz2sIGlN3T/yiPJQ77LHXOYHPSzCZ9uOyJmdGJqKKmYzCoJanZBLyn5Gll1MEEaQnW3Cmoop
	Q9Pjji9qmXU7nDdWZnrrjKxEzevFKVght2X09keGxqULp+E6+SZ+hXiu/CgF7Jl/2QS38aaQpRFkR
	VxP12Cd8QjnPuP8WC/6rx2UOyESByLTm+kLtvaosPWWtEPayOOtJpEyUaL+rmseTFDJ7liLbAehaA
	yGAhDP6Rs/aEp2//XjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv5n-00000006GZh-1OWE;
	Wed, 30 Sep 2026 14:15:31 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv5h-00000006GWi-3Jm9
	for linux-mtd@lists.infradead.org;
	Wed, 30 Sep 2026 14:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790777726; x=1822313726;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=r6J6OMUuexc90xruyZevzc+hksoDZaaD+TsUNdnaTAg=;
  b=cBAKd4HnVZx/6JNRUITLPiCoPc5bcj14f8oX1Tgr2NEc7y2sLZVWE+L1
   lPwgs90ffsRqqCK/ehX94/AohT5aaBIIHkrRJEg6UFy5WsNpc9X/symmA
   2T4hW7SPn3RU0IPdgjNm5orasf9sg+N6713aL5a2J/uACCnJWjFJXMLqP
   uqclZkGFDYqxQf28fZC1RdzgEWxICfTH6wTxW/HRDeEnlpPyi6FGehZXd
   HKDP9MMInqgiR4hi1Cr63I8zQ47rr42PODj5LQKHM38YU1Ww/uj/89ELD
   FrBbYS7fX4edxBsnxqdHW18w5lsSXSM3MszIKLC9UUVGafC2Y8AxOzmgg
   w==;
X-CSE-ConnectionGUID: jip20zwKRdOQ0uD6qpVQWw==
X-CSE-MsgGUID: MVH8RM/8SVi2tURvcq/8AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90470014"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90470014"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:15:06 -0700
X-CSE-ConnectionGUID: fOVCP+umQgCtQQCqJjmfTA==
X-CSE-MsgGUID: TdFU7jRiTDiSb5/IIIHGYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279499634"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:15:02 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Wed, 30 Sep 2026 17:14:47 +0300
Subject: [PATCH v3 2/2] drm/xe/nvm: define survivabilty partition
MIME-Version: 1.0
Message-Id: <20260930-cri_surviv-v3-2-357aeed5fc60@intel.com>
References: <20260930-cri_surviv-v3-0-357aeed5fc60@intel.com>
In-Reply-To: <20260930-cri_surviv-v3-0-357aeed5fc60@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Menachem Adin <menachem.adin@intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790777694; l=2014;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=r6J6OMUuexc90xruyZevzc+hksoDZaaD+TsUNdnaTAg=;
 b=JvPy//bs0zDBw4pGxJbZY8ZpVFjuqHVy5C93fVA5jAW0TcsKYD53soRLZiE2I2Whnjms8mPR/
 uRjQj4eFtBEDKgxP8+WyvXmH3/7GS/0yzpArkMTk8wh9rdsIdxPSzOK
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_071525_880243_7083F55E 
X-CRM114-Status: GOOD (  11.37  )
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
storage is open for write override.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 51a1a431ad85..783c3103a8a4 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -56,10 +56,11 @@ static bool xe_nvm_non_posted_erase(struct xe_device *xe)
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
 
@@ -68,6 +69,7 @@ static bool xe_nvm_writable_override(struct xe_device *xe)
 		reg = PCODE_SCRATCH(0);
 		test_bit = FDO_MODE;
 		test_val = FDO_MODE;
+		s_size = SZ_8M;
 		break;
 	case XE_BATTLEMAGE:
 		reg = HECI_FWSTS2(DG2_GSC_HECI2_BASE);
@@ -91,12 +93,17 @@ static bool xe_nvm_writable_override(struct xe_device *xe)
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
 
@@ -143,7 +150,7 @@ int xe_nvm_init(struct xe_device *xe)
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
