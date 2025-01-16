Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C5DE77188
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15DcnTl2hKlhIN32u+Q54hx1sdALDT1Gf9CniOAdC28=; b=r9a4eOKOnNIFJk
	FvvZ7xX4BGh5zLYCIdsCDALt/3wartoprjOeSmRIipHKJQdTbkZxNmWPvocZ3ZZFtWYFGKHJQ/je9
	hGzS5hmK0DJrnKjpxrAw3aDQvD0SxNhrG7Y01ek5MWiNaeqr8JP6MEREu8dt1uUjbepsJmMwv0Ju6
	or5/ekKd7ZMvmxuVOCbWrFY4xm+mtRnS7+fCwMVEJhaFEelvFaehPSb2aLy7XIftvGT23lSpZrGf9
	qvLXnddJt1ylj9qybBWxrgGp3ubn2y5qgfpySPSDdDPZuweXWL1t7aKHqantu6HjIqUfjZ+zCo4cp
	m8PsKBLvqWBcMlMcq6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGVa-0000000DieK-2BoR;
	Thu, 16 Jan 2025 03:25:26 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGVY-0000000Dici-3hpq
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jan 2025 03:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736997925; x=1768533925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9YYGXevSZHlst/BPZfEfbibwoduDeeUOTds+39AMyPo=;
  b=OWX6w0XZf0wjaEjZh67dGK0syDwG46wxinKXLE3nxTaNGVNF7CS3O6Zs
   5Jdb/dP+24Uc2Lw/FzeQkQ0PWZAc9FdqrZfbdWNoPVUvTglqZVrTpwHb3
   su81ZA4Z/GmQdYLaB59ADpRA75mM8LD23rO8vjeWVeacNhu8dlENwOET+
   upY9dX2m3qo5ul+pW5KHVsKqTq1DqWpNnvI62j2jBaH8gBL7H2A95kCiM
   VayiS4G1C5ajf/89Nx1UNxE/GZlRN2v9KffWfdaKP9D5b8Bz76UF+hveq
   By6Ua8qvaOV+DCc5gaHyoWJCg2Rd0m+w23qqyXATupE0EMV3/Fzagk5zO
   Q==;
X-CSE-ConnectionGUID: WxWq7xIoTcWkIRsjwBDCGQ==
X-CSE-MsgGUID: 8RzwyIqZR1y5WugqiIp4pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37478872"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37478872"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 19:25:24 -0800
X-CSE-ConnectionGUID: UZ+Enxz+Q3uMV4IIBC95Kw==
X-CSE-MsgGUID: dWe5rzSyTlWc1CFGsZI1mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142604337"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2025 19:25:22 -0800
From: niravkumar.l.rabara@intel.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	linux@treblig.org,
	Shen Lichuan <shenlichuan@vivo.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	u.kleine-koenig@baylibre.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob when DMA is not ready
Date: Thu, 16 Jan 2025 11:21:52 +0800
Message-Id: <20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_192524_976253_3FBD266E 
X-CRM114-Status: GOOD (  12.13  )
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

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

Use deferred driver probe in case the DMA driver is not probed.
When ARM SMMU is enabled, all peripheral device drivers, including NAND,
are probed earlier than the DMA driver.

Fixes: ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 8d1d710e439d..5e27f5546f1b 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2908,7 +2908,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		if (!cdns_ctrl->dmac) {
 			dev_err(cdns_ctrl->dev,
 				"Unable to get a DMA channel\n");
-			ret = -EBUSY;
+			ret = -EPROBE_DEFER;
 			goto disable_irq;
 		}
 	}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
