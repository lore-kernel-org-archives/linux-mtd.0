Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA795C43613
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 13:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E725206E0
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 13:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ch0nOIS5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E725206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwDztFDIjCw3Kzm6YJrLcI86Ys4ZKXorOXTJ8huiAcE=; b=ch0nOIS57gjb5I
	98OCXj/0Lhf/N3JgpmZyCRFu2cx7NUq/9XaXYvGAwVCj5euTSFaTIab/+1OeHmjrG2KRMQu9O2qZg
	+GdgXQ08UqSWxd9T7LN4XptN+JxudwL9546SJ0pudgQ0w7jaNCKEQcAYhQ4502/3dSFqfopk3GtUk
	6pnFVcbfKXNWeqw0aBTP03t32cMUMNM1SbRv/8GLuw8rpNyrO/3pubsmCwCSgvIDlXlcP1FgHlXpz
	sWz6+8CSKAncpgnV3ekKBb6kpDCH/taPahBHY0AJtCr60VoB0jxWFHak2Ul3GXlQxCg5G5tepKWyr
	uuYe3qMknbrlxAZReoLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdxP5-00017R-1z; Thu, 20 Jun 2019 13:47:03 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdxOh-0000mK-HH
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2019 13:46:42 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CAA66AE2C;
 Thu, 20 Jun 2019 13:46:37 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 504A11E434F; Thu, 20 Jun 2019 15:46:37 +0200 (CEST)
Date: Thu, 20 Jun 2019 15:46:37 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 4/4] vfs: teach vfs_ioc_fssetxattr_check to check extent
 size hints
Message-ID: <20190620134637.GG30243@quack2.suse.cz>
References: <156022833285.3227089.11990489625041926920.stgit@magnolia>
 <156022836522.3227089.4353401791178719941.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156022836522.3227089.4353401791178719941.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_064640_005757_C34ECCE4 
X-CRM114-Status: GOOD (  16.52  )
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org, yuchao0@huawei.com,
 clm@fb.com, adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
 linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon 10-06-19 21:46:05, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Move the extent size hint checks that aren't xfs-specific to the vfs.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c         |   18 +++++++++++++
>  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++------------------------------
>  2 files changed, 47 insertions(+), 41 deletions(-)
> 
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 40ecd3a6a188..a3757051fd55 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2214,6 +2214,24 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
>  			return -EINVAL;
>  	}
>  
> +	/* Check extent size hints. */
> +	if ((fa->fsx_xflags & FS_XFLAG_EXTSIZE) && !S_ISREG(inode->i_mode))
> +		return -EINVAL;
> +
> +	if ((fa->fsx_xflags & FS_XFLAG_EXTSZINHERIT) &&
> +			!S_ISDIR(inode->i_mode))
> +		return -EINVAL;
> +
> +	if ((fa->fsx_xflags & FS_XFLAG_COWEXTSIZE) &&
> +	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
> +		return -EINVAL;
> +
> +	/* Extent size hints of zero turn off the flags. */
> +	if (fa->fsx_extsize == 0)
> +		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
> +	if (fa->fsx_cowextsize == 0)
> +		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(vfs_ioc_fssetxattr_check);
> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index 82961de98900..b494e7e881e3 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@ -1201,39 +1201,31 @@ xfs_ioctl_setattr_check_extsize(
>  	struct fsxattr		*fa)
>  {
>  	struct xfs_mount	*mp = ip->i_mount;
> -
> -	if ((fa->fsx_xflags & FS_XFLAG_EXTSIZE) && !S_ISREG(VFS_I(ip)->i_mode))
> -		return -EINVAL;
> -
> -	if ((fa->fsx_xflags & FS_XFLAG_EXTSZINHERIT) &&
> -	    !S_ISDIR(VFS_I(ip)->i_mode))
> -		return -EINVAL;
> +	xfs_extlen_t		size;
> +	xfs_fsblock_t		extsize_fsb;
>  
>  	if (S_ISREG(VFS_I(ip)->i_mode) && ip->i_d.di_nextents &&
>  	    ((ip->i_d.di_extsize << mp->m_sb.sb_blocklog) != fa->fsx_extsize))
>  		return -EINVAL;
>  
> -	if (fa->fsx_extsize != 0) {
> -		xfs_extlen_t    size;
> -		xfs_fsblock_t   extsize_fsb;
> -
> -		extsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_extsize);
> -		if (extsize_fsb > MAXEXTLEN)
> -			return -EINVAL;
> +	if (fa->fsx_extsize == 0)
> +		return 0;
>  
> -		if (XFS_IS_REALTIME_INODE(ip) ||
> -		    (fa->fsx_xflags & FS_XFLAG_REALTIME)) {
> -			size = mp->m_sb.sb_rextsize << mp->m_sb.sb_blocklog;
> -		} else {
> -			size = mp->m_sb.sb_blocksize;
> -			if (extsize_fsb > mp->m_sb.sb_agblocks / 2)
> -				return -EINVAL;
> -		}
> +	extsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_extsize);
> +	if (extsize_fsb > MAXEXTLEN)
> +		return -EINVAL;
>  
> -		if (fa->fsx_extsize % size)
> +	if (XFS_IS_REALTIME_INODE(ip) ||
> +	    (fa->fsx_xflags & FS_XFLAG_REALTIME)) {
> +		size = mp->m_sb.sb_rextsize << mp->m_sb.sb_blocklog;
> +	} else {
> +		size = mp->m_sb.sb_blocksize;
> +		if (extsize_fsb > mp->m_sb.sb_agblocks / 2)
>  			return -EINVAL;
> -	} else
> -		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
> +	}
> +
> +	if (fa->fsx_extsize % size)
> +		return -EINVAL;
>  
>  	return 0;
>  }
> @@ -1259,6 +1251,8 @@ xfs_ioctl_setattr_check_cowextsize(
>  	struct fsxattr		*fa)
>  {
>  	struct xfs_mount	*mp = ip->i_mount;
> +	xfs_extlen_t		size;
> +	xfs_fsblock_t		cowextsize_fsb;
>  
>  	if (!(fa->fsx_xflags & FS_XFLAG_COWEXTSIZE))
>  		return 0;
> @@ -1267,25 +1261,19 @@ xfs_ioctl_setattr_check_cowextsize(
>  	    ip->i_d.di_version != 3)
>  		return -EINVAL;
>  
> -	if (!S_ISREG(VFS_I(ip)->i_mode) && !S_ISDIR(VFS_I(ip)->i_mode))
> -		return -EINVAL;
> -
> -	if (fa->fsx_cowextsize != 0) {
> -		xfs_extlen_t    size;
> -		xfs_fsblock_t   cowextsize_fsb;
> +	if (fa->fsx_cowextsize == 0)
> +		return 0;
>  
> -		cowextsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_cowextsize);
> -		if (cowextsize_fsb > MAXEXTLEN)
> -			return -EINVAL;
> +	cowextsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_cowextsize);
> +	if (cowextsize_fsb > MAXEXTLEN)
> +		return -EINVAL;
>  
> -		size = mp->m_sb.sb_blocksize;
> -		if (cowextsize_fsb > mp->m_sb.sb_agblocks / 2)
> -			return -EINVAL;
> +	size = mp->m_sb.sb_blocksize;
> +	if (cowextsize_fsb > mp->m_sb.sb_agblocks / 2)
> +		return -EINVAL;
>  
> -		if (fa->fsx_cowextsize % size)
> -			return -EINVAL;
> -	} else
> -		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
> +	if (fa->fsx_cowextsize % size)
> +		return -EINVAL;
>  
>  	return 0;
>  }
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
