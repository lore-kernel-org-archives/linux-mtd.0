Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7B0C02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 05:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uocPlAnQSHQC88N3flec1eabDTAAhajfGvVbsHjl48Q=; b=r93187EBg7UIRu
	xHCkiGWt7zyW3wiwH3GKGbEsRbuxxS4n5J43ldIm8W0HP2z6+IfWNfxf+LBau5SJMB7EhnJSHWTX3
	jZQognCehsW8CEuI6tfQHc+V756ieyZQ1K4+cwUCdgWtNvV3N2hYhZqZQJHtkb1OuXi2qjYxijSOp
	tqPEgWqIT9IHQPyfP0YHfIkUHh3GxfOV+ZmAbFnI+tLKbZUDu/VDD0PyuenpdCyrf+ImgjUPIvOlu
	sAJf0rdTssGeOwTsj3Ssbv0dsV+IKsb8SYNDkP2OpvjcqEmpu29rYd3G+5Tq9+8fXNkdjhlInbLc/
	s/e18Zz6cSzazYuuvZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thMW9-0000000GICo-2Wef;
	Mon, 10 Feb 2025 05:39:37 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thMW6-0000000GIAh-2ZMR
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 05:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739165974; x=1770701974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E5Gx0mln1QzktxWO4z36jzZMXzJEeo8ZrweNjo//Bz8=;
  b=B7cI4b1e+MO9mRnKH8y60ezOTjAu0eh5qwNvLq4rKL39vHT/6Ihf0QXo
   HfLX5y02+3O+CpEFUHH9U65DGuOdKyDJsaKsO4dvG5dvEZfZklQVBWvd7
   Aymc4rMmC1UfYN5U5NtsIJ7JFYBPjiun+OYEck4Tj9OFT7y1e8AzwJwKN
   k0H+Y+rceBHfNadNnS8DGdzj8kLlvYG7TPJ9xXwTox38izWYz89RcMs8x
   /DG/zVoJjjm0G+15PDIzix8d1p8OA7pMHySYxNzSQsH7ePA76TkAc0Jjn
   858JSmy/p7EpJ19clrLIo+URJRYdNNTqSgo6RvqFHzdnVqLxjZs/VjFQE
   A==;
X-CSE-ConnectionGUID: JN+/VtlnTdGI5u1MQQYllg==
X-CSE-MsgGUID: WFUwy2LWQ5uI/VhUZs2e6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43657924"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="43657924"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:39:34 -0800
X-CSE-ConnectionGUID: /OnQ3929R/ex36lOmtQeeQ==
X-CSE-MsgGUID: PpKNo84rQ6WI/FRAXYPNLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112318414"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2025 21:39:31 -0800
From: niravkumar.l.rabara@intel.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	linux@treblig.org,
	Shen Lichuan <shenlichuan@vivo.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	u.kleine-koenig@baylibre.com,
	nirav.rabara@altera.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 1/3] mtd: rawnand: cadence: fix error code in cadence_nand_init()
Date: Mon, 10 Feb 2025 13:35:49 +0800
Message-Id: <20250210053551.2399716-2-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210053551.2399716-1-niravkumar.l.rabara@intel.com>
References: <20250210053551.2399716-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_213934_664705_1B2397F2 
X-CRM114-Status: GOOD (  10.53  )
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

Replace dma_request_channel() with dma_request_chan_by_mask() and use
helper functions to return proper error code instead of fixed -EBUSY.

Fixes: ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 8d1d710e439d..fb5f671bdb7b 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2904,11 +2904,10 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 	dma_cap_set(DMA_MEMCPY, mask);
 
 	if (cdns_ctrl->caps1->has_dma) {
-		cdns_ctrl->dmac = dma_request_channel(mask, NULL, NULL);
-		if (!cdns_ctrl->dmac) {
-			dev_err(cdns_ctrl->dev,
-				"Unable to get a DMA channel\n");
-			ret = -EBUSY;
+		cdns_ctrl->dmac = dma_request_chan_by_mask(&mask);
+		if (IS_ERR(cdns_ctrl->dmac)) {
+			ret = dev_err_probe(cdns_ctrl->dev, PTR_ERR(cdns_ctrl->dmac),
+					    "%d: Failed to get a DMA channel\n", ret);
 			goto disable_irq;
 		}
 	}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
