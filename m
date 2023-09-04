Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC510C71153
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Sep 2023 09:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1UBXR5vJLvbVSOj1oCMdtxkkm+DsvXVxp3iU/IvXh8=; b=ZT/F6vBI7Ne7Vf
	CEtCPmhtFgZwQ5+T9yV+JkPbfELprEjfmFD3pnRftulhOmMnUk8gN4qE1LXqFt644ajOtmf6AHwee
	9wCZDOAnl+KPsfULH+s6j9L6nqEM/g1pj2RruFQ6DqlNxSMe9az/bSyn+xNITh6VJJruiE278q6p9
	kG2jKg2zpzigI4kpJa4H1XZ/OG/vlfeVFgY4yVPkSMz9/V1W5HMlEF1VVJ3h7LIzfX3vCwZajDZqS
	voGVeOcpEbZVWDoy6hpfa7Tcn1jObVhtQjObmA2RlUGtoFN77fPE5MvU91gQXgSRTDVtFoAmvOgLP
	uiy2JOZqYTtlrJR/V4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd6FQ-003iSQ-1W;
	Mon, 04 Sep 2023 09:51:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd6FN-003iS1-20
	for linux-mtd@lists.infradead.org;
	Mon, 04 Sep 2023 09:51:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C4EA7CE0E30;
	Mon,  4 Sep 2023 09:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B855FC433C8;
	Mon,  4 Sep 2023 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693821110;
	bh=u+xgETcg23UcZvAsSNoTKQTpoQDzWhh5CjfKLhaLfCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrBGNC0GUAEP92SVXDSYgvIeyQhEWu5ohv1UZxcq2j4jmPnZMVKVXd7PcLbrec+YC
	 YwtxwrDnv2HUbxAauD5LP+iZpv1hgd3J7v5N5AFier00fzuLYjkXSyalNCln662qcL
	 MOkKZFmfbFH61oxgNm/1PDUalOPIF/dG8en4lktLAOJKNet2WlaOi4SDB1WMRo8c1E
	 Fx1ryvNUFvNi9qlIPKbaeTXq/1cJbp6vtXGsOglG9wRy2wFIevByTxjIps/B3VRZZs
	 ZTGcqJO6bRRRPVV2zC3wt54/lylE+o7sVECKL3QKI1/oWONjJaYkFRkcM0vOKzehKT
	 ynVVLBmYA4BCQ==
Date: Mon, 4 Sep 2023 11:51:40 +0200
From: Christian Brauner <brauner@kernel.org>
To: Hao Xu <hao.xu@linux.dev>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 07/11] vfs: add nowait parameter for file_accessed()
Message-ID: <20230904-trennen-gewettert-0b2dc5ba60bc@brauner>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827132835.1373581-8-hao.xu@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_025154_025443_7C13E527 
X-CRM114-Status: GOOD (  15.52  )
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

On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> Add a boolean parameter for file_accessed() to support nowait semantics.
> Currently it is true only with io_uring as its initial caller.
> 
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> ---
>  arch/s390/hypfs/inode.c | 2 +-
>  block/fops.c            | 2 +-
>  fs/btrfs/file.c         | 2 +-
>  fs/btrfs/inode.c        | 2 +-
>  fs/coda/dir.c           | 4 ++--
>  fs/ext2/file.c          | 4 ++--
>  fs/ext4/file.c          | 6 +++---
>  fs/f2fs/file.c          | 4 ++--
>  fs/fuse/dax.c           | 2 +-
>  fs/fuse/file.c          | 4 ++--
>  fs/gfs2/file.c          | 2 +-
>  fs/hugetlbfs/inode.c    | 2 +-
>  fs/nilfs2/file.c        | 2 +-
>  fs/orangefs/file.c      | 2 +-
>  fs/orangefs/inode.c     | 2 +-
>  fs/pipe.c               | 2 +-
>  fs/ramfs/file-nommu.c   | 2 +-
>  fs/readdir.c            | 2 +-
>  fs/smb/client/cifsfs.c  | 2 +-
>  fs/splice.c             | 2 +-
>  fs/ubifs/file.c         | 2 +-
>  fs/udf/file.c           | 2 +-
>  fs/xfs/xfs_file.c       | 6 +++---
>  fs/zonefs/file.c        | 4 ++--
>  include/linux/fs.h      | 5 +++--
>  mm/filemap.c            | 8 ++++----
>  mm/shmem.c              | 6 +++---
>  27 files changed, 43 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
> index ee919bfc8186..55f562027c4f 100644
> --- a/arch/s390/hypfs/inode.c
> +++ b/arch/s390/hypfs/inode.c
> @@ -157,7 +157,7 @@ static ssize_t hypfs_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	if (!count)
>  		return -EFAULT;
>  	iocb->ki_pos = pos + count;
> -	file_accessed(file);
> +	file_accessed(file, false);

Why? If all you do is skip atime update anyway then just add something
like:

bool file_needs_atime(struct file *file)
{
       return !(file->f_flags & O_NOATIME) &&
              atime_needs_update(&file->f_path, d_inode(path->dentry));
}

and then

if (file_needs_atime(file) && IOURING_WANTS_ASYNC)
	return -EAGAIN;

instead of touching all this code.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
