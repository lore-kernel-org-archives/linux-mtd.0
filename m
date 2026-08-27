Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E1EC5DF9D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2026 05:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n6nhcbGAB3iF7z7L2ClrZ+McIQ5h2/kMMkOfN1H3Rrk=; b=nxXcZ12JCG+mrk
	Ey+Un5kgnXy5FHo0r6PT+U3Ly8Gp4zbO5d0YLDnF4VY/uzPu4qvc15Yeh5F2geiZUDCAIjZaX04R2
	DM3EbkcEC6nEhNaWFjTxrLdni10YzGrj9mnneT4oequL8/5yrojtNy5bscQDh8afLmj5bKJzIf5gj
	ho1E0ITrHmZeXXzv2SnBZY4d7RVfMQwENzQ8hNhJBgtyiDVVzlhwTSAzG/8iPf3WVKSuhIyFyGBEB
	MFQI+nsIY9dxOjbYr2FfzsNXIRPVWG996MJbQoOiE2XTWGuzi8oJfjNzpz5/r06O7hRq/RAMrHba+
	wHP7u3xZcgxaLBVDomLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzSPa-00000003Pej-0KZV;
	Thu, 27 Aug 2026 05:12:26 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzSPW-00000003Pde-1MA9
	for linux-mtd@lists.infradead.org;
	Thu, 27 Aug 2026 05:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787807542; x=1819343542;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=jplI6Oc3+3ZSXLSuE+Ach9nhgnX57Rptzw/LsuGgC1g=;
  b=lu0OBPLVE1JKiUU7iPW9Kbn4it5IdVrmEvVkfKmT3u0O8WpZXeVZRyzI
   JFSHBb5iZwTDmoMp+Oq13CF+mkiUCSMNgxY0sxGYduRDvoOErVxz4Rnnr
   ssS1/BjDLihokBsSnk5PWbWRAjQMrsIJB8CH2TS6Wz5LUevr/cP7ZKwdj
   hjMLmOZCqUZ7yZJDwNpW1/eJcw6zM31zSmil3l2chI10+ac3kV2MaRceB
   OqbKOxa2j+GOz4/zEBntgIcwPi6MaC9cz9NSv6MvlQhl3JoHawE4PbV8+
   Oo7EzV2mmt3Szdvz6by1rMgC/meKAkPicjRD5ZDZ4czemRAI3/77DZ4J+
   g==;
X-CSE-ConnectionGUID: D68EQy/TT1uRttfAX2inyA==
X-CSE-MsgGUID: X0gcRorfQ/KnJV86m4qrYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88159971"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88159971"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 22:12:19 -0700
X-CSE-ConnectionGUID: K1BmynRxRiqXZKLk7KJeng==
X-CSE-MsgGUID: 3f+bCbmmQxa+S5aPjgo3eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271979932"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 22:12:17 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Thu, 27 Aug 2026 08:11:56 +0300
Subject: [PATCH v2] mtd: mtd_intel_dg: reset poll counter for each erase
MIME-Version: 1.0
Message-Id: <20260827-mtd_eraze_to_fix-v2-1-1395ae4fb795@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6DIBREr2L+ujSAqUJXvUdjCOq3/qSKAULaG
 u5e6gE6uzfJvNkhoCcMcK128JgokFsLyFMFw2zXBzIaC4PksuFKNmyJo0FvP2iiMxO9WN1yhXz
 SuhcWymzzWOpDee8KzxSi8+/jIYlf+0eWBBOsV1bpuoS3lxutEZ/nwS3Q5Zy/ww6QcbAAAAA=
X-Change-ID: 20260826-mtd_eraze_to_fix-3708e0f99b1a
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Menachem Adin <menachem.adin@intel.com>, stable@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787807537; l=1851;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=vXZtjOotZCVR+xsRZA0rIviHyugLPf2qFp/jodZPmYw=;
 b=SYT4x5TEJSV6W7tgkrgpQLF0ikG4f8qzCFOJoR2z39DBB/6wsTT8T1Dn0HXd1IZ8/fFnEeiVO
 oNbiqwvN28uDGyWKghXGft1r5donYh+ihopCaM5fzS51hEWOuE04Vr+
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_221222_426254_C70053E8 
X-CRM114-Status: GOOD (  11.21  )
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

From: Menachem Adin <menachem.adin@intel.com>

The non-posted erase polling counter is initialized only once per MTD
erase request. Large requests therefore share the polling budget across
all 4K erase commands and can fail with -ETIME even though no individual
command timed out.

Reset the counter for each 4K erase command so every operation gets the
intended completion timeout.

Cc: stable@vger.kernel.org
Fixes: a1c940cbf505 ("drm/xe/nvm: add support for non-posted erase")
Signed-off-by: Menachem Adin <menachem.adin@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
Changes in v2:
- Add Fixes tag and stable cc
- Link to v1: https://lore.kernel.org/r/20260826-mtd_eraze_to_fix-v1-1-b8a893333075@intel.com
---
 drivers/mtd/devices/mtd_intel_dg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index f2fa8f68d190..6e226c0c7f17 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -387,7 +387,7 @@ idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_a
 	void __iomem *base2 = nvm->base2;
 	void __iomem *base = nvm->base;
 	const u32 block = 0x10;
-	u32 iter = 0;
+	u32 iter;
 	u32 reg;
 	u64 i;
 
@@ -396,6 +396,7 @@ idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_a
 		iowrite32(region << 24 | block, base + NVM_ERASE_REG);
 		if (nvm->non_posted_erase) {
 			/* Wait for Erase Done */
+			iter = 0;
 			reg = ioread32(base2 + NVM_DEBUG_REG);
 			while (!(reg & NVM_NON_POSTED_ERASE_DONE) &&
 			       ++iter < NVM_NON_POSTED_ERASE_DONE_ITER) {

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260826-mtd_eraze_to_fix-3708e0f99b1a

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
