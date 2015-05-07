Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqIcc-0007g7-T0
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 10:01:40 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Thu, 07 May 2015 12:01:02 +0200
Message-ID: <20781942.cIPodTiNzG@wuerfel>
In-Reply-To: <20150506204910.GJ32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <7101952.uOJDgn7tgf@wuerfel> <20150506204910.GJ32500@ld-irv-0074>
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

On Wednesday 06 May 2015 13:49:10 Brian Norris wrote:
> On Wed, May 06, 2015 at 09:12:43PM +0200, Arnd Bergmann wrote:
> > On Wednesday 06 May 2015 10:59:50 Brian Norris wrote:
> > > +       /*
> > > +        * Some SoCs integrate this controller (e.g., its interrupt bits) in
> > > +        * interesting ways
> > > +        */
> > > +       if (of_property_read_bool(dn, "brcm,nand-soc")) {
> > > +               struct device_node *soc_dn;
> > > +
> > > +               soc_dn = of_parse_phandle(dn, "brcm,nand-soc", 0);
> > > +               if (!soc_dn)
> > > +                       return -ENODEV;
> > > +
> > > +               ctrl->soc = devm_brcmnand_probe_soc(dev, soc_dn);
> > > +               if (!ctrl->soc) {
> > > +                       dev_err(dev, "could not probe SoC data\n");
> > > +                       of_node_put(soc_dn);
> > > +                       return -ENODEV;
> > > +               }
> > > +
> > > +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
> > > +                                      DRV_NAME, ctrl);
> > > +
> > > +               /* Enable interrupt */
> > > +               ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
> > > +
> > > +               of_node_put(soc_dn);
> > > +       } else {
> > > +               /* Use standard interrupt infrastructure */
> > > +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
> > > +                                      DRV_NAME, ctrl);
> > > +       }
> > > 
> > 
> > It looks to me like this should be handled as a nested irqchip, so the node
> > you look up gets used as the "interrupt-parent" instead, making the behavior
> > of this SoC transparent to the nand driver.
> 
> You snipped the rest of the patch, which involves more than just IRQ
> handling. The same registers touch both interrupts and data bus endian
> configuration, so it can't possibly be done transparently to the NAND
> driver.

Anything else in there? The bus configuration would just involve writing
a constant value in some register, right? Doing that in the irqchip
is also a bit ugly, but may still be better overall than doing it the
way you have above.

> > We recently merged nested irqdomain support as well, which might help here,
> > or might not be needed.
> 
> I'm not familiar with nested irqdomains. Do they address anything like
> the above problem?

The problem that nested irqdomains address is when an interrupt is handled
by two irqchips, in particular when one irqchip handles a virtual interrupt
number that was claimed by another irqchip already.

	Arnd
