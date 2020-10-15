Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0EEC433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 17:59:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C41C3222C2
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 17:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qveMVM9+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m21slifx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C41C3222C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VWJ+Mu0B+5VWBTcnoEGXStWgKKvi6C9As6osK+vcQsQ=; b=qveMVM9+aN3+ce23bU7MJ/ZNL
	3R89IbgjdscCEy29sxmb9wDBSoGD4Y4qfBZ8Xda/MjK6hx7yb2As4O2pYpzPLErVXgdzFKgXXYx3d
	f5XqgcW1Ql1d+71hj+0g87Ddub9dP8qHfEb73TfpJiMnQX3i2AJKHi5pye9dY9yf6C7Oi1SgxpmSZ
	LY7irbC0eReEd3fQrHY7PJ5t9uHADOCJ9wiCWhovYVy99WRrfVxt+u2fjpDzKTExW3VfBSLmtqNoZ
	ZlBzftnRR0gokBt5mQ6doln/1wJnA7nwvkmNOz7AF/t17UCXyekrPG5Wlmb2w4GLSnhY5g8Qgo5/Q
	2Qr7MseYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT7We-0001xu-SL; Thu, 15 Oct 2020 17:58:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT7Wb-0001wc-TU; Thu, 15 Oct 2020 17:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=x+XQ7VEyYNfvRvizRGPoAdTEAMGVk8qPQWatjzYSgQw=; b=m21slifxK1bGUo9NkuLnasLmGW
 W7j1mSzLsl8lqkNcmNBEmyamMl2n/iSza8Fv9vJdGtVQIw2/kDlRcMmM4PWbe5eP6FTvI4xm0WOWP
 4Adx+LchNEcYX2u8R/hnI8+L4xfRz5R7/ZW9gYaZ59Wva288nDtTL0QGvEDQcyQNBdTqXo87Bl3HW
 E62GWuauRw2KoIGK3HW5V9LXG8lMy3MQUVaq3gY0yr4/hMeSjIpZfqFbIV5olX2c1do/vAiTNpYlO
 890vukb4WHYvxnqK7wVoxPPIDsWceSIRHULvymZsZRjmZLVpToKJoS//KCJAy1r/TgDXANhlomCkj
 PpgfwI1A==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kT7Wa-00018B-31; Thu, 15 Oct 2020 17:58:48 +0000
Date: Thu, 15 Oct 2020 18:58:48 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 16/16] iomap: Make readpage synchronous
Message-ID: <20201015175848.GA4145@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
 <20201009143104.22673-17-willy@infradead.org>
 <20201015094203.GA21420@infradead.org>
 <20201015164333.GA20115@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015164333.GA20115@casper.infradead.org>
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
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 15, 2020 at 05:43:33PM +0100, Matthew Wilcox wrote:
> On Thu, Oct 15, 2020 at 10:42:03AM +0100, Christoph Hellwig wrote:
> > > +static void iomap_read_page_end_io(struct bio_vec *bvec,
> > > +		struct completion *done, bool error)
> > 
> > I really don't like the parameters here.  Part of the problem is
> > that ctx is only assigned to bi_private conditionally, which can
> > easily be fixed.  The other part is the strange bool error when
> > we can just pass on bi_stats.  See the patch at the end of what
> > I'd do intead.
> 
> I prefer assigning ctx conditionally to propagating the knowledge
> that !rac means synchronous.  I've gone with this:

And I really hate these kinds of conditional assignments.  If the
->rac check is too raw please just add an explicit

	bool synchronous : 1;

flag.

> @@ -340,16 +335,12 @@ iomap_readpage(struct page *page, const struct iomap_ops *
> ops)
>  
>         if (ctx.bio) {
>                 submit_bio(ctx.bio);
> +               if (ret > 0)
> +                       ret = blk_status_to_errno(ctx.status);
>         }
>  
> -       wait_for_completion(&ctx.done);
>         if (ret >= 0)
> -               ret = blk_status_to_errno(ctx.status);
> -       if (ret == 0)
>                 return AOP_UPDATED_PAGE;
>         unlock_page(page);
>         return ret;
> 
> 
> ... there's no need to call blk_status_to_errno if we never submitted a bio.

True.  I'd still prefer the AOP_UPDATED_PAGE as the fallthrough case
and an explicit goto out_unlock, though.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
