Received: from smtp121.sbc.mail.sp1.yahoo.com ([69.147.64.94])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jhvnv-0004HP-90
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 23:58:43 +0000
From: David Brownell <david-b@pacbell.net>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [PATCH]  jffs2 summary allocation
Date: Fri, 4 Apr 2008 16:58:38 -0700
References: <713171.37644.qm@web26213.mail.ukl.yahoo.com>
	<200804041609.41092.david-b@pacbell.net>
	<1207351282.3224.79.camel@vader.jdub.homelinux.org>
In-Reply-To: <1207351282.3224.79.camel@vader.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200804041658.38499.david-b@pacbell.net>
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

On Friday 04 April 2008, Josh Boyer wrote:
> 
> >   ... This means specifically that you may _not_ use the
> >   memory/addresses returned from vmalloc() for DMA.  ...
> > 
> > So I'm rather surprised to see *ANY* kernel code trying to do
> > that.  That rule has been in effect for many, many years now.
> 
> I don't think it was intentional.  You're going through several layers
> here:
> 
> JFFS2 -> mtd parts -> mtd dataflash -> atmel_spi.
> 
> Typically MTD drivers aren't doing DMAs to flash and JFFS2 has no idea
> which particular chip driver is being used because it's abstracted by
> MTD.

That's true ... although I can imagine using DMA to
avoid dcache trashing if its setup cost is low enough,
with either NAND or NOR chips.

Still:  in this context vmalloc() is wrong.

- Dave
