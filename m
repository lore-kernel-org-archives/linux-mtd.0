Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357ECC433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 09:42:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26452222B
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 09:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q4xjAPNT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UbzTDpbC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26452222B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VMQBMNk8RJeQ67QVtezo1aCcC3B3uKhggmmpQTRvPCE=; b=q4xjAPNT5hircSAuo0YyWRfb6
	PU/+hVQbZdvv7t9qNAvgCMu3xHtUu4FE6yDgnMlRwcflgLAPbb+cVy45ftDSBr/R+Ja/mmCgm5g+7
	NQLJMZ61fcJmlbcAoNRgQAbXOWEHRk5tO4sEJh9l/y7FEPEjTtxxSOFaZUAu5/dLrNyp1JQPprZgy
	B3qE7eZxrykI8rsU1a6tMg3HLiNOiWhAHP+g36FWA8cEfxM6rI/51IaS5XDT9JPw35CLl0ukUZmdU
	07wwCYrNlbS1TYRLygC5w3wL23Eenz903IFg7TS9WpMxPOWlgKmHENdAyvb68/zmOh7d8uNPF/PU6
	yhlCkz7Dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSzlv-0000qo-LM; Thu, 15 Oct 2020 09:42:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSzls-0000p8-Oh; Thu, 15 Oct 2020 09:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5ZNMyaMGLyh0iAzgchZNWKe2QHg2PouniT97lm2hLjc=; b=UbzTDpbCdU/uUj0rHetupp4L8v
 PaUluuLxr8LZvOCbK9ck4YLDi3+zPB/hmdH1KgeWEQy8Co2xXtMtUhhVl9GuJYbtbnLeCYd76TNBS
 HZdz95qNkGmkZVezmYCzg8HJhkMbKqv1Xzk2iHdAGnB93fydw7f720JSiZsLwGL22D4bQXb6udDfh
 PL01QS5q/vOm7rs0lz6hK4oIgOO7vvQYNc16v1alatMUt6a+VXectLz3GydJeK3X0T3ZVV1HjE6ii
 B2gLxhncLeJgIGpvtuBsx546BEOgs/6FT1ows1Phr2vQszB8BnyKkzc5Y6LhzlbR7Y0dCe+NH+Dss
 rHuYJitg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kSzlr-0005i9-5C; Thu, 15 Oct 2020 09:42:03 +0000
Date: Thu, 15 Oct 2020 10:42:03 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v2 16/16] iomap: Make readpage synchronous
Message-ID: <20201015094203.GA21420@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
 <20201009143104.22673-17-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009143104.22673-17-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> +static void iomap_read_page_end_io(struct bio_vec *bvec,
> +		struct completion *done, bool error)

I really don't like the parameters here.  Part of the problem is
that ctx is only assigned to bi_private conditionally, which can
easily be fixed.  The other part is the strange bool error when
we can just pass on bi_stats.  See the patch at the end of what
I'd do intead.

> @@ -318,15 +325,17 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
>  
>  	trace_iomap_readpage(page->mapping->host, 1);
>  
> +	ctx.status = BLK_STS_OK;

This should move into the initializer for ctx.  Or we could just drop
it given that BLK_STS_OK is and must always be 0.

>  	} else {
>  		WARN_ON_ONCE(ctx.cur_page_in_bio);
> -		unlock_page(page);
> +		complete(&ctx.done);
>  	}
>  
> +	wait_for_completion(&ctx.done);

I don't think we need the complete / wait_for_completion dance in
this case.

> +	if (ret >= 0)
> +		ret = blk_status_to_errno(ctx.status);
> +	if (ret == 0)
> +		return AOP_UPDATED_PAGE;
> +	unlock_page(page);
> +	return ret;

Nipick, but I'd rather have a goto out_unlock for both error case
and have the AOP_UPDATED_PAGE for the normal path straight in line.

Here is an untested patch with my suggestions:


diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 887bf871ca9bba..81d34725565d7e 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -162,33 +162,34 @@ static void iomap_set_range_uptodate(struct page *page, unsigned off,
 	spin_unlock_irqrestore(&iop->uptodate_lock, flags);
 }
 
-static void iomap_read_page_end_io(struct bio_vec *bvec,
-		struct completion *done, bool error)
+struct iomap_readpage_ctx {
+	struct page		*cur_page;
+	bool			cur_page_in_bio;
+	blk_status_t		status;
+	struct bio		*bio;
+	struct readahead_control *rac;
+	struct completion	done;
+};
+
+static void
+iomap_read_page_end_io(struct iomap_readpage_ctx *ctx, struct bio_vec *bvec,
+		blk_status_t status)
 {
 	struct page *page = bvec->bv_page;
 	struct iomap_page *iop = to_iomap_page(page);
 
-	if (!error)
+	if (status == BLK_STS_OK)
 		iomap_set_range_uptodate(page, bvec->bv_offset, bvec->bv_len);
 
 	if (!iop ||
 	    atomic_sub_and_test(bvec->bv_len, &iop->read_bytes_pending)) {
-		if (done)
-			complete(done);
-		else
+		if (ctx->rac)
 			unlock_page(page);
+		else
+			complete(&ctx->done);
 	}
 }
 
-struct iomap_readpage_ctx {
-	struct page		*cur_page;
-	bool			cur_page_in_bio;
-	blk_status_t		status;
-	struct bio		*bio;
-	struct readahead_control *rac;
-	struct completion	done;
-};
-
 static void
 iomap_read_end_io(struct bio *bio)
 {
@@ -197,12 +198,11 @@ iomap_read_end_io(struct bio *bio)
 	struct bvec_iter_all iter_all;
 
 	/* Capture the first error */
-	if (ctx && ctx->status == BLK_STS_OK)
+	if (ctx->status == BLK_STS_OK)
 		ctx->status = bio->bi_status;
 
 	bio_for_each_segment_all(bvec, bio, iter_all)
-		iomap_read_page_end_io(bvec, ctx ? &ctx->done : NULL,
-				bio->bi_status != BLK_STS_OK);
+		iomap_read_page_end_io(ctx, bvec, bio->bi_status);
 	bio_put(bio);
 }
 
@@ -297,8 +297,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 		ctx->bio->bi_opf = REQ_OP_READ;
 		if (ctx->rac)
 			ctx->bio->bi_opf |= REQ_RAHEAD;
-		else
-			ctx->bio->bi_private = ctx;
+		ctx->bio->bi_private = ctx;
 		ctx->bio->bi_iter.bi_sector = sector;
 		bio_set_dev(ctx->bio, iomap->bdev);
 		ctx->bio->bi_end_io = iomap_read_end_io;
@@ -318,14 +317,16 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 int
 iomap_readpage(struct page *page, const struct iomap_ops *ops)
 {
-	struct iomap_readpage_ctx ctx = { .cur_page = page };
+	struct iomap_readpage_ctx ctx = {
+		.cur_page	= page,
+		.status		= BLK_STS_OK,
+	};
 	struct inode *inode = page->mapping->host;
 	unsigned poff;
 	loff_t ret;
 
 	trace_iomap_readpage(page->mapping->host, 1);
 
-	ctx.status = BLK_STS_OK;
 	init_completion(&ctx.done);
 
 	for (poff = 0; poff < PAGE_SIZE; poff += ret) {
@@ -340,17 +341,16 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
 
 	if (ctx.bio) {
 		submit_bio(ctx.bio);
-		WARN_ON_ONCE(!ctx.cur_page_in_bio);
-	} else {
-		WARN_ON_ONCE(ctx.cur_page_in_bio);
-		complete(&ctx.done);
+		wait_for_completion(&ctx.done);
 	}
 
-	wait_for_completion(&ctx.done);
-	if (ret >= 0)
-		ret = blk_status_to_errno(ctx.status);
-	if (ret == 0)
-		return AOP_UPDATED_PAGE;
+	if (ret < 0)
+		goto out_unlock;
+	ret = blk_status_to_errno(ctx.status);
+	if (ret < 0)
+		goto out_unlock;
+	return AOP_UPDATED_PAGE;
+out_unlock:
 	unlock_page(page);
 	return ret;
 }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
