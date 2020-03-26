Return-Path: <SRS0=o9e3=5L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55BAC43331
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2020 03:22:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8A7F20746
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2020 03:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ij3ccFVE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8A7F20746
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fromorbit.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urobmo23jNnrJdICqKz4y7eoyf9HHEXxPLeFsW4rJTg=; b=Ij3ccFVEiud74R
	/Wv+hOmxPIz+/O8FN3ICk76okBZeXfF9DL4c1SyWPjjBKCNS6QbahABV6WBjS9q74os/SHRLXQC4R
	fiJq3B/isym94iQY8ZoxETs80ibmA4e/yQ/UhmO2rRH4tTmf33ahwoAD6S7ShcDn9qsx12C6inyz6
	YZhXqyvsZ7EzS2Zmm2JghPKQc5Yzh4JUChG4OlEXrqf5V4uQGUCN073VEe0qFX7efmXElXDioCZQw
	uIRY4SPpEj+4V+fClVKnfABgeKO+2hiT2X/B5NHCWaSgpX5RX3MObBaVPQ8vHgnkQRY5aAraFNP0K
	qXm5mfjqjqGnicvbwIcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHJ6C-00048O-JE; Thu, 26 Mar 2020 03:22:28 +0000
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHJ66-00047I-TM
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2020 03:22:24 +0000
Received: from dread.disaster.area (pa49-179-23-206.pa.nsw.optusnet.com.au
 [49.179.23.206])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id D3C267EB4DD;
 Thu, 26 Mar 2020 14:22:13 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jHJ5w-0006v8-Du; Thu, 26 Mar 2020 14:22:12 +1100
Date: Thu, 26 Mar 2020 14:22:12 +1100
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/4] fs: avoid double-writing the inode on a lazytime
 expiration
Message-ID: <20200326032212.GN10776@dread.disaster.area>
References: <20200325122825.1086872-1-hch@lst.de>
 <20200325122825.1086872-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325122825.1086872-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LYdCFQXi c=1 sm=1 tr=0
 a=n/Z79dAqQwRlp4tcgfhWYA==:117 a=n/Z79dAqQwRlp4tcgfhWYA==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=SS2py6AdgQ4A:10
 a=7-415B0cAAAA:8 a=TQi0xSRmeD81B83iwF8A:9 a=CjuIK1q_8ugA:10
 a=biEYGPWJfzWAr4FL6Ov7:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_202223_379055_2945AE25 
X-CRM114-Status: GOOD (  19.83  )
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
Cc: Eric Biggers <ebiggers@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 25, 2020 at 01:28:23PM +0100, Christoph Hellwig wrote:
> In the case that an inode has dirty timestamp for longer than the
> lazytime expiration timeout (or if all such inodes are being flushed
> out due to a sync or syncfs system call), we need to inform the file
> system that the inode is dirty so that the inode's timestamps can be
> copied out to the on-disk data structures.  That's because if the file
> system supports lazytime, it will have ignored the dirty_inode(inode,
> I_DIRTY_TIME) notification when the timestamp was modified in memory.q
> Previously, this was accomplished by calling mark_inode_dirty_sync(),
> but that has the unfortunate side effect of also putting the inode the
> writeback list, and that's not necessary in this case, since we will
> immediately call write_inode() afterwards.  Replace the call to
> mark_inode_dirty_sync() with a new lazytime_expired method to clearly
> separate out this case.


hmmm. Doesn't this cause issues with both iput() and
vfs_fsync_range() because they call mark_inode_dirty_sync() on
I_DIRTY_TIME inodes to move them onto the writeback list so they are
appropriately expired when the inode is written back.

i.e.:


> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 2094386af8ac..e5aafd40dd0f 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -612,19 +612,13 @@ xfs_fs_destroy_inode(
>  }
>  
>  static void
> -xfs_fs_dirty_inode(
> -	struct inode			*inode,
> -	int				flag)
> +xfs_fs_lazytime_expired(
> +	struct inode			*inode)
>  {
>  	struct xfs_inode		*ip = XFS_I(inode);
>  	struct xfs_mount		*mp = ip->i_mount;
>  	struct xfs_trans		*tp;
>  
> -	if (!(inode->i_sb->s_flags & SB_LAZYTIME))
> -		return;
> -	if (flag != I_DIRTY_SYNC || !(inode->i_state & I_DIRTY_TIME))
> -		return;
> -
>  	if (xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp))
>  		return;
>  	xfs_ilock(ip, XFS_ILOCK_EXCL);
> @@ -1053,7 +1047,7 @@ xfs_fs_free_cached_objects(
>  static const struct super_operations xfs_super_operations = {
>  	.alloc_inode		= xfs_fs_alloc_inode,
>  	.destroy_inode		= xfs_fs_destroy_inode,
> -	.dirty_inode		= xfs_fs_dirty_inode,
> +	.lazytime_expired	= xfs_fs_lazytime_expired,
>  	.drop_inode		= xfs_fs_drop_inode,
>  	.put_super		= xfs_fs_put_super,
>  	.sync_fs		= xfs_fs_sync_fs,

This means XFS no longer updates/logs the current timestamp because
->dirty_inode(I_DIRTY_SYNC) is no longer called for XFS) before
->fsync flushes the inode data and metadata changes to the journal.
Hence the current in-memory timestamps are not present in the log
before the fsync is run as so we violate the fsync guarantees
lazytime gives for timestamp updates....

I haven't quite got it straight in my head if the iput() case has
similar problems, but the fsync case definitely looks broken.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
