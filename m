Return-Path: <SRS0=o9e3=5L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D363C43331
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2020 17:04:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023B02074D
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2020 17:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ONUlm97d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 023B02074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWuzHTDSoH9MkAFcaiHC5eloNUg3FSBo9+DPH/z1Vdw=; b=ONUlm97ditHdGh
	Nav7Si6nbBmMSRhompaxY3+AcsZNOSMmFPO3D5V1MtpPqHUGTVPu6J7vHvL6bR4AZE/2Y/uaDyzNs
	ianej+BQUlGnWOPlbwblkE7QkiQOZqvjV4T/HZrANvAN5NNyCVl226yJxNLQtU/xrK75/QLiOILkq
	7gjAjcB6bK67q5UyFJYwcbBEBRi+RZd/muxlmmH49FFAyvPHkl5bLQDD3u2N0Rub8bofIzkY9w0Mt
	MSAuOey8SK6Eh98eIQ2wJ1OYnt+CP5jBrIJThu7Aj78pxy3/illqqh88nO3MgH/BGbhss4/92TGRU
	xF2TkeZflmTl3jwmMWGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHVv9-0007zU-DF; Thu, 26 Mar 2020 17:03:55 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHVv6-0006K4-31
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2020 17:03:53 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 45C90227A81; Thu, 26 Mar 2020 18:01:45 +0100 (CET)
Date: Thu, 26 Mar 2020 18:01:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>
Subject: Re: [PATCH 2/4] fs: avoid double-writing the inode on a lazytime
 expiration
Message-ID: <20200326170145.GA6387@lst.de>
References: <20200325122825.1086872-1-hch@lst.de>
 <20200325122825.1086872-3-hch@lst.de>
 <20200326032212.GN10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326032212.GN10776@dread.disaster.area>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_100352_276585_A6280F1F 
X-CRM114-Status: GOOD (  16.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Eric Biggers <ebiggers@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 26, 2020 at 02:22:12PM +1100, Dave Chinner wrote:
> On Wed, Mar 25, 2020 at 01:28:23PM +0100, Christoph Hellwig wrote:
> > In the case that an inode has dirty timestamp for longer than the
> > lazytime expiration timeout (or if all such inodes are being flushed
> > out due to a sync or syncfs system call), we need to inform the file
> > system that the inode is dirty so that the inode's timestamps can be
> > copied out to the on-disk data structures.  That's because if the file
> > system supports lazytime, it will have ignored the dirty_inode(inode,
> > I_DIRTY_TIME) notification when the timestamp was modified in memory.q
> > Previously, this was accomplished by calling mark_inode_dirty_sync(),
> > but that has the unfortunate side effect of also putting the inode the
> > writeback list, and that's not necessary in this case, since we will
> > immediately call write_inode() afterwards.  Replace the call to
> > mark_inode_dirty_sync() with a new lazytime_expired method to clearly
> > separate out this case.
> 
> 
> hmmm. Doesn't this cause issues with both iput() and
> vfs_fsync_range() because they call mark_inode_dirty_sync() on
> I_DIRTY_TIME inodes to move them onto the writeback list so they are
> appropriately expired when the inode is written back.

True, we'd need to call ->lazytime_expired in the fsync path as well.
While looking into this I've also noticed that lazytime is "enabled"
unconditionally without a file system opt-in.  That means for file systems
that don't rely on ->dirty_inode it kinda "just works" except that both
Teds original fix and this one break that in one way or another.  This
series just cleanly disables it, but Ted's two patches would fail to
pass I_DIRTY_SYNC to ->write_inode.

This whole area is such a mess..

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
