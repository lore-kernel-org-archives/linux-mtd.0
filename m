Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85474D10F51
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Nov 2025 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/cZR+fJXQQiIeiulZy5WbpfIo9gHwQWOgm+A7CJVXo=; b=oGkF0lhgDh0LDS
	1T7/Y2R1NidW5S+P4/yMBoCpstmZr+eIDepUvWfTfPgWWuo1bWQMUMyBqH9FunuepbvT0RkhxJjiJ
	/1RDzLAnF7UNcABtVRS+Y3uRFHTHf/cGP31t26l1qZ3Jxa2zxLZb38ajV6J6qFoHgDPnSGdleSnad
	e2UFicfvRTC5YDfT2loTF1Y+gnnnfUYZTgf12tgVn2gsSNb05fTgAfr5k0TClycEdKbPkYnZ7C2uq
	ESFd8yd8qwzMBCezQO+ors81wgeaEOsDIx7hgJTWvKi7qqdA3EKx4KpL0rf2odpiWp8TrhP+6qL2V
	npTGf+WfIpmjVvi853Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFva-0000000F3sU-2oxO;
	Wed, 26 Nov 2025 13:51:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFvX-0000000F3sM-3q6L
	for linux-mtd@lists.infradead.org;
	Wed, 26 Nov 2025 13:51:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5A1C601B5;
	Wed, 26 Nov 2025 13:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADBEC4CEF8;
	Wed, 26 Nov 2025 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764165082;
	bh=yUKYtxHtKaR+6m/xsrQsQe67bKqXRGc4JbcKnKX+a20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J8iRE1/WnH5hQhQsb+gz1I+WE9aSLdfLQQiRWd7g4hWBfFLiJ7GeKN9MfcROfuy14
	 Bg5ifG0mRnEDa0wLCNWcaWSef/QLNZ9iuJt146gvNW8/fk6cYnq1PxKc4hQKhLNIBA
	 sNEXQMAYyhZpIavSfz+KkkZ7tBQo4jX83xz4wgdkgk+sAnQZiGPm4kG9cVpDUNx50f
	 GszRnMspkE9d7aOOvEx8eAK322hwR8CBYnIQYVbVZy8dg9+z7898oFiThB1IRsH5Xr
	 Ex3oGaOerSkIflHQPu0XSvcuPfWP3Yma6L1dTMlIVWE32f0gwXl7q8tXr7D18MuVes
	 /vgMU+UkTu2HA==
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
Subject: Re: (subset) re-enable IOCB_NOWAIT writes to files v2
Date: Wed, 26 Nov 2025 14:51:10 +0100
Message-ID: <20251126-freigaben-fixkosten-7f8ba6710fce@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120064859.2911749-1-hch@lst.de>
References: <20251120064859.2911749-1-hch@lst.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827; i=brauner@kernel.org; h=from:subject:message-id; bh=yUKYtxHtKaR+6m/xsrQsQe67bKqXRGc4JbcKnKX+a20=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSqs17kYtX3/zt7guqDZZHcotIzSu/JuZ8vW1f2x9Tzn jjvrEs8HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABP5NJ/hfwz3tQVV/86ebZ6Q ZOX2S/x94+vvFxzsdzFb2M/tOJ9ddJzhf+6cWXKXJ/IYCjVvXXqrOyfkypPfnuY+G+fPOLtET2K HGS8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
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

On Thu, 20 Nov 2025 07:47:21 +0100, Christoph Hellwig wrote:
> commit 66fa3cedf16a ("fs: Add async write file modification handling.")
> effectively disabled IOCB_NOWAIT writes as timestamp updates currently
> always require blocking, and the modern timestamp resolution means we
> always update timestamps.  This leads to a lot of context switches from
> applications using io_uring to submit file writes, making it often worse
> than using the legacy aio code that is not using IOCB_NOWAIT.
> 
> [...]

Applied to the vfs-6.19.misc branch of the vfs/vfs.git tree.
Patches in the vfs-6.19.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.19.misc

[01/16] fs: refactor file timestamp update logic
        https://git.kernel.org/vfs/vfs/c/3cd9a42f1b5e
[02/16] fs: lift the FMODE_NOCMTIME check into file_update_time_flags
        https://git.kernel.org/vfs/vfs/c/7f30e7a42371
[03/16] fs: export vfs_utimes
        https://git.kernel.org/vfs/vfs/c/013983665227
[04/16] btrfs: use vfs_utimes to update file timestamps
        https://git.kernel.org/vfs/vfs/c/ded99587047c
[05/16] btrfs: fix the comment on btrfs_update_time
        https://git.kernel.org/vfs/vfs/c/f981264ae75e
[06/16] orangefs: use inode_update_timestamps directly
        https://git.kernel.org/vfs/vfs/c/eff094a58d00

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
