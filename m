Received: from jeeves.momenco.com
	([64.169.228.99] helo=host099.momenco.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19DpkY-0001OH-2C
	for <linux-mtd@lists.infradead.org>; Thu, 08 May 2003 19:04:10 +0100
From: "Matthew Dharm" <mdharm@momenco.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Thu, 8 May 2003 11:04:21 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIKEFKDAAA.mdharm@momenco.com>
MIME-Version: 1.0
In-Reply-To: <1052374635.6876.35.camel@imladris.demon.co.uk>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 128Mb problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Wed, 2003-05-07 at 21:37, Matthew Dharm wrote:
> > I'm porting Linux to our embedded PPC platform.  We have
> a DoC 2000
> > (apparently known as "Millenium") on the board,
>
> The DiskOnChip 2000 and DiskOnChip Millennium are separate beasts.
> Remember the new Millennium didn't start till 2001 :)
>
> You had a DiskOnChip 2000 on the Ocelots, and it's been
> working fine --
> looks like you really do have a Millennium on the new board though.

Well, now we may have found part of the problem -- the label on the
chip says "DiskOnChip 2000" with a part number of MD2202-D128-V3

So is that a 2000 or Millennium?  If it's really a 2000, then the
driver is detecting it incorrectly.

> > and I'm having problems getting the driver working.  I'm hoping
> > someone here can help... I think the issue is that the
> driver doesn't
> > support this part, tho it should (are we really the first to try
> > this?).
> >
> > We're using kernel 2.4.17, upgraded with MTD from CVS as of today.
> > Our DoC is 128MB in size and operates at 3.3 V.
> >
> > Here's our story:  The main DoC driver detects the device, but is
> > unable to identify any flash devices.  At boot time, it shows:
> >
> > Using configured DiskOnChip probe address 0x70400000
> > DiskOnChip Millennium found at address 0x70400000
> > No flash chips recognised.
>
> Odd. There shouldn't really be much difference in behaviour
> between the
> 2000 and the 2001 drivers. They diverged for a while, then we merged
> them. Some tracing and debugging ought to show what the
> merged driver is
> doing differently (and, I assume, wrong).
>
>  <...>
>
> > Which is interesting, because it is exactly half the
> correct size.  A
> > quick check through the source code shows that
> MAX_CHIPS_MIL is set to
> > 1, and there is a FIXME in doc2001.c "to deal with multi-flash on
> > multi-Millenium case more carefully".  If I change the
> definition of
> > MAX_CHIPS_MIL to 4, we get:
> >
> > Using configured DiskOnChip probe address 0x70400000
> > DiskOnChip Millennium found at address 0x70400000
> > Flash chip found: Manufacturer ID: EC, Chip ID: 76
> (Samsung:NAND 64MB 3,3V)
> > Flash chip found: Manufacturer ID: EC, Chip ID: 76
> (Samsung:NAND 64MB 3,3V)
> > 2 flash chips found. Total DiskOnChip size: 128 MiB
> > mtd: Giving out device 0 to DiskOnChip Millennium
>
> That looks basically correct now.

Well, that's worth something, I guess.

> > NFTL driver: nftlcore.c $Revision: 1.88 $, nftlmount.c
> $Revision: 1.31$
> > NFTL_notify_add for DiskOnChip Millennium
> > mtd->read = c00cd450, size = 134217728, erasesize = 8192
> > NFTL_setup
> > Could not find valid boot record
> > Could not mount NFTL device
>
> At this point, it failed to find the NFTL format on the
> DiskOnChip. If
> the kernel code fails, then 'nftldump' will too. Try
> 'nanddump' which
> should just dump the contents of the raw flash. Look
> through it for a
> block starting 'ANAND' and/or send me a copy.

I presume nanddump works on the /dev/mtd0 node?

Matt
