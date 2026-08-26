Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A93C61DBE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Aug 2026 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xzEchmnLYojYzSPEk9quuWSSkSJ9uWkW4hVTJtm8LYQ=; b=j2Sb0gerezi9kh
	hU1EHfvoXPI1iAeuAOKDjQDKidGs2AoBBnLnLper1MKvQJswlJ10i02Nc3GvdvbcOMD9B67Iz5rbX
	cDlcut1sHRDk1FjKmlUlC9uXoszPEl2UWq37z234sZPl13mrfKvkwJnDbPIIhX+jA47T572oblgYj
	ptfIl4VmNBZWWC0A3jiTtgRxfUGWgJP96eqfzuYkvIzH8F5MpGSEonlvrKH3/hpsFYlWeT0Tjs5nM
	ZRdshDoU+Sbzrj8Oiw5XI57BmGzyUT9/DOUHX+SPsrZpRsn/3Nwe3S8lWmnqq4ieA9FvgTk5Eq2Pt
	FrQOwgBzMLIKnoFwP0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBET-00000002Jwa-3UIp;
	Wed, 26 Aug 2026 10:51:49 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBER-00000002JwE-2C7L
	for linux-mtd@lists.infradead.org;
	Wed, 26 Aug 2026 10:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787741508; x=1819277508;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=YafAY5/v4eDzwj1ILd524WEEaHj3LGZoILkqYo7g3R8=;
  b=BrfUNFd+ywXzGGPeZn3xpZCoMblwuUt+BaInf+7peVy/1JnA8SA5cF80
   6ak56okSNGnelbXZqXP3kTwZrZHvj/c076nK7u10HUOL+5HiuDGIkxHS4
   0Im+GLOvsuXABg2hlLogP5Uf5Ci6M2AGKj7JtUnQY7SX3b5nhuzvPGWzB
   VA+nGMYXICgwFRFxVKOYNg69Swrg1jLn0JzNQ7ZS0Qsb+uIQePzOjty5w
   3giMQ2AjaE0PgOHzCi+KOWYSWYjJgVNgptsPCoUOLS0NCSr8CVYCAT6qU
   CAZRm+4lc3YD6USrYdvZrpwSMYpP1kkHDfFp/KRs7a2hbGOTbEuVhEFiM
   A==;
X-CSE-ConnectionGUID: 1DlsnIG0QaSp5DCyftW0jQ==
X-CSE-MsgGUID: 3iJZFMq9TBm7oJiK1uCdBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99380373"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="99380373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 03:51:46 -0700
X-CSE-ConnectionGUID: SW3SbYRdQPuvSR+RxnZrYA==
X-CSE-MsgGUID: bNWbK2mJQxmIBxL6HLDLjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="265744399"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 03:51:45 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Wed, 26 Aug 2026 13:51:23 +0300
Subject: [PATCH] mtd: mtd_intel_dg: reset poll counter for each erase
MIME-Version: 1.0
Message-Id: <20260826-mtd_eraze_to_fix-v1-1-b8a893333075@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TjADs74SIVZr7SENlYikvycdZ
 2AmQ8RAGGGoMgS8KJJ3BZq6gmU3bkNGa2EQXEiuhGRHWjUG86BOXlu6Wdtxhdz2/dwYKNkZsOh
 /OU7v+wEqOwUEYgAAAA==
X-Change-ID: 20260826-mtd_eraze_to_fix-3708e0f99b1a
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Menachem Adin <menachem.adin@intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787741504; l=1606;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=NPQbbJPbozkY44eWUMbteLHRjQYwlyTvxeF54RXzi6c=;
 b=753re2wggG4X98i0iYpauDU9AOIbnrFqtc3ekNw5V7YO+K1EQeyHEhuhpe561JGFW/5jM5dEk
 9BOgN5HWql4BvGa5yFk4gm1woQzATs7atpiosFHKpPv6WqsofT9kaqz
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_035147_672275_25633F00 
X-CRM114-Status: GOOD (  10.24  )
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

Signed-off-by: Menachem Adin <menachem.adin@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
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
