Received: from jeeves.momenco.com
	([64.169.228.99] helo=host099.momenco.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19foeJ-00013q-Mi
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2003 23:33:23 +0100
From: "Matthew Dharm" <mdharm@momenco.com>
To: <manningc2@actrix.gen.nz>, "Holly Gates" <hgates@eink.com>
Date: Thu, 24 Jul 2003 15:33:19 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIKEKODCAA.mdharm@momenco.com>
MIME-Version: 1.0
In-Reply-To: <20030724222352.16C301620F@desire.actrix.co.nz>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: Smartmedia block mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The sddr09 driver in linux/usb/drivers/storage/ actually contains a
software implementation of the block-mapping needed.  The SDDR-09
actually forces the host to do this instead of making the device do
it.

If you can find an SDDR-09 device, and are willing to re-write the
driver (it currently does not support any sort of raw access), then
you could do what you're trying to do.

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org
> [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Charles
> Manning
> Sent: Thursday, July 24, 2003 3:28 PM
> To: Holly Gates
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Smartmedia block mapping
>
>
> On Wednesday 23 July 2003 08:34, Holly Gates wrote:
> > David Woodhouse wrote:
> > >On Tue, 2003-07-22 at 16:05, Holly Gates wrote:
> > >>Maybe I could see using the mapping table if it was on the card
> > >>somewhere,
> > >
> > >It is. It's in the 'out of band' area of the data blocks
> I believe --
> > >see the SmartMedia specs for details.
> >
> > Right, I sort of got a bit of that by reading docs at
> samsung's website.
> > It seems like the logical block number is stored in the
> out of band area
> > of the physical block. But it seems to me that if this
> was the only
> > place it was stored, then when you plug in the card, the
> card reader
> > would have to read the out of band area for all the
> blocks on the card
> > and make a table in RAM. At least on my card reader, it
> is only a little
> > ASIC on the board. I would be surprised to find a few
> hundred K of RAM
> > on that ASIC, which is what you might want for a table on
> the larger cards.
>
> SmartMedia does require the logical to physical mapping to
> be held in RAM
> (well for any acceptable performance anyway). This is not
> much 2 bytes of RAM
> per block of 16kB ie. ony about 32kB of RAM data for a
> 256MB card (isn't that
> the biggest?).
>
> As others have noted, if the device is using the USB mass
> storage driver then
> it is doing all this internally and you can't get at the low levels.
>
> >
> > By the way, any idea where to get the SM spec? I can't
> seem to find it
> > anywhere that I don't need to sign and NDA or pay
> hundreds of dollars
> > for it.
>
> You can get it from the samsung flash www.
> >
> > >> but ideally I could just write the binary file to the sectors
> > >>in true, physical, incrementing order. Anyone know of a
> utility I could
> > >>use to do this?
> > >
> > >You need special hardware which gives you access to the raw flash
> > >without doing the translation _for_ you. Most 'card
> readers' will do it
> > >for you and hence you don't get this option.
> >
> > Hmm. OK. Thats too bad.
> >
> > >>I suppose I could build a parallel port adapter and
> write some software
> > >>or something, but that is annoying since I know the
> computer is capable
> > >>of doing what I want if I could get at the right layer
> of the driver
> > >>stack...
> > >
> > >No, it's not. Your USB card reader doesn't let you have
> access to the
> > >raw flash; it has the translation built-in.
> > >
> > >Either implement the full SMTL in your FPGA, or make sure you use
> > >hardware which accesses the flash directly, when writing
> to the device.
> >
> > Dang! Oh well, thanks for the advice. I'll get out the
> soldering iron I
> > guess...
>
> You can get NAND eval boards from Samsung etc that will
> give you low level
> access.
>
> -- CHarles
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
