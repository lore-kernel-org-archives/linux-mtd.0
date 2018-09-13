Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0KDz-0005ZH-1M
 for linux-mtd@lists.infradead.org; Thu, 13 Sep 2018 05:31:32 +0000
Date: Thu, 13 Sep 2018 07:31:15 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [BUG/RFC] denali NAND probe issues on SoCFPGA
Message-ID: <20180913053115.qau25vunw4jdwnep@pengutronix.de>
References: <737ejrj81y.fsf@pengutronix.de>
 <CAK7LNARiy57xJNA-b4as5xS6Xqjw81Mij77fN10t6NF-mPAFvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARiy57xJNA-b4as5xS6Xqjw81Mij77fN10t6NF-mPAFvg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 13, 2018 at 01:45:59PM +0900, Masahiro Yamada wrote:
> Hi.
> 
> 2018-09-12 19:59 GMT+09:00 Steffen Trumtrar <s.trumtrar@pengutronix.de>:
> >
> > Hi!
> >
> > I just found an issue with
> >
> >    commit 586a2c52909df453ed1b6239283744b0851ccf81
> >    Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> >    Date:   Fri Sep 22 12:46:41 2017 +0900
> >
> >    mtd: nand: denali: squash denali_enable_dma() helper into    caller
> >
> > on (atleast) Cyclone5 SoCFPGAs.
> >
> > With this patch I get
> >
> >    [    0.543088] denali-nand-dt ff900000.nand: necessary clock    is
> > missing. default clock rates are used.
> >    [    0.554325] nand: device found, Manufacturer ID: 0x2c, Chip    ID:
> > 0xda
> >    [    0.560654] nand: Micron MT29F2G08ABAEAWP
> >    [    0.564680] nand: 256 MiB, SLC, erase size: 128 KiB, page    size:
> > 2048, OOB size: 64
> >    [    0.971317] nand: timeout while waiting for chip to become    ready
> >    [    1.991336] denali-nand-dt ff900000.nand: timeout while    waiting for
> > irq 0x4
> >
> > and then the system just reboots. Adding the ioread32 back or just some
> > printks fixes this. So there seems to be a timing issue.
> > What would be the preferred solution? Add a
> > msleep($IDONTKNOWWHATISAGOODVALUE) although it is unnecessary for the other
> > SoCs?
> > Bringing the ioread32 back seems like obfuscating the problem.
> >
> >
> > Best regards,
> > Steffen
> >
> 
> Thanks for the report.
> 
> The current code is working for my SoCs, but may not for others.
> 
> As you noticed, this is a timing issue, which is unclear.
> 
> 
> 
> I think ioread32() should be get back with a clear comment.
> 
> I guess it is enough to add it after enabling the DMA.
> 
> 
> 
> How about this?
> 
> 
> 
>       iowrite32(DMA_ENABLE__FLAG, denali->reg + DMA_ENABLE);
> +     /*
> +      * The ->setup_dma() hook kicks DMA by using the data/command
> +      * interface, which belongs to a different AXI port from the
> +      * register interface.  Read back the register to avoid a race.
> +      */
> +     ioread32(denali->reg + DMA_ENABLE);
> 

Ah, that is why this is happening, different ports. I like it.
Will you send an official patch?

Thanks,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
