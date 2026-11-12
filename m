Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126BB606A327
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PDRBMRb7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QprEbjuf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cENP9VkFw7W2Vxz6+siJNVoj9+jqUVAyAtHQtTBIDkA=; b=PDRBMRb7b5+4zeox9XaT50iRAw
	Nzdmw+yGr43h9wgMzDMxs0TU0Tbw8YApDKeFZQ73M4m3nmrXxxsnKaBucNVtIUVfXd6sWp2Oi9ZtN
	UtPpzJwotpMvEEPVhiuftSqRKE0nQiOccNA1dxkK/xoTb80pOMj8mdxhtTjofFiOQ+b1xp1ZIStfB
	89nHq5iMAMNHK+zqwyCeDMN0ZL4oIQcep+az2wakRob1M0hHnyszI90z7DB5QusqaC7SGSJHNjsbe
	RaozCEBIOxAZSkJmMhKZPdUwvLFF+KXEt5PBGLdgMBWPOZ3xDh7vgVZO8p6HTslOaSapT9IqYWXWU
	dpKArr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTUt-00000009ny4-1uhQ;
	Thu, 12 Nov 2026 12:01:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTUr-00000009nxx-2qtD
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 12:01:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 00B2547325;
	Thu, 12 Nov 2026 12:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA7E1F00A06;
	Thu, 12 Nov 2026 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484900;
	bh=54I5bKtP4WSw79RGADSyevDuBquelpIbRaI3K1RVgo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QprEbjufNb+tvrOa7rBrGmxplqbmNy39Rmf2KUfr+AHg8IrdqKnppWAi/6c1jQ5lw
	 1qQwMsR8fpHwFmAmOjHt6xx/GSD6lfIfUEbOqwxFxYqpUqqxaGguK/FgeQ9b4yse7n
	 X5Gu+V8HvIKolxJnQl0GAY0dMopIoY1Zswfa1hVJnxH54H1V2CcTIR0C3XNIO1kYQQ
	 jb08MOlodWLAKvfmxQBVrfP5uY0qBjF050j5MxuY9KrdgN1iuTLU+0ziIbWc5XAA1N
	 31t4iwXyBD3El+zm85fqmePh/BsB9Y9+wkUwIt81ymt+t2A7BgUdE1+/gxOp3PTE+D
	 sGRcdsQZ5uAtA==
Date: Thu, 12 Nov 2026 13:01:34 +0100
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-mm@kvack.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	Karl Mehltretter <kmehltretter@gmail.com>, Dave Kleikamp <shaggy@kernel.org>
Subject: Re: [PATCH v2 04/34] ext2: don't set SB_RDONLY after filesystem
 errors
Message-ID: <20261112-wohncontainer-saurier-wonnen-91f30c3b3ae2@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-4-2f44f64f0b66@kernel.org>
 <5qefa4mracb3x2z4vsdejmkyyfrhdcrixmmnooz4rzwcdfoejm@mqkvixj6afwp>
 <20261110-kargheit-impfen-pausieren-881763d28b19@brauner>
 <za33axmgzmuzsj3zmfeh43fkphtcsqtkhhrauwuvs7aiftelgp@dzl6z322st5f>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <za33axmgzmuzsj3zmfeh43fkphtcsqtkhhrauwuvs7aiftelgp@dzl6z322st5f>
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

On Wed, Nov 11, 2026 at 03:15:11PM +0100, Jan Kara wrote:
> OK, so instead of BUGing in jfs_evict_inode(), shouldn't JFS just do
> something like:
>
> -	BUG_ON(!list_empty(&ji->anon_inode_list));
> +	if (!list_empty(&ji->anon_inode_list)) {
> +		WARN_ON_ONCE(!sb_emergency_ro(inode->i_sb));
> +		/* This needs helper in fs/jfs/jfs_txnmgr.c */
> +		TXN_LOCK();
> +		list_del_init(&ji->anon_inode_list);
> +		TXN_UNLOCK();
> +	}

Fwiw, this leaks the inode's anonymous tlocks. They're from TxLock which
is shared by all jfs mounts. txLock() also sets mp->lid and pinned the
metapages with metapage_nohomeok().

So the helper would have to tear all of that down like txAbort() does
and drop the pins. Doable, I guess not sure if this belongs into the
series.

> So that JFS doesn't block everybody else? Because conceptually, once sb is
> marked as emergency read-only, we really want to stop writeback so letting
> sync_inodes() run seems moot.

Meh, but a check in sync_filesystem() doesn't stop writeback? The
flusher doesn't know about the emergency state and keeps calling
->writepages() and ->write_inode().

And kill_block_super() calls sync_blockdev() after
generic_shutdown_super() so everything in the bdev mapping
(FAT, bitmaps, inode table blocks) gets writeback anyway. All the check
does is make syncfs() return without writing anything and make unmount
drop whatever the flusher hasn't gotten to yet. Which might be the goal
you're after?

> Argh, also NFS I assume. OK, that won't be easy to get rid of AFAICT (we
> generally don't have mount available there).

So nfsd_setxattr() takes write access to the export's mount via
fh_want_write(). So this would get EROFS from the VFS. Afaict it's
ecryptfs and IMA? ima_fix_xattr() only checks IS_RDONLY().

-- 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
