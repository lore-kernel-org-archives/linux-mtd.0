Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEdMT-0002tD-Nz
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2015 13:01:34 +0000
Date: Mon, 13 Jul 2015 06:01:10 -0700
From: Tony Lindgren <tony@atomide.com>
To: nick <xerofoify@gmail.com>
Cc: Roger Quadros <rogerq@ti.com>, devicetree@vger.kernel.org,
 computersforpeace@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar,
 bcousson@baylibre.com, linux-omap@vger.kernel.org, dwmw2@infradead.org
Subject: Re: [PATCH 03/12] mtd: nand: omap: Move IRQ handling from GPMC to
 NAND driver
Message-ID: <20150713130109.GG26485@atomide.com>
References: <1436531019-18088-1-git-send-email-rogerq@ti.com>
 <1436531019-18088-4-git-send-email-rogerq@ti.com>
 <20150713071008.GC26485@atomide.com> <55A38D2E.9010500@ti.com>
 <20150713124059.GF26485@atomide.com> <55A3B467.8030409@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55A3B467.8030409@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* nick <xerofoify@gmail.com> [150713 05:54]:
> On 2015-07-13 08:40 AM, Tony Lindgren wrote:
> > * Roger Quadros <rogerq@ti.com> [150713 03:07]:
> >  
> >> What is the best map we should use for irqchip?
> >> Some Socs have 4 WAIT pins, some have 3 and some have 2.
> >>
> >> Should we start with 0,1,2, for the wait pins and use the next
> >> available free one for the NAND?
> > 
> > Maybe we can just use the bits defined for each SoC in the
> > GPMC_IRQSTATUS register for the mapping?  
> > Regards,
>
> Is that a good idea as to my knowledge of OMAP platforms that register is hardware
> dependent and therefore that may be an issue unless your idea is to create device
> tables like the way they do in the nand subsystems to support various vendor's 
> nand flash expect here for the pins on OMAP SOCs.

Do you mean mapping irqs based on the GPMC_IRQSTATUS register
bits? If so, that's pretty much how all the GPIO drivers
handle them. We can have a SoC specific irqmask of the valid
bits passed from the dts files, and if necessary we can also
add custom SoC specific IRQ handlers to the GPMC driver if
needed.

The idea is that the NAND driver can just request the irq
from the GPMC driver and do whatever it wants with the
interrupt.

Regards,

Tony
