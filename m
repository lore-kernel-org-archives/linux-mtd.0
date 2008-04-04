Received: from py-out-1112.google.com ([64.233.166.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhvDw-0001hb-Tt
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 23:21:33 +0000
Received: by py-out-1112.google.com with SMTP id p76so371688pyb.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Apr 2008 16:21:31 -0700 (PDT)
Subject: Re: [PATCH]  jffs2 summary allocation
From: Josh Boyer <jwboyer@gmail.com>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200804041609.41092.david-b@pacbell.net>
References: <713171.37644.qm@web26213.mail.ukl.yahoo.com>
	<20080404124812.d39fa640.akpm@linux-foundation.org>
	<200804041609.41092.david-b@pacbell.net>
Content-Type: text/plain
Date: Fri, 04 Apr 2008 18:21:22 -0500
Message-Id: <1207351282.3224.79.camel@vader.jdub.homelinux.org>
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

On Fri, 2008-04-04 at 16:09 -0700, David Brownell wrote:
> On Friday 04 April 2008, Andrew Morton wrote:
> 
> > I'm assuming from the trace that the arm code tried to put that memory
> > under DMA (or at least, passed it into part of the DMA management code to
> > get the various caches sorted out) and that the arm DMA support code
> > doesn't like being given vmalloced memory.
> 
> Actually, Documentation/DMA-Mapping.txt has a section right up
> front called "What memory is DMA'able?" ... which despite its
> ungrammatical title, says clearly:
> 
>   ... This means specifically that you may _not_ use the
>   memory/addresses returned from vmalloc() for DMA.  ...
> 
> So I'm rather surprised to see *ANY* kernel code trying to do
> that.  That rule has been in effect for many, many years now.

I don't think it was intentional.  You're going through several layers
here:

JFFS2 -> mtd parts -> mtd dataflash -> atmel_spi.

Typically MTD drivers aren't doing DMAs to flash and JFFS2 has no idea
which particular chip driver is being used because it's abstracted by
MTD.

josh
