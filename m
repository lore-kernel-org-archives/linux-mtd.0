Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cP9LS-00073E-N7
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2017 14:48:48 +0000
Date: Thu, 5 Jan 2017 15:48:24 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: goliath <david.oberhollenzer@sigma-star.at>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/2] Support skipping bad blocks when seeking to start
 address
Message-ID: <20170105154824.5c9e97ee@bbrezillon>
In-Reply-To: <20170105141834.GA3198@mcrowe.com>
References: <1483539486-16165-1-git-send-email-mac@mcrowe.com>
 <82d2fa84-c1ec-8791-9b50-c57314ad7a5e@sigma-star.at>
 <20170105141834.GA3198@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

On Thu, 5 Jan 2017 14:18:34 +0000
Mike Crowe <mac@mcrowe.com> wrote:

> On Thursday 05 January 2017 at 14:38:23 +0100, goliath wrote:
> > Some concerns have been raised regarding how your specific boot
> > loader clutch works and whether we should really add tool support
> > for it.
> > 
> > If your boot loader seeks to a specific erase block by counting
> > only good blocks (to load the kernel or some second stage?), what
> > happens if another block in between goes bad? Does that just brick
> > your board or do you have to move the data around all the time to
> > account for that?  
> 
> The blocks in-between don't get written so they can't be marked bad.

Maybe not the block in between, but the first block used to store your
2nd stage bootloader (or whatever your store at this offset) might
become bad, which means your data will be moved to the next block (or
possibly farther).

> If
> they develop bit errors that can't be corrected then the board will stop
> booting because the bootloader can't be loaded.

Okay.

> 
> > What kind of boot loader is this? Is it widely used or is that
> > algorithm used by a number of other boot loaders? In that case
> > it would make sense to add support for this. However, if it is
> > just a one-time fix for a vendor specific boot loader, it might
> > not be reasonable to merge it into upstream mtd-utils. Or is
> > there some other use case for this?  
> 
> The bootloader is provided by our SoC vendor and only used with their
> family of chips. It has various parts that are loaded independently and we
> need to upgrade some of them. In an ideal world these would be in separate
> partitions and we wouldn't have this problem, but we need to maintain
> backward compatibility.
> 
> I've used other bootloaders in the past that also have two stages, and the
> second stage is merely appended at the next good block.

So the 1st stage bootloader is trying to load data from the next good
block. I guess the 1st stage bootloader is also programmed using this
approach (skip bad blocks if any), which would explain why you need
this 'adjust offset after skipping bad blocks' feature.

> 
> mtd-utils already supports reading and writing flash whilst skipping
> blocks. Adding the ability to start reading or writing at an offset that
> takes into account previous bad blocks seems to be a generically-useful
> feature to me.
> 
> However, if this is considered to be too niche a use case then we can just
> continue to apply the patch ourselves.

I don't think that's the idea here. We just wanted to be sure what was
the exact use case you had.
I think this request is acceptable (even if I don't like the option
name :-)), but I'll let Richard and David decide what to do with this
patch.

Thanks for the explanation.

Boris
