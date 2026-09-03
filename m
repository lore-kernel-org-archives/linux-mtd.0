Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7324C61DD3
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25xam+QbdYH5GnpSPM32rhsOOPlOaNk20DwFBMtQPQE=; b=KdesXQ3uzkjiBl
	H41x9abK3TkZpQvFCcMtmQd++nNDfAspG4Ytfdb6LQ4H4QpjobZdue6QQU5eCOHIlkApgMZ0z5cdC
	xaA17T+2ESi/27sIiKvsHLp1vCt2bc38jdXcYiohDyJIxASJMunwyNtA7ZqS4ga0vonIsiYt6Q8M/
	Mv4A3uo9RHgvbEQnMof2LExJAedPTjgS4anbY0hQHsTg07T8tjb4vmPB8pPJSu3UJuncPjLHUXzK2
	f3/pCPvPIYdVXVvAMoQt6aNp0rbds35eFiJt4o+uimNaGU5nnGnYabvbw/nTyUPRKaTJgq1MifIt1
	HwaveaMuR0b879XGbWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25UF-0000000HBfU-0xmv;
	Thu, 03 Sep 2026 11:20:07 +0000
Received: from out-152.mta1.migadu.com ([95.215.58.152] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25UC-0000000HBdk-16kx
	for linux-mtd@lists.infradead.org;
	Thu, 03 Sep 2026 11:20:05 +0000
X-Envelope-To: linux-mtd@lists.infradead.org
X-Envelope-To: linux-mtd@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id a78dcd8124518ee1;
	Thu, 03 Sep 2026 11:19:59 +0000
X-Mizu-Trace-ID: a78dcd8124518ee1
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	harry@kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 12/13] mtd: rawnand: gpmi: Don't use GFP_DMA when calling dma_alloc_coherent()
Date: Thu,  3 Sep 2026 19:18:35 +0800
Message-ID: <20260903111836.1777265-13-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
References: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_042004_451790_DD4BBE03 
X-CRM114-Status: UNSURE (   9.40  )
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

dma_alloc_coherent() allocates the DMA buffer with the device's
addressing limitation in mind; the DMA core picks the zone from the
device's coherent DMA mask and ignores GFP_DMA passed by the caller.
Use GFP_KERNEL instead so the allocation may reclaim as usual for
probe-time allocations.

Cc: linux-mtd@lists.infradead.org
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..0d91950ae9fd 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1387,7 +1387,7 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 		goto error_alloc;
 
 	this->auxiliary_virt = dma_alloc_coherent(dev, geo->auxiliary_size,
-					&this->auxiliary_phys, GFP_DMA);
+					&this->auxiliary_phys, GFP_KERNEL);
 	if (!this->auxiliary_virt)
 		goto error_alloc;
 
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
