Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644D2D3CCB1
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 05:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ra3M2RpiPhUQdpBEA69o7Z8BxM8MAw1v3M+QUnsC1/c=; b=nnFSwCONcYqIkV
	Av/YtH9RJlxQ2pd/Uw/9yLBBrl2J4GBgLVFKMl3uwiK18YFdb04Nk+xw80HXqmxflTw3PDtJ+l4CD
	U5j/W1/RSUKWc+JqEOW1eawxKY8XgrUPZqI932ciwZszqWvmg/Zr1n5XLUq22HkCUM7AAaW9iudhD
	I6LczL2q1tI2YzpOIPmZJSXxBvTREW05adEvvbzpsYX3sV9Hj0PIN2HRiJz5JGf/zG+EmAjaxBe2P
	WcVEUvUYJ55wl01mAEvN9pUA2CjbK0MncIPdhgaKtFx8DV37kMR2kH4VvuwFIEoqQBy4tZALTbf0/
	VXCH8jL1h6uULmGDg7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgG6M-0000000BoQZ-1KEK;
	Thu, 15 Jan 2026 05:40:58 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgG6I-0000000BoQD-1Muf
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 05:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768455654; x=1799991654;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wl7xCZoWBvN0SYe3lKX1wJCCqVhc26kn4JqRvUIG6/A=;
  b=nI6LSjjzC/THbod8Ojc1dpLUo696lmre2kX6UtnWpJQ0pBA7v5UrLdeu
   lh2rqlgEPEta+LpPisnBgM/wCqSxoY/5+3K4k0FEsOvtqrPOKCh3jElfq
   CzNo6FO4Hpprb4MGgwd1qIwPmlxyybc7SrCdfoRBEXmE/q4CXfofHtb8S
   W9fFQYGVNmlAuteAYddT0zHK4wXJKwhf8bhsWlSE/+m5fxOG7y1O1jOVU
   9ZrDWBrfMiLlCawhZumMqPQeiHbyVDz/vft9x+Y0g9PB38/UNfNpFtY43
   +nVKdm4PG8VWZjonwEgZ7o5RkxYrAqdP1fAPkH75bWYfpCe4xkqaXLuDA
   g==;
X-CSE-ConnectionGUID: P+sgKV2vTfywPYILfYekhg==
X-CSE-MsgGUID: wjN1BAXiRvq+TzQ7h8onxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80479307"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="80479307"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:40:48 -0800
X-CSE-ConnectionGUID: Wp8RXAohSL6q/3n46iaI2g==
X-CSE-MsgGUID: sFumAQ2dTv6/vJzbdn6a8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="235587833"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:40:43 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	Jani Partanen <jiipee@sotapeli.fi>,
	Lucas De Marchi <demarchi@kernel.org>
Subject: [PATCH] mtd: intel-dg: Fix accessing regions before setting nregions
Date: Thu, 15 Jan 2026 07:22:37 +0200
Message-ID: <20260115052237.1149027-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_214054_384544_2E131D7A 
X-CRM114-Status: GOOD (  11.78  )
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

The regions array is counted by nregions, but it's set only after
accessing it:

[] UBSAN: array-index-out-of-bounds in drivers/mtd/devices/mtd_intel_dg.c:750:15
[] index 0 is out of range for type '<unknown> [*]'

Fix it by also fixing an undesired behavior: the loop silently ignores
ENOMEM and continues setting the other entries.

CC: Gustavo A. R. Silva <gustavoars@kernel.org>
CC: Raag Jadav <raag.jadav@intel.com>
Reported-by: Jani Partanen <jiipee@sotapeli.fi>
Closes: https://lore.kernel.org/all/caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi
Fixes: ceb5ab3cb646 ("mtd: add driver for intel graphics non-volatile memory device")
Signed-off-by: Lucas De Marchi <demarchi@kernel.org>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index 2bab30dcd35f..7f751c48a76d 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -770,6 +770,7 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
 	kref_init(&nvm->refcnt);
 	mutex_init(&nvm->lock);
+	nvm->nregions = nregions;
 
 	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
 		if (!invm->regions[i].name)
@@ -777,13 +778,15 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
 		char *name = kasprintf(GFP_KERNEL, "%s.%s",
 				       dev_name(&aux_dev->dev), invm->regions[i].name);
-		if (!name)
-			continue;
+		if (!name) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
 		nvm->regions[n].name = name;
 		nvm->regions[n].id = i;
 		n++;
 	}
-	nvm->nregions = n; /* in case where kasprintf fail */
 
 	ret = devm_pm_runtime_enable(device);
 	if (ret < 0) {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
