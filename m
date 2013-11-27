Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlTrK-0004rd-Hc
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 01:24:07 +0000
Received: by mail-ie0-f180.google.com with SMTP id tp5so10462113ieb.39
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 17:23:43 -0800 (PST)
Date: Tue, 26 Nov 2013 17:23:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to
 automatically determine bus width
Message-ID: <20131127012338.GS9468@ld-irv-0074.broadcom.com>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131127012158.GR9468@ld-irv-0074.broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <rob.herring@calxeda.com>,
 linux-mtd@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Eric Miao <eric.y.miao@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 26, 2013 at 05:21:58PM -0800, Brian Norris wrote:
> + Pekon, Ezequiel

+ Pekon, Ezequiel for real this time! Sorry... Everything else intact
/Brian

> 
> Hi Alexander,
> 
> We're dealing with a similar issue in other drivers currently, and I
> think it's worth straightening out the issue for all systems.
> 
> On Wed, Nov 13, 2013 at 03:58:02PM +0400, Alexander Shiyan wrote:
> > This patch adds a property to automatically determine the NAND
> > bus width by CFI/ONFI information from chip. This property works
> > if the bus width is not specified explicitly.
> 
> This issue brings up a few questions in my mind, which are relevant to
> device tree in general.
> 
> First of all, do we need a device tree property at all, for something
> that is auto-detectable?
> 
> Related: is a device tree consumer (like Linux) supposed to be a
> validator, or simply a best-effort? I'm considering the following case:
> if Linux is allowed to auto-detect some property which also has a device
> tree binding (e.g., "nand-bus-width", in
> Documentation/devicetree/bindings/mtd/nand.txt), what should happen if
> the binding happens to be incorrect? IOW, what if the device tree
> specifies buswidth is x16, but Linux correctly detects it as x8?
> Shouldn't we make the best effort to bring the hardware up, regardless
> of what the device tree says?
> 
> So for something like this GPIO driver, I'm thinking that Linux should
> just use NAND_BUSWIDTH_AUTO all the time [*]. But (as I'm hinting above)
> that would allow DTB firmware implementors to be lazier and have a
> technically-incorrect "nand-bus-width" or "bank-width" binding, since
> they know it can reliably be detected and overridden by Linux.
> 
> [*] Except where resource_size(res) < 2, as Alexander already has in
> this patch.
> 
> > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> > ---
> >  .../devicetree/bindings/mtd/gpio-control-nand.txt        |  3 +++
> >  drivers/mtd/nand/gpio.c                                  | 16 ++++++++++++----
> >  2 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> > index 36ef07d..fe4e960 100644
> > --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> > @@ -19,6 +19,9 @@ Optional properties:
> >    defaults to 1 byte.
> >  - chip-delay : chip dependent delay for transferring data from array to
> >    read registers (tR).  If not present then a default of 20us is used.
> > +- gpio-control-nand,bank-width-auto : Device bus width is determined
> > +  automatically by CFI/ONFI information from chip if "bank-width"
> > +  parameter is omitted (Boolean).
> 
> If we do resort to a new binding for auto-buswidth, it should be a
> generic one that all NAND drivers can use. Maybe a separate boolean
> "nand-bus-width-auto" and if it is present, then it overrules the
> presence (or lack) of the "nand-bus-width" boolean property?
> Or is it possible to extend "nand-bus-width" to allow the value of 0 to
> mean automatic?
> 
> You may want to modify the of_get_nand_bus_width() helper (or add a new
> one, of_nand_bus_width_auto()?) to drivers/of/of_mtd.c to assist with
> this.
> 
> ...BTW, it looks like we have a duplicate binding here: GPIO NAND
> defines "bank-width" where generic NAND defines "nand-bus-width". Aren't
> these essentially duplications? Can we support the generic binding in
> gpio.c and discourage "bank-width"? Or is that just unnecessary effort?
> 
> >  - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
> >    location used to guard against bus reordering with regards to accesses to
> >    the GPIO's and the NAND flash data bus.  If present, then after changing
> 
> [...]
> 
> Brian
