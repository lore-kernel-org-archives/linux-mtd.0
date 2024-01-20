Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA8BC47DDC
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d/frbaqsSNFHoDu5BO06x18Lxf/6gpfN+CO/tz2a58=; b=y4rDRo3DCjj5XV
	WLvwjiLV7glHUe5Dv/5MJzFj3e/Ap0/1y8/a0dVB+2puAsCMucvnFNuF8SsQQHXxxaxFLEAdfcZrV
	PVsAbTpLPEXvBGgCF9w6+DN1mVR9WEpUwlJmV+3anXANrWI3mdfCleESgdpUW2cyNVFrIewycZRdM
	XMZQHsUtLiNcM5f/pndUDDqR+9+FlUCEBM+Mk6Fu9zHEBi77BirCftpThGJS9vB72RJJGloHOYZJm
	VTmKqOQjsnX12+k/20zz0tFnQUeK9SJvLLBzStV1LYfPHWNIXQqsW1ugs5ra8QfE84JcfXRp7fTAQ
	7fgXWwyGcl2usmbbf7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS7-008ZMD-18;
	Sat, 20 Jan 2024 23:08:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZIP-2D
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D+g8YnhJ0LgyHNjz+9m828oIFUG2iY8z2pIiH0hKqiQ=; b=wBIDuoLbuprWq0X+F/ixooRivP
	emn13ZQlu1cXoiP8y1EzlMl8iRz2Ud5uYhcj/QocDjCHLVv/28KqYbcHB9VLxtMrmKwEV6jPxvExw
	CGIZKtot+JIEUmVaPC3luQc6G4F05kx6LSq41HckqXnnUe+R+ukFHhzIuKTkbKMVDFL0Vjh9SNgcZ
	aieJDZxjAqCfzVY3gTIDmWSChayRTgSmp3n1RoXYZmPEssgSL5phdejYypys49kAw3iTiMIk2dCfu
	q+5o/FKmMPdYV0C5i7JjAKy7cVFK5kkgwCIvMi8etXtLLTf7+E/lv1JMn4irpxue1kSeC3jp9tJiO
	vwgl/0CA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRw-0000000AzXX-2EPk;
	Sat, 20 Jan 2024 23:08:28 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 14/15] ubifs: Use a folio in ubifs_do_bulk_read()
Date: Sat, 20 Jan 2024 23:08:22 +0000
Message-ID: <20240120230824.2619716-15-willy@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240120230824.2619716-1-willy@infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
MIME-Version: 1.0
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

When looking in the page cache, retrieve a folio instead of a page.
This would need some work to make it safe for large folios.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 8cad1fe9c50f..dec5258b4f38 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -777,19 +777,19 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 
 	for (page_idx = 1; page_idx < page_cnt; page_idx++) {
 		pgoff_t page_offset = offset + page_idx;
-		struct page *page;
+		struct folio *folio;
 
 		if (page_offset > end_index)
 			break;
-		page = pagecache_get_page(mapping, page_offset,
+		folio = __filemap_get_folio(mapping, page_offset,
 				 FGP_LOCK|FGP_ACCESSED|FGP_CREAT|FGP_NOWAIT,
 				 ra_gfp_mask);
-		if (!page)
+		if (IS_ERR(folio))
 			break;
-		if (!PageUptodate(page))
-			err = populate_page(c, page, bu, &n);
-		unlock_page(page);
-		put_page(page);
+		if (!folio_test_uptodate(folio))
+			err = populate_page(c, &folio->page, bu, &n);
+		folio_unlock(folio);
+		folio_put(folio);
 		if (err)
 			break;
 	}
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
