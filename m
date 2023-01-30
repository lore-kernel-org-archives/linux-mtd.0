Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0221EC54EED
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDnRbBsmSmPlYbaRcqHRQXfHlvo4QCMW8QFHjCjs8W8=; b=w8eDFkMKf52ZYC
	UiKW7+yEi3vyCUm82a1tmmbfhnVrMq9oVo5GaCWf/sKkk/nc2znkFZ5QkTFimDAOBbgjTtULg3Dse
	rD0pClaMfgMJ6NWOi/SsRypMM678JinYTHHbhOtPCj1Ir1BXo87yuxRBwcpp0AFbr9eHlZc+JL+GF
	le4Eim2+mR+w9YcEJ49QdSGGp8/biphCVaSohvWHsv1Fl6XrH/3FCdg64xMAaP+7csC6BlRhXg3Xy
	e4gFqgeurprGY3MuxRsRkgZSJmbS3mufDwT5+gDg0yR97HKvfFdUH4LU3Rye/YTpPQgGP+NzerYX3
	nQththDG5ph/ClfTDQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRK1-003761-AF; Mon, 30 Jan 2023 10:23:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRJy-00375i-Hd
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2023 10:23:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB75C60EE8;
	Mon, 30 Jan 2023 10:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848BCC433EF;
	Mon, 30 Jan 2023 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675074209;
	bh=JNTyAwdnYzLmCEymJc/ZUWnk+Q8qvEe4IQT1QMUZUUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JN3lXwEWVDPGXUGplDwCOYjrW8++AmiuyWsKytBrUAmwH5pYzbdpE0vlm5QMheggM
	 NBh8TxCmRl0oiVPGeH0p588WtzUGa4Dhxdj47urWqRw5C3YGCL7sEtEpljLyqeU2qK
	 hZMY3SfpZs4a7G1hzx2PjWG4oBFdjJLdjf/CAOLVLdkBRxoWDtbAN1LxJYt5Pv5/uW
	 JiIhf6J6BcQzCzFwiWHxFBJvn0+sgbTbzFveW5be89tbifEA4YoFlo/yhqSIZATMj0
	 cya32Nkc883EMLF+aa2JEWlyaIljfcXui3HQsRaEUKig3vqEj5vhHo9pWtvCv6EINs
	 lzNgfo6NIXgGw==
Date: Mon, 30 Jan 2023 11:23:22 +0100
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
	Seth Forshee <sforshee@kernel.org>, linux-erofs@lists.ozlabs.org,
	Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH 00/12] acl: remove remaining posix acl handlers
Message-ID: <20230130102322.kkq5u72skrmykilh@wittgenstein>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org>
 <20230130091052.72zglqecqvom7hin@wittgenstein>
 <20230130091615.GB5178@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130091615.GB5178@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_022330_659406_E4D8AEE1 
X-CRM114-Status: GOOD (  21.42  )
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

On Mon, Jan 30, 2023 at 10:16:15AM +0100, Christoph Hellwig wrote:
> On Mon, Jan 30, 2023 at 10:10:52AM +0100, Christian Brauner wrote:
> > However, a few filesystems still rely on the ->list() method of the
> > generix POSIX ACL xattr handlers in their ->listxattr() inode operation.
> > This is a very limited set of filesystems. For most of them there is no
> > dependence on the generic POSIX ACL xattr handler in any way.
> > 
> > In addition, during inode initalization in inode_init_always() the
> > registered xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
> > inode->i_opflags.
> > 
> > With the incoming removal of the legacy POSIX ACL handlers it is at
> > least possible for a filesystem to only implement POSIX ACLs but no
> > other xattrs. If that were to happen we would miss to raise IOP_XATTR
> > because sb->s_xattr would be NULL. While there currently is no such
> > filesystem we should still make sure that this just works should it ever
> > happen in the future.
> 
> Now the real questions is: do we care?  Once Posix ACLs use an
> entirely separate path, nothing should rely on IOP_XATTR for them.
> So instead I think we're better off auditing all users of IOP_XATTR
> and making sure that nothing relies on them for ACLs, as we've very
> much split the VFS concept of ACLs from that from xattrs otherwise.

I had a patch like that but some filesystems create inodes that
explicitly remove IOP_XATTR to prevent any xattrs from being set on
specific inodes. I remember this for at least reiserfs and btrfs.

So we would probably need IOP_NOACL that can be raised by a filesystem
to explicitly opt out of them for specific inodes. That's probably fine
and avoids having to introduce something like SB_I_XATTR.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
