Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhxDj-0004fN-Cl
	for linux-mtd@lists.infradead.org; Sat, 05 Apr 2008 01:29:27 +0000
Received: by wf-out-1314.google.com with SMTP id 29so330678wff.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Apr 2008 18:29:26 -0700 (PDT)
Message-ID: <9c9fda240804041829r5a768b39n340926485aa12687@mail.gmail.com>
Date: Sat, 5 Apr 2008 10:29:25 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Josh Boyer" <jwboyer@gmail.com>
Subject: Re: [PATCH] jffs2 summary allocation
In-Reply-To: <1207357870.3224.89.camel@vader.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <713171.37644.qm@web26213.mail.ukl.yahoo.com>
	<200804041609.41092.david-b@pacbell.net>
	<1207351282.3224.79.camel@vader.jdub.homelinux.org>
	<200804041658.38499.david-b@pacbell.net>
	<1207357870.3224.89.camel@vader.jdub.homelinux.org>
Cc: linux-kernel@vger.kernel.org, David Brownell <david-b@pacbell.net>,
	linux-mtd@lists.infradead.org,
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

On Sat, Apr 5, 2008 at 10:11 AM, Josh Boyer <jwboyer@gmail.com> wrote:
> On Fri, 2008-04-04 at 16:58 -0700, David Brownell wrote:
>  > On Friday 04 April 2008, Josh Boyer wrote:
>  > >
>  > > >   ... This means specifically that you may _not_ use the
>  > > >   memory/addresses returned from vmalloc() for DMA.  ...
>  > > >
>  > > > So I'm rather surprised to see *ANY* kernel code trying to do
>  > > > that.  That rule has been in effect for many, many years now.
>  > >
>  > > I don't think it was intentional.  You're going through several layers
>  > > here:
>  > >
>  > > JFFS2 -> mtd parts -> mtd dataflash -> atmel_spi.
>  > >
>  > > Typically MTD drivers aren't doing DMAs to flash and JFFS2 has no idea
>  > > which particular chip driver is being used because it's abstracted by
>  > > MTD.
>  >
>  > That's true ... although I can imagine using DMA to
>  > avoid dcache trashing if its setup cost is low enough,
>  > with either NAND or NOR chips.
>  >
>  > Still:  in this context vmalloc() is wrong.
>
>  Agreed.  One issue is that the summary code allocates a buffer that
>  equals the eraseblock size of the underlying MTD device.  For larger
>  NAND chips, that may be up to 256KiB.  I believe this is within the
>  allowable kmalloc size for most architectures these days, but the
>  summary code is 3 years old and was likely expecting a smaller limit.
>  And there is always the question on whether finding that much contiguous
>  memory will be an issue.

In MLC chips it goes up to 512KiB. It means it can't allocate the
eraseblock size memory with kmalloc().
In ARM environment I can't see the 256KiB or more memory allocation
with kmalloc().
So I now changed the kmalloc eraseblock to vmalloc at both jffs2 and mtd-utils.

Thank you,
Kyungmin Park
