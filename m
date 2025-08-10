Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9F0C87FCA
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o055YsYzzSpZthEPpUpMtyAxNqXSjg0wOBHwvqYM/YE=; b=EuNXWw5Snype7z
	iPzAZWSukxdgrdQ8UdpPUjAUwrJIzvEGF0kqv/Pd2qmnb6tw8gWoDU8J+5LHtJad3PX9XcelGJXHz
	fvV9K1zlOkmU0LpHb2o64VgFuMu7VH9HvkMitJ1n94nsYijIfDloTW2954dMSUO3hd0MIQNFzfuuz
	lplHjg5tv1NKOJD0ZThbI52DBHeUmDE4ojn8S4m087WvFv1wo/grqO/RRRphBecsU6R771YRrqDWY
	sbWq8mT99/E3jmyxdEDIqYxiNSda+MOJJVEEcEdh+l0bL6hQUKFNkgQ4z1fqktWiffaqaFzuTXDkU
	cW/oc4TBV86rP/7F7LYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul1yI-00000005Twe-1bFt;
	Sun, 10 Aug 2025 09:04:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul1yG-00000005TwJ-0oGb
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 09:04:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E166457A1;
	Sun, 10 Aug 2025 09:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1526CC4CEEB;
	Sun, 10 Aug 2025 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754816643;
	bh=1uk+L/4UCvC2YL4rDydg69JfuP7irpTtoBtvSgNeL/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjfGKeZQqiIXfnvbaJEgwYP+/u4ykE3RMP5XuJzst3yu07DMinG6FVd0er4RWR7oT
	 8rY+yL96FW8wFvnuHh6n/P2s+zyfPAo9USy6Gr5e8LHi9ieo1muby/ThPMT0jC2MJ6
	 +BlYRh3l88+NlLoHLFQJG3gzW5nF6vc4t6gkOhKIHNw3TiipDPKog5V9JjwNkUWtz3
	 zCiZEvSodHKopxJzcGudkBciWnHKKucIFIE0/37Uv9R1AJd8/jKkBRWXDhzx62YRFE
	 ckhJ7XvPfWXPJA+9rnHx/WIF2A1CRYUoHGhVluTekBsgPvo1ZHEvNC53HIiH5g5ol/
	 j4fq4OzXJw1Ng==
Date: Sun, 10 Aug 2025 02:03:02 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH v5 00/13] Move fscrypt and fsverity info out of struct
 inode
Message-ID: <20250810090302.GA1274@sol>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <20250810-tortur-gerammt-8d9ffd00da19@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810-tortur-gerammt-8d9ffd00da19@brauner>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_020404_269628_6EABB0E7 
X-CRM114-Status: GOOD (  27.67  )
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

On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner wrote:
> On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> > This is a cleaned-up implementation of moving the i_crypt_info and
> > i_verity_info pointers out of 'struct inode' and into the fs-specific
> > part of the inode, as proposed previously by Christian at
> > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > 
> > The high-level concept is still the same: fs/crypto/ and fs/verity/
> > locate the pointer by adding an offset to the address of struct inode.
> > The offset is retrieved from fscrypt_operations or fsverity_operations.
> > 
> > I've cleaned up a lot of the details, including:
> > - Grouped changes into patches differently
> > - Rewrote commit messages and comments to be clearer
> > - Adjusted code formatting to be consistent with existing code
> > - Removed unneeded #ifdefs
> > - Improved choice and location of VFS_WARN_ON_ONCE() statements
> > - Added missing kerneldoc for ubifs_inode::i_crypt_info
> > - Moved field initialization to init_once functions when they exist
> > - Improved ceph offset calculation and removed unneeded static_asserts
> > - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> > - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
> >   no longer think it's actually correct there.
> > - verity_data_blocks() now keeps doing a raw dereference
> > - Dropped fscrypt_set_inode_info() 
> > - Renamed some functions
> > - Do offset calculation using int, so we don't rely on unsigned overflow
> > - And more.
> > 
> > For v4 and earlier, see
> > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > 
> > I'd like to take this series through the fscrypt tree for 6.18.
> > (fsverity normally has a separate tree, but by choosing just one tree
> > for this, we'll avoid conflicts in some places.)
> 
> Woh woh. First, I had a cleaned up version ready for v6.18 so if you
> plan on taking over someone's series and resend then maybe ask the
> author first whether that's ok or not. I haven't seen you do that. You
> just caused duplicated work for no reason.

Ah, sorry about that.  When I started looking at it again yesterday
there turned out to be way too many cleanups and fixes I wanted to make
(beyond the comments I gave earlier), and I hadn't seen activity from
you on it in a while.  So I figured it would be easier to just send a
series myself.  But I should have asked you first, sorry.

> And second general infrastructure changes that touch multiple fses and
> generic fs infrastructure I very much want to go through VFS trees.
> We'll simply use a shared tree.

So you'd like to discontinue the fscrypt and fsverity trees?  That's
what they are for: general infrastructure shared by multiple
filesystems.  Or is this comment just for this series in particular,
presumably because it touches 'struct inode'?

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
