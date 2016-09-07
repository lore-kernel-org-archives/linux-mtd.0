Received: from da1vs01.rockwellcollins.com ([205.175.227.27])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhV3M-0005dI-0O
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 05:05:41 +0000
Received: by mail-yb0-f199.google.com with SMTP id g5so10078766yba.3
 for <linux-mtd@lists.infradead.org>; Tue, 06 Sep 2016 22:05:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160906215540.56c90b87@bbrezillon>
References: <1473190357-54219-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160906215540.56c90b87@bbrezillon>
From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 7 Sep 2016 00:05:16 -0500
Message-ID: <CANQCQpa6=9=2LXJanGZxW-kSDZoA8MFTVKfiUGLKMKofGq-G=A@mail.gmail.com>
Subject: Re: [PATCH] fsl_ifc_nand: Added dts support for SW BCH ECC
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Dipen.Dudhat@freescale.com,
 sgtandel <sanjay.tandel@rockwellcollins.com>, oss@buserror.net,
 prabhakar.kushwaha@nxp.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Apologize for top post.

Dipen seems to have moved on.  Adding new CC(s).

Cc: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: Steve Wood  <oss@buserror.net>

On Tue, Sep 6, 2016 at 2:55 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
>
> On Tue,  6 Sep 2016 14:32:37 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > Added "nand-sw-ecc-bch", "nand-sw-ecc-block" and "nand-sw-ecc-strength"
> > properties for software based BCH ECC. So if driver finds these
> > properies in DTS NAND flash node, it disables HW ECC and sets ecc
> > mode to NAND_ECC_SOFT_BCH and initializes ecc params.
>
> Please don't do that. We already have standard properties to select the
> ECC engine and its config (nand-ecc-mode, nand-ecc-algo,
> nand-ecc-strength and nand-ecc-step-size).
>
> You even don't have to manually parse these properties, all you have to
> do is test the chip->ecc.mode and chip->ecc.algo after you've called
> nand_scan_ident(). Based on these values, you can decide to
> configure/use your ECC engine or let the core initialize the SW ECC
> engine for you.
>
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > Signed-off-by: sgtandel <sanjay.tandel@rockwellcollins.com>
> > ---
> >  drivers/mtd/nand/fsl_ifc_nand.c | 32 ++++++++++++++++++++++++++++++--
> >  1 file changed, 30 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> > index 4e9e5fd..1d74ce5 100644
> > --- a/drivers/mtd/nand/fsl_ifc_nand.c
> > +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> > @@ -806,7 +806,8 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
> >       struct fsl_ifc_runtime __iomem *ifc_runtime = ctrl->rregs;
> >       struct nand_chip *chip = &priv->chip;
> >       struct mtd_info *mtd = nand_to_mtd(&priv->chip);
> > -     u32 csor;
> > +     u32 csor, csor_swecc;
> > +     struct device_node *np = priv->dev->of_node;
> >
> >       /* Fill in fsl_ifc_mtd structure */
> >       mtd->dev.parent = priv->dev;
> > @@ -879,8 +880,35 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
> >               return -ENODEV;
> >       }
> >
> > +     /* Independent of u-boot's csor settings, If we have "nand-sw-ecc-bch40"
> > +        property set in device tree's nand flash node, enable 40-bit sw bch ecc */
> > +     if (of_property_read_bool(np, "nand-sw-ecc-bch")) {
> > +
> > +             csor_swecc = csor & (~CSOR_NAND_ECC_DEC_EN &
> > +                             ~CSOR_NAND_ECC_ENC_EN & ~CSOR_NAND_ECC_MODE_8);
> > +             ifc_out32(csor_swecc, &ifc_global->csor_cs[priv->bank].csor);
> > +             chip->ecc.mode = NAND_ECC_SOFT_BCH;
> > +
> > +             /* ECC Block */
> > +             if (of_property_read_u32(np, "nand-sw-ecc-block", &chip->ecc.size)) {
> > +                     dev_warn(priv->dev,"devicetree nand-sw-ecc-block property not found\n");
> > +                     chip->ecc.size = 1024;          /* ECC block default */
> > +             }
> > +
> > +             /* ECC Strength */
> > +             if (of_property_read_u32(np, "nand-sw-ecc-strength", &chip->ecc.strength)) {
> > +                     dev_warn(priv->dev,"devicetree nand-sw-ecc-strength property not found\n");
> > +                     chip->ecc.strength = 40;        /* 40-bit ECC */
> > +             }
> > +
> > +              /* Enough bytes to store m*t bits */
> > +             chip->ecc.bytes = ((fls(1 + 8 * chip->ecc.size) * chip->ecc.strength) + 7) / 8;
> > +             chip->ecc.layout = NULL;
> > +             dev_dbg(priv->dev, "NAND_ECC_SOFT_BCH enabled. Strength %d per %d bytes. m*t=%d\n",
> > +                                             chip->ecc.strength, chip->ecc.size, chip->ecc.bytes);
> > +     }
> >       /* Must also set CSOR_NAND_ECC_ENC_EN if DEC_EN set */
> > -     if (csor & CSOR_NAND_ECC_DEC_EN) {
> > +     else if (csor & CSOR_NAND_ECC_DEC_EN) {
> >               chip->ecc.mode = NAND_ECC_HW;
> >               mtd_set_ooblayout(mtd, &fsl_ifc_ooblayout_ops);
> >
>



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber@corp.rockwellcollins.com.
