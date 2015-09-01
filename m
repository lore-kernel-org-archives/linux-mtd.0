Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWgfW-0000XJ-Ik
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 08:11:51 +0000
Date: Tue, 1 Sep 2015 16:11:17 +0800
From: Huang Shijie <shijie.huang@arm.com>
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Han Xu <b45815@freescale.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 fabio.estevam@freescale.com, hofrat@osadl.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 vinod.koul@intel.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org
Subject: Re: [PATCH v3 1/6] mtd: nand: gpmi: add gpmi dsm supend/resume support
Message-ID: <20150901081117.GA14749@free64-pc.asiapac.arm.com>
References: <1440790365-28072-1-git-send-email-b45815@freescale.com>
 <1440790365-28072-2-git-send-email-b45815@freescale.com>
 <20150829091740.GC5594@opentech.at>
MIME-Version: 1.0
In-Reply-To: <20150829091740.GC5594@opentech.at>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 29, 2015 at 11:17:40AM +0200, Nicholas Mc Guire wrote:
> On Fri, 28 Aug 2015, Han Xu wrote:
>=20
> > From: Huang Shijie <b32955@freescale.com>
> >=20
> > i.MX6SX supports deep sleep mode(DSM) that may turn off GPMI/BCH power
> > during suspend, add gpmi nand suspend/resume function to release DMA
> > channel in suspend function and re-init GPMI/BCH controller during
> > resume function.
> >
>=20
> Just a question regarding gpmi_pm_resume() errror reporting
> Is there a reason that the retrun value of gpmi_extra_init() is not check=
ed ?
> gpmi_extra_init() can retrun -ENOMEM or -EINVAL via return enable_edo_mod=
e(),
> while the -EINVAL would produce a dev_err message, -ENOMEM does not so ma=
ybe
> this also wants to include a if(ret) {...} ? - something like the below
> =20
> > Although it is not necessary to restore GPMI/BCH registers value for
> > i.MX6QDL, the code doesn't distinguish different platforms to keep the
> > code simple.
> >=20
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > Signed-off-by: Han Xu <han.xu@freescale.com>
> > ---
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 45 ++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 44 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> > index 1b8f350..dfd0ba1 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -1,7 +1,7 @@
> >  /*
> >   * Freescale GPMI NAND Flash Driver
> >   *
> > - * Copyright (C) 2010-2011 Freescale Semiconductor, Inc.
> > + * Copyright (C) 2010-2015 Freescale Semiconductor, Inc.
> >   * Copyright (C) 2008 Embedded Alley Solutions, Inc.
> >   *
> >   * This program is free software; you can redistribute it and/or modif=
y
> > @@ -2036,9 +2036,52 @@ static int gpmi_nand_remove(struct platform_devi=
ce *pdev)
> >  =09return 0;
> >  }
> > =20
> > +static int gpmi_pm_suspend(struct device *dev)
> > +{
> > +=09struct gpmi_nand_data *this =3D dev_get_drvdata(dev);
> > +
> > +=09release_dma_channels(this);
> > +=09return 0;
> > +}
> > +
> > +static int gpmi_pm_resume(struct device *dev)
> > +{
> > +=09struct gpmi_nand_data *this =3D dev_get_drvdata(dev);
> > +=09int ret;
> > +
> > +=09ret =3D acquire_dma_channels(this);
> > +=09if (ret < 0)
> > +=09=09return ret;
> > +
> > +=09/* re-init the GPMI registers */
> > +=09this->flags &=3D ~GPMI_TIMING_INIT_OK;
> > +=09ret =3D gpmi_init(this);
> > +=09if (ret) {
> > +=09=09dev_err(this->dev, "Error setting GPMI : %d\n", ret);
> > +=09=09return ret;
> > +=09}
> > +
> > +=09/* re-init the BCH registers */
> > +=09ret =3D bch_set_geometry(this);
> > +=09if (ret) {
> > +=09=09dev_err(this->dev, "Error setting BCH : %d\n", ret);
> > +=09=09return ret;
> > +=09}
> > +
> > +=09/* re-init others */
> > +=09gpmi_extra_init(this);
>=20
> report failure of enable_edo_mode() ?
>=20
> =09if (ret) {
> =09=09dev_err(this->dev, "Error enabling EDO mode : %d\n", ret);
> =09=09return ret;
> =09}
I think it's better that we do not report the failure of the enable_edo_mod=
e() here.
If we do so, the gpmi may cannot work when the enable_edo_mode() fails.

But if we do not report it, the gpmi still can work.

thanks
Huang Shijie
