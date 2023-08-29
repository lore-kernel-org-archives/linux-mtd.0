Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7681C71153
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvFTz6kvoO5P48wbSazS4SOGvCD5OZ4+oAWWWpoMNMw=; b=lJjk7LLoMI5/Rf
	B0xaXGh8onyN39WbMI2PdXQVqDS4qgJxMZJxH0QkKCozFGyMHB1plNCvdPQwnr96UwSvJLvrQxxRT
	KkEXL8tUcPyh6Imc9xRELMOCog8icDWExkyw1az2+sRrTGZ+visuQzyZPXeMLloA9WLnaukHalFNQ
	1FdH4759dDvH0yFP/gxzQIKVvtdHcjjhPXh+XyvFf9EtHxxMctoUjYX4/AhTw6/U88qpZuxkl2LNy
	B+T829ziegpF4ZfJ9bnbiWI17vkpV22uQgbfG3+hrG+MpMXeYULmYyRUKy3O+kjL/P25g7PnOafmH
	l1E0xhejXXwGfsGvN5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qayPR-00BYsl-1w;
	Tue, 29 Aug 2023 13:05:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qayPO-00BYsa-2B
	for linux-mtd@bombadil.infradead.org;
	Tue, 29 Aug 2023 13:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RchKoATVAdQvPJfSjQ7igQ4w+5FVPwMefhSLf5vYpSI=; b=Q3QmRgXTehCOZCVueX+FS2Az5N
	PVqmWnEC5SOyltZJNMDkbuPj3BuxIKobdTkUGJdkwt9An23qab7RWIeUTJvkRcM5ZQw7A9VajHpfv
	K7r2l3ZZ2pGC+tetoYQU12TmTvlZI3sm3ayVKtCD8x7/yd2j9SuUz7gnHbMb8LXGAJC6qfT96aNHD
	/+KAN9szQKpq1/b+zh8evtWeBszURne3cpQtIIZ5DUWss+rP/RkNTx5Y/tCCASZPZaSLUEyAkYJWx
	0SrCGJoWwn5s3UmnWTZbObVE6DrneAPDreiurlPZ6M22SpYEkwQtVmJFqXgm29PIZAfXouLOFvP7I
	44OUuuBQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qayP8-006i8Z-JC; Tue, 29 Aug 2023 13:05:10 +0000
Date: Tue, 29 Aug 2023 14:05:10 +0100
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
Message-ID: <ZO3tBqJLtRwSYrEr@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
 <ZOu1xYS6LRmPgEiV@casper.infradead.org>
 <ca10040f-b7fa-7c43-1c89-6706d13b2747@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca10040f-b7fa-7c43-1c89-6706d13b2747@linux.dev>
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

On Tue, Aug 29, 2023 at 03:41:43PM +0800, Hao Xu wrote:
> On 8/28/23 04:44, Matthew Wilcox wrote:
> > > @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
> > >   				bp = NULL;
> > >   			}
> > > -			if (*lock_mode == 0)
> > > -				*lock_mode = xfs_ilock_data_map_shared(dp);
> > > +			if (*lock_mode == 0) {
> > > +				*lock_mode =
> > > +					xfs_ilock_data_map_shared_generic(dp,
> > > +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
> > > +				if (!*lock_mode) {
> > > +					error = -EAGAIN;
> > > +					break;
> > > +				}
> > > +			}
> > 
> > 'generic' doesn't seem like a great suffix to mean 'takes nowait flag'.
> > And this is far too far indented.
> > 
> > 			xfs_dir2_lock(dp, ctx, lock_mode);
> > 
> > with:
> > 
> > STATIC void xfs_dir2_lock(struct xfs_inode *dp, struct dir_context *ctx,
> > 		unsigned int lock_mode)
> > {
> > 	if (*lock_mode)
> > 		return;
> > 	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
> > 		return xfs_ilock_data_map_shared_nowait(dp);
> > 	return xfs_ilock_data_map_shared(dp);
> > }
> > 
> > ... which I think you can use elsewhere in this patch (reformat it to
> > XFS coding style, of course).  And then you don't need
> > xfs_ilock_data_map_shared_generic().
> 
> How about rename xfs_ilock_data_map_shared() to xfs_ilock_data_map_block()
> and rename xfs_ilock_data_map_shared_generic() to
> xfs_ilock_data_map_shared()?
> 
> STATIC void xfs_ilock_data_map_shared(struct xfs_inode *dp, struct
> dir_context *ctx, unsigned int lock_mode)
> {
>  	if (*lock_mode)
>  		return;
>  	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
>  		return xfs_ilock_data_map_shared_nowait(dp);
>  	return xfs_ilock_data_map_shared_block(dp);
> }

xfs_ilock_data_map_shared() is used for a lot of things which are not
directories.  I think a new function name is appropriate, and that
function name should include the word 'dir' in it somewhere.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
