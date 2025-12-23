Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2686DE748FC
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 22:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdroUvdH15dpQEnLvvbr+h5cLLaQToX0xrLCcUkizcs=; b=1wSJWVxx4imx00
	C4v2U1renETFlo8c6gVB0IfW9drfcD0qNgA5V9UQysybaYjSiirVZxD6DjfP/f4yxbGjXBAoqrian
	KfCa5Z3iiby+FDHBULpSll521iJ9LpOyI8XktuPetPHL4tbNN0mFTp+9Y40GNmMEQNMwfxBIkucZR
	UGyXnrhO5TBaHGhfsscajJLUoNkj3jXFEhTh3ynWxZtRU+pM6XC4rvYFVxBNtG1zLPiuX2vHZBwk2
	Iizns58b1YLXYBA9MKSCQBZtt9L+aQwWdw0MUqSQ+CKRNrnolsbKWyDgmcBLvB9C19LjTK8dlYur8
	AgRoZdsXGjD3ockpbVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBFt-0000000G9iH-3h4j;
	Tue, 23 Dec 2025 22:53:25 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBFp-0000000G9hm-3ZUg
	for linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2025 22:53:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 98B7D227A87; Tue, 23 Dec 2025 23:53:16 +0100 (CET)
Date: Tue, 23 Dec 2025 23:53:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: re-enable IOCB_NOWAIT writes to files v4
Message-ID: <20251223225316.GA26676@lst.de>
References: <20251223003756.409543-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251223003756.409543-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_145322_040376_0EF7DDFA 
X-CRM114-Status: GOOD (  23.22  )
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

Julia found a nice little typo in the new changes, which really
wants me to split the atime from c/mtime update path badly.  So
don't feel rushed to review this version and enjoy the holidays,
there will be a new one soon.

On Tue, Dec 23, 2025 at 09:37:43AM +0900, Christoph Hellwig wrote:
> Hi all,
> 
> commit 66fa3cedf16a ("fs: Add async write file modification handling.")
> effectively disabled IOCB_NOWAIT writes as timestamp updates currently
> always require blocking, and the modern timestamp resolution means we
> always update timestamps.  This leads to a lot of context switches from
> applications using io_uring to submit file writes, making it often worse
> than using the legacy aio code that is not using IOCB_NOWAIT.
> 
> This series allows non-blocking updates for lazytime if the file system
> supports it, and adds that support for XFS.
> 
> Changes since v3:
>  - fix was_dirty_time handling in __mark_inode_dirty for the racy flag
>    update case
>  - refactor inode_update_timestamps to make the lazytime vs blocking
>    logical more clear
>  - allow non-blocking timestamp updates for fat
> 
> Changes since v2:
>  - drop patches merged upstream
>  - adjust for the inode state accesors
>  - keep a check in __writeback_single_inode instead of exercising
>    potentially undefined behavior
>  - more spelling fixes
> 
> Changes since v1:
>  - more regular numbering of the S_* flags
>  - fix XFS to actually not block
>  - don't ignore the generic_update_time return value in
>    file_update_time_flags
>  - fix the sync_lazytime return value
>  - fix an out of data comment in btrfs
>  - fix a race that would update i_version before returning -EAGAIN in XFS
> 
> Diffstat:
>  Documentation/filesystems/locking.rst |    2 
>  Documentation/filesystems/vfs.rst     |    6 +
>  fs/btrfs/inode.c                      |    8 +-
>  fs/fs-writeback.c                     |   33 +++++++---
>  fs/gfs2/inode.c                       |    6 +
>  fs/inode.c                            |  111 +++++++++++++++++++++-------------
>  fs/internal.h                         |    3 
>  fs/nfs/inode.c                        |    4 -
>  fs/orangefs/inode.c                   |    5 +
>  fs/overlayfs/inode.c                  |    2 
>  fs/sync.c                             |    4 -
>  fs/ubifs/file.c                       |   13 ++-
>  fs/xfs/xfs_iops.c                     |   34 +++++++++-
>  fs/xfs/xfs_super.c                    |   29 --------
>  include/linux/fs.h                    |   27 ++++++--
>  include/trace/events/writeback.h      |    6 -
>  16 files changed, 182 insertions(+), 111 deletions(-)
---end quoted text---

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
