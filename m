Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jykdd-0001T4-HT
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 09:29:38 +0000
Date: Wed, 21 May 2008 11:29:25 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080521092925.GA20358@logfs.org>
References: <411628.55054.qm@web36703.mail.mud.yahoo.com>
	<1211360767.21380.325.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1211360767.21380.325.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 May 2008 10:06:07 +0100, David Woodhouse wrote:
> 
>  - Support for devices larger than 4GiB.
>  - Clarifying whether buffers can be used for DMA
>  - Partitioning (which is a bit of a hack right now) & concatenation.

Been there, tried that.  You should still have my patches from 2001
somewhere in your attic. ;)

One of the problems with partitioning is device numbering.  I decided to
use 0 for the main device, 1..15 for the partitions, 16 for the next
main devices, etc.  I also removed the read-only devices, which is a
real no-no, as it breaks the current userland interface.

But even the raw partitioning is a suprise at the least.  Given two
devices with two partitions each, you would expect to see something
like:
ls /dev
...
mtda0
mtda1
mtda2
mtdb0
mtdb1
mtdb2

But what you'll get is:
mtd0
mtd0ro
mtd1
mtd1ro
mtd2
mtd2ro
mtd16
mtd16ro
mtd17
mtd17ro
mtd18
mtd18ro

So unless someone has a bright idea or we all decide that it's worth
breaking stuff to fix the current mess, partitioning will remain a mess.

>  - Removable devices
>  - Sysfs presence

I'm not entirely sure what this is good for.  But maybe I've just become
too disillusioned with sysfs altogether and wish we'd never digressed
from sysctl.  At least back that we had one crappy interface instead of
three or four.

> Here's one way I think we can get started on this...
> 
>  1. Turn all calls to functions like mtd->read(mtd...) into calls to 
>     core functions 'mtd_read()' which we can later play with.

You mean in fs/jffs2 and similar?  Not sure how useful that would be.
In the end we will need to deal with four combinations:
1. driver uses old interface, user uses old interface
2. driver uses new interface, user uses old interface
3. driver uses old interface, user uses new interface
4. driver uses new interface, user uses new interface

1 is what we have right now, 4 is where we want to be in the future.  In
the meantime we either have to deal with 2 and 3 or go through all
drivers/users and fix them up.  Wrapper are mainly useful to avoid doing
the fixup, which means we'll end up with something akin to arch/ppc/ -
old cruddy code staying in limbo for decades to come.

What I wanted to do is basically add the asynchronous interface, convert
roughtly one driver and one user (logfs and ramtd) to play around with
the interface and get some experience.  What that becomes useful we can
decide whether we need plumbing for 2 and 3 or just crawl through all
the dusty code and change it.

Jörn

-- 
It is the mark of an educated mind to be able to entertain a thought
without accepting it.
-- Aristotle
