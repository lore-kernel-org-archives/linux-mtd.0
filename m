Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AD5C48BD5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 07:08:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A1D20665
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 07:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KtcFZj87"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A1D20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTIktsOqt9J9OY/A0/rRqa5c24aLMnOibKtG9yaRh8o=; b=KtcFZj87KoBvF9
	4m0SdrLhBPjWDwxwPJ2qX+JN8v1FZuMA9v6/ioLN3FGELVGeyxUPEaHZuA8RhaXariOPce4RM3dz8
	mh9kQsLWbvTWuSEEn9eumAMdfuPDyt3r2Wj4LxPeuyMxEw/CxXyhxkcZVxOaEbeGvjqyoAvTdj1NL
	jUfe5Y4NgrXtIGjDx7+nOHWQnoK0Yf2WSy5K0EfWQmFh3n/+NOKcKexJiqe3/9z20YZglLCIGYIVE
	4xYQlhGfibLOLmee77a3STNhO1RjozItcNRMfG75s7tRZpp2Yaq5PsRnE1hlED1GLsfK84FxUCuim
	Z1m4W/54Utglj7sxKmRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hffYq-0003PZ-MH; Tue, 25 Jun 2019 07:08:12 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hffYn-0003EI-0V
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2019 07:08:11 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05584ADF2;
 Tue, 25 Jun 2019 07:08:05 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E62D81E2F23; Tue, 25 Jun 2019 09:08:04 +0200 (CEST)
Date: Tue, 25 Jun 2019 09:08:04 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [Ocfs2-devel] [PATCH 2/7] vfs: flush and wait for io when
 setting the immutable flag via SETFLAGS
Message-ID: <20190625070804.GA31527@quack2.suse.cz>
References: <156116141046.1664939.11424021489724835645.stgit@magnolia>
 <156116142734.1664939.5074567130774423066.stgit@magnolia>
 <20190624113737.GG32376@quack2.suse.cz>
 <20190624215817.GE1611011@magnolia>
 <20190625030439.GA5379@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625030439.GA5379@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_000809_346723_EC183A75 
X-CRM114-Status: GOOD (  25.31  )
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
Cc: linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>, yuchao0@huawei.com,
 linux-mm@kvack.org, clm@fb.com, adilger.kernel@dilger.ca,
 ocfs2-devel@oss.oracle.com, matthew.garrett@nebula.com,
 linux-nilfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, josef@toxicpanda.com, reiserfs-devel@vger.kernel.org,
 viro@zeniv.linux.org.uk, dsterba@suse.com, jaegeuk@kernel.org, tytso@mit.edu,
 ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jk@ozlabs.org, jack@suse.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon 24-06-19 20:04:39, Darrick J. Wong wrote:
> On Mon, Jun 24, 2019 at 02:58:17PM -0700, Darrick J. Wong wrote:
> > On Mon, Jun 24, 2019 at 01:37:37PM +0200, Jan Kara wrote:
> > > On Fri 21-06-19 16:57:07, Darrick J. Wong wrote:
> > > > From: Darrick J. Wong <darrick.wong@oracle.com>
> > > > 
> > > > When we're using FS_IOC_SETFLAGS to set the immutable flag on a file, we
> > > > need to ensure that userspace can't continue to write the file after the
> > > > file becomes immutable.  To make that happen, we have to flush all the
> > > > dirty pagecache pages to disk to ensure that we can fail a page fault on
> > > > a mmap'd region, wait for pending directio to complete, and hope the
> > > > caller locked out any new writes by holding the inode lock.
> > > > 
> > > > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > 
> > > Seeing the way this worked out, is there a reason to have separate
> > > vfs_ioc_setflags_flush_data() instead of folding the functionality in
> > > vfs_ioc_setflags_check() (possibly renaming it to
> > > vfs_ioc_setflags_prepare() to indicate it does already some changes)? I
> > > don't see any place that would need these two separated...
> > 
> > XFS needs them to be separated.
> > 
> > If we even /think/ that we're going to be setting the immutable flag
> > then we need to grab the IOLOCK and the MMAPLOCK to prevent further
> > writes while we drain all the directio writes and dirty data.  IO
> > completions for the write draining can take the ILOCK, which means that
> > we can't have grabbed it yet.
> > 
> > Next, we grab the ILOCK so we can check the new flags against the inode
> > and then update the inode core.
> > 
> > For most filesystems I think it suffices to inode_lock and then do both,
> > though.
> 
> Heh, lol, that applies to fssetxattr, not to setflags, because xfs
> setflags implementation open-codes the relevant fssetxattr pieces.
> So for setflags we can combine both parts into a single _prepare
> function.

Yeah. Also for fssetxattr we could use the prepare helper at least for
ext4, f2fs, and btrfs where the situation isn't so complex as for xfs to
save some boilerplate code.

								Honza

> > > > +/*
> > > > + * Flush all pending IO and dirty mappings before setting S_IMMUTABLE on an
> > > > + * inode via FS_IOC_SETFLAGS.  If the flush fails we'll clear the flag before
> > > > + * returning error.
> > > > + *
> > > > + * Note: the caller should be holding i_mutex, or else be sure that
> > > > + * they have exclusive access to the inode structure.
> > > > + */
> > > > +static inline int vfs_ioc_setflags_flush_data(struct inode *inode, int flags)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	if (!vfs_ioc_setflags_need_flush(inode, flags))
> > > > +		return 0;
> > > > +
> > > > +	inode_set_flags(inode, S_IMMUTABLE, S_IMMUTABLE);
> > > > +	ret = inode_flush_data(inode);
> > > > +	if (ret)
> > > > +		inode_set_flags(inode, 0, S_IMMUTABLE);
> > > > +	return ret;
> > > > +}
> > > 
> > > Also this sets S_IMMUTABLE whenever vfs_ioc_setflags_need_flush() returns
> > > true. That is currently the right thing but seems like a landmine waiting
> > > to trip? So I'd just drop the vfs_ioc_setflags_need_flush() abstraction to
> > > make it clear what's going on.
> > 
> > Ok.
> > 
> > --D
> > 
> > > 
> > > 								Honza
> > > -- 
> > > Jan Kara <jack@suse.com>
> > > SUSE Labs, CR
> > 
> > _______________________________________________
> > Ocfs2-devel mailing list
> > Ocfs2-devel@oss.oracle.com
> > https://oss.oracle.com/mailman/listinfo/ocfs2-devel
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
