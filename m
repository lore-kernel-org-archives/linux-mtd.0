Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eo5rN-0004m3-OI
 for linux-mtd@lists.infradead.org; Tue, 20 Feb 2018 11:13:23 +0000
Date: Tue, 20 Feb 2018 12:12:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH 2/6] mtd: nand: Use wrappers to call onfi GET/SET_FEATURES
Message-ID: <20180220121259.22ea6cf9@xps13>
In-Reply-To: <20180206155508.071dc8a1@bbrezillon>
References: <20180203095544.9855-1-miquel.raynal@bootlin.com>
 <20180203095544.9855-3-miquel.raynal@bootlin.com>
 <20180206155508.071dc8a1@bbrezillon>
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

Hi Boris,

On Tue, 6 Feb 2018 15:55:08 +0100, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> On Sat,  3 Feb 2018 10:55:40 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> >  /**
> > - * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
> > + * nand_set_features_default - [REPLACEABLE] set features for ONFI NAND
> >   * @mtd: MTD device structure
> >   * @chip: nand chip info structure
> >   * @addr: feature address.
> >   * @subfeature_param: the subfeature parameters, a four bytes array.
> >   */
> > -static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_ch=
ip *chip,
> > -			int addr, uint8_t *subfeature_param)
> > +static int nand_set_features_default(struct mtd_info *mtd,
> > +				     struct nand_chip *chip, int addr,
> > +				     uint8_t *subfeature_param) =20
>=20
> This name change is not mentioned in the commit message, and it's
> probably something you should do in a separate patch. And how about
> moving the default specifier just after nand_ =3D>
> nand_default_set_features().

This change has been moved in a separate patch, that will be integrated
in the series that prepares to this one (about a better handling of
timings in the core).

>=20
> >  {
> > -	if (!chip->onfi_version ||
> > -	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> > -	      & ONFI_OPT_CMD_SET_GET_FEATURES))
> > -		return -EINVAL;
> > -
> >  	return nand_set_features_op(chip, addr, subfeature_param);
> >  }
> > =20
> >  /**
> > - * nand_onfi_get_features- [REPLACEABLE] get features for ONFI nand
> > + * nand_get_features_default - [REPLACEABLE] get features for ONFI NAND
> >   * @mtd: MTD device structure
> >   * @chip: nand chip info structure
> >   * @addr: feature address.
> >   * @subfeature_param: the subfeature parameters, a four bytes array.
> >   */
> > -static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_ch=
ip *chip,
> > -			int addr, uint8_t *subfeature_param)
> > +static int nand_get_features_default(struct mtd_info *mtd,
> > +				     struct nand_chip *chip, int addr,
> > +				     uint8_t *subfeature_param) =20
>=20
> Ditto.
>=20
> >  {
> > -	if (!chip->onfi_version ||
> > -	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> > -	      & ONFI_OPT_CMD_SET_GET_FEATURES))
> > -		return -EINVAL;
> > -
> >  	return nand_get_features_op(chip, addr, subfeature_param);
> >  }
> > =20
> > @@ -5015,9 +5056,9 @@ static void nand_set_defaults(struct nand_chip *c=
hip)
> > =20
> >  	/* set for ONFI nand */
> >  	if (!chip->onfi_set_features)
> > -		chip->onfi_set_features =3D nand_onfi_set_features;
> > +		chip->onfi_set_features =3D nand_set_features_default;
> >  	if (!chip->onfi_get_features)
> > -		chip->onfi_get_features =3D nand_onfi_get_features;
> > +		chip->onfi_get_features =3D nand_get_features_default; =20
>=20
> We should probably also rename the hooks at some point, because GET/SET
> FEATURES operations are not limited to ONFi compliant chips.

Done. Will also be in the other series. Next version is coming soon.

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
