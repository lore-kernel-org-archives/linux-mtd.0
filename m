Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yqo7G-0004SP-1Z
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 19:39:23 +0000
Received: by pdbnk13 with SMTP id nk13so95628316pdb.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 May 2015 12:39:01 -0700 (PDT)
Date: Fri, 8 May 2015 12:38:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Message-ID: <20150508193850.GB32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <20781942.cIPodTiNzG@wuerfel> <20150507184246.GO32500@ld-irv-0074>
 <2731660.FLCdTmWWOZ@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2731660.FLCdTmWWOZ@wuerfel>
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

On Fri, May 08, 2015 at 03:41:10PM +0200, Arnd Bergmann wrote:
> On Thursday 07 May 2015 11:42:46 Brian Norris wrote:
> > On Thu, May 07, 2015 at 12:01:02PM +0200, Arnd Bergmann wrote:
> > > The bus configuration would just involve writing
> > > a constant value in some register, right?
> > 
> > I'm not an expert on the Cygnus/iProc chips, but I believe the answer is
> > no: we *must* reconfigure the bus before and after each data
> > transaction, because it affects the rest of the core too. Others on the
> > CC list can probably elaborate.
> 
> That would not be a problem I think: the irqchip driver would always
> get initialized first, because the main driver would get an -EPROBE_DEFER
> when requesting the interrupt line otherwise.

Huh? I wasn't worried about initialization order. I was worried about
the fact that the "NAND" and "SoC" portions are very integrated when
handling the data path. And I think you agreed that this means we can't
do a straight-up irqchip.

FWIW, I agree that -EPROBE_DEFER can handle initialization ordering
issues...

> > > Doing that in the irqchip
> > > is also a bit ugly, but may still be better overall than doing it the
> > > way you have above.
> > 
> > Well, the Cygnus/iProc case is more complicated as I mention. But I
> > agree that other cases could be nicer, like bcm63138 (which only has
> > separate interrupt status/enable registers). Do you expect a new irqchip
> > driver for every arrangement of registers like this? There are a few
> > similar chips that have status/enable registers in different orders, and
> > some that combine them into a single word. Do we really need a new
> > irqchip driver for each one? I might have done that for bcm63138 and
> > bcm3384, except that I thought I'd have to fall back to this extra
> > per-SoC support driver for Cygnus anyway.
> 
> I assumed this one was the only odd one.

Yes, the Cygnus/iProc are the oddest. The others (BCM33xx (not yet
supported) and BCM63xxx) just have separate one-off interrupt register
blocks.

To be clear, since I'm not sure if you're confused below:

 * Cygnus is a family of chips using the IPROC architecture, coming from
   the Infrastructure/Networking Group; there are BCMxxxx numbers noted
   in arch/arm/mach-bcm/Kconfig for them, but I usually just refer to
   the Cygnus family or the IPROC architecture.

 * BCM63xxx is a class of DSL chips from the Broadband/Connectivity
   Group.

> > > > > We recently merged nested irqdomain support as well, which might help here,
> > > > > or might not be needed.
> > > > 
> > > > I'm not familiar with nested irqdomains. Do they address anything like
> > > > the above problem?
> > > 
> > > The problem that nested irqdomains address is when an interrupt is handled
> > > by two irqchips, in particular when one irqchip handles a virtual interrupt
> > > number that was claimed by another irqchip already.
> > 
> > I'll do some reading on that, but it definitely doesn't address the main
> > problem here.
> 
> Ok, back to the drawing board then: How about turning the probe order around
> and splitting the SoC-specific part out into its own platform_driver:
> 
> Instead of bus_prepare/bus_unprepare for bcm63138, you'd get a

bcm63138 does not need the bus_{,un}prepare. That's for IPROC/Cygnus.

> bcm63138_nand_driver with its own probe() function that calls the
> common probe function. That would make the soc specific parts
> better contained and match how we normally do abstractions of
> similar drivers.

OK, so I can imagine this might require changing the DT binding a bit [1]
(is that your goal?). But what's the intended software difference? [2]
I'll still be passing around the same sorts of callbacks from the
'iproc_nand' probe to the common probe function.

Brian

[1] e.g.:

       nand: nand@18046000 {
               compatible = "brcm,iproc-nand", "brcm,brcmnand-v6.1", "brcm,brcmnand";
               reg = <0x18046000 0x600>, <0xf8105408 0x600>, <0x18046f00 0x20>;
               reg-names = "nand", "iproc-idm", "iproc-ext";
               interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;

               #address-cells = <1>;
               #size-cells = <0>;

               brcm,nand-has-wp;
       };

This captures the extra "iproc-*" register ranges. Then we could have
the iproc_nand driver bind against "brcm,iproc-nand", then call into the
common probe, which would then accept/reject based on
"brcm,brcmnand-vX.Y".

[2] The DT structure from [1] could actually accommodate either driver
structure just fine. So maybe that means it's a better hardware
description?
