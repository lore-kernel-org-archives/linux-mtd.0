Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD26CC02180
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2025 03:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8AHFOyV+r8ZmzYx+7pjPjh39l7oqSjays46ths4FnE=; b=LneAeMjqdcGs2X
	rXjbmwiW8f4JcgGpCzKAtjCzZWGMSYn5375QPiBbo2QitamZ9uQqktdvGjzUM9iOMhsebSqcDoI3G
	3eLbRyD1QJACqFUXeX4+qMWQK71KJy3NAsXg+0KOIIbkFQ9QhqXOwoevdHHouB7PEDY4PuIK4Fk2s
	VGxQrtl2iKG3n5kHwGVTShxLaFpi4QfdmgjJH3CcVaKHJ15kIJr/YUuODoUTcidZ7Hmjzo2R5NlNl
	dmhnlI1Gl8PCn8jzVAdTM36eRkV7b5R6uGWEUXTrfAJ4FbfyGjQ3taUmwYPGSylcGdE9Hk01fDhbU
	6EviuvJBW2Xv6tbWvGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGVn-0000000DijW-0SxY;
	Thu, 16 Jan 2025 03:25:39 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGVk-0000000Difb-17rM
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jan 2025 03:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736997936; x=1768533936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=td3ZZ0j0HLouPMAMZAhj2DUcSXrlnPeWRXzfXSyW9Gs=;
  b=HRDwsNo/LydDY+NKPe1bgjNhVavjnE13NXiNYKbSknncXBusW9DQFVoa
   gumw4rtpRS3m0u/YKDHBKxqLAslCDoDrBR6F0s3FaA8WooQ6STSD52h4e
   z/DovjlYT0BWAzPuOYm5ixsG5Dgfb3Ur1+899jqS3ungeTlaTR88Wa656
   BEk/x9JnzzpxvlSPwaJNipUi1CmaUrC7f+fN0lAm140JO1yp7QS56AObn
   e2eAVenApQHpVrtvT8zqSgtXCnWd4lBQ+rEifh6rY80/7t1IcR8cvDjxy
   D9zoXZG/4OA0/WeLWDrU4uphOEx1ZJi2TEv3J/yhaXTYxiBy0BytWwyoy
   w==;
X-CSE-ConnectionGUID: Icau3L8ySCm6rioMQxcGWw==
X-CSE-MsgGUID: 97AX89jiTSGlGCe2p/Zfzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37478921"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37478921"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 19:25:36 -0800
X-CSE-ConnectionGUID: yEniKsXdQiWkMRkAKPxzKw==
X-CSE-MsgGUID: Kd575k5bQYGSVVDfyZxTwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142604370"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2025 19:25:33 -0800
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
Subject: [PATCH v2 3/3] mtd: rawnand: cadence: fix incorrect dev context in dma_unmap_single
Date: Thu, 16 Jan 2025 11:21:54 +0800
Message-Id: <20250116032154.3976447-4-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_192536_358865_5FDA8CE5 
X-CRM114-Status: UNSURE (   9.66  )
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

dma_map_single is using dma_dev->dev, however dma_unmap_single
is using cdns_ctrl->dev, which is incorrect.
Used the correct device context dma_dev->dev for dma_unmap_single.

Fixes: ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 8281151cf869..2d50eeb902ac 100644
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
