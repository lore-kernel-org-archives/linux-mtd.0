Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7HqZ-0004aS-W6
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 17:43:52 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HV800C6IX92Z8@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 18:43:51 +0100 (MET)
Date: Sat, 27 Mar 2004 18:40:28 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <1080404311.17352.69.camel@imladris.demon.co.uk>
To: David Woodhouse <dwmw2@infradead.org>, David Updegraff <dave@cray.com>
Message-id: <200403271840.28091.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <406328A2.3060905@cray.com> <4065A81B.6020607@cray.com>
 <1080404311.17352.69.camel@imladris.demon.co.uk>
cc: linux-mtd@lists.infradead.org
Subject: Re: nand oob layout assumptions
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 27 March 2004 17:18, David Woodhouse wrote:
> On Sat, 2004-03-27 at 10:13 -0600, David Updegraff wrote:
> > In all this discussion, the need for anyone outside the driver to know
> > hardware positions of ECC and badblock markers still elludes me.  Yes,
> > various FS need to scribble oob info of their own in a particular
> > format, and in a way that won't scribble over ecc/badblock, but is there
> > anything more than that?
>
> Nope. The file system just need to be told which are bad blocks, where
> the ECC data are, and which bytes are still available. In fact, it
> possibly doesn't even need to know where the ECC data are in the general
> case.
>
> > So, again, what if the 'oobsize' and 'oob_buf' (or a renamed relative
> > thereof) were interpreted to mean "region available in OOB for misc.
> > file system housekeeping, that will not stomp on private ECC or badblock
> > areas and will not be interpreted by nand driver".  And let the driver
> > put it wherever it wants/needs to in OOB.  Driver gets to ignorant of FS
> > details, FS gets to be ignorant of chip-HW-dependent ECC and badblock
> > layout.
>
> Seems reasonable. We can make it a bitmask of available bytes, perhaps?

I'm tired to repeat myself. 

1. This will break existing code and I'm not willing to do so
We accepted in a long discussion 2 years ago, that we support fs supplied ECC 
layouts. YAFFS relies on this. 

2. Putting stuff into any random place is not a thing I want to have.
Changing one line in the placement code will break all existing fs at once. 
Changing an oob layout in a fs driver just breaks this and solely this 
filesystem. 

It may be better and nicer and more clever to have this independent, but
will you explain the people which are using YAFFS on a SmartMedia Card, that 
they can either freeze the current code or accept that the already existing 
cards are not longer readable ? This is valid for soldered flash too. Update 
of existing hardware to a more recent kernel is then not longer possible 
without loosing data. 

I'm not against an _extended_ API, which provides such things for new 
developments, but I'm cowardly refusing to break compability of existing 
stuff.

Can you please accept the matter of fact that breaking existing 
implementations, which are used on removable medias, is not possible.
Thats like changing the FAT or the ISO driver is not possible even if there 
could be better designs available.

Breaking such things only for the sake of a slightly cleaner interface is the 
playfield of M$ and friends. Linux has a good standing for long term 
stability of interfaces and this is a reason for industrial users to choose 
it. They are tired of changing stuff in short intervals, as the lifecycle of 
such products are higher than the M$ incompabilty rate. And now we want to go 
for the same ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
