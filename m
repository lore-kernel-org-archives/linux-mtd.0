Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA505606C989
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZQgkuCt5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JAtowwJ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rRNOcn0wNBsH/a9/crS3WsEHOzn6aB/CYG5um6hsBDY=; b=ZQgkuCt5LwUxnrdTYEu6zruAmp
	hf/M9+kYG438/oPLU9Yk9E2BJjwV4xgGWe3r9SN4Kfkcc7AYkqUKYvUe9EpBegsIewe6nOwzVoIbs
	3iqHOiJVAxJn3Xv6acS6vy1rylhHBMd5J82847CtoUHUlC1Wf4RewOZw1BaS60RoyOwogu4/THpML
	aG5joX46QBeXdHUkKlvck+NgH2FARfX4EpRcQx/om/R5q7qJl/mexIZQVjQ7u15VUyaAwkXtMj5Y1
	2OP/+MC4UAl3MAFg9l9YpawtKfKm7fKxpk9vQ9dZgWDfo4XIUeN1NxPpx4lc7xDrHx5hOtGk1NLZL
	XpVUro+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQts2-000000056vP-3wve;
	Tue, 10 Nov 2026 21:59:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQts1-000000056vI-3Ua6
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 21:59:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 489CB60546;
	Tue, 10 Nov 2026 21:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D211F0089F;
	Tue, 10 Nov 2026 21:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347953;
	bh=ZJO94l84QK4bprsIuDcbPoluEQrXPtjS00pqy7xCAGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JAtowwJ2pPdCxaTBZjmKWNh5PkcnHC1a6JqF1BhyWgLEOzat739v+ux/OaqQKC+zo
	 AJRUFFRLkFiCTJvFNJCxS5fuoKKN/yiKzz5944+hRGW1Pk36p4YwmEI4B4ymNtaS/s
	 0LG9OFyRJ+uw3MFuCJ7mc5ieslXrWLACXId7HRo+lURTCYdpyQMb9AADbXSWAfDBpM
	 SKZvctyT4GvwnyYePshqwabyG10N3/JG245TfZxFrDfXyI4Y3nncp9K4Lquhu65ZhH
	 75DW9LUy9jNh6MqNcF4VarBImxcsrFW34Gyf42+1X63g6x7zu2D3TkBye2OXHVrX3u
	 H1oHCd7yuYlag==
Date: Tue, 10 Nov 2026 22:59:08 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Karl Mehltretter <kmehltretter@gmail.com>, dsterba@suse.cz, 
	tytso@mit.edu, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH v2 05/34] jfs: don't set SB_RDONLY after filesystem errors
Message-ID: <20261110-tasten-willst-denken-3168bf999f0d@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-5-2f44f64f0b66@kernel.org>
 <sashiko-outbox-191224@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-191224@kernel.org>
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

On Fri, Oct 30, 2026 at 04:09:51PM +0000, sashiko-bot@kernel.org wrote:
> With COMMIT_Dirty never set on ip (and jfs_freeze() skipping txQuiesce() once
> sb_emergency_ro() is set), could evicting the inode trigger
> BUG_ON(!list_empty(&ji->anon_inode_list)) in jfs_evict_inode()?

No for extAlloc(). dquot_free_block() in its failure path marks the
inode dirty and jfs_dirty_inode() sets COMMIT_Dirty because atlhead is
set by then. extRecord() doesn't mark the inode dirty on failure without
this patch either and it only runs for XAD_NOTRECORDED extents which
Linux never creates.

> sb_rdonly(sb) is still false, so won't jfs_extendfs() proceed on a filesystem
> that just entered emergency read-only mode during sync_filesystem(sb)?

Right, I'll check sb_emergency_ro() there too.

> What happens if userspace requests a read-write remount (for example, mount -o
> remount,rw) after a runtime filesystem error without having remounted
> read-only first?

It succeeds and the filesystem stays read-only. That's how ext4 behaves.

> won't updateSuper() take the JFS_NOINTEGRITY branch instead of returning early
> at sbi->state == FM_DIRTY, and overwrite the on-disk FM_DIRTY error state with
> FM_CLEAN?

Pre-existing.

> Wouldn't jfs_evict_inode() hit BUG_ON(!list_empty(&ji->anon_inode_list))
> because nothing commits the inode after jfs_reconfigure() sets SB_RDONLY?

No.

> If the filesystem was mounted with JFS_NOINTEGRITY and an error occurs while it
> is frozen, does calling updateSuper(sb, FM_MOUNT) in jfs_unfreeze() clobber the
> FM_DIRTY state?

Yes, I'll make jfs_unfreeze() record FM_DIRTY again in that state.

-- 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
