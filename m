Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcKfN-0005SQ-HY
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 17:04:38 +0000
Date: Thu, 30 Jun 2011 19:04:32 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC controller
	driver
Message-ID: <20110630170432.GA20948@pengutronix.de>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
	<1309335878-16678-2-git-send-email-b32955@freescale.com>
	<20110630102728.GB1997@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20110630102728.GB1997@pengutronix.de>
Cc: thierry.nolf.barco@gmail.com, dedekind1@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2011 at 12:27:28PM +0200, Wolfram Sang wrote:
>=20
> > +static int mil_ecc_write_oob(struct mtd_info *mtd,
> > +				struct nand_chip *nand, int page)
> > +{
> > +	struct gpmi_nfc_data *this =3D nand->priv;
> > +	struct device *dev =3D this->dev;
> > +	struct mil *mil	=3D &this->mil;
> > +	uint8_t *block_mark;
> > +	int block_mark_column;
> > +	int status;
> > +	int error =3D 0;
> > +
> > +	/* Only marking a block bad is permitted to write the OOB. */
> > +	if (!mil->marking_a_bad_block) {
> > +		dev_emerg(dev, "This driver doesn't support writing the OOB\n");
> > +		WARN_ON(1);
> > +		error =3D -EIO;
> > +		goto exit;
> > +	}
>=20
> Huh? Why is that? This will break JFFS2, for example.

-----------------------------------------------------------------
The GPMI-NFC driver will use the OOB(BCH will use the OOB for a special lay=
out), so we forbid any others to use the OOB.
But marking a block bad is permitted.

If the JFFS2 use the OOB, we have to disable it
We use UBIFS by default.

-----------------------------------------------------------------

(Please use a proper mailer)

Why can't you define a nand_ecclayout with no free space?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk4MrKAACgkQD27XaX1/VRvgpACeKRdZReHj7l6VDjxtkFTGsDrm
Z0UAn2XeAhsE2qMB75ujwGU1T91uAYeE
=Mgrd
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
