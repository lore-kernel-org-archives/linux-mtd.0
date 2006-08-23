Received: from nz-out-0102.google.com ([64.233.162.198])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GFoxV-0006aU-7o
	for linux-mtd@lists.infradead.org; Wed, 23 Aug 2006 10:23:40 +0100
Received: by nz-out-0102.google.com with SMTP id s1so38961nze
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Aug 2006 02:22:29 -0700 (PDT)
Message-ID: <6934efce0608230222o68716ad5t6cdd2c69a2aafb1e@mail.gmail.com>
Date: Wed, 23 Aug 2006 02:22:29 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] CORE: Allow kernel access to struct mtd_part and PART()
	for axfs
In-Reply-To: <1156061852.22871.239.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0608180223g4591c1beja5be00f57d5173f4@mail.gmail.com>
	<1156061852.22871.239.camel@pmac.infradead.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> If it's going to be public information I'd prefer to just add it to the
> struct mtd_info rather than exposing more private structures just
> because they happen to contain it at the moment.

You're right, but I don't like putting .phys into mtd_info as it's
already in map_info.  Seems like redundant duplication.  And besides
axfs is the only customer for this data.

How about we add a new function, something like unsigned long
partition_physaddr(mtd_info) in mtdpart.c to do the dirty work?

> But really, you need to be able to coordinate with the flash driver so
> that you can read from it _only_ when it's in read mode. This kind of
> thing is what point() is for. The whole point()/unpoint() thing is
> probably misdesigned, so feel free to make suggestions for changing it,
> if it doesn't do what you want.

As soon as I mount I point() the whole partition and unpoint() it at
unmount.  Works for me.  Maybe someday we will include this page by
page XIP into a writeable filesystem and then we'll take a more
serious look at point().  But I really don't see anything wrong with
point().

There is no read mode really.  I assume any userspace process will
have the raw flash mmap()ed directly into it's memory.  So I just keep
it point()ed.  If the flash needs to be written to then use
CONFIG_MTD_XIP or be clever with flash hardware partitions.

> How do you handle tearing down a mapping when the data moves from one
> place on the flash to another? Or does that not happen?

Doesn't happen, its a static read only filesystem.  Design is very
simple.  The mounting routines are I think twice the lines as the
actual meat of the filesystem.
