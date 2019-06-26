Return-Path: <SRS0=bYPC=UZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292F1C4646B
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 03:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BEB2082F
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 03:53:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sUDNM/vU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4BEB2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqI3KFpJSCSh8LH6JqGzfY2D3enkFFtxweldIAkHLIo=; b=sUDNM/vU8++F7B
	yrGorgm3fo/UveXzL8YQqWEUtKDh4Zw4HPuFk/6zSBlETOplJKUtj5zHbZXcK+qFb9TbKy1cM14n3
	b5AmhJ5mZMPK2fYx8pJ9JNzqxzD0g/ITvFkxLx0wZiLh3eo0qrRZF4P5wlU1MaxJ1Xo37IAp/sqyf
	2s7Z5bZpG0LGfwOy3oNxtYOUsXX2napOM/soJLyxcasNNRSndwWT2z3ZCIqVy22GdIC3rPO2tUWOW
	qyXfGgNRjdGzv8fPX0DEgk0xoHEp1Uv0xF6tPxN6U21vyp/fLhXdBtwal/t40qUF6N9mRGLru7f0f
	z3ZvJmBH2mpwzgJZ+H7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfz02-0000fQ-4m; Wed, 26 Jun 2019 03:53:34 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfyzq-0000b2-6K
 for linux-mtd@lists.infradead.org; Wed, 26 Jun 2019 03:53:24 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hfyyN-0008Mv-UN; Wed, 26 Jun 2019 03:51:52 +0000
Date: Wed, 26 Jun 2019 04:51:51 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 5/5] vfs: don't allow writes to swap files
Message-ID: <20190626035151.GA10613@ZenIV.linux.org.uk>
References: <156151637248.2283603.8458727861336380714.stgit@magnolia>
 <156151641177.2283603.7806026378321236401.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156151641177.2283603.7806026378321236401.stgit@magnolia>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_205322_415538_CACD9C36 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org, yuchao0@huawei.com,
 linux-mm@kvack.org, clm@fb.com, adilger.kernel@dilger.ca,
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org, hch@infradead.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, dsterba@suse.com, jaegeuk@kernel.org,
 tytso@mit.edu, ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jk@ozlabs.org, jack@suse.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jun 25, 2019 at 07:33:31PM -0700, Darrick J. Wong wrote:
> --- a/fs/attr.c
> +++ b/fs/attr.c
> @@ -236,6 +236,9 @@ int notify_change(struct dentry * dentry, struct iattr * attr, struct inode **de
>  	if (IS_IMMUTABLE(inode))
>  		return -EPERM;
>  
> +	if (IS_SWAPFILE(inode))
> +		return -ETXTBSY;
> +
>  	if ((ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID | ATTR_TIMES_SET)) &&
>  	    IS_APPEND(inode))
>  		return -EPERM;

Er...  So why exactly is e.g. chmod(2) forbidden for swapfiles?  Or touch(1),
for that matter...

> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 596ac98051c5..1ca4ee8c2d60 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3165,6 +3165,19 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  	if (error)
>  		goto bad_swap;
>  
> +	/*
> +	 * Flush any pending IO and dirty mappings before we start using this
> +	 * swap file.
> +	 */
> +	if (S_ISREG(inode->i_mode)) {
> +		inode->i_flags |= S_SWAPFILE;
> +		error = inode_drain_writes(inode);
> +		if (error) {
> +			inode->i_flags &= ~S_SWAPFILE;
> +			goto bad_swap;
> +		}
> +	}

Why are swap partitions any less worthy of protection?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
