Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE44C7EE2C
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 21:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/vwCUBOPB+T7bJuHpz7OllchLWPcI+pTNC5mzAxBY0=; b=pxWKPVFv5dbg48
	xL2CjaV24aFRHEiZ3CHbd7kf7nRle1fFQw4vtEIWT/Boo6W4fcat1N6P+1VsAgm6MO2kXeIP8Afa+
	Sb2yS345MV+KUDrla8qPrCeR9C3ogO8JB/9Q9ZAjmrCefSR6/OEe+0ax9lK8kJFFTQgEWlulJEof6
	943xKSgV0z1x3mueekKMW4q94596SrF7CLuIBur9pW0puuvqU/be0evRIHGF7aLFpK/zSNISKYHie
	Ihutxp5vdoEKScy+HgbvoHtjmXJe5kaTpSMsDx1yHAfP6+oFGrBodl7RZW94/i2juW+lLDvx2oWML
	JdptnN3hkWluIjaHVwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZeWY-0063XU-2q;
	Fri, 25 Aug 2023 21:39:22 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZeWW-0063We-14
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 21:39:22 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68bec3a9bdbso1060337b3a.3
        for <linux-mtd@lists.infradead.org>; Fri, 25 Aug 2023 14:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1692999556; x=1693604356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7dRQ9By/T99QWDW5xev9b8rVkM9NZXXwZrmSduoTKY=;
        b=SlHW1FHh55Miyt5dC5YbHFzbz8/Ww6dpIRyxo6vWvL1BUT9wpnYc90O8W3sh6jbVDI
         8VSN/Xe7i/NpqgfmZUfGif/OWVY4CvO1XNCApsJ0gTKpBFDUVISAdbUZIXX0AL7Ymm4P
         GTcb7wyrBEoupwm2T77MgFldNvL555iN8Gi3uYCzgcocNv0xnFj+WWlwbcbOTqmgKZI+
         MLGEhJoBOR8ij98DujYJDG8/ErJs1WTRaajOZxKdaJWii5ir39jpSlGIz75MH3BFujgn
         75aCRb2KJIpxhwlYFJHEvUeGNqpylJdIJf8XyyAJR0UoHIDg5wblyZNVqnwV4VZyvNd5
         jfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692999556; x=1693604356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7dRQ9By/T99QWDW5xev9b8rVkM9NZXXwZrmSduoTKY=;
        b=BNdYISnG+2zbWBTAjOr5VxUr9CQIZCHu6uGLnu/MW3aHPFZ2SXXHX+HnG3Vihv6BE/
         Aq5tg0xu8xEtzbgvJo0BkqlT/KgNVs2wVxsrdwRRtzb2miWSJpv4fSS7DwhOCsGoCnj9
         yUHRz21hO6wlghQtS5t7aJnjECj+0z8Q53phNhY1C0uxhOw6CmxyUtZPvh7caYYwZkm4
         yu0NGNFE5meJ4BzhxplyJrX6OPPhyETAosNKL6RxkcF0q9r95cPav0hmIYEvKhytVoKh
         yoHu0HXAef7mZm2j/dswuVxqUG6KiH92USnQkvpWFu47kM01Rg4HRpPHwohc/RWRUhIQ
         YubA==
X-Gm-Message-State: AOJu0YxQDX/cLH5e+VhLYCpvmA3L1kTuc+1ZOxADpP4nw6SsnAZM62Ek
	t8M3wQRu0z8djszZd2MkmtHWRw==
X-Google-Smtp-Source: AGHT+IFGwDu4J6IE5hfbjc7KSF4OfJEndquVBvBoV5vhWuIhyGy4zoBWcpcC8Lokr19GaOsT0RulfQ==
X-Received: by 2002:a05:6a20:7fa0:b0:140:324c:124c with SMTP id d32-20020a056a207fa000b00140324c124cmr22387249pzj.62.1692999556447;
        Fri, 25 Aug 2023 14:39:16 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id a14-20020a62bd0e000000b006875df4773fsm1997221pff.163.2023.08.25.14.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:39:15 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qZeWO-006Uvd-0J;
	Sat, 26 Aug 2023 07:39:12 +1000
Date: Sat, 26 Aug 2023 07:39:12 +1000
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
Subject: Re: [PATCH 02/29] xfs: rename XBF_TRYLOCK to XBF_NOWAIT
Message-ID: <ZOkfgBlWKVmGN84i@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-3-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-3-hao.xu@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_143920_564357_AC760E89 
X-CRM114-Status: GOOD (  27.14  )
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

On Fri, Aug 25, 2023 at 09:54:04PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> XBF_TRYLOCK means we need lock but don't block on it,

Yes.


> we can use it to
> stand for not waiting for memory allcation. Rename XBF_TRYLOCK to
> XBF_NOWAIT, which is more generic.

No.

Not only can XBF_TRYLOCK require memory allocation, it can require
IO to be issued. We use TRYLOCK for -readahead- and so we *must* be
able to allocate memory and issue IO under TRYLOCK caller
conditions.

[...]

> diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
> index d440393b40eb..2ccb0867824c 100644
> --- a/fs/xfs/libxfs/xfs_attr_remote.c
> +++ b/fs/xfs/libxfs/xfs_attr_remote.c
> @@ -661,7 +661,7 @@ xfs_attr_rmtval_invalidate(
>  			return error;
>  		if (XFS_IS_CORRUPT(args->dp->i_mount, nmap != 1))
>  			return -EFSCORRUPTED;
> -		error = xfs_attr_rmtval_stale(args->dp, &map, XBF_TRYLOCK);
> +		error = xfs_attr_rmtval_stale(args->dp, &map, XBF_NOWAIT);
>  		if (error)
>  			return error;

XBF_INCORE | XBF_NOWAIT makes no real sense. I mean, XBF_INCORE is
exactly "find a cached buffer or fail" - it's not going to do any
memory allocation or IO so NOWAIT smeantics don't make any sense
here. It's the buffer lock that this lookup is explicitly
avoiding, and so TRYLOCK describes exactly the semantics we want
from this incore lookup.

Indeed, this is a deadlock avoidance mechanism as the transaction
may already have the buffer locked and so we don't want the
xfs_buf_incore() lookup to try to lock the buffer again. TRYLOCK
documents this pretty clearly - NOWAIT loses that context....

> diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
> index 6a6503ab0cd7..77c4f1d83475 100644
> --- a/fs/xfs/libxfs/xfs_btree.c
> +++ b/fs/xfs/libxfs/xfs_btree.c
> @@ -1343,7 +1343,7 @@ xfs_btree_read_buf_block(
>  	int			error;
>  
>  	/* need to sort out how callers deal with failures first */
> -	ASSERT(!(flags & XBF_TRYLOCK));
> +	ASSERT(!(flags & XBF_NOWAIT));
>  
>  	error = xfs_btree_ptr_to_daddr(cur, ptr, &d);
>  	if (error)
> diff --git a/fs/xfs/scrub/repair.c b/fs/xfs/scrub/repair.c
> index ac6d8803e660..9312cf3b20e2 100644
> --- a/fs/xfs/scrub/repair.c
> +++ b/fs/xfs/scrub/repair.c
> @@ -460,7 +460,7 @@ xrep_invalidate_block(
>  
>  	error = xfs_buf_incore(sc->mp->m_ddev_targp,
>  			XFS_FSB_TO_DADDR(sc->mp, fsbno),
> -			XFS_FSB_TO_BB(sc->mp, 1), XBF_TRYLOCK, &bp);
> +			XFS_FSB_TO_BB(sc->mp, 1), XBF_NOWAIT, &bp);

My point exactly.

xfs_buf_incore() is simply a lookup with XBF_INCORE set. (XBF_INCORE
| XBF_TRYLOCK) has the exactly semantics of "return the buffer only
if it is cached and we can lock it without blocking.

It will not instantiate a new buffer (i.e. do memory allocation) or
do IO because the if it is under IO the buffer lock will be held.

So, essentially, this "NOWAIT" semantic you want is already supplied
by (XBF_INCORE | XBF_TRYLOCK) buffer lookups.

>  	if (error)
>  		return 0;
>  
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index 15d1e5a7c2d3..9f84bc3b802c 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -228,7 +228,7 @@ _xfs_buf_alloc(
>  	 * We don't want certain flags to appear in b_flags unless they are
>  	 * specifically set by later operations on the buffer.
>  	 */
> -	flags &= ~(XBF_UNMAPPED | XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD);
> +	flags &= ~(XBF_UNMAPPED | XBF_NOWAIT | XBF_ASYNC | XBF_READ_AHEAD);
>  
>  	atomic_set(&bp->b_hold, 1);
>  	atomic_set(&bp->b_lru_ref, 1);
> @@ -543,7 +543,7 @@ xfs_buf_find_lock(
>  	struct xfs_buf          *bp,
>  	xfs_buf_flags_t		flags)
>  {
> -	if (flags & XBF_TRYLOCK) {
> +	if (flags & XBF_NOWAIT) {
>  		if (!xfs_buf_trylock(bp)) {
>  			XFS_STATS_INC(bp->b_mount, xb_busy_locked);
>  			return -EAGAIN;
> @@ -886,7 +886,7 @@ xfs_buf_readahead_map(
>  	struct xfs_buf		*bp;
>  
>  	xfs_buf_read_map(target, map, nmaps,
> -		     XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
> +		     XBF_NOWAIT | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
>  		     __this_address);

That will break readahead (which we use extensively in getdents
operations) if we can't allocate buffers and issue IO under NOWAIT
conditions.

>  }
>  
> diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
> index 549c60942208..8cd307626939 100644
> --- a/fs/xfs/xfs_buf.h
> +++ b/fs/xfs/xfs_buf.h
> @@ -45,7 +45,7 @@ struct xfs_buf;
>  
>  /* flags used only as arguments to access routines */
>  #define XBF_INCORE	 (1u << 29)/* lookup only, return if found in cache */
> -#define XBF_TRYLOCK	 (1u << 30)/* lock requested, but do not wait */
> +#define XBF_NOWAIT	 (1u << 30)/* mem/lock requested, but do not wait */

That's now a really poor comment. It doesn't describe the semantics
or constraints that NOWAIT might imply.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
