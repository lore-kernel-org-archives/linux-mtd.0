Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484B4C433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 16:45:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB6722268
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 16:44:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1aSNLkrN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bQaSzufp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB6722268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QdnnePnJN4nBOMPu1XNcZnf3/Lb894bT7Dbzr6wieN4=; b=1aSNLkrNm3Ty1iSkCn3cTNlU5
	3Roak3zMouO1LffhxjLA7IHB+8RwOgVd+6eAZcSrZJKxMSoO77ZDQdHNje5BViPChTHU4iUfaUJpV
	JDzZsAMdlgA+/CMTxJ7V4rpGVUvvVP1uw7g7+NxfY2Eb0NLK9IugnCLd3ii4kdeSzLxufv4FHwrE3
	iKu1FuBFnk6i4ta8X+qYR/4KX/FMw1UE8FGjUqLzE3p+bZvHWFrYHEGNKoIP4eefxSP+lUXrRid0j
	NxVld9Q9xtNYRmEtSBXZAXgPa1KeAZ2+7DJs6ib4HTNC88AeB85F9H5fVH9Hj3I1tTlbAZF+fvRF7
	eBW8AN8zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT6Lq-0001zr-UC; Thu, 15 Oct 2020 16:43:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT6Ln-0001yT-9d; Thu, 15 Oct 2020 16:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Hz/6L/k6/ZOdJL5HZTqoNr1Jk2Qpg013UruFF7Ew+Ak=; b=bQaSzufpfmAGrd9FrqRwxr4T5m
 X84DxXuyxdBxVSzNhwLsBArjvcHS/mpvQPMZpafZ2TFdCdqgJ61ukuXQ8z1+fRqIJN4wmquqbdjwb
 WlC/CzV4Pp78jUv25MprLTjKe1dtz28Q/PktQvYy7zVnE/E3avpBrh5UWPXm2Fgae7v6OeA7rDMq4
 7iaqZGguIxyTRBXcyx5J0Q4M03apjgSaI7oKJVb+jf6v9ttPIG3pGr5Dj6oOGRgd2VxNiwCBRvGTx
 qATN08w9wjnLNiSCe1bkXvj5OwbEQdtYQ+VNCBA2TlI4A8jt7rVLQHJzG1ZvNjQL68Fr4DnKbAIwu
 E1bjNH9Q==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kT6Lm-0005af-0i; Thu, 15 Oct 2020 16:43:34 +0000
Date: Thu, 15 Oct 2020 17:43:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 16/16] iomap: Make readpage synchronous
Message-ID: <20201015164333.GA20115@casper.infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
 <20201009143104.22673-17-willy@infradead.org>
 <20201015094203.GA21420@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015094203.GA21420@infradead.org>
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

On Thu, Oct 15, 2020 at 10:42:03AM +0100, Christoph Hellwig wrote:
> > +static void iomap_read_page_end_io(struct bio_vec *bvec,
> > +		struct completion *done, bool error)
> 
> I really don't like the parameters here.  Part of the problem is
> that ctx is only assigned to bi_private conditionally, which can
> easily be fixed.  The other part is the strange bool error when
> we can just pass on bi_stats.  See the patch at the end of what
> I'd do intead.

I prefer assigning ctx conditionally to propagating the knowledge
that !rac means synchronous.  I've gone with this:

 static void iomap_read_page_end_io(struct bio_vec *bvec,
-               struct completion *done, bool error)
+               struct iomap_readpage_ctx *ctx, blk_status_t status)
 {
        struct page *page = bvec->bv_page;
        struct iomap_page *iop = to_iomap_page(page);
 
-       if (!error)
+       if (status == BLK_STS_OK) {
                iomap_set_range_uptodate(page, bvec->bv_offset, bvec->bv_len);
+       } else if (ctx && ctx->status == BLK_STS_OK) {
+               ctx->status = status;
+       }
 
        if (!iop ||
            atomic_sub_and_test(bvec->bv_len, &iop->read_bytes_pending)) {
-               if (done)
-                       complete(done);
+               if (ctx)
+                       complete(&ctx->done);
                else
                        unlock_page(page);
        }

> >  	} else {
> >  		WARN_ON_ONCE(ctx.cur_page_in_bio);
> > -		unlock_page(page);
> > +		complete(&ctx.done);
> >  	}
> >  
> > +	wait_for_completion(&ctx.done);
> 
> I don't think we need the complete / wait_for_completion dance in
> this case.
> 
> > +	if (ret >= 0)
> > +		ret = blk_status_to_errno(ctx.status);
> > +	if (ret == 0)
> > +		return AOP_UPDATED_PAGE;
> > +	unlock_page(page);
> > +	return ret;
> 
> Nipick, but I'd rather have a goto out_unlock for both error case
> and have the AOP_UPDATED_PAGE for the normal path straight in line.
> 
> Here is an untested patch with my suggestions:

I think we can go a little further here:

@@ -340,16 +335,12 @@ iomap_readpage(struct page *page, const struct iomap_ops *
ops)
 
        if (ctx.bio) {
                submit_bio(ctx.bio);
-               WARN_ON_ONCE(!ctx.cur_page_in_bio);
-       } else {
-               WARN_ON_ONCE(ctx.cur_page_in_bio);
-               complete(&ctx.done);
+               wait_for_completion(&ctx.done);
+               if (ret > 0)
+                       ret = blk_status_to_errno(ctx.status);
        }
 
-       wait_for_completion(&ctx.done);
        if (ret >= 0)
-               ret = blk_status_to_errno(ctx.status);
-       if (ret == 0)
                return AOP_UPDATED_PAGE;
        unlock_page(page);
        return ret;


... there's no need to call blk_status_to_errno if we never submitted a bio.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
