Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBC3C54EED
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 18:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BS9sgtzdtCooiepbl3+QT3/OcJOo734LHL7dlXjSiNY=; b=COm/UFVXpPT5u2
	dTgKF6aBnJ3m1AdWumTq86rhPtQpDt7HCAO2DTu8Tx05tEf71F9mUHGNPjAaFF+Cg7M+dUmYiEo0L
	rsEeSwc+qiPMFL0OokI8yf4Q3zCqVC4RxsFJZIhGb6xMcMEcMH2CFos1SOAZ944xAb0zTFv1Kr0KS
	FRgdPiwqeQAVYqW/MumqUrQ9GDz7K/oNhjscpYuQCTJFxTwIPp6vRcQDYnbw8i2dJ3GXrn1zuRZCv
	O9LbmOJwwIkHQdJIVt62+jXmhOGOe/xuLWK/ahBbE46p34gwrdbodpvubhaYxebn26wI9zzufbtyE
	1L1iFKvmrcqMYzJCCLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYeq-004t71-1p; Mon, 30 Jan 2023 18:13:32 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYcj-004rt0-SO
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2023 18:11:24 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 524FF68BEB; Mon, 30 Jan 2023 10:16:15 +0100 (CET)
Date: Mon, 30 Jan 2023 10:16:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Seth Forshee <sforshee@kernel.org>, linux-erofs@lists.ozlabs.org,
	Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH 00/12] acl: remove remaining posix acl handlers
Message-ID: <20230130091615.GB5178@lst.de>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org> <20230130091052.72zglqecqvom7hin@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130091052.72zglqecqvom7hin@wittgenstein>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_101122_116870_F6DE3AF1 
X-CRM114-Status: GOOD (  15.45  )
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

On Mon, Jan 30, 2023 at 10:10:52AM +0100, Christian Brauner wrote:
> However, a few filesystems still rely on the ->list() method of the
> generix POSIX ACL xattr handlers in their ->listxattr() inode operation.
> This is a very limited set of filesystems. For most of them there is no
> dependence on the generic POSIX ACL xattr handler in any way.
> 
> In addition, during inode initalization in inode_init_always() the
> registered xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
> inode->i_opflags.
> 
> With the incoming removal of the legacy POSIX ACL handlers it is at
> least possible for a filesystem to only implement POSIX ACLs but no
> other xattrs. If that were to happen we would miss to raise IOP_XATTR
> because sb->s_xattr would be NULL. While there currently is no such
> filesystem we should still make sure that this just works should it ever
> happen in the future.

Now the real questions is: do we care?  Once Posix ACLs use an
entirely separate path, nothing should rely on IOP_XATTR for them.
So instead I think we're better off auditing all users of IOP_XATTR
and making sure that nothing relies on them for ACLs, as we've very
much split the VFS concept of ACLs from that from xattrs otherwise.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
