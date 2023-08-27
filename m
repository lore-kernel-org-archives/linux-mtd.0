Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0EEC83F01
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Aug 2023 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HouHWEHdP+TY7fWxfGOKbE6LcAHTyujOBBOuZ6nh7s=; b=LOyHmskH96dX4U
	QdOVj8+X6Ftgz3NQdsjn6ZEISGKRSNmv1HgUpEizdbUxj3o+9ETYLZdCFvK2y148Xpf4h1Nj5cdem
	WsYjGekmW1LFAcD6M4QKShw9vGI6n+48G579nW2eUFf3dF27RoYVYhn3lU0vDwGgA0m4nO+R4Sadq
	Ek37aDL1QntPDqokbyMQhHHFc54yLJWPD/+p+oRpiAZsD6mNUD+XfBBw3fPsitmat5VBiaV0sND0B
	eZtV2iYAR39MeXYox7F3UdTMAdTe3+OHdEcty8Eu0RjxKy3K4UJxEWAnbYE5U0phmULaNHYaif53i
	JD0PujVc35BBAhqiDA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaMdE-008Rpc-18;
	Sun, 27 Aug 2023 20:45:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaMdC-008RpV-28
	for linux-mtd@bombadil.infradead.org;
	Sun, 27 Aug 2023 20:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b31OO6Xd9+jxzKw5QB3n4d33iA6sZ4nPi+nMylKSno4=; b=rh2eHyjfSChvP5M3GZFqng0djt
	iCSjqmEmDczFMnSTrKUt8mmVXGPGgbJ4oq2lIEXyRSbFH+YR4YMUxP/z9QQKohjOoCQZks3WE0IMK
	3S4hJ/QxWWGwrLIXBI8vnsgZg3HMNGIE+hIRemTa2iQvkDDHCCMd0yz1djBYQiyi1qOQAKg4GjHdy
	fEL5cINLesPqAO5iR1xTPAPnXU+iFHAHJEGUTx86DeTnZzv1uxgeaR21j4BV+7nscvIXdd9sVE/Si
	rCIGIbVvaskI417AUCK4HwQeBGpvqIcrg+ypempVGeBQFeEiZBUSg5QboubLY+HaM/1Y954EFPxgD
	hXmevJ/g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qaMcv-00Dkeb-PH; Sun, 27 Aug 2023 20:44:53 +0000
Date: Sun, 27 Aug 2023 21:44:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>,
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
Subject: Re: [PATCH 02/11] xfs: add NOWAIT semantics for readdir
Message-ID: <ZOu1xYS6LRmPgEiV@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827132835.1373581-3-hao.xu@linux.dev>
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

On Sun, Aug 27, 2023 at 09:28:26PM +0800, Hao Xu wrote:
> +++ b/fs/xfs/libxfs/xfs_da_btree.c
> @@ -2643,16 +2643,32 @@ xfs_da_read_buf(
>  	struct xfs_buf_map	map, *mapp = &map;
>  	int			nmap = 1;
>  	int			error;
> +	int			buf_flags = 0;
>  
>  	*bpp = NULL;
>  	error = xfs_dabuf_map(dp, bno, flags, whichfork, &mapp, &nmap);
>  	if (error || !nmap)
>  		goto out_free;
>  
> +	/*
> +	 * NOWAIT semantics mean we don't wait on the buffer lock nor do we
> +	 * issue IO for this buffer if it is not already in memory. Caller will
> +	 * retry. This will return -EAGAIN if the buffer is in memory and cannot
> +	 * be locked, and no buffer and no error if it isn't in memory.  We
> +	 * translate both of those into a return state of -EAGAIN and *bpp =
> +	 * NULL.
> +	 */

I would not include this comment.

> +	if (flags & XFS_DABUF_NOWAIT)
> +		buf_flags |= XBF_TRYLOCK | XBF_INCORE;
>  	error = xfs_trans_read_buf_map(mp, tp, mp->m_ddev_targp, mapp, nmap, 0,
>  			&bp, ops);

what tsting did you do with this?  Because you don't actually _use_
buf_flags anywhere in this patch (presumably they should be the
sixth argument to xfs_trans_read_buf_map() instead of 0).  So I can only
conclude that either you didn't test, or your testing was inadequate.

>  	if (error)
>  		goto out_free;
> +	if (!bp) {
> +		ASSERT(flags & XFS_DABUF_NOWAIT);

I don't think this ASSERT is appropriate.

> @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
>  				bp = NULL;
>  			}
>  
> -			if (*lock_mode == 0)
> -				*lock_mode = xfs_ilock_data_map_shared(dp);
> +			if (*lock_mode == 0) {
> +				*lock_mode =
> +					xfs_ilock_data_map_shared_generic(dp,
> +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
> +				if (!*lock_mode) {
> +					error = -EAGAIN;
> +					break;
> +				}
> +			}

'generic' doesn't seem like a great suffix to mean 'takes nowait flag'.
And this is far too far indented.

			xfs_dir2_lock(dp, ctx, lock_mode);

with:

STATIC void xfs_dir2_lock(struct xfs_inode *dp, struct dir_context *ctx,
		unsigned int lock_mode)
{
	if (*lock_mode)
		return;
	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
		return xfs_ilock_data_map_shared_nowait(dp);
	return xfs_ilock_data_map_shared(dp);
}

... which I think you can use elsewhere in this patch (reformat it to
XFS coding style, of course).  And then you don't need
xfs_ilock_data_map_shared_generic().


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
