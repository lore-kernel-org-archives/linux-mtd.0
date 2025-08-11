Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAA0C87FDB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKDbRkdOW5g3cip5lfGKQE1txUA57OQXLCTlUaIInKU=; b=qfVL7K/MAy+zpR
	DAmNljwdoSTnI1x/Qct4vRoqhsD4Il6zOKP0wQJ2BUBaEKC2vdhJbq9ArEFYViuJ/fwrbZG+f94GX
	R3lMeGpM+GAiSrI3jww0AQO+p+62/CMQt4KSEtKSEPqtZZAV/zMUCF1FekbJ9hy8Ik32HLlUixa5i
	E3ryR3MUcg/nJAQ/e9O4kf3PCKcN984sm1GbvsRoy5ASS0V2OziAMlyVDvhFNXzXEZ65puKgRRNzP
	ZlWIYDkgJzFI3ADUQNMTPlShhevPQc1PzBncc1ljozgR0++MWU6pldP6BrvMwmNVM6RFGG1mgeyB/
	Ippfl3NiKEOGhmxrjOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSgw-00000007qLn-3kIp;
	Mon, 11 Aug 2025 13:35:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSfh-00000007q3z-2sD2
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 13:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A685BA4ED70;
	Mon, 11 Aug 2025 13:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB39C4CEED;
	Mon, 11 Aug 2025 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754919280;
	bh=Ba4T8JRIhY1ucolU1ke77/oTfZPh0CpkbfaJTVmXDGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLF36AqIkTxYij3rbRxLgiTKeAc20fE19pNkSF+6AsTmK4O7x7hqc6h9W1w8JaKxB
	 F6Yd6j+Zuz3C0Z725mv1ub40YX4pJKu9nCeUFh2JxNvosAsHrd4mTQ2qzKY1GIBjIw
	 utXSwPyDvH5GbbB4gOpKORIsVNVeawQrxrddtJU038mcQ5W0vgkBBoWX+bWpmCh+K1
	 wrIWKmD6rZBzQrW6phPG619xf0GlruQdThXJEfKIWfoZkrpK2I9COSa5cZMyFHZNg/
	 LG8LJcdQ3DDiYJIXqSDznqH/6+C6ULpc7F7fNadE2owbTdrJ+LR0jcwygpsMArWBYA
	 ZgrzYeoo58MPw==
Date: Mon, 11 Aug 2025 15:34:35 +0200
From: Christian Brauner <brauner@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH v5 00/13] Move fscrypt and fsverity info out of struct
 inode
Message-ID: <20250811-unbedacht-vollmond-1a805b76212b@brauner>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <20250810-tortur-gerammt-8d9ffd00da19@brauner>
 <20250810090302.GA1274@sol>
 <20250811-distribuieren-nilpferd-bef047fa7992@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-distribuieren-nilpferd-bef047fa7992@brauner>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_063441_854115_6378A924 
X-CRM114-Status: GOOD (  46.45  )
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

On Mon, Aug 11, 2025 at 03:17:01PM +0200, Christian Brauner wrote:
> On Sun, Aug 10, 2025 at 02:03:02AM -0700, Eric Biggers wrote:
> > On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner wrote:
> > > On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> > > > This is a cleaned-up implementation of moving the i_crypt_info and
> > > > i_verity_info pointers out of 'struct inode' and into the fs-specific
> > > > part of the inode, as proposed previously by Christian at
> > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > 
> > > > The high-level concept is still the same: fs/crypto/ and fs/verity/
> > > > locate the pointer by adding an offset to the address of struct inode.
> > > > The offset is retrieved from fscrypt_operations or fsverity_operations.
> > > > 
> > > > I've cleaned up a lot of the details, including:
> > > > - Grouped changes into patches differently
> > > > - Rewrote commit messages and comments to be clearer
> > > > - Adjusted code formatting to be consistent with existing code
> > > > - Removed unneeded #ifdefs
> > > > - Improved choice and location of VFS_WARN_ON_ONCE() statements
> > > > - Added missing kerneldoc for ubifs_inode::i_crypt_info
> > > > - Moved field initialization to init_once functions when they exist
> > > > - Improved ceph offset calculation and removed unneeded static_asserts
> > > > - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> > > > - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
> > > >   no longer think it's actually correct there.
> > > > - verity_data_blocks() now keeps doing a raw dereference
> > > > - Dropped fscrypt_set_inode_info() 
> > > > - Renamed some functions
> > > > - Do offset calculation using int, so we don't rely on unsigned overflow
> > > > - And more.
> > > > 
> > > > For v4 and earlier, see
> > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > 
> > > > I'd like to take this series through the fscrypt tree for 6.18.
> > > > (fsverity normally has a separate tree, but by choosing just one tree
> > > > for this, we'll avoid conflicts in some places.)
> > > 
> > > Woh woh. First, I had a cleaned up version ready for v6.18 so if you
> > > plan on taking over someone's series and resend then maybe ask the
> > > author first whether that's ok or not. I haven't seen you do that. You
> > > just caused duplicated work for no reason.
> > 
> > Ah, sorry about that.  When I started looking at it again yesterday
> > there turned out to be way too many cleanups and fixes I wanted to make
> > (beyond the comments I gave earlier), and I hadn't seen activity from
> > you on it in a while.  So I figured it would be easier to just send a
> > series myself.  But I should have asked you first, sorry.
> 
> So I started working on this pretty much right away. And I had planned
> on sending it out rather soon but then thought to better wait for -rc1
> to be released because I saw you had a bunch of crypto changes in for
> -rc1 that would've caused merge conflicts. It's no big deal overall but
> I just don't like that I wasted massaging all that stuff. So next time a
> heads-up would be nice. Thank you!

I just pulled the series and now I see that you also changed the
authorship of every single patch in the series from me to you and put my
Co-developed-by in there.

I mean I acknowledge that there's changes between the branches and
there's some function renaming but it's not to the point where
authorship should be changed. And if you think that's necessary than it
would be something you would want to talk to me about first.

I don't care about the stats but it was always hugely frustrating to me
when I started kernel development when senior kernel developers waltzed
in and thought they'd just take things over so I try very hard to not do
that unless this is agreed upon first.

> > > And second general infrastructure changes that touch multiple fses and
> > > generic fs infrastructure I very much want to go through VFS trees.
> > > We'll simply use a shared tree.
> > 
> > So you'd like to discontinue the fscrypt and fsverity trees?  That's
> > what they are for: general infrastructure shared by multiple
> > filesystems.  Or is this comment just for this series in particular,
> > presumably because it touches 'struct inode'?
> 
> My comment just applies this series. I'm not here to take away your
> trees ofc unless you would like to have them go through the VFS batch.
> That's something that some people like Amir have started doing.
> 
> I'll put the series into vfs-6.17.inode and push it out then you can
> base any additional changes on top of that. I'll not touch it unless you
> tell me to. Linus knows that VFS trees often have work that is used as
> the base for other trees so he will merge VFS trees before any of the
> smaller trees and I always mention this to him.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
