Received: from pony1.arc.nasa.gov ([128.102.31.31] helo=mail.arc.nasa.gov)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19FdEJ-0002d3-1q
	for <linux-mtd@lists.infradead.org>; Tue, 13 May 2003 18:06:19 +0100
Message-Id: <5.2.1.1.2.20030513100802.0124bed8@mail.arc.nasa.gov>
Date: Tue, 13 May 2003 10:09:02 -0700
To: "Matthew Dharm" <mdharm@momenco.com>
From: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <NEBBLJGMNKKEEMNLHGAIEEHGDAAA.mdharm@momenco.com>
References: <5.1.1.5.2.20030512133623.014ec7b0@mail.arc.nasa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

Haven't tried nanddump.

Ted

At 06:42 PM 5/12/2003 -0700, you wrote:
>Well, I found at least one part of the problem.
>
>The Linux driver doc2001.c assumes that addresses (in DoC_Address) are
>23 bits max.  On some parts, the max is 31, so an extra write of the
>address component is needed.
>
>Given that modification (and changing calls to DoC_Address to use 4
>bytes instead of 3 -- one of the parameters is how many to use), I now
>have data coming from nanddump.  I'm sending that to David only for
>now -- it's 800K compressed.
>
>What's interesting here is that there is definately data there.  I can
>even see readable text strings, and the filename of the VxWorks image
>that was loaded onto this particular unit.  But, the string "ANAND" is
>somewhat rare -- the string "BNAND" is significantly more common.
>
>I'm starting to wonder if M-Systems has changed their on-chip data
>format from NFTL to something else....
>
>Edward, have you ever tried the nanddump utility?
>
>Unfortunately for me, the proprietary driver is x86-only, and I'm on a
>PPC platform.
>
>Matt
>
>--
>Matthew D. Dharm                            Senior Software Designer
>Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
>(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
>Momentum Works For You                      www.momenco.com
>
> > -----Original Message-----
> > From: Edward A. Hildum [mailto:ehildum@mail.arc.nasa.gov]
> > Sent: Monday, May 12, 2003 1:43 PM
> > To: Matthew Dharm
> > Cc: linux-mtd@lists.infradead.org
> > Subject: RE: DiskOnChip 2000 128Mb problem
> >
> >
> > They didn't, but I didn't try the Millenium-only driver.
> > After fooling
> > around with GRUB, trying to get it working with the DOC, I
> > punted and went
> > with the M-Systems proprietary driver.  This solves my problem for
> > now.  Maybe I'll try again later when I've got some
> > progress on other
> > fronts to show.
> >
> > Ted
> >
> > At 01:29 PM 5/9/2003 -0700, you wrote:
> > >Did the Linux drivers work for you?
> > >
> > >Matt
> > >
> > >--
> > >Matthew D. Dharm                            Senior
> > Software Designer
> > >Momentum Computer Inc.                      1815 Aston
> > Ave.  Suite 107
> > >(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
> > >Momentum Works For You                      www.momenco.com
> > >
> > > > -----Original Message-----
> > > > From: Edward A. Hildum [mailto:ehildum@mail.arc.nasa.gov]
> > > > Sent: Friday, May 09, 2003 1:24 PM
> > > > To: Matthew Dharm
> > > > Cc: linux-mtd@lists.infradead.org
> > > > Subject: RE: DiskOnChip 2000 128Mb problem
> > > >
> > > >
> > > > I had a similar experience using a DOC 2000 TSOP 256M part.
> > > >  Its chip ID is
> > > > 0x30, which is right for a Millenium part, even though it
> > > > has a DOC 2000
> > > > part number.  The part also has an IPL which can be updated
> > > > like Millenium
> > > > parts.
> > > >
> > > > Ted Hildum
> > > >
> > > > At 09:58 AM 5/9/2003 -0700, you wrote:
> > > > > > -----Original Message-----
> > > > > > From: David Woodhouse [mailto:dwmw2@infradead.org]
> > > > > > Sent: Friday, May 09, 2003 9:48 AM
> > > > > > To: Matthew Dharm
> > > > > > Cc: linux-mtd@lists.infradead.org
> > > > > > Subject: RE: DiskOnChip 2000 128Mb problem
> > > > > >
> > > > > >
> > > > > > On Fri, 2003-05-09 at 17:40, Matthew Dharm wrote:
> > > > > > > Is it normal for a DoC 2000 to be detected as a Millenium?
> > > > > >
> > > > > > No, but it's not normal for its contents to be read back as
> > > > > > 0x01 0x02
> > > > > > 0x03 etc. either: )
> > > > >
> > > > >Okay, so we're all on the same page.
> > > > >
> > > > > > > I've already checked the bus width and timing.
> > > > > >
> > > > > > And it's definitely not set to 16-bit? -ECONFUSED.
> > > > >
> > > > >No kidding.  I'm hoping the docs will have something
> > > > useful, and I'm
> > > > >about to pull out the bus analyizer.
> > > > >
> > > > >
> > > > >Matt
> > > > >
> > > > >
> > > > >______________________________________________________
> > > > >Linux MTD discussion mailing list
> > > > >http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > > >
> >
