Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BFBE77188
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2025 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TS8JJa+o1SU4MGFRqUEw0cVtGBwFKqsuKAvxUZ43C+c=; b=sY1MA3MDKz5fN7
	C6FWXFYnNpT+fFpCt0jxmuDjAK77qOBIQ3/cc/+bDjEMHqin213TbP99WPQ6J7yknALF+oIWIk9+o
	4mtJXMIhVZ9LuRdveIFjEfsWbbqk+zJGNABMT56KVZOL4adM3R7crPkvWD8Z9H7hwOCyrGldpddau
	SfAkZ+gBlRck+Y1WScz9jISCCE1tqTOOFizxJLswldYUkEOoloNNtpW+BIVwvvbIEztPH6tVEpWDS
	Shk8nEyTN3Z8c2U/oTodUPVbqBXLDQRAyeJfOFz/wFxmaoFgr3Pcq/NhvfPxVqvXRDNhxKyx/uXW2
	6IhuLIT5S+lOyrNx+V2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWXm-00000008hln-1exE;
	Wed, 08 Jan 2025 13:56:22 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWXk-00000008hfJ-1sN8
	for linux-mtd@lists.infradead.org;
	Wed, 08 Jan 2025 13:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736344580; x=1767880580;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GJtoDD/fFhooT9dql+l+hPcFXNG+AsnmshuIeFwbtgw=;
  b=eHwC6av+OsDjPDI7tCojOyFOgbSFy0ptYW2Oi8xTrirDaOEpBhc0rdnK
   9WRCTw9ARqjDWDw5FMD7WXc+6YNaWnsMAmMaY7cePQYZ87YZkuKJUqKlZ
   wSs0MHU5zlq3ylE9ZFAJ3gLuSVKfx+UtMZP3D0XS3fWmMuWMgUHBjK2Gk
   AUfmkE00Yk5mgQrysFwaBiiSXwCUJOGTmx+YgRwbDSHORKLtVvSmt1yYF
   qpBOUIrGWonwtrUPpHgQDZYITP9mxFy7T9MPb3m/7680eJsowUfAEX6vA
   xapAZNpaZGc/g/rM5vu9bZVuotU92fbaf0huqgEpPGlbPw/5qXF2wipkV
   A==;
X-CSE-ConnectionGUID: 3XKsluOtS0WyItvNgvNFUw==
X-CSE-MsgGUID: pOd9WGlFSSK3eYZH/yrdaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="61948183"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="61948183"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:56:20 -0800
X-CSE-ConnectionGUID: Q873MzLaR02U0GjB3IWAAw==
X-CSE-MsgGUID: JfcGN71oQ0CrltnESTIFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102971643"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2025 05:56:17 -0800
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
Subject: [PATCH 3/3] mtd: rawnand: cadence: fix incorrect dev context in dma_unmap_single
Date: Wed,  8 Jan 2025 21:52:34 +0800
Message-Id: <20250108135234.3107502-4-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108135234.3107502-1-niravkumar.l.rabara@intel.com>
References: <20250108135234.3107502-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_055620_515000_64181359 
X-CRM114-Status: UNSURE (   9.47  )
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
