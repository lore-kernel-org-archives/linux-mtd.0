Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7EeS-0003mS-1p
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 14:19:08 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HV800CWDNRPZ8@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 15:19:02 +0100 (MET)
Date: Sat, 27 Mar 2004 15:15:39 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <1080386714.17352.52.camel@imladris.demon.co.uk>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <200403271515.39680.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <406328A2.3060905@cray.com>
	<200403271210.30061.tglx@linutronix.de>
	<1080386714.17352.52.camel@imladris.demon.co.uk>
cc: manningc2@actrix.gen.nz
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

On Saturday 27 March 2004 12:25, David Woodhouse wrote:
> On Sat, 2004-03-27 at 12:10 +0100, Thomas Gleixner wrote:
> > What else would you need ?
>
> Nothing more, but it does live where it is in the hardware driver.
>
> > I'm not happy to build in the bad block bitmap stuff as a general
> > solution. Next will be translation tables, bad block remapping and all
> > kind of crap, which is not neccecary to run a NAND FLASH aware
> > filesystem.
>
> We don't need to build it in as a general solution -- the DiskOnChip
> code will do it itself. All we need to do is keep the API sufficiently
> versatile that the FS doesn't need to know about the peculiarities of
> the DiskOnChip -- it just gets told which bytes of the OOB area it can
> use, and does so.
>
> The DiskOnChip uses the first 6 bytes of the OOB area for hardware ECC,
> and bad block information is elsewhere on the medium.

OK, that's DOC specific. And the functions is there. Nobody is going to remove 
it.

> > The NAND specs have defined to have the bad block markers in the OOB
> > area, which is quite clever, as it does not restrict the usage of any
> > byte in the main area.
>
> No, the NAND specs have defined the bad block markers to be in the OOB
> area when the device is shipped. What you do with it after that is up to
> you. And in the case of the DiskOnChip that means the bad block
> information is moved. We _really_ want to honour that and keep it within
> the hardware driver. I don't want any possibility of erasing bad blocks,
> and I'm not overly happy with thinking non-bad blocks are bad just
> because the device has already been used with NFTL and has ECC data in
> byte 5.

So the evil thing is moving the bad block information to a different place.
If some braindead hardware engineers decide to move this information then we 
unfortunately have to deal with the consequences in a hardware specific 
driver which is aware of that crap, but moving it should _NOT_ be encouraged 
by providing a generic possibility to do so. 

We have built a HW ECC which does error correction into a FPGA. The ECC 
positions are programmable, so I can use YAFFS and JFFS2 with it. I did not 
need an extra driver and an extra bad block mechanism. In general should 
people learn to do hardware / software codesign rather than blowing up the 
code with support for braindead hardware.

The nand driver does prevent the erasure of bad blocks already and I'm not 
going to change this.  

> > Nand.c needs bad block handling in the sense of preventing erase of bad
> > blocks. Maybe the prevention of reading / writing bad blocks too. And the
> > possibility to have a bad block detection function, which covers specific
> > cases like DOC.
> >
> > But this does not change the interface.
>
> Except that in the file system we need to call the device's
> ->is_bad_block() function rather than poking at the OOB area.

Correct. No arguments against.

>
> We don't need a fixed ECC scheme. But we do need to tell the file system
> what we support. Those should include the SmartMedia software ECC, and
> may include the DiskOnChip hardware ECC too.
> JFFS2 uses the DiskOnChip ECC on DiskOnChip already, doesn't it?

Yep, but on DOC this is enforced by the hardware. All other things can use an 
ECC placement scheme which fits the filesystem specific OOB layout.

I'm not happy to say that the ECC placements are given by the nand driver, as 
it will break the existing YAFFS code at least, which is not a real good idea, 
as this code is used already in production environment.

> > > Other than noticing them and avoiding them, there really isn't much
> > > handling to be done.
> >
> > True, but it still is a job of the filesystem and therefor it must have
> > access to this information.
>
> Yes. It _absolutely_ needs access to the information 'is this a bad
> block?'. What it doesn't need is stuff like "what byte in the OOB area
> would tell us if this was a bad block".

It needs the information where it is so the fs driver does not put data into 
this place. 

We discussed this already two years ago and decided against a function which 
shuffles around the fs oob data into places which are not used by ecc and bad 
block information and another function which rebuilds the data on read into a 
byte stream which is expected by the fs driver.

The argument there was: removing transparency and flexiblity is evil. 

And I say it's still evil, especially if it breaks existing code.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
