Received: from jeeves.momenco.com
	([64.169.228.99] helo=host099.momenco.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19EAuj-0004Tr-0w
	for <linux-mtd@lists.infradead.org>; Fri, 09 May 2003 17:40:05 +0100
From: "Matthew Dharm" <mdharm@momenco.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Fri, 9 May 2003 09:40:17 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIGEGDDAAA.mdharm@momenco.com>
MIME-Version: 1.0
In-Reply-To: <1052490920.23135.215.camel@passion.cambridge.redhat.com>
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

Is it normal for a DoC 2000 to be detected as a Millenium?

I've already checked the bus width and timing.

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: Friday, May 09, 2003 7:35 AM
> To: Matthew Dharm
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: DiskOnChip 2000 128Mb problem
>
>
> On Fri, 2003-05-09 at 15:25, David Woodhouse wrote:
> > On Thu, 2003-05-08 at 19:04, Matthew Dharm wrote:
> > > Well, now we may have found part of the problem -- the
> label on the
> > > chip says "DiskOnChip 2000" with a part number of MD2202-D128-V3
> > >
> > > So is that a 2000 or Millennium?  If it's really a
> 2000, then the
> > > driver is detecting it incorrectly.
> >
> > It's probably a Millennium.
>
> I lied. That's a DiskOnChip 2000 part number, I think.
> Check bus width,
> timing, etc. for the chip select you've attached it to. I
> know PMON used
> to set it up wrong for the Ocelot, we fix it up manually in Linux.
>
> --
> dwmw2
>
