Return-Path: <SRS0=pBCJ=U4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E27C5B577
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2019 20:09:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13060215EA
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2019 20:09:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j/btdRV0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13060215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eA/G5McLn8Q7m4iul5xZLpEC6s/yGKA7txJsG4762H0=; b=j/btdRV0KejS9V
	FzrIYIOPceQIiTGI/sYQ0vVaR1EN8IyP4jAiS7YBJaIkxDowSa7QtMZIUunwNarbC6/4RMY8Xmuhe
	w+CluNF/v0pkdnaf/gTrT1JD+Bas8WLlpMn4v50NIdcMhcKdbasYvT7ixai7r0Z6fJjN07pMRNKST
	bB83tlEwK+IZ6z57AA3yCJjdRZ3rQkRvm8VUv4sFnRSuDPp9Ks1YN1BFTYPAKJ4AOHHF0zRkmtR87
	S2eJx5jukbPZnPN2rULuym7LamtZSSWIodc+0UoVXolRvhQFmrUuryf+DKZ6swvxQmwSC5NXsoGyb
	0GWUcd+OtwsnWwGQvFJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhJes-0001Ds-6V; Sat, 29 Jun 2019 20:09:14 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhJem-0001DN-ON
 for linux-mtd@lists.infradead.org; Sat, 29 Jun 2019 20:09:10 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 20195AD70;
 Sat, 29 Jun 2019 20:09:03 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id AA7D51E3F56; Sat, 29 Jun 2019 22:09:01 +0200 (CEST)
Date: Sat, 29 Jun 2019 22:09:01 +0200
From: Jan Kara <jack@suse.cz>
To: " Darrick J. Wong " <darrick.wong@oracle.com>
Subject: Re: [PATCH 5/5] vfs: only allow FSSETXATTR to set DAX flag on files
 and dirs
Message-ID: <20190629200901.GA18642@quack2.suse.cz>
References: <156174682897.1557318.14418894077683701275.stgit@magnolia>
 <156174687185.1557318.13703922197244050336.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156174687185.1557318.13703922197244050336.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190629_130908_943424_09602935 
X-CRM114-Status: GOOD (  13.98  )
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
 linux-efi@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
 adilger.kernel@dilger.ca, ocfs2-devel@oss.oracle.com, hch@infradead.org,
 linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, matthew.garrett@nebula.com, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk,
 David Sterba <dsterba@suse.com>, jaegeuk@kernel.org, tytso@mit.edu,
 ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jk@ozlabs.org, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri 28-06-19 11:34:31,  Darrick J. Wong  wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> The DAX flag only applies to files and directories, so don't let it get
> set for other types of files.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 670d5408d022..f08711b34341 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2259,6 +2259,14 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
>  	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
>  		return -EINVAL;
>  
> +	/*
> +	 * It is only valid to set the DAX flag on regular files and
> +	 * directories on filesystems.
> +	 */
> +	if ((fa->fsx_xflags & FS_XFLAG_DAX) &&
> +	    !(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)))
> +		return -EINVAL;
> +
>  	/* Extent size hints of zero turn off the flags. */
>  	if (fa->fsx_extsize == 0)
>  		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
