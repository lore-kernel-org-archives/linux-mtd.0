Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AD660A2605
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 13:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VCTvdSp3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MmvF84R0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JAIJI9/3+3RTg/P2E5Veev7gxvQpwcw1+8vop6PavR4=; b=VCTvdSp3JE2rSyHgM1NT/vdU+H
	KWFsTAe66RSKMPSc7bqJDebPnI2flxtk+IPuH6fAfTNn5LAFu8Yf5np8SqmfzAHVdDEu4SjmOKm8S
	01euvqLsUJmSwJjlOzkJ6b8odSAvDBM8lU19DOgOHAAuuUoxz/lUcDAPjDB1LMKv8UpklK+zHRiok
	A6G9+Lhu6FyWlocDDLp2fLvJWpheRVA/hS0NI6IHDw11QSNvGyOIBQUp0JUyLhO1fQqnhkJkVXJCd
	/nseofbXKJhtGJKFVxsYkIFVW4OvfnbCuYTxklAWG1/taHsYwDvp2rS4GHXw7zm88MKGAXJzTEt5v
	4jID1BJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUji-0000000A0MI-00TH;
	Thu, 12 Nov 2026 13:21:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUjh-0000000A0M1-1DDG
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 13:21:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8F5742DD6;
	Thu, 12 Nov 2026 13:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D581F00A05;
	Thu, 12 Nov 2026 13:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794489664;
	bh=2TVb8qDZ4KT/CTu1G3B1wlWvG0RXp8XP3qjnuNYzjOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MmvF84R0gtLndw24gzSFT3ub5yJmtlvjtQewwlBkOj3aPXQTksQ4drEzrc46OvL/z
	 wo9GRa3UsS1F1xzmaEOQVjwk+tWBf2XT/7mCHBb8HSswe2CPaa8KtfXoHjL9Y0GbyO
	 1efF5XqnKzznSG9DEGEO7OMYE2iaaSETCJ8OFamxUwQlBUJWVpDt1tjvUs4hkM1QL2
	 IWFg+ih4NX2foIqjeWjsniqTNNlHAD8H5+koYNsWz+ArokDl49tjta/Dn88XnGLkGJ
	 3S6OKico8mJafJNwprIMppBt+ZwOOYREUSFE9sMr0CwvZQk9NrRSiDsIISSMrUCwF/
	 4a2UthzwC3fuQ==
Date: Thu, 12 Nov 2026 14:20:58 +0100
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
Message-ID: <20261112-besorgen-nobel-handschuhe-fb3373259b5f@brauner>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-4-2f44f64f0b66@kernel.org>
 <5qefa4mracb3x2z4vsdejmkyyfrhdcrixmmnooz4rzwcdfoejm@mqkvixj6afwp>
 <20261110-kargheit-impfen-pausieren-881763d28b19@brauner>
 <za33axmgzmuzsj3zmfeh43fkphtcsqtkhhrauwuvs7aiftelgp@dzl6z322st5f>
 <20261112-wohncontainer-saurier-wonnen-91f30c3b3ae2@brauner>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261112-wohncontainer-saurier-wonnen-91f30c3b3ae2@brauner>
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

On Thu, Nov 12, 2026 at 01:01:34PM +0100, Christian Brauner wrote:
> Fwiw, this leaks the inode's anonymous tlocks. They're from TxLock which
> is shared by all jfs mounts. txLock() also sets mp->lid and pinned the
> metapages with metapage_nohomeok().
>
> So the helper would have to tear all of that down like txAbort() does
> and drop the pins. Doable, I guess not sure if this belongs into the
> series.

So ok, I tried to do this in a vm. With jfs.nTxLock=256 three rounds of
error + umount leaked 163 tlocks and the next writer on a fresh jfs hung
in txBeginAnon().

I think txAbort() might be the wrong model. It only drops the pin when
mp->lsn is set and doesn't free linelocks. So this would need a helper
modelled on txUnlock().

Fwiw, the BUG_ON() also triggers without this series. The error sets
SB_RDONLY, sync_filesystem() bails at umount and nothing commits the
anonymous tlocks. This series fixes that as a side effect because
sync_filesystem() keeps running.

> All the check
> does is make syncfs() return without writing anything and make unmount
> drop whatever the flusher hasn't gotten to yet. Which might be the goal
> you're after?

I tried that too on fat and ext2. With the check and an umount right
after the error new files are gone on both. If the flusher ran first
nothing is lost. That's exactly what happens without this series. If
writeback is allowed to finish nothing is lost either way.

Skipping these superblocks in the flusher is no better. ext4
effectively does that in its emergency state (ext4_writepages() bails)
and the stuck dirty pages throttle everyone else from testing. with 1.4G
stuck on ext4 a dd to ext2 on another disk crawled at ~1MB/s until ext4
was unmounted (cf. [1]).

[1]: https://lore.kernel.org/r/ZEnb7KuOWmu5P+V9@ovpn-8-24.pek2.redhat.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
