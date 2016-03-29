Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akoTA-0005gQ-I0
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2016 07:53:46 +0000
Date: Tue, 29 Mar 2016 09:53:05 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Graham Moore
 <grmoore@opensource.altera.com>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, devicetree@vger.kernel.org, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Richard Weinberger
 <richard@nod.at>, Kumar Gala <galak@codeaurora.org>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Brian Norris
 <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, David
 Woodhouse <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] mtd: nand: denali: allow to override max_banks from DT
 property
Message-ID: <20160329095305.46229ad5@bbrezillon>
In-Reply-To: <CAK7LNATqVEMRwa+Ss4V9sBXYZwqKX=CpB_3Oox8bM6Yow0mkXA@mail.gmail.com>
References: <1458822277-31428-1-git-send-email-yamada.masahiro@socionext.com>
 <20160325154520.199b0863@bbrezillon>
 <CAK7LNATqVEMRwa+Ss4V9sBXYZwqKX=CpB_3Oox8bM6Yow0mkXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm answering to this one, but I already saw your v2.

On Sat, 26 Mar 2016 13:27:50 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2016-03-25 23:45 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Thu, 24 Mar 2016 21:24:37 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >
> >> Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
> >> changed in revision 5.1") supported the new encoding of the "n_banks"
> >> bits of the "features" register, but there is an unfortunate case
> >> that is not covered by that commit.
> >>
> >> Panasonic (its System LSI division is now Socionext) bought several
> >> versions of this IP.  The IP released for Panasonic around Feb. 2012
> >> is revision 5 and uses the old encoding for n_banks (2 << n_banks).
> >> While the one released around Nov. 2012 is also revision 5, but it
> >> uses the new encoding (1 << n_banks).
> >>
> >> The revision register cannot distinguish these two incompatible
> >> hardware.  I guess this IP series is not well-organized.  I could not
> >> find any alternative but giving max_banks from DT property.
> >
> > Hm, shouldn't that be addressed with a new compatible instead of adding
> > a extra property?

You didn't answer to this suggestion. I see several advantages in this
approach:

1/ You'll only break the DT once (to add your new compatible) even if
you got your logic wrong. All you'll have to do in this case is patch
your driver to change the compatible <-> capabilities association

2/ This may not be the only difference between the 2 revisions, and
in this case, putting the compatible <-> capabilities association
directly in your driver will allow you to easily tweak capabilities
per-revision

> >
> >>
> >> This commit works around the problem by allowing DT to set the
> >> max_banks forcibly.  Of course, this DT property can be optional if
> >> the auto detection based on the hardware registers works well.
> >>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> ---
> >>
> >>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 4 ++++
> >>  drivers/mtd/nand/denali.c                             | 3 ++-
> >>  drivers/mtd/nand/denali_dt.c                          | 3 +++
> >>  3 files changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> >> index 785b825..78c250d 100644
> >> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> >> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> >> @@ -7,6 +7,10 @@ Required properties:
> >>    - interrupts : The interrupt number.
> >>    - dma-mask : DMA bit mask
> >>
> >> +Optional properties:
> >> +  - max-banks : Maximum number of banks supported by hardware.  If not
> >> +    specified, it is determined based on the "features" register of hardware.
> >> +
> >
> > You might want to prefix that with "denali,".
> >
> >>  The device tree may optionally contain sub-nodes describing partitions of the
> >>  address space. See partition.txt for more detail.
> 
> 
> In which case, do we have to add a vendor prefix to DT properties?
> 
> I do not know a clear rule about this.

Usually you add a vendor prefix when the property only applies to a
specific controller/IP. In the NAND specific case, most NAND
controllers have a fixed number of banks which can be deduced from the
IP revision/version. I'd like to keep it like that and avoid seeing
other drivers use this max-banks property to deduce the number of
available banks, hence my suggestion to, at least, prefix your property
with "denali,". But I'd still prefer to see the max-banks value be
associated to a new compatible.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
