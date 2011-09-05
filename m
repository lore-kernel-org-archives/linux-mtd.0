Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R0awK-000543-6R
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2011 15:18:25 +0000
Date: Mon, 5 Sep 2011 17:17:52 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v11 1/3] MTD : add the common code for GPMI-NAND
	controller driver
Message-ID: <20110905151752.GA10987@pengutronix.de>
References: <1314616381-11615-1-git-send-email-b32955@freescale.com>
	<1314616381-11615-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <1314616381-11615-2-git-send-email-b32955@freescale.com>
Cc: dedekind1@gmail.com, koen.beel.barco@gmail.com, marek.vasut@gmail.com,
	linux-mtd@lists.infradead.org, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2011 at 07:12:59PM +0800, Huang Shijie wrote:
> These files contain the common code for the GPMI-NAND driver.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
> Tested-by: Koen Beel <koen.beel@barco.com>

=2E..

> +static int __devinit
> +acquire_register_block(struct gpmi_nand_data *this, const char *res_name)
> +{
> +	struct platform_device *pdev =3D this->pdev;
> +	struct resources *res =3D &this->resources;
> +	struct resource *r;
> +	void *p;
> +
> +	r =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, res_name);
> +	if (!r) {
> +		pr_err("Can't get resource for %s\n", res_name);
> +		return -ENXIO;
> +	}
> +
> +	p =3D ioremap(r->start, resource_size(r));
> +	if (!p) {
> +		pr_err("Can't remap %s\n", res_name);
> +		return -ENOMEM;
> +	}
> +
> +	if (res_name =3D=3D GPMI_NAND_GPMI_REGS_ADDR_RES_NAME)
> +		res->gpmi_regs =3D p;
> +	else if (res_name =3D=3D GPMI_NAND_BCH_REGS_ADDR_RES_NAME)
> +		res->bch_regs =3D p;

Am I the only one getting warnings here?

drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'acquire_register_block=
':
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:345:15: warning: comparison with str=
ing literal results in unspecified behavior
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:347:20: warning: comparison with str=
ing literal results in unspecified behavior

Really worth fixing IMHO...

> +	else
> +		BUG();

dev_err + ENODEV?

Might be worth checking the other BUG()-occurences as well if they really n=
eed
to halt the kernel.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5k6CAACgkQD27XaX1/VRsq7gCfUF4jNtXM0sa3gZ+qPBhz4Yna
XbIAn0PqRv/VINGGVZTib+nZYsSxr+D2
=Ft55
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
