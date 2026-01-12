Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EEEC9EC88
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jan 2026 13:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up0Okc+WYZb4XqkApLUdrl1VEWBdqCIoVD83RpPrz8c=; b=LEpSoygpwRygCQ
	tYdp/xyeEp2MsvR9Jg6w4RCnBkvSD+fUVZITWTF+HSE9W2gRLtCTp5waBIdv6M2NvFM1SeojiMSWT
	uBPcaImonGRMO76kGbK+8cWWJTW7c5bV1tVqJmjVmA+dFDllxgNPH76PuuDtLH1wUpzzZpCM7AGRT
	bWLWuKjpK6mKv02LGkx3PpRnvo05cnZRR5SWa4zYDOEYO/lqQDxAgEQs9nQhUR0Z8lqQOAUvQOg/P
	RhKt0Qz67S4GxfBPkR+v/3/Eb6i+mwYacmEFfElfHIalaETJrdB/CfeE4a160NF+UslrigNx+mlLQ
	QhLHxNIjEDSao4jhL2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHYl-00000005MxT-3z36;
	Mon, 12 Jan 2026 13:02:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHYj-00000005Mwb-0Ca8
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jan 2026 13:02:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CD7B42B00;
	Mon, 12 Jan 2026 13:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EF4C16AAE;
	Mon, 12 Jan 2026 13:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768222932;
	bh=RIH5DGw9iaODSe+GboFTs0O7c0cEBRdRfN8567Qvz9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GuBawYgiub2dv2qsF9RKZVhe0V/aSnkEu4nPJWorZt+trDE7QgUWV0DL+v3F9lYFb
	 S8jkjZescwZ86TegZq0zHtZhaq9OiP/XT4Ek5oC6djgknJE1zX7QEA/iqpuP2EIHYd
	 i/AUasa7Z7UImS/J0tHpsy/U9HlOS5XOAxCNzfi5lx8vhyf2Wb4IsdXz0HYl/2ybgd
	 zyMbLaIzdD+bTqh0IYPV9h+8sw3TKlpbpGyacEvIK+RA3MswzE5pZ8VVVdUD7aZwhB
	 Xj9stBjtg4cBkuHHRQP3fuSvhrKmcBkeAARfw51Fmp9ppfpQRplOXvMpP4uYYgpMYD
	 hcqUp5Kh8q71w==
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>,
	Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev,
	io-uring@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: re-enable IOCB_NOWAIT writes to files v6
Date: Mon, 12 Jan 2026 14:02:02 +0100
Message-ID: <20260112-geben-ausrichten-20a6cad7e163@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108141934.2052404-1-hch@lst.de>
References: <20260108141934.2052404-1-hch@lst.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358; i=brauner@kernel.org; h=from:subject:message-id; bh=RIH5DGw9iaODSe+GboFTs0O7c0cEBRdRfN8567Qvz9A=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSmfDgTzOJR2bBdxfHs4lPvNzr2Vs6TUNwx6US+esA93 wOa+bFsHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABN5dI2R4ZP6ftH/fWt4PbWW uef2Z5wtW9WpnhlzeM35ddH5pfqvghj+lxkqrN5Xtz+j/JXujQs9eTrzbzdP4Od/964lr1hHb7E MCwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_050213_125706_F57D987A 
X-CRM114-Status: GOOD (  12.49  )
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

On Thu, 08 Jan 2026 15:19:00 +0100, Christoph Hellwig wrote:
> commit 66fa3cedf16a ("fs: Add async write file modification handling.")
> effectively disabled IOCB_NOWAIT writes as timestamp updates currently
> always require blocking, and the modern timestamp resolution means we
> always update timestamps.  This leads to a lot of context switches from
> applications using io_uring to submit file writes, making it often worse
> than using the legacy aio code that is not using IOCB_NOWAIT.
> 
> [...]

Applied to the vfs-7.0.nonblocking_timestamps branch of the vfs/vfs.git tree.
Patches in the vfs-7.0.nonblocking_timestamps branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.0.nonblocking_timestamps

[01/11] fs: remove inode_update_time
        https://git.kernel.org/vfs/vfs/c/20b781834ea0
[02/11] fs: allow error returns from generic_update_time
        https://git.kernel.org/vfs/vfs/c/dc9629faef0a
[03/11] nfs: split nfs_update_timestamps
        https://git.kernel.org/vfs/vfs/c/b8b3002fbfef
[04/11] fat: cleanup the flags for fat_truncate_time
        https://git.kernel.org/vfs/vfs/c/1cbc82281675
[05/11] fs: refactor ->update_time handling
        https://git.kernel.org/vfs/vfs/c/761475268fa8
[06/11] fs: factor out a sync_lazytime helper
        https://git.kernel.org/vfs/vfs/c/188344c8ac0b
[07/11] fs: add a ->sync_lazytime method
        https://git.kernel.org/vfs/vfs/c/5cf06ea56ee6
[08/11] fs: add support for non-blocking timestamp updates
        https://git.kernel.org/vfs/vfs/c/85c871a02b03
[09/11] fs: refactor file_update_time_flags
        https://git.kernel.org/vfs/vfs/c/2d72003ba244
[10/11] xfs: implement ->sync_lazytime
        https://git.kernel.org/vfs/vfs/c/f92f8eddbbfb
[11/11] xfs: enable non-blocking timestamp updates
        https://git.kernel.org/vfs/vfs/c/08489c4f4133

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
