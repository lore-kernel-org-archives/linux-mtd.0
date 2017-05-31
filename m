Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dG0T6-0001SY-K6
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 10:03:10 +0000
Date: Wed, 31 May 2017 12:02:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Peter Pan =?UTF-8?B?5r2Y5qCL?= (peterpandong)" <peterpandong@micron.com>
Cc: "richard@nod.at" <richard@nod.at>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "arnaud.mouiche@gmail.com"
 <arnaud.mouiche@gmail.com>, "thomas.petazzoni@free-electrons.com"
 <thomas.petazzoni@free-electrons.com>, "marex@denx.de" <marex@denx.de>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "peterpansjtu@gmail.com" <peterpansjtu@gmail.com>,
 "linshunquan1@hisilicon.com" <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 11/15] nand: spi: add basic operations support
Message-ID: <20170531120246.60e3009e@bbrezillon>
In-Reply-To: <B7799737-B040-4824-BBAF-5A0510CD553C@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-12-git-send-email-peterpandong@micron.com>
 <20170530001152.1d8beb72@bbrezillon>
 <B7799737-B040-4824-BBAF-5A0510CD553C@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Peter,

On Wed, 31 May 2017 06:51:34 +0000
Peter Pan =E6=BD=98=E6=A0=8B (peterpandong) <peterpandong@micron.com> wrote:

> >> +/**
> >> + * spinand_disable_ecc - disable internal ECC
> >> + * @spinand: SPI NAND device structure
> >> + */
> >> +static void spinand_disable_ecc(struct spinand_device *spinand)
> >> +{
> >> +    u8 cfg =3D 0;
> >> +
> >> +    spinand_get_cfg(spinand, &cfg);
> >> +
> >> +    if ((cfg & CFG_ECC_MASK) =3D=3D CFG_ECC_ENABLE) {
> >> +        cfg &=3D ~CFG_ECC_ENABLE;
> >> +        spinand_set_cfg(spinand, cfg);
> >> +    } =20
> >=20
> > Is this really a generic (manufacturer-agnostic) feature??? I had the
> > feeling that is was only working for Micron. If that's the case, this
> > 'disable-ecc' step should be done in spi/micron.c in a
> > micron_spinand_init() function. =20
>=20
> As far as I can see, Micron is not the only vendor to disable on die ecc=
=20
> by this way, actually all vendors I know use this .

Hm, ok. I'm a bit skeptical (vendors tend to implement this kind of
feature with vendor specific commands, but maybe it has changed with SPI
NANDs), but I'll trust you on this one.=20

> And this series=20
> doesn't support on die ecc, so IMO it is necessary to disable it during
> initialization

Actually I was not arguing on the need to disable on-die ECC, just
wasn't sure this should be done in the core. If it's really generic,
then it's fine.

>=20
> >  =20
> >> +}

[...]

> >>=20
> >> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> >> index dd9da71..04ad1dd 100644
> >> --- a/include/linux/mtd/spinand.h
> >> +++ b/include/linux/mtd/spinand.h
> >> @@ -103,11 +103,14 @@ struct spinand_controller_ops {
> >>  *          return directly and let others to detect.
> >>  * @init: initialize SPI NAND device.
> >>  * @cleanup: clean SPI NAND device footprint.
> >> + * @prepare_op: prepara read/write operation. =20
> >=20
> >           ^ prepare
> >=20
> >=20
> >  =20
> >>  */
> >> struct spinand_manufacturer_ops {
> >>    bool (*detect)(struct spinand_device *spinand);
> >>    int (*init)(struct spinand_device *spinand);
> >>    void (*cleanup)(struct spinand_device *spinand);
> >> +    void (*prepare_op)(struct spinand_device *spinand,
> >> +               struct spinand_op *op, u32 page, u32 column); =20
> >=20
> > It seems to be here to prepare read/write page operations, so I'd like
> > to rename this method ->prepare_page_op() if you don't mind. =20
>=20
> I'm ok with the new name

Actually, in the mean time I asked Cyrille how dummy cycles were
handled in the spi-nor subsystem and how spi flash controllers are
dealing with such dummy cycles. It seems that some controllers are able
to handle those dummy cycles on their own (without any software
intervention to skip bits or move things around in output bufs.

I'll let Cyrille comment on this specific aspect, but I wonder if we
shouldn't just specify the number of dummy cycles and let the
controller handle that.

Regards,

Boris
