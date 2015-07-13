Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEd2z-0006JE-4l
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2015 12:41:25 +0000
Date: Mon, 13 Jul 2015 05:40:59 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, bcousson@baylibre.com,
 ezequiel@vanguardiasur.com.ar, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] mtd: nand: omap: Move IRQ handling from GPMC to
 NAND driver
Message-ID: <20150713124059.GF26485@atomide.com>
References: <1436531019-18088-1-git-send-email-rogerq@ti.com>
 <1436531019-18088-4-git-send-email-rogerq@ti.com>
 <20150713071008.GC26485@atomide.com> <55A38D2E.9010500@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55A38D2E.9010500@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [150713 03:07]:
> Tony,
> 
> On 13/07/15 10:10, Tony Lindgren wrote:
> > * Roger Quadros <rogerq@ti.com> [150710 05:26]:
> >> Since the Interrupt Events are used only by the NAND driver,
> >> there is no point in managing the Interrupt registers
> >> in the GPMC driver and complicating it with irqchip modeling.
> > 
> > I don't think it's a good idea to allow external drivers to
> > tinker directly with GPMC registers. How about just set up GPMC
> > as an irqchip for the edge detection interrupts?
> > 
> > I think we already have devices with multiple NAND chips. And
> > there's nothing stopping other drivers from using the edge
> > detection interrupts.
> 
> OK. The GPMC_IRQ registers manage 2 NAND specific interrupts
> (terminalcount and fifo) and 'n' WAIT pin edge interrupts.
> 
>  So we can model this as a irqchip with 'n + 2' interrupts.

OK
 
> We need to take care that if a GPMC chip select needs a
> wait pin then it can't be used as a generic interrupt.
> 
> We need to get rid of omap_dev_ready() in nand/omap2.c as
> it accesses the GPMC_STATUS register directly. Plus it is
> hard coded to only monitor wait0 pin.

OK
 
> What is the best map we should use for irqchip?
> Some Socs have 4 WAIT pins, some have 3 and some have 2.
> 
> Should we start with 0,1,2, for the wait pins and use the next
> available free one for the NAND?

Maybe we can just use the bits defined for each SoC in the
GPMC_IRQSTATUS register for the mapping?  
Regards,

Tony
