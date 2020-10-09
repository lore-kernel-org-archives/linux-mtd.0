Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A90CC433E7
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:34:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCB222226B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o5eKrioU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ekyZ0RqH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCB222226B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qvXkzyzlnaFGTPkEkFuV06fUoAMPfJeTmuPVl9IReEs=; b=o5eKrioURqxxB0hFzQFNKgnDh
	RHncQ64zcCzUYvM/N86fvFk0PkOWV8HSckW+Dn6S/w2P0ii08xTjU0DZUDl6Xn58meKGPY1PaYTiN
	QV491soKc/ne+v2Xh5DNATeYfMekr4ZhZ1jz6UAgsKlIfMJ/53cjeRZlFdp5Ujzo7EtrIVYpGfwh/
	rr810UkkthgKoJRom+BR82v4MmwvhrFGuVX8bYRAhpVClFR+UC8eDFG5kiqANJLcW1CTEsqwHg3UY
	2xexjbFRr0If4smM1+jzuXFLrVrz4SMXG6Zsq6P/4nv+6ZiUmmm1qMPOIZdiNnrCzzcHeRvhVtW7O
	U+41PXUaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQtSn-0004gc-TL; Fri, 09 Oct 2020 14:33:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQtQP-0003O2-Fa; Fri, 09 Oct 2020 14:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XENkUyBYEqQdDJViwbkj3PXnyvtkG9pwyINW5T48dY0=; b=ekyZ0RqHciHT6w0FRtBIb74RNP
 ATW28QGWmqsNnH/vLrqBZaFXuDhEx3ApS3w+jFzpx2X/taHl+6rpgUjut8ndwr5pqa+DLjv4Gx50+
 6+70qpWiZ3+++j70k/q90ALYSczVw6/4PCbVL3Y2U2L6Y23KLl4a3w8gd03srsRFuXNg/GmrWwXYN
 vTNgqiQtCBrX8BYOQuu/fsNDHXqjKDBLsVhD/vQ09kXf7CReTOSNh1XplEPkeYBls5zfzru3+gi4I
 EhS0MsH/dvccHF4LZQeeilzTBaCqLN8cLE90npHEUozqFLYE3kkEPktZ4a+EFwfYQ8aTrZOR6RQUm
 0EdAxQ2A==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQtQN-0005wc-Vg; Fri, 09 Oct 2020 14:31:12 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 16/16] iomap: Make readpage synchronous
Date: Fri,  9 Oct 2020 15:31:04 +0100
Message-Id: <20201009143104.22673-17-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201009143104.22673-1-willy@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

A synchronous readpage lets us report the actual errno instead of
ineffectively setting PageError.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/iomap/buffered-io.c | 74 ++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 32 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index e60f572e1590..887bf871ca9b 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -150,9 +150,6 @@ static void iomap_set_range_uptodate(struct page *page, unsigned off,
 	unsigned last = (off + len - 1) >> inode->i_blkbits;
 	unsigned long flags;
 
-	if (PageError(page))
-		return;
-
 	if (!iop) {
 		SetPageUptodate(page);
 		return;
@@ -165,42 +162,50 @@ static void iomap_set_range_uptodate(struct page *page, unsigned off,
 	spin_unlock_irqrestore(&iop->uptodate_lock, flags);
 }
 
-static void
-iomap_read_page_end_io(struct bio_vec *bvec, int error)
+static void iomap_read_page_end_io(struct bio_vec *bvec,
+		struct completion *done, bool error)
 {
 	struct page *page = bvec->bv_page;
 	struct iomap_page *iop = to_iomap_page(page);
 
-	if (unlikely(error)) {
-		ClearPageUptodate(page);
-		SetPageError(page);
-	} else {
+	if (!error)
 		iomap_set_range_uptodate(page, bvec->bv_offset, bvec->bv_len);
-	}
 
-	if (!iop || atomic_sub_and_test(bvec->bv_len, &iop->read_bytes_pending))
-		unlock_page(page);
+	if (!iop ||
+	    atomic_sub_and_test(bvec->bv_len, &iop->read_bytes_pending)) {
+		if (done)
+			complete(done);
+		else
+			unlock_page(page);
+	}
 }
 
+struct iomap_readpage_ctx {
+	struct page		*cur_page;
+	bool			cur_page_in_bio;
+	blk_status_t		status;
+	struct bio		*bio;
+	struct readahead_control *rac;
+	struct completion	done;
+};
+
 static void
 iomap_read_end_io(struct bio *bio)
 {
-	int error = blk_status_to_errno(bio->bi_status);
+	struct iomap_readpage_ctx *ctx = bio->bi_private;
 	struct bio_vec *bvec;
 	struct bvec_iter_all iter_all;
 
+	/* Capture the first error */
+	if (ctx && ctx->status == BLK_STS_OK)
+		ctx->status = bio->bi_status;
+
 	bio_for_each_segment_all(bvec, bio, iter_all)
-		iomap_read_page_end_io(bvec, error);
+		iomap_read_page_end_io(bvec, ctx ? &ctx->done : NULL,
+				bio->bi_status != BLK_STS_OK);
 	bio_put(bio);
 }
 
-struct iomap_readpage_ctx {
-	struct page		*cur_page;
-	bool			cur_page_in_bio;
-	struct bio		*bio;
-	struct readahead_control *rac;
-};
-
 static void
 iomap_read_inline_data(struct inode *inode, struct page *page,
 		struct iomap *iomap)
@@ -292,6 +297,8 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 		ctx->bio->bi_opf = REQ_OP_READ;
 		if (ctx->rac)
 			ctx->bio->bi_opf |= REQ_RAHEAD;
+		else
+			ctx->bio->bi_private = ctx;
 		ctx->bio->bi_iter.bi_sector = sector;
 		bio_set_dev(ctx->bio, iomap->bdev);
 		ctx->bio->bi_end_io = iomap_read_end_io;
@@ -318,15 +325,17 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
 
 	trace_iomap_readpage(page->mapping->host, 1);
 
+	ctx.status = BLK_STS_OK;
+	init_completion(&ctx.done);
+
 	for (poff = 0; poff < PAGE_SIZE; poff += ret) {
 		ret = iomap_apply(inode, page_offset(page) + poff,
 				PAGE_SIZE - poff, 0, ops, &ctx,
 				iomap_readpage_actor);
-		if (ret <= 0) {
-			WARN_ON_ONCE(ret == 0);
-			SetPageError(page);
+		if (WARN_ON_ONCE(ret == 0))
+			ret = -EIO;
+		if (ret < 0)
 			break;
-		}
 	}
 
 	if (ctx.bio) {
@@ -334,15 +343,16 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
 		WARN_ON_ONCE(!ctx.cur_page_in_bio);
 	} else {
 		WARN_ON_ONCE(ctx.cur_page_in_bio);
-		unlock_page(page);
+		complete(&ctx.done);
 	}
 
-	/*
-	 * Just like mpage_readahead and block_read_full_page we always
-	 * return 0 and just mark the page as PageError on errors.  This
-	 * should be cleaned up all through the stack eventually.
-	 */
-	return 0;
+	wait_for_completion(&ctx.done);
+	if (ret >= 0)
+		ret = blk_status_to_errno(ctx.status);
+	if (ret == 0)
+		return AOP_UPDATED_PAGE;
+	unlock_page(page);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(iomap_readpage);
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
