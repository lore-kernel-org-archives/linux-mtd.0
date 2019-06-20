Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC9CC48BE3
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 13:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74242206E0
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 13:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kjOnF0EZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74242206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eY4zEEK7SyrLdNbwy+McSH8IDkDshzVmXS9efC3BsS0=; b=kjOnF0EZahn9y2
	PN9+iwJEXOkC0SlPGerGHRsnpeIeW2DsgJre02AfG6eSK4HsDnedkv3UV2pCDGevqvtPBakjgyUqP
	8NkU0LWBg47TyUz+8rpqKjpAt1KAxoVfdIVJwICAlvv1wopctA5HtbGk9EyZROJd9TDaiMra2eko2
	L2it9upk0yTJsKig2VAKKROsbSMnowXQCDiGzK4CxhcqEDC3CPnceDvA94q3+fmpzWhAwp+OWW7pi
	IOoCQkBgYDR2lwvYjD4RRzSCgOuVpjVEwYKa/cEhg+7Eski8YPi1ieGu8v8mrw7f7aCDWdNv1aKu7
	Pcag/5W5oVKiY9miQdxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdxJb-0005fp-Ir; Thu, 20 Jun 2019 13:41:23 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdxJY-0005fT-Ub
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2019 13:41:22 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 551A4AEF8;
 Thu, 20 Jun 2019 13:41:19 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id ADFD51E434F; Thu, 20 Jun 2019 15:41:18 +0200 (CEST)
Date: Thu, 20 Jun 2019 15:41:18 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 3/4] fs: teach vfs_ioc_fssetxattr_check to check project
 id info
Message-ID: <20190620134118.GF30243@quack2.suse.cz>
References: <156022833285.3227089.11990489625041926920.stgit@magnolia>
 <156022835712.3227089.13380623784109583024.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156022835712.3227089.13380623784109583024.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_064121_282361_40C7D9EF 
X-CRM114-Status: GOOD (  18.81  )
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

On Mon 10-06-19 21:45:57, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Standardize the project id checks for FSSETXATTR.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/ioctl.c    |   27 ---------------------------
>  fs/f2fs/file.c     |   27 ---------------------------
>  fs/inode.c         |   13 +++++++++++++
>  fs/xfs/xfs_ioctl.c |   15 ---------------
>  4 files changed, 13 insertions(+), 69 deletions(-)
> 
> 
> diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
> index c2f48c90ca45..6aa1df1918f7 100644
> --- a/fs/ext4/ioctl.c
> +++ b/fs/ext4/ioctl.c
> @@ -697,30 +697,6 @@ static long ext4_ioctl_group_add(struct file *file,
>  	return err;
>  }
>  
> -static int ext4_ioctl_check_project(struct inode *inode, struct fsxattr *fa)
> -{
> -	/*
> -	 * Project Quota ID state is only allowed to change from within the init
> -	 * namespace. Enforce that restriction only if we are trying to change
> -	 * the quota ID state. Everything else is allowed in user namespaces.
> -	 */
> -	if (current_user_ns() == &init_user_ns)
> -		return 0;
> -
> -	if (__kprojid_val(EXT4_I(inode)->i_projid) != fa->fsx_projid)
> -		return -EINVAL;
> -
> -	if (ext4_test_inode_flag(inode, EXT4_INODE_PROJINHERIT)) {
> -		if (!(fa->fsx_xflags & FS_XFLAG_PROJINHERIT))
> -			return -EINVAL;
> -	} else {
> -		if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  static void ext4_fsgetxattr(struct inode *inode, struct fsxattr *fa)
>  {
>  	struct ext4_inode_info *ei = EXT4_I(inode);
> @@ -1135,9 +1111,6 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  
>  		inode_lock(inode);
>  		ext4_fsgetxattr(inode, &old_fa);
> -		err = ext4_ioctl_check_project(inode, &fa);
> -		if (err)
> -			goto out;
>  		err = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
>  		if (err)
>  			goto out;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f707de6bd4a8..183ed1ac60e1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2799,30 +2799,6 @@ static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
>  	return 0;
>  }
>  
> -static int f2fs_ioctl_check_project(struct inode *inode, struct fsxattr *fa)
> -{
> -	/*
> -	 * Project Quota ID state is only allowed to change from within the init
> -	 * namespace. Enforce that restriction only if we are trying to change
> -	 * the quota ID state. Everything else is allowed in user namespaces.
> -	 */
> -	if (current_user_ns() == &init_user_ns)
> -		return 0;
> -
> -	if (__kprojid_val(F2FS_I(inode)->i_projid) != fa->fsx_projid)
> -		return -EINVAL;
> -
> -	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL) {
> -		if (!(fa->fsx_xflags & FS_XFLAG_PROJINHERIT))
> -			return -EINVAL;
> -	} else {
> -		if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
> @@ -2850,9 +2826,6 @@ static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
>  		return err;
>  
>  	inode_lock(inode);
> -	err = f2fs_ioctl_check_project(inode, &fa);
> -	if (err)
> -		goto out;
>  
>  	__f2fs_ioc_fsgetxattr(inode, &old_fa);
>  	err = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
> diff --git a/fs/inode.c b/fs/inode.c
> index 026955258a47..40ecd3a6a188 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2201,6 +2201,19 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
>  	    !capable(CAP_LINUX_IMMUTABLE))
>  		return -EPERM;
>  
> +	/*
> +	 * Project Quota ID state is only allowed to change from within the init
> +	 * namespace. Enforce that restriction only if we are trying to change
> +	 * the quota ID state. Everything else is allowed in user namespaces.
> +	 */
> +	if (current_user_ns() != &init_user_ns) {
> +		if (old_fa->fsx_projid != fa->fsx_projid)
> +			return -EINVAL;
> +		if ((old_fa->fsx_xflags ^ fa->fsx_xflags) &
> +				FS_XFLAG_PROJINHERIT)
> +			return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(vfs_ioc_fssetxattr_check);
> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index 08c24f2f55c3..82961de98900 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@ -1299,21 +1299,6 @@ xfs_ioctl_setattr_check_projid(
>  	if (fa->fsx_projid > (uint16_t)-1 &&
>  	    !xfs_sb_version_hasprojid32bit(&ip->i_mount->m_sb))
>  		return -EINVAL;
> -
> -	/*
> -	 * Project Quota ID state is only allowed to change from within the init
> -	 * namespace. Enforce that restriction only if we are trying to change
> -	 * the quota ID state. Everything else is allowed in user namespaces.
> -	 */
> -	if (current_user_ns() == &init_user_ns)
> -		return 0;
> -
> -	if (xfs_get_projid(ip) != fa->fsx_projid)
> -		return -EINVAL;
> -	if ((fa->fsx_xflags & FS_XFLAG_PROJINHERIT) !=
> -	    (ip->i_d.di_flags & XFS_DIFLAG_PROJINHERIT))
> -		return -EINVAL;
> -
>  	return 0;
>  }
>  
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
