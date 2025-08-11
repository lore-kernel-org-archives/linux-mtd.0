Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82784CA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 19:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJjpNTKHZteiid1At3czQ0+OrLM7ihDzMJQ+8AdAmTI=; b=qhvHgHT4FNRWym
	fZTG5TcicE7VC0l1sJ4xDT7YWeWwnbNSvL0Rm6KwqLChVmvWKzykVMNktETg9MsUvC4UhxpB9LojV
	ULx3koZSeqUWOcazvGY2LKe6f/jabXMe/Mey7C2pdWAHfucpwrgobataBaw1Ot2W1ACeVJy5od7sg
	DlO8g1WvT9ZtJgybE4rLOiWzD3IpDaSSQ/4ReOywTOVFJJg6KiP5V2mfqw+aaXBekIop2+eXTmahT
	CRk8yWRkFVnhKbNJDY1P9jS6zSu4VavbFrnKEycuRoDG8WlsJz/BTs4tR+ACJYIoHGgcCe5Zh9u53
	hq1mLLtUfZZ4jU2OfbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulY2o-00000008ug8-3R4f;
	Mon, 11 Aug 2025 19:18:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVZD-00000008RSZ-0XgF
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 16:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E89D43DC5;
	Mon, 11 Aug 2025 16:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B361C4CEED;
	Mon, 11 Aug 2025 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754930409;
	bh=yfY9fEwE5prSXu7c0Ar8fQ1UlOn+Yver65cw9lpRakc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGsk5/BBpOcOyGSEi4YMVtKP9l1LnkIw0E8k1OWWmvEzjR8tWPYLRCdVWgDivYzB0
	 QBjs/iXUHLQNSFF4scAcafi5A8kFz1Z8tWfjAEZfNb9NTb5L3WGctIErpbHiBvkSjS
	 jAGC82roagiAIKtNyS3bUDO/rDabILKuUtEMC3vtmh4MpO1+42hJvpurkyNYZzA8f6
	 uJ8+z6YbJb9LNnmANY2gQPZvA+X+dfQdOzHLdtSWb7wVG3CjCC6waAV6DvQSRz5Mm4
	 JlzXaWwIgprKlf+tsPTkwngce/DAsh+8U1uF1N3mPSSegfPMWUPEc15lr9rK5LUNSN
	 vJdnzKs0VS1gA==
Date: Mon, 11 Aug 2025 09:39:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH v5 00/13] Move fscrypt and fsverity info out of struct
 inode
Message-ID: <20250811163907.GA1268@sol>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <20250810-tortur-gerammt-8d9ffd00da19@brauner>
 <20250810090302.GA1274@sol>
 <20250811-distribuieren-nilpferd-bef047fa7992@brauner>
 <20250811-unbedacht-vollmond-1a805b76212b@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-unbedacht-vollmond-1a805b76212b@brauner>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_094011_215234_E351D97A 
X-CRM114-Status: GOOD (  45.03  )
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

On Mon, Aug 11, 2025 at 03:34:35PM +0200, Christian Brauner wrote:
> On Mon, Aug 11, 2025 at 03:17:01PM +0200, Christian Brauner wrote:
> > On Sun, Aug 10, 2025 at 02:03:02AM -0700, Eric Biggers wrote:
> > > On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner wrote:
> > > > On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> > > > > This is a cleaned-up implementation of moving the i_crypt_info and
> > > > > i_verity_info pointers out of 'struct inode' and into the fs-specific
> > > > > part of the inode, as proposed previously by Christian at
> > > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > > 
> > > > > The high-level concept is still the same: fs/crypto/ and fs/verity/
> > > > > locate the pointer by adding an offset to the address of struct inode.
> > > > > The offset is retrieved from fscrypt_operations or fsverity_operations.
> > > > > 
> > > > > I've cleaned up a lot of the details, including:
> > > > > - Grouped changes into patches differently
> > > > > - Rewrote commit messages and comments to be clearer
> > > > > - Adjusted code formatting to be consistent with existing code
> > > > > - Removed unneeded #ifdefs
> > > > > - Improved choice and location of VFS_WARN_ON_ONCE() statements
> > > > > - Added missing kerneldoc for ubifs_inode::i_crypt_info
> > > > > - Moved field initialization to init_once functions when they exist
> > > > > - Improved ceph offset calculation and removed unneeded static_asserts
> > > > > - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> > > > > - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
> > > > >   no longer think it's actually correct there.
> > > > > - verity_data_blocks() now keeps doing a raw dereference
> > > > > - Dropped fscrypt_set_inode_info() 
> > > > > - Renamed some functions
> > > > > - Do offset calculation using int, so we don't rely on unsigned overflow
> > > > > - And more.
> > > > > 
> > > > > For v4 and earlier, see
> > > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > > 
> > > > > I'd like to take this series through the fscrypt tree for 6.18.
> > > > > (fsverity normally has a separate tree, but by choosing just one tree
> > > > > for this, we'll avoid conflicts in some places.)
> > > > 
> > > > Woh woh. First, I had a cleaned up version ready for v6.18 so if you
> > > > plan on taking over someone's series and resend then maybe ask the
> > > > author first whether that's ok or not. I haven't seen you do that. You
> > > > just caused duplicated work for no reason.
> > > 
> > > Ah, sorry about that.  When I started looking at it again yesterday
> > > there turned out to be way too many cleanups and fixes I wanted to make
> > > (beyond the comments I gave earlier), and I hadn't seen activity from
> > > you on it in a while.  So I figured it would be easier to just send a
> > > series myself.  But I should have asked you first, sorry.
> > 
> > So I started working on this pretty much right away. And I had planned
> > on sending it out rather soon but then thought to better wait for -rc1
> > to be released because I saw you had a bunch of crypto changes in for
> > -rc1 that would've caused merge conflicts. It's no big deal overall but
> > I just don't like that I wasted massaging all that stuff. So next time a
> > heads-up would be nice. Thank you!
> 
> I just pulled the series and now I see that you also changed the
> authorship of every single patch in the series from me to you and put my
> Co-developed-by in there.
> 
> I mean I acknowledge that there's changes between the branches and
> there's some function renaming but it's not to the point where
> authorship should be changed. And if you think that's necessary than it
> would be something you would want to talk to me about first.
> 
> I don't care about the stats but it was always hugely frustrating to me
> when I started kernel development when senior kernel developers waltzed
> in and thought they'd just take things over so I try very hard to not do
> that unless this is agreed upon first.

If you want to keep the authorship that's fine with me.  Make sure
you've checked the diff: the diff between v4 and v5 is larger than the
diff between the base and either version.  And as I mentioned, I rewrote
the commit messages and divided some of the changes into commits
differently as well.  If the situation was flipped, I wouldn't want to
be kept as the author.  But I realize there are different opinions about
this sort of thing, and I'm totally fine with whatever you prefer.

Thanks,

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
