Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ7pL-0003xb-3h
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 21:42:53 +0000
Date: Mon, 4 Aug 2008 23:42:49 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Message-ID: <20080804214249.GI31974@xi.wantstofly.org>
References: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
	<200808041326.38840.david-b@pacbell.net>
	<20080804205617.GF31974@xi.wantstofly.org>
	<200808041437.34822.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200808041437.34822.david-b@pacbell.net>
Cc: Tony Lindgren <tony@atomide.com>, "Kamat, Nishant" <nskamat@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Kyungmin Park <kmpark@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 04, 2008 at 02:37:34PM -0700, David Brownell wrote:

> > I've never seen CPU endianity being hardwired in any ARM system ever
> > -- but maybe OMAP is different.
> 
> I'll let TI answer that one, since I'm not going to look at docs for
> all the ARM's I've ever used.
> 
> My observation stands *REGARDLESS* of whether endianness was fixed in
> hardware, bootloader, or kernel ... and in any case, with very few
> exceptions (not including OMAP), Linux uses ARMs in LE mode:
> 
>   ~/kernel/linux-2.6/arch/arm/configs$ grep ENDIAN * | egrep -v '#' |egrep -v OHCI
>   ixp2000_defconfig:CONFIG_ARCH_SUPPORTS_BIG_ENDIAN=y
>   ixp2000_defconfig:CONFIG_CPU_BIG_ENDIAN=y
>   ixp23xx_defconfig:CONFIG_ARCH_SUPPORTS_BIG_ENDIAN=y
>   ixp23xx_defconfig:CONFIG_CPU_BIG_ENDIAN=y
>   ixp4xx_defconfig:CONFIG_ARCH_SUPPORTS_BIG_ENDIAN=y
>   ixp4xx_defconfig:CONFIG_CPU_BIG_ENDIAN=y
>   ~/kernel/linux-2.6/arch/arm/configs$  ls | wc -l
>   105
>   ~/kernel/linux-2.6/arch/arm/configs$ 

That's just because not many people ask for BE or use BE -- not
because the LE'ness would be hardwired in hardware as you asserted
earlier.


> To repeat:  there's no point in having the words byteswapped when
> writing, then again when reading, like this driver does.  All that
> does is ensure slow I/O paths.  Were you disagreeing with that main
> point?  Or just quibbling about where any unusual big-endianness
> might come from?

I was responding to your statement that ARM CPU endianity is
hardwired when ARM cores are turned into silicon.
