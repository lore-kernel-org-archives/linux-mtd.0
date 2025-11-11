Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5E3CCFA1A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Nov 2025 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u91EOFt8WZvlax6XOh9qAxbaipzknkJZRTTZ16s+zck=; b=0vHYlPx/Z/iBc9
	1ggUPvIYoLjp4tUdBeZEuSnUIalxlG9aJsVqAI6RWoAcq8S9ZDPGaE4WEQvF0YH2okKWUUmuHLZcX
	wtz0i7F4rj4LHRUp2RvoiSo8uPWTa13ZXMoBVlWMT9a16TYOqiAykBin9bTDrgP2pQ8BHK5LDv0BX
	fAQRpRpMlf/9Wtzzc7DBCvMLRe07dT8PUVhJrJsL6S6ECjObTx0eKsKP1BlG/h9+rNOoaKQLIoXLj
	knd/3y7EPJCI3aJRs/0yAknhJTW3xjE/deGzBftXJ8laH/58YZvZaUz7k59780XBKWj/lSNZefXLd
	asiXN9HQg9KxWMB8aitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqIv-00000007Nml-2deI;
	Tue, 11 Nov 2025 15:29:09 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqIu-00000007NmR-08ZL
	for linux-mtd@lists.infradead.org;
	Tue, 11 Nov 2025 15:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762874948; x=1794410948;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sHV4YCriJE6MHGsGQWPgrOX/gNbP+xPxtR6RU0E9fDY=;
  b=bYAD6/EeX0xb1TQJjUoPgN0GTKDjEUin9fBfgFK2MREjybaMaAsMv3+J
   Quhs4W73bN20C2MoVwwv2TqlvRUFoWsB4IBiddYndFwoWjkR0Pt7X46gd
   Vd6fTdERyGF3gMqhCnULYjmmlMSG9BToYswGI4bF5J3W1KtN63LrTERvv
   ywwdCmO67iDir+uwrYlc+xSUV1xLGIBh6R6MLL/XNkhdwCwNbhPXM/7Qi
   YlMPeYGxNvhD0Y5/D1i2hbCGD/1CBudP16KV9PDM6dIazbg3MV1AayNIN
   RgCan6hBmxq7IU4NSY9+kIvAMlIT092FJXvc2QMZwaWn2e4Vmtj1XTE6K
   A==;
X-CSE-ConnectionGUID: r2n6+w6xSgyQ78prGrQiuQ==
X-CSE-MsgGUID: lkL8w+7aRZW2s1N/cv5oIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64854871"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64854871"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 07:29:07 -0800
X-CSE-ConnectionGUID: f7ybnT3wTeaeyy5BxAvp3A==
X-CSE-MsgGUID: tQ2osJ4ERGCYOccNK9PqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="212383820"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 07:29:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Jani Partanen <jiipee@sotapeli.fi>
Subject: [PATCH] mtd: intel-dg: Fix accessing regions before setting nregions
Date: Tue, 11 Nov 2025 07:28:25 -0800
Message-ID: <20251111-mtd-nregions-v1-1-61db61e78c63@intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Change-ID: 20251110-mtd-nregions-e9c66d5fcfae
X-Mailer: b4 0.15-dev-50d74
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_072908_170474_D60BC076 
X-CRM114-Status: GOOD (  10.88  )
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

Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Reported-by: Jani Partanen <jiipee@sotapeli.fi>
Closes: https://lore.kernel.org/all/caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi
Fixes: ceb5ab3cb646 ("mtd: add driver for intel graphics non-volatile memory device")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index b438ee5aacc34..114e69135b8d9 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -738,6 +738,7 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
 	kref_init(&nvm->refcnt);
 	mutex_init(&nvm->lock);
+	nvm->nregions = nregions;
 
 	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
 		if (!invm->regions[i].name)
@@ -745,13 +746,15 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
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
 
 	nvm->base = devm_ioremap_resource(device, &invm->bar);
 	if (IS_ERR(nvm->base)) {




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
