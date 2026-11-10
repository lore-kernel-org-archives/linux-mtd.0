Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1504606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 21:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0T2aPAua;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j22Pvhyi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6wsPipJlAZGn37cuIl8c3zPvlqhKe+NFIqtYAZYWeRw=; b=0T2aPAua0DzBhtixwWKWFBVPyE
	Bh7CBYcFudF8FdFgT854aY/gM43kydvOaNVVnwqtu1DojAihXnZYDOklfvnHZ90RMM8spVHYkjwkC
	FOnoIoYNht8ad9++Ddb76U649bzmOEJb/TOQf4qUd/jzdIRtpkPhAuPkgSBR/2UMeNMvl5D8FI6Di
	6JStSc9OJ+mqtzJeE2bDxwRb4s/jcY76oiG5h1FmowsQiNRmtHjDtu14Li0IoJ72pY+F2h5VaqKfF
	AxOfJX+KzgGXkcOQFFHuqBvEiFwf5OkfO7Qonu5RGj6jJhJXcq1WYoFiaEu18Kq8j9MWEUhHXQp/B
	sccpv+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQto1-000000055jb-1pT2;
	Tue, 10 Nov 2026 21:55:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtnz-000000055jU-2lG3
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 21:55:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A3A743C76;
	Tue, 10 Nov 2026 21:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944791F0089F;
	Tue, 10 Nov 2026 21:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347703;
	bh=Qo2+jRzUK6ef9hbeUahqrraMXl7IGJhVlYVAOScV8ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j22PvhyilTKnM5nyfrsCHKDdMDuDUmUojoPgdFVX3mAQZV2Hd/EwIcKqe9WVrqR2c
	 MSzVoBQwUnPD6JzsOc+1o53n5QYkcA+nlbqm6dxtbnSJyl1ZOQIiHKoQnYZzRHBowa
	 e4X8dMoJr9bDyOXLzZ3FjgJiGislRrlSph8RedwX838BPRAKN2NO3x0D/Z2w9j2CW/
	 KQxt4VdILN3yV+fYs4w6/qhzADCZGiYz2e1iQFRwWJMpZ2iPogLQ1Bb6gF7gFEd0oy
	 GDOo3T8sD7nRxhmfhzFYGhDL0p+Q5hwG10KJ/zATsmnIkscFJ7zS+hlynFopD1R2yP
	 G8nJmfQnsF5QA==
Date: Tue, 10 Nov 2026 22:54:57 +0100
From: Christian Brauner <brauner@kernel.org>
To: Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org, 
	Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, ntfs@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 23/34] btrfs: check BTRFS_FS_STATE_RO instead of
 SB_RDONLY at runtime
Message-ID: <20261110-kursniveau-zeltlager-quintessenz-36b26debabe3@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-23-2f44f64f0b66@kernel.org>
 <c88e4e9c-6b86-4fbb-94bf-909522badf83@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c88e4e9c-6b86-4fbb-94bf-909522badf83@suse.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 01:26:22PM +1030, Qu Wenruo wrote:
> I love the idea. This reminds me exactly why for btrfs_force_shutdown(),
> we have to manually set the fs error without marking the fs RO, to avoid
> exactly the same problem.
>
> With that said, can you also a set_bit() call in btrfs_force_shutdown()
> to also set that flag instead of the exsting setting fs_info->fs_error?

I think so. I'd set BTRFS_FS_STATE_RO in addition to fs_error though.
start_transaction(), join_transaction() and btrfs_remount_rw() key off
BTRFS_FS_ERROR().

Note that this changes some error codes after a shutdown.
btrfs_permission() returns EROFS for MAY_WRITE once btrfs_fs_rdonly() is
true so opening a file for writing fails with EROFS instead of the EIO
from btrfs_file_open().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
