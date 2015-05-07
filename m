Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqI4A-0008ER-PB
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 09:26:03 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH v3 03/10] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Thu, 07 May 2015 11:25:29 +0200
Message-ID: <2668469.V5VmYNtzFN@wuerfel>
In-Reply-To: <554A8537.8050404@broadcom.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <20150506210534.GK32500@ld-irv-0074> <554A8537.8050404@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>,
 Kevin Cernekee <cernekee@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 06 May 2015 14:18:47 Ray Jui wrote:
> 
> On 5/6/2015 2:05 PM, Brian Norris wrote:
> > On Wed, May 06, 2015 at 09:17:36PM +0200, Arnd Bergmann wrote:
> >> On Wednesday 06 May 2015 10:59:47 Brian Norris wrote:
> >>> +
> >>> +static inline u32 nand_readreg(struct brcmnand_controller *ctrl, u32 offs)
> >>> +{
> >>> +       return __raw_readl(ctrl->nand_base + offs);
> >>> +}
> >>> +
> >>> +static inline void nand_writereg(struct brcmnand_controller *ctrl, u32 offs,
> >>> +                                u32 val)
> >>> +{
> >>> +       __raw_writel(val, ctrl->nand_base + offs);
> >>> +}
> >>> +
> >>>
> >>
> >> You had mentioned previously that there might be an endianess issue in this
> >> driver.
> > 
> > Might. I have a patch already, but I failed to boot a BE kernel, so I
> > kept it out for now. If you don't mind, I'd prefer patching something
> > like this once it's testable on ARM BE. This *is*, however, extensively
> > tested on MIPS (LE and BE) and ARM (LE).
> 
> Correct, extensive test and pass all MTD test cases. We should
> eventually be able to test this on a working ARM BE platform, within the
> next couple months.

I'm fine with not testing it on ARM, as long as the code is written in a
way that is plausible to be correct and not obviously broken.


> >> I think this won't work on big-endian architectures other than MIPS,
> >> so it would be good to either list in the DT the endianess of the device
> >> and use appropriate accessors here, or hardcode it based on the architecture
> >> (using ioread32_be in big-endian mips, but readl elsewhere).
> > 
> > I suspect we wouldn't need a DT property but could just special-case
> > MIPS BE, as you note.

Ok


There is one twist here that I forgot to mention:

This loop in brcmnand_read_by_pio() and the respective one in
brcmnand_write_by_pio():

+               if (likely(buf))
+                       for (j = 0; j < FC_WORDS; j++, buf++)
+                               *buf = brcmnand_read_fc(ctrl, j);

should be converted to use ioread32_rep(). There are two reasons for
this: 

a) accessing the flash data is inherently different from accessing an
   mmio register, and you want the bytes to end up in memory in the same
   order that they are in flash. ioread32_rep() uses __raw_readl()
   internally for this purpose, except on architectures that have a
   byte flipping hardware on the bus interface.

b) The implementation is optimized on ARM and will likely give you
   higher throughput than a manual loop using readl().

> >> Using __raw_writel has another problem regarding the DMA capability of this
> >> driver, as it will not flush any write buffers or synchronize caches before
> >> sending data off to the device, so you risk data corruption.
> > 
> > We use mb() before kicking off DMA or other commands.

Ok, that should work, but will be a stronger barrier than necessary on some
architectures. On ARM, mb() is 'dsb(); outer_sync();', while readl only
needs a 'dsb()' and writel() can use dsb(st) that is slightly weaker than
a full dsb().

> >> Also, the
> >> compiler can choose to split up the 32-bit word access into byte accesses,
> >> which on most hardware does not do what you want.
> > 
> > Huh? Wouldn't that break just about every driver in existence? And how
> > is writel() any different than __raw_writel() in that regard? From
> > include/asm-generic/io.h:
> > 
> > static inline void writel(u32 value, volatile void __iomem *addr)
> > {
> >         __raw_writel(__cpu_to_le32(value), addr);
> > }
> > 
> > And BTW, splitting isn't possible on ARM. From
> > arch/arm/include/asm/io.h:
> > 
> > static inline void __raw_writel(u32 val, volatile void __iomem *addr)
> > {
> >         asm volatile("str %1, %0"
> >                      : "+Qo" (*(volatile u32 __force *)addr)
> >                      : "r" (val));
> > }
> > 

Ah right, we changed that one to simplify KVM support. It used to just
do a volatile store for __raw_* but use an assembly for writel_relaxed().

	Arnd
