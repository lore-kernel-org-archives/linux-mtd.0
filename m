Received: from py-out-1112.google.com ([64.233.166.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jhww5-0000SO-VU
	for linux-mtd@lists.infradead.org; Sat, 05 Apr 2008 01:11:14 +0000
Received: by py-out-1112.google.com with SMTP id p76so423529pyb.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Apr 2008 18:11:13 -0700 (PDT)
Subject: Re: [PATCH]  jffs2 summary allocation
From: Josh Boyer <jwboyer@gmail.com>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200804041658.38499.david-b@pacbell.net>
References: <713171.37644.qm@web26213.mail.ukl.yahoo.com>
	<200804041609.41092.david-b@pacbell.net>
	<1207351282.3224.79.camel@vader.jdub.homelinux.org>
	<200804041658.38499.david-b@pacbell.net>
Content-Type: text/plain
Date: Fri, 04 Apr 2008 20:11:10 -0500
Message-Id: <1207357870.3224.89.camel@vader.jdub.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Michael Trimarchi <trimarchimichael@yahoo.it>,
	spi-devel-general@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-04-04 at 16:58 -0700, David Brownell wrote:
> On Friday 04 April 2008, Josh Boyer wrote:
> > 
> > >   ... This means specifically that you may _not_ use the
> > >   memory/addresses returned from vmalloc() for DMA.  ...
> > > 
> > > So I'm rather surprised to see *ANY* kernel code trying to do
> > > that.  That rule has been in effect for many, many years now.
> > 
> > I don't think it was intentional.  You're going through several layers
> > here:
> > 
> > JFFS2 -> mtd parts -> mtd dataflash -> atmel_spi.
> > 
> > Typically MTD drivers aren't doing DMAs to flash and JFFS2 has no idea
> > which particular chip driver is being used because it's abstracted by
> > MTD.
> 
> That's true ... although I can imagine using DMA to
> avoid dcache trashing if its setup cost is low enough,
> with either NAND or NOR chips.
> 
> Still:  in this context vmalloc() is wrong.

Agreed.  One issue is that the summary code allocates a buffer that
equals the eraseblock size of the underlying MTD device.  For larger
NAND chips, that may be up to 256KiB.  I believe this is within the
allowable kmalloc size for most architectures these days, but the
summary code is 3 years old and was likely expecting a smaller limit.
And there is always the question on whether finding that much contiguous
memory will be an issue.

I don't see much harm with the actual patch itself, assuming larger
kmallocs work as I think they should.  It does make me wonder if we have
other cases of vmalloc'd buffers being passed to lower drivers using DMA
though.

josh
