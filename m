Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WD08r-0001wx-C3
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 23:19:58 +0000
Date: Mon, 10 Feb 2014 20:19:32 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210231931.GA29523@localhost>
References: <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost> <20140210084616.GP22376@1wt.eu>
 <20140210142026.GB15607@localhost>
 <1392043814.32363.49.camel@sauron.fi.intel.com>
 <20140210184858.GA6484@localhost> <20140210233754.71e3e199@skate>
 <de976336-3144-4f21-859b-d1a37fc3d811@email.android.com>
 <20140210234600.3a03b346@skate>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140210234600.3a03b346@skate>
Cc: Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 10, 2014 at 11:46:00PM +0100, Thomas Petazzoni wrote:
> On Mon, 10 Feb 2014 23:41:54 +0100, Piergiorgio Beruto wrote:
> 
> > sorry for interrupting

Please, don't apoplogize. As a user of this you have all the right
-maybe the obligation- to interrupt :-)

> The point about the caching feature was not really the increased code
> size, but rather the memory consumption caused by the cache itself.
> This can be solved using a runtime configurable module parameter.
> 

Yes, Artem is suggestion that direction too. The write support can be
added with an already existent block device ioctl (blockdev --setrw).

As for the cache, well... we could have a module parameter. The problem
I see in that, is that the block interface is *not* a module (as I recently
pointed out). Instead, it's integrated into the UBI core.

Therefore, it would be an UBI module parameter, such as "ubi.block_cache
= yes/no". I really don't like this.

Oh, and *please* don't ask about the non-module choice. Having the block
interface as an extension of the UBI core, the userspace interface
results very intuitive.

We have a new UBI module parameter:

  $ modprobe ubi mtd=/dev/mtd5 block=/dev/ubi0_0

And a simple tool, which re-uses the already existent UBI ioctl:

  $ ubiblkvol --attach /dev/ubi0_0
  $ ubiblkvol --detach /dev/ubi0_0

The modularized approach meant a very complex userspace interface. It
seemed to require *another* control char device:

  https://lkml.org/lkml/2011/8/15/145

*** ***

On the other side, I don't really agree with all this fuzz around the
two compile options. The code is *really* dead simple, as I went to
great extents to keep it simple.

Sadly, we are not reaching any agreement. So unless anybody has a better
idea, I'd go for a solution that suits the squashfs user: no cache,
no write support.

Artem? What do you say?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
