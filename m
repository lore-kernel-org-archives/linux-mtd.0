Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2373C021A0
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Feb 2025 03:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p6CAM1dAnEfEPYiJSzXgzKd/tOhoyisSsVGzFq427P0=; b=JQfVlGEZmuFpMq
	CqSJFyQLx2ewQUGmkv9+Ba/mNRV4JAQp+tkeM/pz7ifp7diQ8mmUCmhes/0hbUBbizrbUnTmSQdhg
	3HNn2vNzFS+BNmXqx2w9tVgMCadAk5nkWb1qAtew/er/6PoHnmBQKWvc+WpfDy1xpBz1och3rgluG
	vL1PamzpaMymVUzrCDvLuyDrBX/HWOdT5oqAYFpTvXmgbz8rn/78iegoMrAUCie/FTByV/lbT01T0
	veyDB9QBIdOvB0tavlC3F6Y+3yRcnM+udtFfZ0qCPOBw70dKo2DIUmR7BTiC7ypFrrN206LEANPRR
	gL+4fuv6k7/C74gIhsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjVBk-000000017Lm-33dR;
	Sun, 16 Feb 2025 03:19:24 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjVBh-000000017Ka-49UE
	for linux-mtd@lists.infradead.org;
	Sun, 16 Feb 2025 03:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739675962; x=1771211962;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CsCnn3iYvhf1M5IjX/gTVsMy7hQwe8lPL9/SaVYEwBM=;
  b=XNOTBDkluJOKkwrQt5JnpuUCKQOtikboU+Yn9aqdlylb0aysdLtc207G
   YdciAPnXKFXb5cBQuqxPe8ahuQWlTBMRXmF1bZrhxKgKpfCZyjjb6qyRf
   rr0xraFCD8fQUUHtDGE+C3Hao1aTlFt7GC55N456iw9k6evuVn+mc35bv
   Xk71M6blWnj5LFe5j7gchtFJGbV4FLx4LKv1VpRaGnTrweqRlQLwGfHwt
   Q2mcEnGZnMsK8X+bOLqF8Wh7MMisX3u3r825zwz7i/h7fA+UB+RnJkzE4
   5p8Y5p7JTP7pkd9UjQ6rDQepiB0lpG82Ltp/Sl21g1XyZwx2c5aA+42qS
   w==;
X-CSE-ConnectionGUID: UW98nRuoSwijAtysc+30bg==
X-CSE-MsgGUID: CZaZEu/1R+yLkdHwYpDKbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="39622264"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="39622264"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 19:19:13 -0800
X-CSE-ConnectionGUID: SvVGbEXARU+0n1nSymd4Qg==
X-CSE-MsgGUID: k4btaVhrTZ2QABLXX8hbBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="144663474"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa002.jf.intel.com with ESMTP; 15 Feb 2025 19:19:09 -0800
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH mtd/fixes] mtd: rawnand: cadence: fix unchecked dereference
Date: Sun, 16 Feb 2025 11:15:36 +0800
Message-Id: <20250216031536.3366360-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_191922_044047_C5B15682 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
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

Add NULL check before variable dereference to fix static checker warning.

Fixes: d76d22b5096c ("mtd: rawnand: cadence: use dma_map_resource for sdma address")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/e448a22c-bada-448d-9167-7af71305130d@stanley.mountain/
Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 0b2db4173e72..6667eea95597 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2972,8 +2972,10 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 static void cadence_nand_remove(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	cadence_nand_chips_cleanup(cdns_ctrl);
-	dma_unmap_resource(cdns_ctrl->dmac->device->dev, cdns_ctrl->io.iova_dma,
-			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
+	if (cdns_ctrl->dmac)
+		dma_unmap_resource(cdns_ctrl->dmac->device->dev,
+				   cdns_ctrl->io.iova_dma, cdns_ctrl->io.size,
+				   DMA_BIDIRECTIONAL, 0);
 	cadence_nand_irq_cleanup(cdns_ctrl->irq, cdns_ctrl);
 	kfree(cdns_ctrl->buf);
 	dma_free_coherent(cdns_ctrl->dev, sizeof(struct cadence_nand_cdma_desc),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
