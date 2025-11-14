Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D540CE8D55
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34At5IC1wr+iPF4oMXZ3mENw0lyrqru6yCyCBkEw3k8=; b=jOP8B1vBwdsUZe
	nRY7GAIBvVjWS9+CPHlHJV55HEqAuFvo9ImBScBJg0/XrhXU7kndtGuCmdVo4p5pqrWNBKZccev2A
	Ep/E//+zUTlHZUGtU4QHUb0jrjJSAzJxfDRUWpUr4rflFKNBYJEp/y3pMsij7LNCaHQqhGM9zWp+0
	PEeAHrPAKwKZEET2L1k7azZwv6euGJJY7js06o3qZ6w40pnPE/aO8EQx/pyGbjTUmpM2rjb5ePKsf
	Pk5pMUu+wKvsnJ4nHxPWUi1aa88E+fqPmuMm244U4K3sgqwM0vXmp4yVz0qPN+Y2Ue0lPuRJduAgK
	TqICaYRy+gh1hnUCAgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxB0-0000000Cnib-2ios;
	Fri, 14 Nov 2025 17:01:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxAx-0000000Cnhs-44QO
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8E9A43833;
	Fri, 14 Nov 2025 17:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D0BC4CEFB;
	Fri, 14 Nov 2025 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763139690;
	bh=xo93xhtQbjPmQQpRAXzz2hy+EkMDFlHK8+leO+CYunA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=depSgkpCCepPRRW+haC+ZhH06xBPr/5yQrjHaIoFlCz8xf8fUrGtSukow5jCP6oM6
	 j5NyYWNTFcBHltRN23qEwrkCZX8ywI0nDaOSwiC7jaIV2zCl42k5JLmQLo1htaeT9D
	 FLysup2+Q9ecjIW+VpnTOKXOGk1P3nYyqiwxtuuBWlyWOJ6qiiMuvBO3jGauhnsTcj
	 fDKSSau3RCn0+rOF3PNnMYFN/kNzwwH+Y8rpihOFPMXz0mwunqvfR4694a4G3XPgM0
	 ruI8Q+WEJ27xbie0fKMrkI5oYeRBOb2IYG9UxoyxU58e9E8+mLINYLKgYPYMbZtBtA
	 rTGeGAjEsMHPA==
Date: Fri, 14 Nov 2025 09:01:29 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: re-enable IOCB_NOWAIT writes to files
Message-ID: <20251114170129.GI196370@frogsfrogsfrogs>
References: <20251114062642.1524837-1-hch@lst.de>
 <b7e8d5e3a0ce8da103f4591afc1f4a9c683ef3c7.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7e8d5e3a0ce8da103f4591afc1f4a9c683ef3c7.camel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_090132_050514_C4B156AC 
X-CRM114-Status: GOOD (  30.20  )
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

On Fri, Nov 14, 2025 at 09:04:58AM -0500, Jeff Layton wrote:
> On Fri, 2025-11-14 at 07:26 +0100, Christoph Hellwig wrote:
> > Hi all,
> > 
> > commit 66fa3cedf16a ("fs: Add async write file modification handling.")
> > effectively disabled IOCB_NOWAIT writes as timestamp updates currently
> > always require blocking, and the modern timestamp resolution means we
> > always update timestamps.  This leads to a lot of context switches from
> > applications using io_uring to submit file writes, making it often worse
> > than using the legacy aio code that is not using IOCB_NOWAIT.
> > 
> > This series allows non-blocking updates for lazytime if the file system
> > supports it, and adds that support for XFS.
> > 
> > It also fixes the layering bypass in btrfs when updating timestamps on
> > device files for devices removed from btrfs usage, and FMODE_NOCMTIME
> > handling in the VFS now that nfsd started using it.  Note that I'm still
> > not sure that nfsd usage is fully correct for all file systems, as only
> > XFS explicitly supports FMODE_NOCMTIME, but at least the generic code
> > does the right thing now.
> > 
> > Diffstat:
> >  Documentation/filesystems/locking.rst |    2 
> >  Documentation/filesystems/vfs.rst     |    6 ++
> >  fs/btrfs/inode.c                      |    3 +
> >  fs/btrfs/volumes.c                    |   11 +--
> >  fs/fat/misc.c                         |    3 +
> >  fs/fs-writeback.c                     |   53 ++++++++++++++----
> >  fs/gfs2/inode.c                       |    6 +-
> >  fs/inode.c                            |  100 +++++++++++-----------------------
> >  fs/internal.h                         |    3 -
> >  fs/orangefs/inode.c                   |    7 ++
> >  fs/overlayfs/inode.c                  |    3 +
> >  fs/sync.c                             |    4 -
> >  fs/ubifs/file.c                       |    9 +--
> >  fs/utimes.c                           |    1 
> >  fs/xfs/xfs_iops.c                     |   29 ++++++++-
> >  fs/xfs/xfs_super.c                    |   29 ---------
> >  include/linux/fs.h                    |   17 +++--
> >  include/trace/events/writeback.h      |    6 --
> >  18 files changed, 152 insertions(+), 140 deletions(-)
> 
> This all looks pretty reasonable to me. There are a few changelog and
> subject line typos, but the code changes look fine. You can add:
> 
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> 
> As far as nfsd's usage of FMODE_NOCMTIME, it looks OK to me. That's
> implemented today by the check in file_modified_flags(), which is
> generic and should work across filesystems.
> 
> The main exception is xfs_exchange_range() which has some special
> handling for it, but nfsd doesn't use that functionality so that
> shouldn't be an issue.
> 
> Am I missing some subtlety?

In exchangerange specifically?

The FMODE_NOCMTIME checks in xfs_exchange_range exist to tell the
exchange-range code to update cmtime, but only if it decides to actually
go through with the mapping exchange.  Since the mapping exchange
requires a transaction anyway, it's cheap to bundle in timestamp
updates.

Also there's no way that we can do nonblocking exchangerange so a NOWAIT
flag wouldn't be much help here anyway.

(I hope that answers your question)

--D

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
