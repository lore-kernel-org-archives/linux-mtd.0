Received: from jeeves.momenco.com
	([64.169.228.99] helo=host099.momenco.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19fp1d-0001LA-83
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2003 23:57:29 +0100
From: "Matthew Dharm" <mdharm@momenco.com>
To: <manningc2@actrix.gen.nz>, "Holly Gates" <hgates@eink.com>
Date: Thu, 24 Jul 2003 15:57:27 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIEEKPDCAA.mdharm@momenco.com>
MIME-Version: 1.0
In-Reply-To: <20030724224326.6B6D54230@blood.actrix.co.nz>
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

Well, in theory, yes.....

But the current code just makes the media look like traditional
block-media via the usb-storage driver.  You would need to do some
significant hacking to expose the low-level interface.

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: Charles Manning [mailto:manningc2@actrix.gen.nz]
> Sent: Thursday, July 24, 2003 3:47 PM
> To: Matthew Dharm; Holly Gates
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Smartmedia block mapping
>
>
> On Friday 25 July 2003 10:33, Matthew Dharm wrote:
> > The sddr09 driver in linux/usb/drivers/storage/ actually
> contains a
> > software implementation of the block-mapping needed.  The SDDR-09
> > actually forces the host to do this instead of making the
> device do
> > it.
> >
> > If you can find an SDDR-09 device, and are willing to re-write the
> > driver (it currently does not support any sort of raw
> access), then
> > you could do what you're trying to do.
>
> Thanx for that info Matt.
>
> This would indicate that the SDDR-09 would allow you to use
> YAFFS and JFFS2
> too!
>
>
> >
> > Matt
>
