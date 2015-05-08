Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqiXB-0003v7-EA
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 13:41:46 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Fri, 08 May 2015 15:41:10 +0200
Message-ID: <2731660.FLCdTmWWOZ@wuerfel>
In-Reply-To: <20150507184246.GO32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <20781942.cIPodTiNzG@wuerfel> <20150507184246.GO32500@ld-irv-0074>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 07 May 2015 11:42:46 Brian Norris wrote:
> On Thu, May 07, 2015 at 12:01:02PM +0200, Arnd Bergmann wrote:
> > On Wednesday 06 May 2015 13:49:10 Brian Norris wrote:
> > > On Wed, May 06, 2015 at 09:12:43PM +0200, Arnd Bergmann wrote:
> > > > It looks to me like this should be handled as a nested irqchip, so the node
> > > > you look up gets used as the "interrupt-parent" instead, making the behavior
> > > > of this SoC transparent to the nand driver.
> > > 
> > > You snipped the rest of the patch, which involves more than just IRQ
> > > handling. The same registers touch both interrupts and data bus endian
> > > configuration, so it can't possibly be done transparently to the NAND
> > > driver.
> > 
> > Anything else in there?
> 
> Looks like miscellaneous NAND-related control bits. AXI and APB endian
> configuration; several interrupt-enable bits (we only use one for now);
> a clock-enable; and some timing test mode bits.

I see. Describing that as an irqchip would indeed be too much of a stretch.

> > The bus configuration would just involve writing
> > a constant value in some register, right?
> 
> I'm not an expert on the Cygnus/iProc chips, but I believe the answer is
> no: we *must* reconfigure the bus before and after each data
> transaction, because it affects the rest of the core too. Others on the
> CC list can probably elaborate.

That would not be a problem I think: the irqchip driver would always
get initialized first, because the main driver would get an -EPROBE_DEFER
when requesting the interrupt line otherwise.

> > Doing that in the irqchip
> > is also a bit ugly, but may still be better overall than doing it the
> > way you have above.
> 
> Well, the Cygnus/iProc case is more complicated as I mention. But I
> agree that other cases could be nicer, like bcm63138 (which only has
> separate interrupt status/enable registers). Do you expect a new irqchip
> driver for every arrangement of registers like this? There are a few
> similar chips that have status/enable registers in different orders, and
> some that combine them into a single word. Do we really need a new
> irqchip driver for each one? I might have done that for bcm63138 and
> bcm3384, except that I thought I'd have to fall back to this extra
> per-SoC support driver for Cygnus anyway.

I assumed this one was the only odd one.

> > > > We recently merged nested irqdomain support as well, which might help here,
> > > > or might not be needed.
> > > 
> > > I'm not familiar with nested irqdomains. Do they address anything like
> > > the above problem?
> > 
> > The problem that nested irqdomains address is when an interrupt is handled
> > by two irqchips, in particular when one irqchip handles a virtual interrupt
> > number that was claimed by another irqchip already.
> 
> I'll do some reading on that, but it definitely doesn't address the main
> problem here.

Ok, back to the drawing board then: How about turning the probe order around
and splitting the SoC-specific part out into its own platform_driver:

Instead of bus_prepare/bus_unprepare for bcm63138, you'd get a
bcm63138_nand_driver with its own probe() function that calls the
common probe function. That would make the soc specific parts
better contained and match how we normally do abstractions of
similar drivers.

	Arnd
