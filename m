Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZgVi-0001ZS-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 21:53:18 +0100
Received: from lava.lineo.com ([207.179.37.1])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZgVe-0001ZM-00
	for mtd@infradead.org; Mon, 27 Mar 2000 21:53:15 +0100
Received: from lineo.com (ranier.lineo.com [207.179.37.103])
	by lava.lineo.com (8.9.1a/8.9.1) with ESMTP id NAA29582
	for <mtd@infradead.org>; Mon, 27 Mar 2000 13:53:09 -0700
Message-ID: <38DFCA35.4F7977ED@lineo.com>
Date: Mon, 27 Mar 2000 13:53:09 -0700
From: John Drabik <jdrabik@lineo.com>
MIME-Version: 1.0
CC: MTD <mtd@infradead.org>
Subject: Re: Resume from Flash
References: <Pine.NEB.4.20.0003271523350.22165-100000@pulse.flatline.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Andreas Kotes wrote:

> I'd like to do resume-from-flash with Linux and DoC 2000, this appears to
> be the fastest possibility to get an embedded system up and running ..
>
> Has anyone done this yet? Any suggestions? Any hints/pointers?

Haven't done it, but I've been looking into it.  There are several issues
and options (at least).

First, you have to decide if you want true resume-from-flash (i.e., the full
state of the system is kept during powerdown).  This is tough, and you'll
need some kind of sleep utility that knows how to save process information,
stack information, etc.  This is easy on the desktop, but a lot more
involved for embedded devices (which is where you'll find Flash - who the
heck is going to pay $75 for a 16 MB Flash disk when they can get a 4 GB HDD
for the same price?)

Alternatively, you could design your system to use fully static design, so
that the clock speed can just be dropped to 0 Hz.  You still have to supply
some power though, and this may not be possible in every situation.  Also,
static RAM and other system components are larger and more expensive than
DRAM.  You need special startup code (not much), and a processor that works
in this way.  Quite a few of the microcontrollers might be candidates, such
as the DragonBall.  But then, you don't get an MMU, and in some cases, you
might not even get the current kernel version (because some of the MMU-less
processor work is lagging).  But this approach is faster than an all-Flash
approach as far as startup, and probably meets your definition of
"resume-in-place".

In either case, you'll need a larger Flash device, because you'll have to
keep the decompressed image in Flash.  Drawbacks?  Larger, more expensive
Flash devices needed, and they're not price-competitive.  You can figure on
about a 100-to-1 premium for the use of DOC devices.

Alternatively, you could decompress from Flash, infrequently, into Static
RAM, and restart only if the Static RAM backup fails.  Issues in this case
include a more complex startup procedure, larger and more expensive Static
RAM array, higher costs, and greater power dissipation.  It isn't clear
whether you'd also need a large Flash device.  My feeling is that copy a
large image from Flash to Static RAM would probably be slower than
decompressing the kernel from the same Flash device to Static RAM, at least,
it is with a "reasonably fast" processor.

Another (easier) choice is to keep the decompressed image in Flash, and
build a new initrd at each boot.  The image doesn't have to decompress, but
you still have to create RAM disk, etc.  This is easier than a purely static
design, or an all-Flash design, in my opinion.  I'm currently thinking of
this as the middle-of-the-road approach.  Reasonably easy, relatively
simple, not too expensive, not too much power dissipation, etc.  It requires
a special loader, but that's about it.  It probably doesn't meet your
criteria for "resume in place" operation though, because the recreation of
initrd means that you are losing state information between reboots or
shutdowns.

Finally, there's the typical approach used today: boot from the Flash device
with a compressed kernel.  Then decompress the image, create the RAM disk,
and go - but then, you don't have that quick startup anymore.

Given the cost of chips such as the 16 MB DOC 2000 (approximately $75 each
in small quantities, at least here in the US), and the cost of a fully
static design (lots more $$$, probably 5- or 10-to-one), it doesn't appear
to make much of a difference; if you want quicker startup, use
execute-in-place, with a decompressed kernel in Flash.

I'm not sure if that answers your questions, but let me know if you'd like
to discuss the matter more.  My guess is that we should take the discussion
off-line, however.

John Drabik




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
