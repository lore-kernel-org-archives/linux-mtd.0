Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92EA606A325
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 21:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=doDPZFQL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KO/XKzwP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dsQZG7lbhtLcyvdC518dE2M8odtZDOcFijzZBGnjxoY=; b=doDPZFQL3MTmijUt5lkUMl8AN1
	JQTiQZmTMsmm3beSlm6O8ZJQXSxcwDd86VfaJ1qovATZzGUi3yWk6UhGR3XIOSwWWMI+Nrgn0EaQI
	vyutWbbXwfMISZHTCJq59s7PJjf80wkLcNoiW8Q6Jm3yf8WElLwM5P7MGejK0TuUu0+EeQhnoCWsx
	rjPlZ4TbnnVhwIgIoOi/gSNaKmWuedjAay6qOeET5hDmHxt6oBn654rr+nbd4f6p5qer31ZUNnTZ1
	r9BGKMsZ3fMGRkdyJ74Modps55YqiuEaK5051Yk2EPsyGtwmqNvdABI5dcNteo6PqOtNEW9YMh1kJ
	PRKyEnIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtjy-000000055Q2-2FXb;
	Tue, 10 Nov 2026 21:50:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtjx-000000055Pg-2wdP
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 21:50:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CCC7405BD;
	Tue, 10 Nov 2026 21:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2361E1F008A1;
	Tue, 10 Nov 2026 21:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347452;
	bh=jBjh6Hk100+KrECKKCLZMsdZH69ww17QHoFNGmE10pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KO/XKzwPaQTyl6+FijRmvYt7OfljTwf6lBoi7zd24R3KDOXd9HAGCZNC7KAYdyUYj
	 hBJJdYiiuBfGwwWCOmpZV23Q4HudsU1yoE9Rhgry0hTKqHF+nkqklf5TUTaEFUD6GW
	 niIPAXt+6OcJkFypr0b38UaCjrqEIesfHfavg1Y9gYKtIjC8fTa6yKcpG+wwc6ZeTA
	 +T2K7aictElGKSFlX8kES5nifGp4/GVkQJk7tj2mA58Dkifk7h1fG13cfBeo6mHXLD
	 iFLabsTbOzjUzu/9Krncuv56JNmgiwYwErGw5k9p1piJLK7fKkwVgKxFsoVF59iQ+M
	 jJRcPY1T7tJnQ==
Date: Tue, 10 Nov 2026 22:50:47 +0100
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-mm@kvack.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: [PATCH v2 04/34] ext2: don't set SB_RDONLY after filesystem
 errors
Message-ID: <20261110-kargheit-impfen-pausieren-881763d28b19@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-4-2f44f64f0b66@kernel.org>
 <5qefa4mracb3x2z4vsdejmkyyfrhdcrixmmnooz4rzwcdfoejm@mqkvixj6afwp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5qefa4mracb3x2z4vsdejmkyyfrhdcrixmmnooz4rzwcdfoejm@mqkvixj6afwp>
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

On Thu, Nov 05, 2026 at 10:22:07AM +0100, Jan Kara wrote:
> So shouldn't we just modify the sb_rdonly() check in sync_filesystem() to
> use also sb_emergency_ro() and don't bother with modifying individual
> filesystems?

The VFS patch I posted in v1 thread did that. I dropped it because
of jfs. jfs keeps anonymous tlocks for every allocation that writeback
hasn't committed yet. If sync_filesystem() bails after the error nothing
commits them before evict_inodes() and jfs_evict_inode() hits the
BUG_ON() for a non-empty anon_inode_list on umount.

Which is what happened before the series because the error set
SB_RDONLY. jfs_reconfigure() relies on the same sync_filesystem() call
when going read-only after the error.

jfs could commit them itself before evict_inodes() but that means a
->kill_sb() wrapper and a txQuiesce()-like walk over the global
anon_list filtered by superblock. I don't think that's worth it.

> Also if we have the check in sync_filesystem(), then freeze_super() is
> generally going to fail so this check could trigger only if
> sb_emergency_ro() was set after sync_filesystem() ran and before we called
> ->freeze_fs(). Since sb_emergency_ro() checking is pretty much guaranteed
> to be racy (it is just a best effort framework to limit damage), we
> probably don't have to bother with checking in ->freeze_fs() handlers.

Ok, I'll drop it. ext2_freeze() then writes the superblock with
EXT2_ERROR_FS in it which is fine.

> Is this really needed? All the xattr operations go through mnt_want_write()
> / mnt_want_write_file() so this should be caught in VFS...

Not the ones ecryptfs does on the lower filesystem...
Hm, maybe we should make ecryptfs get write access to the lower mount
instead and drop the xattr checks from the filesystems. Not sure.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
