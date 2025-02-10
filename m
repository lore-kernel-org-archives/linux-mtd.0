Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9428C021A1
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 06:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yixxh9WytEZO6qU6X7+R/jzT4rfWLl2Ir9ZcrDa6avU=; b=BlfeH3aQ6EedQg
	3y130Ut2Jmgwj8middv+AbIklUTLBL96aFsm4U01LZnrQ4198L09nO/6mSu6WvatOj2rMy/t/0Z0y
	4PAIbHMPmckjXukv+KLD7kpxiOHIg0Vm9jdXQJipianp2XlbN5jSI/0UCpnLGtBT++9NYwj0R0Gj1
	wbO3sJVtWsf6G+buoC/kK5+7w2MCkMjEKghnaol83JcTWW3gbT9BNUHxuBSgQrG5AZYSlIZjovl08
	5gv3NVfJqA8yWS1KbHjWeJlU9WQjUHsIbkhDdfGIdV+KNOjBjGmrOhNDezpoUkSIJhSjQa49GeuLS
	U3kAg5ttFPDORBh4bESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thNTG-0000000GOqu-40ru;
	Mon, 10 Feb 2025 06:40:42 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thMWH-0000000GIAh-2472
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 05:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739165985; x=1770701985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=buG6voVc5zfk4HiKSZp19+HKiFIsBIA6Ww+wD6EEDD0=;
  b=Q0r3cLW+0VpqEdkEZmfacVDpZMYOryGQDrcVznLaIWWcsyQFPRH4tmZV
   SHzBc0Fkgd3HQcf6tttSCTrzU+KZZZ2NE+/NBwrDJraprEHcP3mQ1D8ct
   zRDI+0CFXLx+8Xj7lv+28LhLhzpP18hHMq4dVhSR5O1jMnR+4yBhdCh0U
   DEcFzSesAXNlHmbEerPdWdbHQJOvSkVhie7qWyAJB4YRro7GN6jQc6ka6
   zZShhj06GVcJULmL3w9ZVn6t4sCRap4aWtivQYYVZYFuaXevtp9w1XPXW
   Rs0mLZd2rFFO3ghYP01cIR3chzEBjse7fAbgl/OKBtHxgMj1IuW4Axx/s
   Q==;
X-CSE-ConnectionGUID: uwbaFZjQTXiMxidMiZ5+Bw==
X-CSE-MsgGUID: C31rUNYkRwqrHxJvGO46dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43657955"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="43657955"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:39:45 -0800
X-CSE-ConnectionGUID: ApGwRRFvRWS+8W6N15XrDA==
X-CSE-MsgGUID: gbY2Fzp2SgSxQBdk4A1XfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112318428"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2025 21:39:42 -0800
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
Subject: [PATCH v3 3/3] mtd: rawnand: cadence: fix incorrect device in dma_unmap_single
Date: Mon, 10 Feb 2025 13:35:51 +0800
Message-Id: <20250210053551.2399716-4-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210053551.2399716-1-niravkumar.l.rabara@intel.com>
References: <20250210053551.2399716-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_213945_547783_3D36E9B3 
X-CRM114-Status: GOOD (  10.11  )
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

dma_map_single is using physical/bus device (DMA) but dma_unmap_single
is using framework device(NAND controller), which is incorrect.
Fixed dma_unmap_single to use correct physical/bus device.

Fixes: ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 47950a0ac6d2..0b2db4173e72 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1863,12 +1863,12 @@ static int cadence_nand_slave_dma_transfer(struct cdns_nand_ctrl *cdns_ctrl,
 	dma_async_issue_pending(cdns_ctrl->dmac);
 	wait_for_completion(&finished);
 
-	dma_unmap_single(cdns_ctrl->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev->dev, buf_dma, len, dir);
 
 	return 0;
 
 err_unmap:
-	dma_unmap_single(cdns_ctrl->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev->dev, buf_dma, len, dir);
 
 err:
 	dev_dbg(cdns_ctrl->dev, "Fall back to CPU I/O\n");
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
