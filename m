Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aKebY-0003Hu-Nk
 for linux-mtd@lists.infradead.org; Sun, 17 Jan 2016 04:06:17 +0000
Date: Sat, 16 Jan 2016 22:05:52 -0600
From: Rob Herring <robh@kernel.org>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: "Yang, Wenyou" <Wenyou.Yang@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Josh Wu <rainyfeeling@outlook.com>,
 "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>
Subject: Re: [PATCH v1 3/5] mtd: atmel_nand: Support PMECC on SAMA5D2
Message-ID: <20160117040552.GA28704@rob-hp-laptop>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-4-git-send-email-romain.izard.pro@gmail.com>
 <20160114011252.GA29778@rob-hp-laptop>
 <B256D81BAE5131468A838E5D7A243641D63EBC55@penmbx01>
 <CAL_JsqL9kbNYrGYeqT7QCsbMneJbPgoXfaHhCvL8S=t97YaCbg@mail.gmail.com>
 <CAGkQfmO94gQ61prZvF52=B_UtOTkbYxd5nnTmDhJam4q-n3T7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGkQfmO94gQ61prZvF52=B_UtOTkbYxd5nnTmDhJam4q-n3T7g@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 15, 2016 at 09:54:07AM +0100, Romain Izard wrote:
> Hi Rob, Wenyou,
> 
> 2016-01-14 14:14 GMT+01:00 Rob Herring <robh@kernel.org>:
> > On Wed, Jan 13, 2016 at 7:17 PM, Yang, Wenyou <Wenyou.Yang@atmel.com> wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Rob Herring [mailto:robh@kernel.org]
> >>> Sent: 2016年1月14日 9:13
> >>> To: Romain Izard <romain.izard.pro@gmail.com>
> >>> Cc: linux-mtd@lists.infradead.org; devicetree@vger.kernel.org; Yang, Wenyou
> >>> <Wenyou.Yang@atmel.com>; Josh Wu <rainyfeeling@outlook.com>; Ferre,
> >>> Nicolas <Nicolas.FERRE@atmel.com>
> >>> Subject: Re: [PATCH v1 3/5] mtd: atmel_nand: Support PMECC on SAMA5D2
> >>>
> >>> On Wed, Jan 13, 2016 at 05:34:15PM +0100, Romain Izard wrote:
> >>> > Starting with the SAMA5D2, there is a new revision of the Atmel PMECC
> >>> > controller that can correct 32 bits in each sector. This controller is
> >>> > not 100% compatible with the previous revision that corrected a
> >>> > maximum of 24 bits by sector, as some register addresses overlap.
> >>> >
> >>> > Using information from the device tree, we can configure the driver to
> >>> > work with both versions.
> >>> >
> >>> > Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> >>> > ---
> >>> >  .../devicetree/bindings/mtd/atmel-nand.txt         |  7 +++++--
> >>> >  drivers/mtd/nand/atmel_nand.c                      | 23 +++++++++++++++++++++-
> >>> >  drivers/mtd/nand/atmel_nand_ecc.h                  |  8 ++++++--
> >>> >  3 files changed, 33 insertions(+), 5 deletions(-)
> >>> >
> >>> > diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> >>> > b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> >>> > index 89b0db9801b0..90887b430f03 100644
> >>> > --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> >>> > +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> >>> > @@ -1,7 +1,10 @@
> >>> >  Atmel NAND flash
> >>> >
> >>> >  Required properties:
> >>> > -- compatible : should be "atmel,at91rm9200-nand" or "atmel,sama5d4-nand".
> >>> > +- compatible: The possible values are:
> >>> > +   "atmel,at91rm9200-nand"
> >>> > +   "atmel,sama5d2-nand"
> >>> > +   "atmel,sama5d4-nand"
> >>> >  - reg : should specify localbus address and size used for the chip,
> >>> >     and hardware ECC controller if available.
> >>> >     If the hardware ECC is PMECC, it should contain address and size for
> >>> > @@ -22,7 +25,7 @@ Optional properties:
> >>> >    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
> >>> >    "soft_bch".
> >>> >  - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware.
> >>> > -  Only supported by at91sam9x5 or later sam9 product.
> >>> > +  Supported by AT91SAM9x5 or later SAM9 chips, and SAMA5 chips.
> >>>
> >>> What compatible string would AT91SAM9x5 be?
> >>
> >> "atmel,at91rm9200-nand".
> >
> > Answer the question in the binding doc by saying which compatible
> > strings a property is valid for.
> 
> I'm trying to rewrite the documentation for this point, and in the end it
> seems to me that the line should be removed instead.
> 
> Adding the 'atmel,has-pmecc' property to a SoC device tree is the normal way
> to describe that it supports this type of controller. If we need to write it
> in the documentation as well, it's a duplicate information that can become
> stale quite fast, as it was before.
> 
> In the end, I believe the best path is to describe better what PMECC is,
> instead of describing as "the controller found in this kind of chip".

Okay, that is important too. We are wanting to move binding 
documentation to something more structured where we can do some amount 
of validation of dts files against binding documentation. So that is why 
I am thinking in terms of having the information to validate a dts. But 
we are a ways off from doing such a thing.

Rob
