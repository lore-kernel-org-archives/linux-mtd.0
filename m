Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve4Gd-0001xg-R1
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 14:39:37 +0000
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MVU00LC9J9RJ7A0@mailout2.w1.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 14:39:12 +0000 (GMT)
From: Tomasz Figa <t.figa@samsung.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: add a new DT property to use the datasheet's
 minimum required ECC
Date: Wed, 06 Nov 2013 15:39:07 +0100
Message-id: <1818094.INS0lkJjja@amdc1227>
In-reply-to: <20131105200729.GT20061@ld-irv-0074.broadcom.com>
References: <1382929517-22606-1-git-send-email-b32955@freescale.com>
 <20131105200729.GT20061@ld-irv-0074.broadcom.com>
MIME-version: 1.0
Content-transfer-encoding: 7Bit
Content-type: text/plain; charset=us-ascii
Cc: Huang Shijie <b32955@freescale.com>, devicetree@vger.kernel.org,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tuesday 05 of November 2013 12:07:29 Brian Norris wrote:
> On Mon, Oct 28, 2013 at 11:05:17AM +0800, Huang Shijie wrote:
> > In default way, we use the ecc_strength/ecc_step size calculated by ourselves
> > and use all the OOB area.
> > 
> > This patch adds a new property : "fsl,use-minimum-ecc"
> > 
> > If we enable it, we will firstly try to use the datasheet's minimum required
> > ECC provided by the MTD layer (the ecc_strength_ds/ecc_step_ds fields
> > in the nand_chip{}). So we may have free space in the OOB area by using the
> > minimum ECC, and we may support JFFS2 with some SLC NANDs, such as Micron's
> > SLC NAND.
> > 
> > If we fail to use the minimum ECC, we will use the legacy method to calculate
> > the ecc_strength and ecc_step size.
> > 
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > ---
> > v1 --> v2:
> > 	based on David's patch to fix the regression.
> > ---
> >  .../devicetree/bindings/mtd/gpmi-nand.txt          |    6 ++++++
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    3 +++
> >  2 files changed, 9 insertions(+), 0 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> > index 551b2a1..4297795 100644
> > --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> > @@ -17,6 +17,12 @@ Required properties:
> >  Optional properties:
> >    - nand-on-flash-bbt: boolean to enable on flash bbt option if not
> >                         present false
> > +  - fsl,use-minimum-ecc: By enabling this boolean property, the gpmi will try
> > +                       to use the datasheet's minimum required ECC provided by
> > +                       the MTD layer (the ecc_strength_ds/ecc_step_ds fields
> > +                       in the nand_chip{}). So we may have free space in the OOB
> > +                       area by using the minimum ECC, and we may support JFFS2
> > +                       with some SLC NANDs, such as Micron's SLC NAND.
> 
> This description still uses Linux-isms/MTD-isms (ecc_strength_ds,
> ecc_step_ds, nand_chip{}, JFFS2). I would personally write this as
> something like the following:
> 
>   - fsl,use-minimum-ecc: Protect this NAND flash with the minimum ECC
> 			 strength required. The required ECC strength is
> 			 automatically discoverable for some flash
> 			 (e.g., according to the ONFI standard).
> 			 However, note that if this strength is not
> 			 discoverable, the software may choose an
> 			 implementation-defined ECC scheme.

After reading this description, it is not clear to me what is the default
behavior if this property is not present.

Best regards,
Tomasz
