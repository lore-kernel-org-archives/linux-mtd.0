Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFCBE77199
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2025 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7Dme33bvaFsDHnQ+6vBqmuqaveHDc/OZJl0Q9DJaSo=; b=BYCMb6I3oiQVVI
	9bJYSpfz6y64kfpzlLo9tR6GMt4hJ5BuJ0JqaL2nScILYX1QZNrYX5YWfn+mlR/vEacT/GVD4oNkk
	9/J4rjViKTor0eupAEloV8UufnFuhxHjwrPsKFy2GJgBg7FoL8hE2Uk6lnVSTGzUIfEe2se8af0tz
	t4vbla9r5Lo0jDGtXrFHJBmBHafvyKdOC3Vu5TVq1rS5WcRVWSsCB5KIMbm8KkxKNbyLCZvwMrdBu
	bzPdvAsZCH64qjXeYPHtKrIhv8QmqgY4q4O3247AFml7wg1UnkIVD9mCSiq1C5qMI7sQ0BB9XiWrc
	nI4qABZ2X/SZD3nME1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWXa-00000008hgM-1huA;
	Wed, 08 Jan 2025 13:56:10 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWXY-00000008hfJ-0efi
	for linux-mtd@lists.infradead.org;
	Wed, 08 Jan 2025 13:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736344568; x=1767880568;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+JMuW1qkzn19JA8pMkK7JfbKJ0Uifx3DASEHjqiWvzY=;
  b=DzL7j8+9xYxgEeryQfs1jBlsoaxRxorXFm9Zo6MyUPKLtHP08HluLiV5
   5DsyW+fC7WiHYzj3rxkt5a+WZu7zC7Nv8hAHvXCbDgx2E+62mpd47MXD7
   kMw/nc1GPyKV9b1LCSPIQr4+2q1gtYwJzNC3+B10bgmF9b8Z5XcT4ZQWG
   RAM3rhbJrcI86jwmuefndMOmcYs/1JMe14kKeJtoi8Kw4NkzbjKd7sPLf
   tJUpoL5mJgoBtWriOAjJ6l/PJuWxoNFkzItiJF/EUX9mnrMD0Z1wmtPsd
   Nm/Gkom8IQfz8ygV1m6Xn1IKPQZYElj7MMrmrodFpeJBJLgxbfKrd3L0l
   A==;
X-CSE-ConnectionGUID: vmVDnL1nTP6cdiKTfofRrA==
X-CSE-MsgGUID: IUErwybRShm7MfvJk5/0KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="61948158"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="61948158"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:56:08 -0800
X-CSE-ConnectionGUID: 8tAR4J09TNK4K+uYs31DdA==
X-CSE-MsgGUID: ir3vachzRdy1cmXm07r+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102971633"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2025 05:56:05 -0800
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
Subject: [PATCH 1/3] mtd: rawnand: cadence: support deferred prob when DMA is not ready
Date: Wed,  8 Jan 2025 21:52:32 +0800
Message-Id: <20250108135234.3107502-2-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108135234.3107502-1-niravkumar.l.rabara@intel.com>
References: <20250108135234.3107502-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_055608_672119_6ACF64C9 
X-CRM114-Status: GOOD (  12.02  )
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
