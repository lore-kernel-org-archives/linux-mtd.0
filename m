Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DAAEE49B3
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 22:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ppmlPSj4VBTlvrFZdgDnx2n4/DQGtU7OaPht8Ej+DQ=; b=kINTS0rTdp3YgW
	PYNNIFldfKL6ogRGfS2njOSnTMZCy01bSnexrkkzyPisvfeu/AZx5x/XAzLi6ZMIDUKD92TROaksN
	8c7k6Hy5BiRzNBvQ9d81eFfsjCaoamrv2lWqsXUzzXJEKjQbi6Vs58XO/yeNT8Dku5tDphsRgZUio
	Pcl7yIVN+Rrqck6cOqzuyJtnU2ose3/iSxHdmu6o2LBX5B/jjBpfEGUM2p5AskABmWwUSypLB/4j/
	0kD8goCiVgLoh9BHZlXAYPrI2q8WAX7KNGOQ8PrNsVvMenl2whJKTjk9oz+aFvi4qZxFycrB17Q/1
	U9W9giu9Inkt1T7QNH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZf6P-0066FP-1O;
	Fri, 25 Aug 2023 22:16:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZf6M-0066Eh-21
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 22:16:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bf7a6509deso10111555ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 25 Aug 2023 15:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1693001779; x=1693606579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppeQOWgbWz5gqWZs/rbytV4GhpZ82FSsmBh/giRYIfc=;
        b=oGxnlMh0S/WiVEBqRgXg0XkOHzHqDpTBvnGnagMxXiK0WZOe1Z4r+2p1ptsCZGDnWB
         pXEktmY/ad0PuwAxCgT0YcHOMRjDsuwyrAXCFtdwEmAj+muyxYQXIE+r39jHMvXhT5B0
         o+SPYmvdCE0AaqEX44rBk89wjuy74zXAp3Vwzk0u1JPoPtSJh1DrCjw1RqWqiFdJpqby
         tMNly65LV0QvaLstk47azhvzcHLQyEtc8q2u/G93EQr7wDi/F72WQh2TPKv7ILrD/tve
         HoezaGEwtih61yu0zT7giO0Mqh1qaOyneAEL9vdEIb12mBB0wZbgWFOwNbvY6RzLwUwH
         OW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693001779; x=1693606579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppeQOWgbWz5gqWZs/rbytV4GhpZ82FSsmBh/giRYIfc=;
        b=QozPw4WL5eLSJ37JWg7TT4Hdq5oJu0uT0CBBtgqd5uYo/Y3PfJxu8HL7GVkAgIQpyC
         vGfgBoUpq/7MxH1Qwl+yqW0cUMlDGJ/JsUJAVoEXoDN5MZYr7TggZDz0dpcJr7WYTv9C
         U7k0Z6w653607nCL+xzVn6DSWGEBNktci+aIxOvqVoxOK3hTxceju0WarsFZsN89qrhu
         p19PePEEhrFNNXtGoE2P/P1nYLUmLrM+V2PQFRqRE19dQqNpE2aLCamDsSpNGTG0usjx
         F0O2uQphDqKjQR5TIczY4iSXKUNK5QIbpwwbMYtlQ2nf4wRzjiRj6ZbYEmuOsJ5u7SM6
         Yybw==
X-Gm-Message-State: AOJu0YxZL4oPEjjJdbYdxbT7ow58HC5hXPg3kvGS7eEyzozZAbdIT2hD
	NTQcrSND2UAYKZ8P1Xu3QS80wg==
X-Google-Smtp-Source: AGHT+IEjt82Q7/ukix1Bwi0HcqOCAUCGzooSpz1T14B8KRhD3u7v0lApveU1bnKvxuVgpN4iNhxk8w==
X-Received: by 2002:a17:903:264e:b0:1bd:c338:ae14 with SMTP id je14-20020a170903264e00b001bdc338ae14mr16243879plb.12.1693001778913;
        Fri, 25 Aug 2023 15:16:18 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902684800b001c0bf60ba5csm2276046pln.272.2023.08.25.15.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:16:18 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qZf6F-006Va3-0j;
	Sat, 26 Aug 2023 08:16:15 +1000
Date: Sat, 26 Aug 2023 08:16:15 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 25/29] xfs: support nowait for xfs_buf_item_init()
Message-ID: <ZOkoL8nuXJDVZM1H@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-26-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-26-hao.xu@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_151622_667380_2E89CE9B 
X-CRM114-Status: GOOD (  28.57  )
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

On Fri, Aug 25, 2023 at 09:54:27PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> support nowait for xfs_buf_item_init() and error out -EAGAIN to
> _xfs_trans_bjoin() when it would block.
> 
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> ---
>  fs/xfs/xfs_buf_item.c         |  9 +++++++--
>  fs/xfs/xfs_buf_item.h         |  2 +-
>  fs/xfs/xfs_buf_item_recover.c |  2 +-
>  fs/xfs/xfs_trans_buf.c        | 16 +++++++++++++---
>  4 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/xfs/xfs_buf_item.c b/fs/xfs/xfs_buf_item.c
> index 023d4e0385dd..b1e63137d65b 100644
> --- a/fs/xfs/xfs_buf_item.c
> +++ b/fs/xfs/xfs_buf_item.c
> @@ -827,7 +827,8 @@ xfs_buf_item_free_format(
>  int
>  xfs_buf_item_init(
>  	struct xfs_buf	*bp,
> -	struct xfs_mount *mp)
> +	struct xfs_mount *mp,
> +	bool   nowait)
>  {
>  	struct xfs_buf_log_item	*bip = bp->b_log_item;
>  	int			chunks;
> @@ -847,7 +848,11 @@ xfs_buf_item_init(
>  		return 0;
>  	}
>  
> -	bip = kmem_cache_zalloc(xfs_buf_item_cache, GFP_KERNEL | __GFP_NOFAIL);
> +	bip = kmem_cache_zalloc(xfs_buf_item_cache,
> +				GFP_KERNEL | (nowait ? 0 : __GFP_NOFAIL));
> +	if (!bip)
> +		return -EAGAIN;
> +
>  	xfs_log_item_init(mp, &bip->bli_item, XFS_LI_BUF, &xfs_buf_item_ops);
>  	bip->bli_buf = bp;

I see filesystem shutdowns....

> diff --git a/fs/xfs/xfs_trans_buf.c b/fs/xfs/xfs_trans_buf.c
> index 016371f58f26..a1e4f2e8629a 100644
> --- a/fs/xfs/xfs_trans_buf.c
> +++ b/fs/xfs/xfs_trans_buf.c
> @@ -57,13 +57,14 @@ xfs_trans_buf_item_match(
>   * If the buffer does not yet have a buf log item associated with it,
>   * then allocate one for it.  Then add the buf item to the transaction.
>   */
> -STATIC void
> +STATIC int
>  _xfs_trans_bjoin(
>  	struct xfs_trans	*tp,
>  	struct xfs_buf		*bp,
>  	int			reset_recur)
>  {
>  	struct xfs_buf_log_item	*bip;
> +	int ret;
>  
>  	ASSERT(bp->b_transp == NULL);
>  
> @@ -72,7 +73,11 @@ _xfs_trans_bjoin(
>  	 * it doesn't have one yet, then allocate one and initialize it.
>  	 * The checks to see if one is there are in xfs_buf_item_init().
>  	 */
> -	xfs_buf_item_init(bp, tp->t_mountp);
> +	ret = xfs_buf_item_init(bp, tp->t_mountp,
> +				tp->t_flags & XFS_TRANS_NOWAIT);
> +	if (ret < 0)
> +		return ret;
> +
>  	bip = bp->b_log_item;
>  	ASSERT(!(bip->bli_flags & XFS_BLI_STALE));
>  	ASSERT(!(bip->__bli_format.blf_flags & XFS_BLF_CANCEL));
> @@ -92,6 +97,7 @@ _xfs_trans_bjoin(
>  	xfs_trans_add_item(tp, &bip->bli_item);
>  	bp->b_transp = tp;
>  
> +	return 0;
>  }
>  
>  void
> @@ -309,7 +315,11 @@ xfs_trans_read_buf_map(
>  	}
>  
>  	if (tp) {
> -		_xfs_trans_bjoin(tp, bp, 1);
> +		error = _xfs_trans_bjoin(tp, bp, 1);
> +		if (error) {
> +			xfs_buf_relse(bp);
> +			return error;
> +		}
>  		trace_xfs_trans_read_buf(bp->b_log_item);

So what happens at the callers when we have a dirty transaction and
joining a buffer fails with -EAGAIN?

Apart from the fact this may well propagate -EAGAIN up to userspace,
cancelling a dirty transaction at this point will result in a
filesystem shutdown....

Indeed, this can happen in the "simple" timestamp update case that
this "nowait" semantic is being aimed at. We log the inode in the
timestamp update, which dirties the log item and registers a
precommit operation to be run. We commit the
transaction, which then runs xfs_inode_item_precommit() and that
may need to attach the inode to the inode cluster buffer. This
results in:

xfs_inode_item_precommit
  xfs_imap_to_bp
    xfs_trans_read_buf_map
      _xfs_trans_bjoin
        xfs_buf_item_init(XFS_TRANS_NOWAIT)
	  kmem_cache_zalloc(GFP_NOFS)
	  <memory allocation fails>
      gets -EAGAIN error
    propagates -EAGAIN
  fails due to -EAGAIN

And now xfs_trans_commit() fails with a dirty transaction and the
filesystem shuts down.

IOWs, XFS_TRANS_NOWAIT as it stands is fundamentally broken. Once we
dirty an item in a transaction, we *cannot* back out of the
transaction. We *must block* in every place that could fail -
locking, memory allocation and/or IO - until the transaction
completes because we cannot undo the changes we've already made to
the dirty items in the transaction....

It's even worse than that - once we have committed intents, the
whole chain of intent processing must be run to completionr. Hence
we can't tolerate backing out of that defered processing chain half
way through because we might have to block.

Until we can roll back partial dirty transactions and partially
completed defered intent chains at any random point of completion,
XFS_TRANS_NOWAIT will not work.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
