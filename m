Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9A2E6B25B
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Dec 2025 23:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZyOKG+WWTqnNqDsn0hQKabbrFIh9Z/Ijuc4bshrQzY=; b=0CYpgwhWZffKTb
	HqVujGKi2T5/2mmXJTAEeTy/3fne+0T2sx+AiiPbbQPSj0FLvPrSqYjP2g1PsabkPLBHiSNKyvyH2
	52pwkVPE9MxmjLc4xoNp+NAvl36Q2WJAE6bItVbBM43XqXm2r4ZAnmcPQsMmhPL0699SFwKD70M0I
	W7Tmw2tJeUcwBMOPq7Pqls7cQx8+rw9sOdLjpxO+4I+iK1sftynJclB9Zfxiort4XBSawKxlfY4Cc
	BO8J4ZS68tkpXz1gP8ociSdPlVwPUvReRJHjKZNPgKUHiRZ809yfWqcYHS5+UwUnqemQxI0rq+bMY
	/TYSOiECtDjsebgEl2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXpXe-0000000EH3S-12wO;
	Mon, 22 Dec 2025 23:42:18 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXpXb-0000000EH2T-2a4W
	for linux-mtd@lists.infradead.org;
	Mon, 22 Dec 2025 23:42:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id E236368B05; Tue, 23 Dec 2025 00:41:56 +0100 (CET)
Date: Tue, 23 Dec 2025 00:41:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: [PATCH 08/10] fs: add support for non-blocking timestamp
 updates
Message-ID: <20251222234156.GA19230@lst.de>
References: <20251217061015.923954-1-hch@lst.de> <20251217061015.923954-9-hch@lst.de> <2hnq54zc4x2fpxkpuprnrutrwfp3yi5ojntu3e3xfcpeh6ztei@2fwwsemx4y5z> <20251218061900.GB2775@lst.de> <wynhubqgvknr3fl4umfst62xyacck3avmg6qnbp2na6w7ee3qf@odetcif4kozl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wynhubqgvknr3fl4umfst62xyacck3avmg6qnbp2na6w7ee3qf@odetcif4kozl>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_154215_803788_D46BBEE1 
X-CRM114-Status: GOOD (  18.36  )
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

On Fri, Dec 19, 2025 at 04:12:01PM +0100, Jan Kara wrote:
> Ah, I see now. Thanks for explanation. This interplay between filesystem's
> .update_time() helper and inode_update_timestamps() is rather subtle.
> Cannot we move the SB_LAZYTIME checking from .update_time() to
> inode_update_timestamps() to have it all in one function? The hunk you're
> adding to xfs_vn_update_time() later in the series looks like what the
> other filesystems using it will want as well?

XFS is a bit special as it requires the ilock for timestamp updates
(I'm actually not sure how they are properly serialized for others,
but let's open that can of worms after this one is dealt with..).

But I came up with a way to make this a bit more obvious, which is
by moving the flags selection from mark_inode_dirty_time into
inode_update_timestamps.

> BTW, I've noticed that ovl_update_time() and fat_update_time() should be
> safe wrt NOWAIT IO so perhaps you don't have to disable it in your patch
> (or maybe reenable explicitly?).

fat is safe.  overlayfs is not, touch_atime might sleep in the lower fs.

> And I don't really now what orangefs_update_time() is trying to do with its
> __orangefs_setattr() call which just copies the zeroed-out timestamps from
> iattr into the inode? Mike?

I'll leave that to Mike.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
