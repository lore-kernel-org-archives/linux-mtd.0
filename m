Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yqq9Y-0006du-4E
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 21:49:52 +0000
Received: by pabtp1 with SMTP id tp1so59919304pab.2
 for <linux-mtd@lists.infradead.org>; Fri, 08 May 2015 14:49:29 -0700 (PDT)
Date: Fri, 8 May 2015 14:49:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Message-ID: <20150508214923.GG32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <2213714.99tu5uLKxT@wuerfel> <20150508204725.GD32500@ld-irv-0074>
 <22310765.EUWHaqSZZD@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22310765.EUWHaqSZZD@wuerfel>
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

On Fri, May 08, 2015 at 11:38:11PM +0200, Arnd Bergmann wrote:
> On Friday 08 May 2015 13:47:25 Brian Norris wrote:
> > On Fri, May 08, 2015 at 09:49:02PM +0200, Arnd Bergmann wrote:
> > > On Friday 08 May 2015 12:38:50 Brian Norris wrote:
> > > > On Fri, May 08, 2015 at 03:41:10PM +0200, Arnd Bergmann wrote:
> > > > > bcm63138_nand_driver with its own probe() function that calls the
> > > > > common probe function. That would make the soc specific parts
> > > > > better contained and match how we normally do abstractions of
> > > > > similar drivers.
> > > > 
> > > > OK, so I can imagine this might require changing the DT binding a bit [1]
> > > > (is that your goal?). But what's the intended software difference? [2]
> > > > I'll still be passing around the same sorts of callbacks from the
> > > > 'iproc_nand' probe to the common probe function.
> > 
> > ^^ before getting bogged down on the DT details (which can be changed
> > independently), I'd like to address this point.
> 
> The intended change is to make it work according to
> Documentation/driver-model/design-patterns.txt

Huh? There are two bullet points in that file, and neither are
particularly enlightening for this case. Maybe you're referring to your
mental design patterns documentation? :)

> basically, by having all the shared code be a "library" module that gets
> called by the actual hardware specific drivers, rather than having the
> shared code be the central driver that fans out into all possible subdrivers.

OK, I'll see what I can do. It will be a fairly opaque "library" though,
consisting largely of a single monolithic core driver. Might just move
to a whole drivers/mtd/nand/brcmnand/ subdirectory at the same time...

> > > Yes, I think this makes sense overall. Regarding the specific example, can you
> > > clarify how the register areas in iproc are structured?
> > > 
> > > The 0xf8105408 and 0x18046f00 start addresses are not aligned to large powers
> > > of two, which often indicates that they are part of some other, larger,
> > > unit that might need to have a driver of its own, so before we specify
> > > a binding like the one you proposed above I'd like to make sure we're not
> > > getting ourselves into trouble later.
> > 
> > I may want the Cygnus guys to speak up here, partly for technical
> > expertise and partly to know how much they care to share...
> > 
> > <0xf8105408 0x600>: covers a series of NAND_IDM registers. NAND has a
> > few bits we don't care about (for debugging, logging, and resetting), as
> > well as its interrupt enable bits. The adjacent blocks cover similar IDM
> > blocks for other cores (SPI, PNOR, DDR), and they are similarly
> > unaligned. Not sure why, exactly; probably just a compact layout.
> > 
> > <0x18046f00 0x20>: a series of 8 NAND interrupt registers, each word
> > containing a single bit representing status/clear. There is nothing
> > between the "nand" range and this range, and the SPI core register range
> > follows.
> > 
> > So I think these are pretty clearly-delineated register ranges for NAND,
> > and the alignment is not really missing anything. Adjacent hardware
> > (e.g., SPI) is independent, though pieces look similar. For one, it has
> > similar:
> > 
> >  * interrupt enable bits in the IDM range (0xf8106408 to 0xf8106a00);
> >    and
> >  * interrupt status/clear following the SPI block (0x180473a0 to
> >    0x180473b8)
> 
> This would in turn indicate that we should treat these ranges as
> an irqchip that handles all sorts of devices, but it really depends
> on the particular register layout.

OK, sure. But this has nothing to do with NAND (which we established
cannot be an irqchip on Cygnus). I think SPI is coming through the
pipeline soon, though, and that's a good point.

Brian
