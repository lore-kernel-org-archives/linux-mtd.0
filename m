Received: from web10507.mail.yahoo.com ([216.136.130.157])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rRy3-0006IB-67
	for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2003 01:45:51 +0100
Message-ID: <20030826004527.54509.qmail@web10507.mail.yahoo.com>
Date: Mon, 25 Aug 2003 17:45:26 -0700 (PDT)
From: Jared Hulbert <jaredeh@yahoo.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1061619037.27605.20.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: hardware cached reads
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> We've discussed it briefly before, haven't we? Used
> cached mapping only
> for data reads, flush it from the chip driver
> (probably with a new
> map_info method for flushing the cache) upon write
> or erase.

Yep.  We've been practicing with the general technique
a little bit more lately.  I'm comfortable with what
needs to be done, but I'm a little fuzzy on where to
do it.

It seems to me I need to get map_copy_from() to use
the  cached mapping.  So I see map_copy_from() is
really a map_info.copy_from.  I can't seem to find
where this map_info.copy_from is ever redefined.  Do I
need do this?  To do this for the Lubbock is the
proper place to do a map_info.copy_from =
something_copy_from() in the lubbock_flash.c or the
cfi_cmdset001.c or elsewhere?  I guess I'm unsure as
to whether we should put the changes mostly in the map
file or the chip driver?
Am I missing something basic here?
 
> Do remember that i386en get very unhappy if you ever
> map the same region
> with both a cached and uncached mapping.

As the mappings happen in what are pretty much
platform specific maps/*.c files this shouldn't be a
problem, should it?  But I suppose some comments
repeating this warning are warranted in the map.h.
 
> We may also want to investigate putting
> burst-capable chips (and
> chipsets) into burst mode for ourselves.

Hmm.  I would imagine the bootloader and the power
management modules would actully be doing the sync off
and sync on. Perhaps the mtd is an excellent place to
provide the power management code the sync status and
an API to manipulate the timings.  Actually, as I
think it through, that seems like a really good idea
combined with the XIP patches you recently worked on
as the process of switching the flash and processor
between mode must not be interrupted.

I think I like this idea.

,J


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com
