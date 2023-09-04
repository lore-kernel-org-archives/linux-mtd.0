Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14896CA0FE9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Sep 2023 01:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRpYh9eXmuzZ6AXoulruXY6cyWQPmZUDkt4WWlYHdJc=; b=tAQZpeCH2qq7zB
	N1WEWGZDbpv35Rtsm7gv8u1lWSYbjFb49ExxdtUdu5ID/gpfBfiHPDOCdNhhYHvFC0b7mot18cOwj
	EWgT69Aa4l3I8/3n3yEeFe9xo5/SqPg8Xp5lSotE+DDvmZsWx2RHcFGysUuJ7ftK/zKuSLtRsiKY4
	7qlB+IS+UC2SdaWFo+gLitvgd0MNEVNJbRzRL8SsBQWkCbNYa565uwb+z3k3RLaYCfWnIQQo6yQKG
	m/EDeYhmhV7cMyRfs4i6TkrR+qkbWMHGws+zQmycpxIJ2HPnQ3k2xMOf+2lRQ3qoaz0ldYrQAcDS9
	bH8nFj/g3a2wIXwEizfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcxzL-00363F-2Y;
	Mon, 04 Sep 2023 01:02:47 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcxzI-00361O-1b
	for linux-mtd@lists.infradead.org;
	Mon, 04 Sep 2023 01:02:46 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bf55a81eeaso2041515ad.0
        for <linux-mtd@lists.infradead.org>; Sun, 03 Sep 2023 18:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1693789356; x=1694394156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SkjlWpTOnFF4QpgAAxUR7lqv3IHtXsX9Ov+YWVrmXw=;
        b=nRlD9NcFNg7w+4VQaUknhe3yFzv199i50nmpuijfeVO2TkHXChMK4Qb2NyqdFogYjS
         VziMR9VKAPUOYM7ek71cta9G6jZ1AGt/zIK40lHdeOpJWg/us8UA09dRbj7X+A5UZ2oI
         +ee9rSg3m0LTeXMPA/HbK9ySp9+N/+Z5CmO4Ncof2YB/CmQQ6XzChB4rAI3Xo548qUYK
         RbVpFmWNgRJAxKbYRqywr9VbS/rrlQYQep6ow+Q+n1Ds9oOSVW3uir9y58FCgl10ab+1
         u102R5+u59nuuKUDCeKNEycto6laha7U0DrSKR0daOhCBI/9LDevyrfqy6FHWanucL1E
         dz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693789356; x=1694394156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SkjlWpTOnFF4QpgAAxUR7lqv3IHtXsX9Ov+YWVrmXw=;
        b=bSh+3QKRsyEazw4ACnRnbUYNdKJoiCFd90hSQJH9ljVxoPpmOh23dbSwmfR5Mscp4b
         cMNfTZcur0Tj/WceYkn2ARn7Mn23j4uN8ebKVKpRSWiVpz40OzU26p1RWgHl0HsgJK3n
         2PfJd3Nb4C+Cj+qAfSJ86ebLI7GkHMdvhgABmFu1lDx+ZhfHmLUqAejxBvJn5uc70yX+
         1h84/BT1v+vT4eOAYyBg4NkXGNyOTCWzUJ6dkRdgAIYIGWE2ye5yn113r5ClOQu0V+z4
         YBapIuPxUSLuVvgfv6g4JdfA60czH+nvZ5m1/y2I1n8lZy+zA9j0AnnC9R7sAR3CQeFS
         7fmw==
X-Gm-Message-State: AOJu0YzT18p/Wg9ZrSJm2K4c65pu4i+iUq+EW54BOyrzj2mZNj1p61VI
	mkxV7VROOJW5xdec4Iq08GgDXw==
X-Google-Smtp-Source: AGHT+IGGrky2P+bBuH4AKgWBeYdqXOP6u+qaOJyeKMBTbWb7BRdsdnk0jjxmGVwySX0sZe8eaRNDcw==
X-Received: by 2002:a17:902:ecc8:b0:1c1:fe97:bf34 with SMTP id a8-20020a170902ecc800b001c1fe97bf34mr8040994plh.24.1693789355853;
        Sun, 03 Sep 2023 18:02:35 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902c18400b001bdcafcf8d3sm6351806pld.69.2023.09.03.18.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 18:02:35 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qcxz6-00AVA9-2L;
	Mon, 04 Sep 2023 11:02:32 +1000
Date: Mon, 4 Sep 2023 11:02:32 +1000
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
Subject: Re: [PATCH 02/11] xfs: add NOWAIT semantics for readdir
Message-ID: <ZPUsqGfeUwupdlLE@dread.disaster.area>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827132835.1373581-3-hao.xu@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230903_180244_755020_0F9208F8 
X-CRM114-Status: GOOD (  45.22  )
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
> From: Hao Xu <howeyxu@tencent.com>
> 
> Implement NOWAIT semantics for readdir. Return EAGAIN error to the
> caller if it would block, like failing to get locks, or going to
> do IO.
> 
> Co-developed-by: Dave Chinner <dchinner@redhat.com>

Not really.

"Co-developed" implies equal development input between all the
parties, which is not the case here - this patch is based on
prototype I wrote, whilst you're doing the refining, testing and
correctness work.

In these cases with XFS code, we add a line in the commit message to
say:

"This is based on a patch originally written by Dave Chinner."


> Signed-off-by: Dave Chinner <dchinner@redhat.com>
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> [fixes deadlock issue, tweak code style]

With a signoff chain like you already have.

In the end you'll also get a RVB from me, which seems rather wrong
to me if I've apparently been "co-developing" the code....

....

> @@ -156,7 +157,9 @@ xfs_dir2_block_getdents(
>  	if (xfs_dir2_dataptr_to_db(geo, ctx->pos) > geo->datablk)
>  		return 0;
>  
> -	error = xfs_dir3_block_read(args->trans, dp, &bp);
> +	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
> +		flags |= XFS_DABUF_NOWAIT;
> +	error = xfs_dir3_block_read(args->trans, dp, flags, &bp);
>  	if (error)
>  		return error;
>  

Given we do this same check in both block and leaf formats to set
XFS_DABUF_NOWAIT, and we do the DIR_CONTEXT_F_NOWAIT check in
xfs_readdir() as well, we should probably do this check once at the
higher level and pass flags down from there with XFS_DABUF_NOWAIT
already set.

> @@ -240,6 +243,7 @@ xfs_dir2_block_getdents(
>  STATIC int
>  xfs_dir2_leaf_readbuf(
>  	struct xfs_da_args	*args,
> +	struct dir_context	*ctx,
>  	size_t			bufsize,
>  	xfs_dir2_off_t		*cur_off,
>  	xfs_dablk_t		*ra_blk,
> @@ -258,10 +262,15 @@ xfs_dir2_leaf_readbuf(
>  	struct xfs_iext_cursor	icur;
>  	int			ra_want;
>  	int			error = 0;
> -
> -	error = xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
> -	if (error)
> -		goto out;
> +	unsigned int		flags = 0;
> +
> +	if (ctx->flags & DIR_CONTEXT_F_NOWAIT) {
> +		flags |= XFS_DABUF_NOWAIT;
> +	} else {
> +		error = xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
> +		if (error)
> +			goto out;
> +	}

Especially as, in hindsight, this doesn't make a whole lot of sense.
If XFS_DABUF_NOWAIT is set, we keep going until
xfs_ilock_data_map_shared_nowait() where we call
xfs_need_iread_extents() to see if we need to read the extents in
and abort at that point.

So, really, we shouldn't get this far with nowait semantics if
we haven't read the extents in yet - we're supposed to already have
the inode locked here and so we should have already checked this
condition before we bother locking the inode...

i.e. all we should be doing here is this:

	if (!(flags & XFS_DABUF_NOWAIT)) {
		error = xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
		if (error)
			goto out;
	}

And then we don't need to pass the VFS dir_context down into low
level XFS functions unnecessarily.


>  
>  	/*
>  	 * Look for mapped directory blocks at or above the current offset.
> @@ -280,7 +289,7 @@ xfs_dir2_leaf_readbuf(
>  	new_off = xfs_dir2_da_to_byte(geo, map.br_startoff);
>  	if (new_off > *cur_off)
>  		*cur_off = new_off;
> -	error = xfs_dir3_data_read(args->trans, dp, map.br_startoff, 0, &bp);
> +	error = xfs_dir3_data_read(args->trans, dp, map.br_startoff, flags, &bp);
>  	if (error)
>  		goto out;
>  
> @@ -360,6 +369,7 @@ xfs_dir2_leaf_getdents(
>  	int			byteoff;	/* offset in current block */
>  	unsigned int		offset = 0;
>  	int			error = 0;	/* error return value */
> +	int			written = 0;
>  
>  	/*
>  	 * If the offset is at or past the largest allowed value,
> @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
>  				bp = NULL;
>  			}
>  
> -			if (*lock_mode == 0)
> -				*lock_mode = xfs_ilock_data_map_shared(dp);
> -			error = xfs_dir2_leaf_readbuf(args, bufsize, &curoff,
> -					&rablk, &bp);
> +			if (*lock_mode == 0) {
> +				*lock_mode =
> +					xfs_ilock_data_map_shared_generic(dp,
> +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
> +				if (!*lock_mode) {
> +					error = -EAGAIN;
> +					break;
> +				}
> +			}
> +			error = xfs_dir2_leaf_readbuf(args, ctx, bufsize,
> +					&curoff, &rablk, &bp);

int
xfs_ilock_readdir(
	struct xfs_inode	*ip,
	int			flags)
{
	if (flags & XFS_DABUF_NOWAIT) {
		if (!xfs_ilock_nowait(dp, XFS_ILOCK_SHARED))
			return -EAGAIN;
		return XFS_ILOCK_SHARED;
	}
	return xfs_ilock_data_map_shared(dp);
}

And then this code simply becomes:

			if (*lock_mode == 0)
				*lock_mode = xfs_ilock_readdir(ip, flags);


>  			if (error || !bp)
>  				break;
>  
> @@ -479,6 +496,7 @@ xfs_dir2_leaf_getdents(
>  		 */
>  		offset += length;
>  		curoff += length;
> +		written += length;
>  		/* bufsize may have just been a guess; don't go negative */
>  		bufsize = bufsize > length ? bufsize - length : 0;
>  	}
> @@ -492,6 +510,8 @@ xfs_dir2_leaf_getdents(
>  		ctx->pos = xfs_dir2_byte_to_dataptr(curoff) & 0x7fffffff;
>  	if (bp)
>  		xfs_trans_brelse(args->trans, bp);
> +	if (error == -EAGAIN && written > 0)
> +		error = 0;
>  	return error;
>  }
>  
> @@ -514,6 +534,7 @@ xfs_readdir(
>  	unsigned int		lock_mode;
>  	bool			isblock;
>  	int			error;
> +	bool			nowait;
>  
>  	trace_xfs_readdir(dp);
>  
> @@ -531,7 +552,11 @@ xfs_readdir(
>  	if (dp->i_df.if_format == XFS_DINODE_FMT_LOCAL)
>  		return xfs_dir2_sf_getdents(&args, ctx);
>  
> -	lock_mode = xfs_ilock_data_map_shared(dp);
> +	nowait = ctx->flags & DIR_CONTEXT_F_NOWAIT;
> +	lock_mode = xfs_ilock_data_map_shared_generic(dp, nowait);
> +	if (!lock_mode)
> +		return -EAGAIN;
> +

Given what I said above:

	if (ctx->flags & DIR_CONTEXT_F_NOWAIT) {
		/*
		 * If we need to read extents, then we must do IO
		 * and we must use exclusive locking. We don't want
		 * to do either of those things, so just bail if we
		 * have to read extents. Doing this check explicitly
		 * here means we don't have to do it anywhere else
		 * in the XFS_DABUF_NOWAIT path.
		 */
		if (xfs_need_iread_extents(&ip->i_df))
			return -EAGAIN;
		flags |= XFS_DABUF_NOWAIT;
	}
	lock_mode = xfs_ilock_readdir(dp, flags);

And with this change, we probably should be marking the entire
operation as having nowait semantics. i.e. using args->op_flags here
and only use XFS_DABUF_NOWAIT for the actual IO. ie.

		args->op_flags |= XFS_DA_OP_NOWAIT;

This makes it clear that the entire directory op should run under
NOWAIT constraints, and it avoids needing to pass an extra flag
through the stack.  That then makes the readdir locking function
look like this:

/*
 * When we are locking an inode for readdir, we need to ensure that
 * the extents have been read in first. This requires the inode to
 * be locked exclusively across the extent read, but otherwise we
 * want to use shared locking.
 *
 * For XFS_DA_OP_NOWAIT operations, we do an up-front check to see
 * if the extents have been read in, so all we need to do in this
 * case is a shared try-lock as we never need exclusive locking in
 * this path.
 */
static int
xfs_ilock_readdir(
	struct xfs_da_args	*args)
{
	if (args->op_flags & XFS_DA_OP_NOWAIT) {
		if (!xfs_ilock_nowait(args->dp, XFS_ILOCK_SHARED))
			return -EAGAIN;
		return XFS_ILOCK_SHARED;
	}
	return xfs_ilock_data_map_shared(args->dp);
}

> diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
> index 9e62cc500140..d088f7d0c23a 100644
> --- a/fs/xfs/xfs_inode.c
> +++ b/fs/xfs/xfs_inode.c
> @@ -120,6 +120,33 @@ xfs_ilock_data_map_shared(
>  	return lock_mode;
>  }
>  
> +/*
> + * Similar to xfs_ilock_data_map_shared(), except that it will only try to lock
> + * the inode in shared mode if the extents are already in memory. If it fails to
> + * get the lock or has to do IO to read the extent list, fail the operation by
> + * returning 0 as the lock mode.
> + */
> +uint
> +xfs_ilock_data_map_shared_nowait(
> +	struct xfs_inode	*ip)
> +{
> +	if (xfs_need_iread_extents(&ip->i_df))
> +		return 0;
> +	if (!xfs_ilock_nowait(ip, XFS_ILOCK_SHARED))
> +		return 0;
> +	return XFS_ILOCK_SHARED;
> +}
> +
> +int
> +xfs_ilock_data_map_shared_generic(
> +	struct xfs_inode	*dp,
> +	bool			nowait)
> +{
> +	if (nowait)
> +		return xfs_ilock_data_map_shared_nowait(dp);
> +	return xfs_ilock_data_map_shared(dp);
> +}

And all this "generic" locking stuff goes away.

FWIW, IMO, "generic" is a poor name for an XFS function as there's
nothing "generic" in XFS.  We tend name the functions after what
they do, not some abstract concept. Leave "generic" as a keyword for
widely used core infrastructure functions, not niche, one-off use
cases like this.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
