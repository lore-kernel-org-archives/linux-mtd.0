Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AqxAB-0001l0-W5
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2004 16:24:36 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Joshua Wise <joshua@joshuawise.com>
In-Reply-To: <200402110054.31831.joshua@joshuawise.com>
References: <200402110054.31831.joshua@joshuawise.com>
Content-Type: text/plain
Message-Id: <1076516571.19353.582.camel@tubarao>
Mime-Version: 1.0
Date: 11 Feb 2004 09:22:51 -0700
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0002.c: do_xxlock_oneblock: overflow subtract
	causing oopsen on iPAQ h1900
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm the one that added the do_xxlock_oneblock() function.

On Tue, 2004-02-10 at 22:54, Joshua Wise wrote:

> Note that ca871000 is the virtbase of the chip - doing an overflow subtract 
> obviously FUBARs things there by bringing it below the ioremapped base!
> 
> The offending line of code seems to be the following:
> adr = ((adr & ~0xffff) | 0x2) + ~0x3fffff;
> 
> This is approximately line 2119 in drivers/mtd/chips/cfi_cmdset_0002.c - give 
> or take a few lines because of my debugging statements added.
> 
> Can anybody shed a little bit of light on why we are doing a 4MiB overflow 
> subtract? Indeed the comment is annotated with a little "(danger)"... I 
> assume that we cannot always expect there to be lock block registers 
> ioremapped below on all platforms (this does not make sense on systems where 
> boot flash is at 0x0, so I know it's not just an oddity in what I'm doing :)

Yep, it's an incredibly ugly thing - I can see why it blows things out
of the water.  I knew it was a bad thing to do - hence the comments.  At
the time that it was added, there wasn't an unlock function and so
adding, even a broken one, was a starting place.

The strange unlock address that breaks things (4MiB below) is for an SST
49LF004B chip.  SST makes some strange stuff and I wish they'd make
things a bit more sane.  The SST 49LF040 has a bug in it - it is over
anxious to reset itself when it doesn't need to.  SST decided to replace
the 49LF040 with a 49LF004B - which by the way also replaced the 49LF004
as well.  The 49LF040 was an LPC part and the 49LF004 was a FWH part. 
The 49LF040B is supposed to be 100% compatible with both chips - but it
isn't!  Worse, SST didn't change the model ID so that the 49LF004B can
be detected and dealt with in it's wonderful brokenness.

In the end, please fix up the code so that it works for the general
case.  I'll look at things later and see what I can do to either black
list the SST parts or deal with them in a sane way that isn't dangerous
and ugly.

SST, PLEASE FIX YOUR CHIPS AND USE UNIQUE IDS FOR NEW PARTS!!!

Yes, I do mean to yell.

-- 
Thayne Harbaugh
Linux Networx
