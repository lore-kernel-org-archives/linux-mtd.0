Received: from jeeves.momenco.com
	([64.169.228.99] helo=host099.momenco.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19EEUt-0005Mb-3Y
	for <linux-mtd@lists.infradead.org>; Fri, 09 May 2003 21:29:39 +0100
From: "Matthew Dharm" <mdharm@momenco.com>
To: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
Date: Fri, 9 May 2003 13:29:53 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIOEGGDAAA.mdharm@momenco.com>
MIME-Version: 1.0
In-Reply-To: <5.1.1.5.2.20030509131915.015142c0@mail.arc.nasa.gov>
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

Did the Linux drivers work for you?

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: Edward A. Hildum [mailto:ehildum@mail.arc.nasa.gov]
> Sent: Friday, May 09, 2003 1:24 PM
> To: Matthew Dharm
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: DiskOnChip 2000 128Mb problem
>
>
> I had a similar experience using a DOC 2000 TSOP 256M part.
>  Its chip ID is
> 0x30, which is right for a Millenium part, even though it
> has a DOC 2000
> part number.  The part also has an IPL which can be updated
> like Millenium
> parts.
>
> Ted Hildum
>
> At 09:58 AM 5/9/2003 -0700, you wrote:
> > > -----Original Message-----
> > > From: David Woodhouse [mailto:dwmw2@infradead.org]
> > > Sent: Friday, May 09, 2003 9:48 AM
> > > To: Matthew Dharm
> > > Cc: linux-mtd@lists.infradead.org
> > > Subject: RE: DiskOnChip 2000 128Mb problem
> > >
> > >
> > > On Fri, 2003-05-09 at 17:40, Matthew Dharm wrote:
> > > > Is it normal for a DoC 2000 to be detected as a Millenium?
> > >
> > > No, but it's not normal for its contents to be read back as
> > > 0x01 0x02
> > > 0x03 etc. either: )
> >
> >Okay, so we're all on the same page.
> >
> > > > I've already checked the bus width and timing.
> > >
> > > And it's definitely not set to 16-bit? -ECONFUSED.
> >
> >No kidding.  I'm hoping the docs will have something
> useful, and I'm
> >about to pull out the bus analyizer.
> >
> >
> >Matt
> >
> >
> >______________________________________________________
> >Linux MTD discussion mailing list
> >http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
