Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPFM5-0005vZ-Uf
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2013 17:27:58 +0000
Received: by mail-ob0-f182.google.com with SMTP id wo20so2203163obc.27
 for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2013 10:27:36 -0700 (PDT)
Date: Thu, 26 Sep 2013 10:27:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v6 1/4] ARM: OMAP2+: cleaned-up DT support of various
 ECC schemes
Message-ID: <20130926172728.GJ23337@ld-irv-0074.broadcom.com>
References: <1378986619-26765-1-git-send-email-pekon@ti.com>
 <1378986619-26765-2-git-send-email-pekon@ti.com>
 <CAL_Jsq+XxQ_9ik_P8EPPNSzXiCz6yd-VJLRU668t3jvD-jhyOw@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA16B0D@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA16B0D@DBDE04.ent.ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, Rob Herring <robherring2@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[I see Mark made some of the same comments while I was typing this
email]

On Thu, Sep 26, 2013 at 06:08:42AM +0000, Gupta, Pekon wrote:
> > From: Rob Herring [mailto:robherring2@gmail.com]
> > > From: Pekon Gupta [mailto:pekon@ti.com]
> > > diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> > b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> > > index df338cb..958e5d5 100644
> > > --- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> > > +++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> > > @@ -21,11 +21,8 @@ Optional properties:
> > >                                 is wired that way. If not specified, a bus
> > >                                 width of 8 is assumed.
> > >
> > > - - ti,nand-ecc-opt:            A string setting the ECC layout to use. One of:
> > > -
> > > -               "sw"            Software method (default)
> > > -               "hw"            Hardware method
> > > -               "hw-romcode"    gpmc hamming mode method & romcode layout
> > > + - ti,nand-ecc-scheme:         A string setting the ECC layout to use. One of:
> > > +               "ham1"          1-bit Hamming ecc code
> > 
> > As has been pointed out, this breaks compatibility which should be
> > avoided unless you know the state of use of this binding. I fail to
> > see the advantage of using scheme over opt. You could simply add ham1
> > here and maintain compatibility. Instead of removing sw, hw, etc. you
> > can simply deprecate them or decide that the kernel doesn't support
> > those options.
> > 
> Renaming 'ti,nand-ecc-opt' to 'ti,nand-ecc-scheme' was as per earlier 
> comments from Olof. So either way is fine with me. Should I revert
> it back to 'ti,nand-ecc-opt' ?
> 
> Also, "sw", "hw_romcode" have been deprecated, they are no longer
> supported in driver. So shouldn't they be removed from the documentation ?

I think leaving them in the documentation but marking them as
"deprecated" makes sense.

> > However, since you are willing to break compatibility, then you should
> > the generic NAND binding and use nand-ecc-mode adding the values you
> > need.
> > 
> > Documentation/devicetree/bindings/mtd/nand.txt:
> > * MTD generic binding
> > 
> > - nand-ecc-mode : String, operation mode of the NAND ecc mode.
> >   Supported values are: "none", "soft", "hw", "hw_syndrome",
> > "hw_oob_first",
> >   "soft_bch".
> 
> Yes I can use generic 'nand-ecc-mode', But the binding values like
> "soft", "hw", "soft_bch" are too generic to describe the hardware.
> - BCH ECC scheme can itself be of multiple types, bch4/bch8/bch16
>   so "soft_bch" is ambiguous.
> - Similarly "soft" and "hw" do not determine the algorithm used
>    like Hamming or BCH.
> 
> (a) Should I update the generic binding values (if no one else is using) ? like 
> 	sw -> ham1_sw
> 	hw -> ham1_hw
> 	soft_bch-> soft_bch4, soft_bch8
> OR 
> (b) Should I add newer ones to it (like "ham1", "bch4", "bch8", "bch16") ?
>       keeping the old ones intact. And how should I handle un-supported
>      values, (Is pr_err during kernel probe enough ?).

The existing nand-ecc-mode binding is a bit peculiar and hard to
maintain generically for all NAND, IMO. ECC is often very specific to
each driver/controller. What's to say that a given software BCH4 library
(such as the one found in Linux) will match a given controller's HW BCH4
layout and encoding format? Perhaps Pekon's OMAP NAND driver can
straighten things out such that HW and SW ECC are interchangeable for a
given BCH mode, but we can't guarantee all drivers/controllers make this
possible.

So, what's the advantage of using this generic binding (nand-ecc-mode)
for all NAND hardware instead of defining distinct hardware-specific
bindings for different sets of hardware? The former seems like we will
clutter up the nand-ecc-mode namespace such that any one set of
hardware/software will only support a small subset of the potential
options. And it doesn't seem to win us a lot.

What's more, this single binding doesn't seem flexible enough for the
hardware I deal with. I have a NAND controller whose ECC HW can be
programmed to one of dozens of different ECC modes, parameterized by
strength (i.e., BCH-x, where x varies) and ECC step/sector size (i.e.,
each ECC block covers 512B or 1024B of data).

So I'm not convinced that extending this nand-ecc-mode property is
correct at all. But if we do want to, perhaps we'd need to introduce
additional orthogonal properties to specify strength and step size,
rather than listing all combinations as separate values for
nand-ecc-mode.

Brian
