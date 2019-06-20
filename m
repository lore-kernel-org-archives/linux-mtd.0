Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DABCC43613
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 14:00:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6270D2083B
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 14:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A3Rj4WJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6270D2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QF3O13CMhr29fdMeI7zeY1SHV6s+BaogQvfwBHV2x+E=; b=A3Rj4WJSIKZ6n/
	P8qLdia+uF6LybbbuiQfkq6+hoHLWuBSgTXm0qM0KxC8dGOSWYWlXLGasmu6cdDGNMNn/SVK5Nn6n
	45VNceLhMaTM7PsHH/tTUZyrrr9w8X5jsgvoqeAnB8mR7UaY3cr0BOm+GAHiHlkzz8yqOuI4cbZUp
	5uGMCcLm/83tyGogEALBpnyGj86h+7MhyfE3rljTid0iyHF5eBJRJostZ9OyCwJWr8/waBhc/5NnZ
	higvN7Vl0+EPQ9DLybscgkHpBG/oFUlX8AqSypA7gFAgxxqxnLEH9D3QdKABxUEJBob1G4KkDulG0
	pALtnPcqow+oi1mmpbLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdxcT-0002EO-8P; Thu, 20 Jun 2019 14:00:53 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdxc6-0001wZ-8K
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2019 14:00:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8BBB1AEF8;
 Thu, 20 Jun 2019 14:00:28 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1187D1E434F; Thu, 20 Jun 2019 16:00:28 +0200 (CEST)
Date: Thu, 20 Jun 2019 16:00:28 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 2/6] vfs: flush and wait for io when setting the
 immutable flag via SETFLAGS
Message-ID: <20190620140028.GH30243@quack2.suse.cz>
References: <156022836912.3227213.13598042497272336695.stgit@magnolia>
 <156022838496.3227213.3771632042609589318.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156022838496.3227213.3771632042609589318.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_070031_340834_088A468A 
X-CRM114-Status: GOOD (  16.86  )
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

On Mon 10-06-19 21:46:25, Darrick J. Wong wrote:
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

...

> diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
> index 6aa1df1918f7..a05341b94d98 100644
> --- a/fs/ext4/ioctl.c
> +++ b/fs/ext4/ioctl.c
> @@ -290,6 +290,9 @@ static int ext4_ioctl_setflags(struct inode *inode,
>  	jflag = flags & EXT4_JOURNAL_DATA_FL;
>  
>  	err = vfs_ioc_setflags_check(inode, oldflags, flags);
> +	if (err)
> +		goto flags_out;
> +	err = vfs_ioc_setflags_flush_data(inode, flags);
>  	if (err)
>  		goto flags_out;
>  

...

> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 8dad3c80b611..9c899c63957e 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3548,7 +3548,41 @@ static inline struct sock *io_uring_get_socket(struct file *file)
>  
>  int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags);
>  
> +/*
> + * Do we need to flush the file data before changing attributes?  When we're
> + * setting the immutable flag we must stop all directio writes and flush the
> + * dirty pages so that we can fail the page fault on the next write attempt.
> + */
> +static inline bool vfs_ioc_setflags_need_flush(struct inode *inode, int flags)
> +{
> +	if (S_ISREG(inode->i_mode) && !IS_IMMUTABLE(inode) &&
> +	    (flags & FS_IMMUTABLE_FL))
> +		return true;
> +
> +	return false;
> +}
> +
> +/*
> + * Flush file data before changing attributes.  Caller must hold any locks
> + * required to prevent further writes to this file until we're done setting
> + * flags.
> + */
> +static inline int inode_flush_data(struct inode *inode)
> +{
> +	inode_dio_wait(inode);
> +	return filemap_write_and_wait(inode->i_mapping);
> +}
> +
> +/* Flush file data before changing attributes, if necessary. */
> +static inline int vfs_ioc_setflags_flush_data(struct inode *inode, int flags)
> +{
> +	if (vfs_ioc_setflags_need_flush(inode, flags))
> +		return inode_flush_data(inode);
> +	return 0;
> +}
> +

But this is racy at least for page faults, isn't it? What protects you
against write faults just after filemap_write_and_wait() has finished?
So either you need to set FS_IMMUTABLE_FL before flushing data or you need
to get more protection from the fs than just i_rwsem. In the case of ext4
that would be i_mmap_rwsem but other filesystems don't have equivalent
protection...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
