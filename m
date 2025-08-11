Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B40EC88CB9
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWERhkNNFAQrHiACrGQ7h7h3SOQYGegDcKWgdUa6MTk=; b=YJRXE3XOJkX1mR
	X57brpN5umQwL2VwHfqHbx5CWbZovZvOkJEqPzXUlV+FS8b8LpxI4sX1It91gkO6KZnWXH31dEtIo
	nDgGHMyh36OE3vScv/Yf6YE6s5vHDVP6df13HjC7AB5U0vkkxmt9e03FGuANm0PmnIIvPIIepq8mR
	zG0ZqBWHyRsof9X9l4nNt/fXhzyQoWNfIbPCFntaesa6moJkwEzSg2+onzO9syJdl8e+7RlBvAdIp
	OOutBvie3yiirghhabJwJSEaXS/dNFKcDVhyV8fj5UfRavOE3qrTkgcxyIoparmNBbk6UyZgZt3ly
	pKOb4c/Wem1/Pp/YWpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSS8-00000007nYb-3WXP;
	Mon, 11 Aug 2025 13:20:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSOh-00000007n6v-2M5V
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 13:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0721601F7;
	Mon, 11 Aug 2025 13:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C58FC4CEF4;
	Mon, 11 Aug 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754918226;
	bh=9H/x5XG1IcYYuNxoZ/FRiA+0c4IRqwYORLUEqhmTUO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCD79R8WxTBcVrqg9rMg+tofGwTK8plCUX7hNKwEW3euMu+ELqZMDzG3+NaHbwoym
	 Z69gkLPwTFj/nx6Bg1B+irqlcABZjhpqoq3jVFiKTJDeZyxYw5CnVFo3Q+bloZ86fg
	 2m7vRUyEdvxYTnp4GkbhiIKHV/bfrHqC23dXRI85VIsNFxmxcLBjVAxLQmgF30a916
	 xH/7d0xrt5yCWPjsIm3OC3Vy5w0lb1AV3fMcYGzfzRi4FUKJKTzdL5BmdhSAyC1qsd
	 WvUrI1WnXciEAjbrhDJcFTMO79IkymShrf+HBHbQRv+JPtbb2CJrsIaGlHXIvqUdR+
	 G4L8HPawNFllQ==
Date: Mon, 11 Aug 2025 15:17:01 +0200
From: Christian Brauner <brauner@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH v5 00/13] Move fscrypt and fsverity info out of struct
 inode
Message-ID: <20250811-distribuieren-nilpferd-bef047fa7992@brauner>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <20250810-tortur-gerammt-8d9ffd00da19@brauner>
 <20250810090302.GA1274@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810090302.GA1274@sol>
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

On Sun, Aug 10, 2025 at 02:03:02AM -0700, Eric Biggers wrote:
> On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner wrote:
> > On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> > > This is a cleaned-up implementation of moving the i_crypt_info and
> > > i_verity_info pointers out of 'struct inode' and into the fs-specific
> > > part of the inode, as proposed previously by Christian at
> > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > 
> > > The high-level concept is still the same: fs/crypto/ and fs/verity/
> > > locate the pointer by adding an offset to the address of struct inode.
> > > The offset is retrieved from fscrypt_operations or fsverity_operations.
> > > 
> > > I've cleaned up a lot of the details, including:
> > > - Grouped changes into patches differently
> > > - Rewrote commit messages and comments to be clearer
> > > - Adjusted code formatting to be consistent with existing code
> > > - Removed unneeded #ifdefs
> > > - Improved choice and location of VFS_WARN_ON_ONCE() statements
> > > - Added missing kerneldoc for ubifs_inode::i_crypt_info
> > > - Moved field initialization to init_once functions when they exist
> > > - Improved ceph offset calculation and removed unneeded static_asserts
> > > - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> > > - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
> > >   no longer think it's actually correct there.
> > > - verity_data_blocks() now keeps doing a raw dereference
> > > - Dropped fscrypt_set_inode_info() 
> > > - Renamed some functions
> > > - Do offset calculation using int, so we don't rely on unsigned overflow
> > > - And more.
> > > 
> > > For v4 and earlier, see
> > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > 
> > > I'd like to take this series through the fscrypt tree for 6.18.
> > > (fsverity normally has a separate tree, but by choosing just one tree
> > > for this, we'll avoid conflicts in some places.)
> > 
> > Woh woh. First, I had a cleaned up version ready for v6.18 so if you
> > plan on taking over someone's series and resend then maybe ask the
> > author first whether that's ok or not. I haven't seen you do that. You
> > just caused duplicated work for no reason.
> 
> Ah, sorry about that.  When I started looking at it again yesterday
> there turned out to be way too many cleanups and fixes I wanted to make
> (beyond the comments I gave earlier), and I hadn't seen activity from
> you on it in a while.  So I figured it would be easier to just send a
> series myself.  But I should have asked you first, sorry.

So I started working on this pretty much right away. And I had planned
on sending it out rather soon but then thought to better wait for -rc1
to be released because I saw you had a bunch of crypto changes in for
-rc1 that would've caused merge conflicts. It's no big deal overall but
I just don't like that I wasted massaging all that stuff. So next time a
heads-up would be nice. Thank you!

> 
> > And second general infrastructure changes that touch multiple fses and
> > generic fs infrastructure I very much want to go through VFS trees.
> > We'll simply use a shared tree.
> 
> So you'd like to discontinue the fscrypt and fsverity trees?  That's
> what they are for: general infrastructure shared by multiple
> filesystems.  Or is this comment just for this series in particular,
> presumably because it touches 'struct inode'?

My comment just applies this series. I'm not here to take away your
trees ofc unless you would like to have them go through the VFS batch.
That's something that some people like Amir have started doing.

I'll put the series into vfs-6.17.inode and push it out then you can
base any additional changes on top of that. I'll not touch it unless you
tell me to. Linus knows that VFS trees often have work that is used as
the base for other trees so he will merge VFS trees before any of the
smaller trees and I always mention this to him.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
