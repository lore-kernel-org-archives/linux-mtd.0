Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbs5X-000466-OO
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 10:33:44 +0000
Date: Wed, 29 Jun 2011 12:33:37 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC
	controller driver
Message-ID: <20110629103337.GF1992@pengutronix.de>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
	<1309335878-16678-2-git-send-email-b32955@freescale.com>
	<20110629100658.GE1992@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
Content-Disposition: inline
In-Reply-To: <20110629100658.GE1992@pengutronix.de>
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


--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > +static int __devinit acquire_interrupt(struct gpmi_nfc_data *this,
> > +			const char *resource_name,
> > +			irq_handler_t interrupt_handler, int *lno, int *hno)
> > +{
> > +	struct platform_device *pdev =3D this->pdev;
> > +	struct resource *r;
> > +	int err;
> > +
> > +	r =3D platform_get_resource_byname(pdev, IORESOURCE_IRQ, resource_nam=
e);
> > +	if (!r) {
> > +		pr_info("Can't get resource for %s\n", resource_name);
> > +		return -ENXIO;
> > +	}
> > +
> > +	BUG_ON(r->start !=3D r->end);
> > +	err =3D request_irq(r->start, interrupt_handler, 0, resource_name, th=
is);
> > +	if (err) {
> > +		pr_info("Can't own %s\n", resource_name);
> > +		return err;
> > +	}
> > +
> > +	*lno =3D r->start;
> > +	*hno =3D r->end;
> > +	return 0;
> > +}
>=20
> This will not work if max_chip_count > 1, because the irq is already
> taken. (Also, I am not convinced of the resource handling, but I need to

Doh, I wrote that below the wrong codepath. This is another irq here.
Still, the problem exists: When a second channel GPMI channel is
requested, dmaengine will return -EBUSY, because the DMAIRQ is already
taken.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk4K/4EACgkQD27XaX1/VRvVIgCcC4H01buOCNQCnt2WsaUjfaoc
BvIAn08CPoLOl4qB3fzcch0vrbcjJZPw
=PaNq
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
