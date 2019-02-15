Return-Path: <SRS0=Utib=QW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F88C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Feb 2019 08:05:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF18222E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Feb 2019 08:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qPGqqZ9O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTwuZODZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CF18222E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPyysN6uzNLkX6EvY9zQORgs+BEzEtqQPWHKIq1jj/Y=; b=qPGqqZ9OXGORiF
	IKVYfzAqZYlgKkBTyQ5q2yJfq70zHNIOZlD8ETdV64XQPIXeD3oIrGRfVqkaJF9h8WrZn1nX7A0GB
	XLRVrLc59XQW6oILBWDeQqmpUcXYnoxeadp7QpF284YHcAiGx8BRz8NuAivDMnRnw1hbot6xUU+HI
	x/zDba4n6BcxBOVqJIrA6J+3ZqUtssSROTfruFqY4xNUATUbas7yaHjmVUNmGH4BMKmPL6ZbeI3x0
	IXrfmMzZhLWA/SQeP1aLCoFzTQPFrYSf+XhsPuqL5ZvA+lvlI+A6WY/Z11lg3doJLSIOZx4M+ygKY
	aNRyT9+lvlteU1sOD05w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guYU0-000564-Df; Fri, 15 Feb 2019 08:04:28 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guYTw-00055Y-VX
 for linux-mtd@lists.infradead.org; Fri, 15 Feb 2019 08:04:26 +0000
Received: by mail-yb1-xb42.google.com with SMTP id 2so3466296ybw.4
 for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2019 00:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QuEfGz9b+yTPacvnfh/QMnf3j7UM3cHWmseR0aorNT0=;
 b=iTwuZODZm/rOKVxYNUyD7WhyONkGHoFKvHJmU7KQQHd0OVhYrDsruvhfGPlzfQWG7d
 +LhdlRPH0b3tYOAMqbilffCBDMxU5eztxCZaPrJbLzNokDIQxUvUtbg86I0sLJtkPR7o
 VOrHSFY3YblvfYFJEYnLYjMCRkAXhEobe5kACtHAKixavdyqWYZacDFfwCgtB/N4/IcK
 zfNUci1q3fNIzEgFayI+DNU2j8H0pqP20H424oIRwjqC24gbo0ogGEtWdpawpXfjAj1w
 nxWq+N1u0WqkaL4TuPva8RtuFImC2B69xUzGCHeEUkPFdzi2hD5jVIOqCYp5KSBakC4G
 c+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QuEfGz9b+yTPacvnfh/QMnf3j7UM3cHWmseR0aorNT0=;
 b=uNq0+uNLsI5wFj5a5pV6+kgNKp/hOgxCfOwpwPXrjpNtxU1bZ98WkwCYvB7xtCQ5tJ
 Jihtnu0LAM4L8IomQDFXx6p9QWxyFdRlC/eC/kfw1fkCZTXE3JZBWZqaSZ+6UbVQITh5
 9xDlsOHWnrNH5J5dMLWvfm4cy6weTFTkqv3Fde6zyEN7syfrYxhSfrUMV57/ulaZFzZN
 4PJpl6bWM+5DLVZ0JX0+SnxASznU0InKbaKidXB4A3NfL3t452WI8P0IVBW8VBl9vxxL
 N88FYGmfAQbkmzbECKcwt1QbuvPbjjRNLdUAEZwIBxOTAGFHCbnD+N8y8jtuqPdeEI+w
 641g==
X-Gm-Message-State: AHQUAuZzrNvLC/CPjX1IFWDfZTYy84WEFPsZOCKIvjFwmKNiLpbYYYeU
 7Wk6TuVXAL8Jh1cAtFhuWLG4puEsKb5YXaj9LJE=
X-Google-Smtp-Source: AHgI3IbStHEFP2mPJIlWtmF4n/NoxAegtGV89PF4VxWaRToDnmSo0gKvywSNl1E5lM/gDGjkKC8HTPs6V3PZGp1+bd8=
X-Received: by 2002:a25:9c09:: with SMTP id c9mr7114969ybo.462.1550217863552; 
 Fri, 15 Feb 2019 00:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20190214234908.GA6474@magnolia>
In-Reply-To: <20190214234908.GA6474@magnolia>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 15 Feb 2019 10:04:12 +0200
Message-ID: <CAOQ4uxho2AK7g-uhHykGaG6n+aqad-SaCTC6Z_EaA4Jn07tDSg@mail.gmail.com>
Subject: Re: [PATCH] vfs: don't decrement i_nlink in d_tmpfile
To: "Darrick J. Wong" <darrick.wong@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_000425_044692_A21C3DDA 
X-CRM114-Status: GOOD (  23.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Tso <tytso@mit.edu>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 yuchao0@huawei.com, Hugh Dickins <hughd@google.com>,
 Josef Bacik <josef@toxicpanda.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Christoph Hellwig <hch@infradead.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>, dsterba@suse.com,
 Jaegeuk Kim <jaegeuk@kernel.org>, Ext4 <linux-ext4@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Linux Btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 15, 2019 at 4:23 AM Darrick J. Wong <darrick.wong@oracle.com> wrote:
>
> From: Darrick J. Wong <darrick.wong@oracle.com>
>
> d_tmpfile was introduced to instantiate an inode in the dentry cache as
> a temporary file.  This helper decrements the inode's nlink count and
> dirties the inode, presumably so that filesystems could call new_inode
> to create a new inode with nlink == 1 and then call d_tmpfile which will
> decrement nlink.
>
> However, this doesn't play well with XFS, which needs to allocate,
> initialize, and insert a tempfile inode on its unlinked list in a single
> transaction.  In order to maintain referential integrity of the XFS
> metadata, we cannot have an inode on the unlinked list with nlink >= 1.
>
> XFS and btrfs hack around d_tmpfile's behavior by creating the inode
> with nlink == 0 and then incrementing it just prior to calling
> d_tmpfile, anticipating that it will be reset to 0.
>
> Everywhere else outside of d_tmpfile, it appears that nlink updates and
> persistence is the responsibility of individual filesystems.  Therefore,
> move the nlink decrement out of d_tmpfile into the callers, and require
> that callers only pass in inodes with nlink already set to 0.
>
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> ---
>  fs/btrfs/inode.c  |    8 --------
>  fs/dcache.c       |    8 ++++++--
>  fs/ext2/namei.c   |    2 +-
>  fs/ext4/namei.c   |    1 +
>  fs/f2fs/namei.c   |    1 +
>  fs/minix/namei.c  |    2 +-
>  fs/ubifs/dir.c    |    1 +
>  fs/udf/namei.c    |    2 +-
>  fs/xfs/xfs_iops.c |   13 ++-----------
>  mm/shmem.c        |    1 +
>  10 files changed, 15 insertions(+), 24 deletions(-)
>
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index 5c349667c761..bd189fc50f83 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -10382,14 +10382,6 @@ static int btrfs_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
>         if (ret)
>                 goto out;
>
> -       /*
> -        * We set number of links to 0 in btrfs_new_inode(), and here we set
> -        * it to 1 because d_tmpfile() will issue a warning if the count is 0,
> -        * through:
> -        *
> -        *    d_tmpfile() -> inode_dec_link_count() -> drop_nlink()
> -        */
> -       set_nlink(inode, 1);
>         d_tmpfile(dentry, inode);
>         unlock_new_inode(inode);
>         mark_inode_dirty(inode);
> diff --git a/fs/dcache.c b/fs/dcache.c
> index aac41adf4743..5fb4ecce2589 100644
> --- a/fs/dcache.c
> +++ b/fs/dcache.c
> @@ -3042,12 +3042,16 @@ void d_genocide(struct dentry *parent)
>
>  EXPORT_SYMBOL(d_genocide);
>
> +/*
> + * Instantiate an inode in the dentry cache as a temporary file.  Callers must
> + * ensure that @inode has a zero link count.
> + */
>  void d_tmpfile(struct dentry *dentry, struct inode *inode)
>  {
> -       inode_dec_link_count(inode);
>         BUG_ON(dentry->d_name.name != dentry->d_iname ||
>                 !hlist_unhashed(&dentry->d_u.d_alias) ||
> -               !d_unlinked(dentry));
> +               !d_unlinked(dentry) ||
> +               inode->i_nlink != 0);

You've just promoted i_nlink filesystem accounting error (which
are not that rare) from WARN_ON() to BUG_ON(), not to mention
Linus' objection to any use of BUG_ON() at all.

!hlist_unhashed is anyway checked again in d_instantiate().
!d_unlinked is not a reason to break the machine.
The name check is really not a reason to break the machine.
Can probably make tmp name code conditional to WARN_ON().

Thanks,
Amir.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
