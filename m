Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182DFC43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 11:37:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E04BB20674
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 11:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JotD6/ik"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E04BB20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRwP6hzsBrDo50S906enueKnp427bFnlVjrt+yE3DYI=; b=JotD6/ikH3cgYY
	F3nh+XR3vM8iEei5c6GOH+nQiLGltqoaqYp0JNXuYyTdYifusAA6ZS1zG4c9DMUROjC3Jy4Ylwygb
	bkL1sixrIQeMvFvDLTxT54Fpw9G0ratEgLq2tCxkwmN8bTwoYEkZn72is7Juv5+Y0LYdHICbdgH7y
	o8GA8mNR91UgFQVaekREU3IrbFF9elWGdvpcHdDu1+kgaEfbXPL7OG3ruXIZZMBqriOV/ejRbegJ2
	LyN91g/863kuiAfxBtYV71aVeCvWarQs7ylnEhyCorMIR0tnr69i5W+XKid/rljOmPnO/apKon0DR
	AnaV3k1xwTYDpNw3XCdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfNI8-0000eR-Be; Mon, 24 Jun 2019 11:37:44 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfNI5-0000e8-Q1
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 11:37:43 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0EF03AE79;
 Mon, 24 Jun 2019 11:37:40 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id DBCD31E2F23; Mon, 24 Jun 2019 13:37:37 +0200 (CEST)
Date: Mon, 24 Jun 2019 13:37:37 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 2/7] vfs: flush and wait for io when setting the
 immutable flag via SETFLAGS
Message-ID: <20190624113737.GG32376@quack2.suse.cz>
References: <156116141046.1664939.11424021489724835645.stgit@magnolia>
 <156116142734.1664939.5074567130774423066.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156116142734.1664939.5074567130774423066.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_043741_995382_2A0BA2D4 
X-CRM114-Status: GOOD (  14.58  )
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
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org, josef@toxicpanda.com,
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

On Fri 21-06-19 16:57:07, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> When we're using FS_IOC_SETFLAGS to set the immutable flag on a file, we
> need to ensure that userspace can't continue to write the file after the
> file becomes immutable.  To make that happen, we have to flush all the
> dirty pagecache pages to disk to ensure that we can fail a page fault on
> a mmap'd region, wait for pending directio to complete, and hope the
> caller locked out any new writes by holding the inode lock.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

Seeing the way this worked out, is there a reason to have separate
vfs_ioc_setflags_flush_data() instead of folding the functionality in
vfs_ioc_setflags_check() (possibly renaming it to
vfs_ioc_setflags_prepare() to indicate it does already some changes)? I
don't see any place that would need these two separated...

> +/*
> + * Flush all pending IO and dirty mappings before setting S_IMMUTABLE on an
> + * inode via FS_IOC_SETFLAGS.  If the flush fails we'll clear the flag before
> + * returning error.
> + *
> + * Note: the caller should be holding i_mutex, or else be sure that
> + * they have exclusive access to the inode structure.
> + */
> +static inline int vfs_ioc_setflags_flush_data(struct inode *inode, int flags)
> +{
> +	int ret;
> +
> +	if (!vfs_ioc_setflags_need_flush(inode, flags))
> +		return 0;
> +
> +	inode_set_flags(inode, S_IMMUTABLE, S_IMMUTABLE);
> +	ret = inode_flush_data(inode);
> +	if (ret)
> +		inode_set_flags(inode, 0, S_IMMUTABLE);
> +	return ret;
> +}

Also this sets S_IMMUTABLE whenever vfs_ioc_setflags_need_flush() returns
true. That is currently the right thing but seems like a landmine waiting
to trip? So I'd just drop the vfs_ioc_setflags_need_flush() abstraction to
make it clear what's going on.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
