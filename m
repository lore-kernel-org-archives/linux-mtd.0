Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B1CCA0EE4
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Aug 2025 16:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QaZOTPB7iYNYza5WTi1ex9aNIqc0ZVOBpZ0/5R1m/T4=; b=thHTS7V6ZF8di4
	Y/SsMq10ACx6Kay7nF1UkuEkVb7BcwkKR5MOyUFkMGU36Pk7ncZ+zKiaX3KCGK/mM1UYu7sJs9PG5
	WxfKTOLel0Kd8xu8PVHTqLgfrIALYoOUl4J035cKh5F5toibAimq9AL3hOJKDjxxAWYO/wowLVvfP
	pYLgV4irymc2jMOUe8G59EgZwX88d15OMQ5ahbK2rxHCwDrc0tsl1718vDioFVG535h/AHvELUVHb
	sjjc4DuwHJT8+LBodrlxwA5YsjeH/CRHJBa2iDNl36N4BQnH2UI4oJvtS6e5hZ9c2Ci/KHpK35MK9
	QKE64rKXXf+at3zAxwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx47-00000002wUL-099o;
	Fri, 15 Aug 2025 16:14:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvPr-00000002iSN-07rC
	for linux-mtd@lists.infradead.org;
	Fri, 15 Aug 2025 14:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A4084527F;
	Fri, 15 Aug 2025 14:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BE4C4CEF5;
	Fri, 15 Aug 2025 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755268102;
	bh=NjlA2V0nQx0tBL4rAiZ29YI48biAV1hmLhasXfWKjKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vi/jyHyCpW3IS1hb6zQ4jJ+oAYD0DXsY2Im5ys51K44DIEZQHnGkTVraWsoFcqbwC
	 JxJq03+C9R3fjpoMc9nQd4QG10bfgmJDeOjpatQAYOyzqylhQ1n0AYRglhszfcGetS
	 FjhIcW7orUVId79eVQDk4m6yVnMF8nfROWLKKC2DlG1gQDlsTg5ndmXNr61rMo4qLc
	 FwgVzCRxDCjKmjVaJfryczmqUHzyfxIQC23QMXOHkNvThADLMLAyeNAgSC/7uGhDd7
	 iOBJ7p+fW43/8ExrYdQawHBPv3mNoLE+f/MSAzjfGGQ+rUABw1kKle6THgz2+iucuP
	 LOrp6gISP0oAQ==
Date: Fri, 15 Aug 2025 16:28:17 +0200
From: Christian Brauner <brauner@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH v5 00/13] Move fscrypt and fsverity info out of struct
 inode
Message-ID: <20250815-pension-geleugnet-0b0502f0555c@brauner>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <20250810-tortur-gerammt-8d9ffd00da19@brauner>
 <20250810090302.GA1274@sol>
 <20250811-distribuieren-nilpferd-bef047fa7992@brauner>
 <20250811-unbedacht-vollmond-1a805b76212b@brauner>
 <20250811163907.GA1268@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811163907.GA1268@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_072823_111719_00B862D4 
X-CRM114-Status: GOOD (  50.91  )
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

On Mon, Aug 11, 2025 at 09:39:07AM -0700, Eric Biggers wrote:
> On Mon, Aug 11, 2025 at 03:34:35PM +0200, Christian Brauner wrote:
> > On Mon, Aug 11, 2025 at 03:17:01PM +0200, Christian Brauner wrote:
> > > On Sun, Aug 10, 2025 at 02:03:02AM -0700, Eric Biggers wrote:
> > > > On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner wrote:
> > > > > On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> > > > > > This is a cleaned-up implementation of moving the i_crypt_info and
> > > > > > i_verity_info pointers out of 'struct inode' and into the fs-specific
> > > > > > part of the inode, as proposed previously by Christian at
> > > > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > > > 
> > > > > > The high-level concept is still the same: fs/crypto/ and fs/verity/
> > > > > > locate the pointer by adding an offset to the address of struct inode.
> > > > > > The offset is retrieved from fscrypt_operations or fsverity_operations.
> > > > > > 
> > > > > > I've cleaned up a lot of the details, including:
> > > > > > - Grouped changes into patches differently
> > > > > > - Rewrote commit messages and comments to be clearer
> > > > > > - Adjusted code formatting to be consistent with existing code
> > > > > > - Removed unneeded #ifdefs
> > > > > > - Improved choice and location of VFS_WARN_ON_ONCE() statements
> > > > > > - Added missing kerneldoc for ubifs_inode::i_crypt_info
> > > > > > - Moved field initialization to init_once functions when they exist
> > > > > > - Improved ceph offset calculation and removed unneeded static_asserts
> > > > > > - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> > > > > > - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
> > > > > >   no longer think it's actually correct there.
> > > > > > - verity_data_blocks() now keeps doing a raw dereference
> > > > > > - Dropped fscrypt_set_inode_info() 
> > > > > > - Renamed some functions
> > > > > > - Do offset calculation using int, so we don't rely on unsigned overflow
> > > > > > - And more.
> > > > > > 
> > > > > > For v4 and earlier, see
> > > > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > > > 
> > > > > > I'd like to take this series through the fscrypt tree for 6.18.
> > > > > > (fsverity normally has a separate tree, but by choosing just one tree
> > > > > > for this, we'll avoid conflicts in some places.)
> > > > > 
> > > > > Woh woh. First, I had a cleaned up version ready for v6.18 so if you
> > > > > plan on taking over someone's series and resend then maybe ask the
> > > > > author first whether that's ok or not. I haven't seen you do that. You
> > > > > just caused duplicated work for no reason.
> > > > 
> > > > Ah, sorry about that.  When I started looking at it again yesterday
> > > > there turned out to be way too many cleanups and fixes I wanted to make
> > > > (beyond the comments I gave earlier), and I hadn't seen activity from
> > > > you on it in a while.  So I figured it would be easier to just send a
> > > > series myself.  But I should have asked you first, sorry.
> > > 
> > > So I started working on this pretty much right away. And I had planned
> > > on sending it out rather soon but then thought to better wait for -rc1
> > > to be released because I saw you had a bunch of crypto changes in for
> > > -rc1 that would've caused merge conflicts. It's no big deal overall but
> > > I just don't like that I wasted massaging all that stuff. So next time a
> > > heads-up would be nice. Thank you!
> > 
> > I just pulled the series and now I see that you also changed the
> > authorship of every single patch in the series from me to you and put my
> > Co-developed-by in there.
> > 
> > I mean I acknowledge that there's changes between the branches and
> > there's some function renaming but it's not to the point where
> > authorship should be changed. And if you think that's necessary than it
> > would be something you would want to talk to me about first.
> > 
> > I don't care about the stats but it was always hugely frustrating to me
> > when I started kernel development when senior kernel developers waltzed
> > in and thought they'd just take things over so I try very hard to not do
> > that unless this is agreed upon first.
> 
> If you want to keep the authorship that's fine with me.  Make sure
> you've checked the diff: the diff between v4 and v5 is larger than the
> diff between the base and either version.  And as I mentioned, I rewrote
> the commit messages and divided some of the changes into commits
> differently as well.  If the situation was flipped, I wouldn't want to
> be kept as the author.  But I realize there are different opinions about
> this sort of thing, and I'm totally fine with whatever you prefer.

It's not that I oppose it per se it's just that it would be nice to have
gotten a heads-up about both the rewrite and the authorship change.
(Sorry, still on vacation and so answers are delayed.)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
