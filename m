Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50E8CF258E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 07:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYYWu8NdSTfoj/X71JDl/yeU1yNZrgSuXdqCyUJyiY4=; b=zXTGqLxuCj2iin
	3Y7wb9DFsffx1Dxwm05PtjLz4f/iVWAPPSOPe1iOlmUSuZ+IhCrAcu2ZHNpMja0+SDLvYTK3+zqzL
	u07sX4OwGKJ9USQW0wnSWGCYSlgtn5H4PF6mIjIvnQ1o8G6rBC8a/U3fy9/YIW356Omh840fGK7S0
	NrfRYE9+ONzM8U+J0thik3ugYSd1hB3cziapgYD1ni7i2gwJ0peiIkg9hnHymhG56+Hm82sRdjs57
	FQe42XECMENQac2cGQpCbqsG2Oa3I+0Ahl6j2x4frtYryyXhpE5npRQWZiCwQRcvGwV6aLscpaA7w
	zdPZv3xI/etM5SqFg40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcdR-00000002htf-0sqF;
	Wed, 19 Nov 2025 07:29:49 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcdP-00000002ht9-2D3n
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 07:29:48 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id D009F68AFE; Wed, 19 Nov 2025 08:29:41 +0100 (CET)
Date: Wed, 19 Nov 2025 08:29:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
	io-uring@vger.kernel.org, devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 14/14] xfs: enable non-blocking timestamp updates
Message-ID: <20251119072941.GA22368@lst.de>
References: <20251114062642.1524837-1-hch@lst.de> <20251114062642.1524837-15-hch@lst.de> <aRmJ728evgFnBLhn@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRmJ728evgFnBLhn@dread.disaster.area>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_232947_708933_39219CD0 
X-CRM114-Status: GOOD (  25.58  )
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

On Sun, Nov 16, 2025 at 07:23:11PM +1100, Dave Chinner wrote:
> On Fri, Nov 14, 2025 at 07:26:17AM +0100, Christoph Hellwig wrote:
> > The lazytime path using generic_update_time can never block in XFS
> > because there is no ->dirty_inode method that could block.  Allow
> > non-blocking timestamp updates for this case.
> > 
> > Fixes: 66fa3cedf16a ("fs: Add async write file modification handling.")
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  fs/xfs/xfs_iops.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> > index bd0b7e81f6ab..3d7b89ffacde 100644
> > --- a/fs/xfs/xfs_iops.c
> > +++ b/fs/xfs/xfs_iops.c
> > @@ -1195,9 +1195,6 @@ xfs_vn_update_time(
> >  
> >  	trace_xfs_update_time(ip);
> >  
> > -	if (flags & S_NOWAIT)
> > -		return -EAGAIN;
> > -
> >  	if (inode->i_sb->s_flags & SB_LAZYTIME) {
> >  		if (!((flags & S_VERSION) &&
> >  		      inode_maybe_inc_iversion(inode, false)))
> > @@ -1207,6 +1204,9 @@ xfs_vn_update_time(
> >  		log_flags |= XFS_ILOG_CORE;
> >  	}
> >  
> > +	if (flags & S_NOWAIT)
> > +		return -EAGAIN;
> > +
> >  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp);
> >  	if (error)
> >  		return error;
> 
> Not sure this is correct - this can now bump iversion and then
> return -EAGAIN. That means S_VERSION likely won't be set on the
> retry, and we'll go straight through the non-blocking path to
> generic_update_time() and skip logging the iversion update....

Thanks.

I'll fix this by propagating S_NOWAIT to inode_update_timestamps.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
