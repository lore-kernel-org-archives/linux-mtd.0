Received: from avasout06.plus.net ([212.159.14.18])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cP8sf-0007u2-Ok
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2017 14:19:03 +0000
Date: Thu, 5 Jan 2017 14:18:34 +0000
From: Mike Crowe <mac@mcrowe.com>
To: goliath <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 0/2] Support skipping bad blocks when seeking to start
 address
Message-ID: <20170105141834.GA3198@mcrowe.com>
References: <1483539486-16165-1-git-send-email-mac@mcrowe.com>
 <82d2fa84-c1ec-8791-9b50-c57314ad7a5e@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82d2fa84-c1ec-8791-9b50-c57314ad7a5e@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 05 January 2017 at 14:38:23 +0100, goliath wrote:
> Some concerns have been raised regarding how your specific boot
> loader clutch works and whether we should really add tool support
> for it.
> 
> If your boot loader seeks to a specific erase block by counting
> only good blocks (to load the kernel or some second stage?), what
> happens if another block in between goes bad? Does that just brick
> your board or do you have to move the data around all the time to
> account for that?

The blocks in-between don't get written so they can't be marked bad. If
they develop bit errors that can't be corrected then the board will stop
booting because the bootloader can't be loaded.

> What kind of boot loader is this? Is it widely used or is that
> algorithm used by a number of other boot loaders? In that case
> it would make sense to add support for this. However, if it is
> just a one-time fix for a vendor specific boot loader, it might
> not be reasonable to merge it into upstream mtd-utils. Or is
> there some other use case for this?

The bootloader is provided by our SoC vendor and only used with their
family of chips. It has various parts that are loaded independently and we
need to upgrade some of them. In an ideal world these would be in separate
partitions and we wouldn't have this problem, but we need to maintain
backward compatibility.

I've used other bootloaders in the past that also have two stages, and the
second stage is merely appended at the next good block.

mtd-utils already supports reading and writing flash whilst skipping
blocks. Adding the ability to start reading or writing at an offset that
takes into account previous bad blocks seems to be a generically-useful
feature to me.

However, if this is considered to be too niche a use case then we can just
continue to apply the patch ourselves.

Thanks for the review.

Mike.
