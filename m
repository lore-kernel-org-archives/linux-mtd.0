Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NXY7o-0005K5-Ol
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 10:49:25 +0000
Date: Wed, 20 Jan 2010 11:49:15 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 06/11] mtd: Add MPC5121 NAND Flash Controller driver
Message-ID: <20100120104915.GB5041@pengutronix.de>
References: <1263932653-3634-1-git-send-email-agust@denx.de>
	<1263932653-3634-7-git-send-email-agust@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <1263932653-3634-7-git-send-email-agust@denx.de>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org, dzu@denx.de,
	Piotr Ziecik <kosmo@semihalf.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2010 at 09:24:08PM +0100, Anatolij Gustschin wrote:
> From: Piotr Ziecik <kosmo@semihalf.com>
>=20
> Adds NAND Flash Controller driver for MPC5121 Revision 2.
> All device features, except hardware ECC and power management,
> are supported.
>=20
> Signed-off-by: Piotr Ziecik <kosmo@semihalf.com>
> Signed-off-by: Wolfgang Denk <wd@denx.de>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> Cc: <linux-mtd@lists.infradead.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: John Rigby <jcrigby@gmail.com>
> ---

Please include a logfile with changes since the last version. This really
helps.

> +static int __init mpc5121_nfc_probe(struct of_device *op,
> +					const struct of_device_id *match)

[...]

> +{
> +	/* Support external chip-select logic on ADS5121 board */
> +	rootnode =3D of_find_node_by_path("/");
> +	if (of_device_is_compatible(rootnode, "fsl,mpc5121ads")) {
> +		retval =3D ads5121_chipselect_init(mtd);
> +		if (retval) {
> +			dev_err(dev, "Chipselect init error!\n");
> +			of_node_put(rootnode);
> +			return retval;
> +		}
> +
> +		chip->select_chip =3D ads5121_select_chip;
> +	}
> +	of_node_put(rootnode);

If we have to live with the platform-stuff being in the driver, maybe a tab=
le
having the compatible-string and an init-function pointer per entry will ma=
ke
it scale better with the number of boards?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAktW36sACgkQD27XaX1/VRtA1wCgponKWU3rPA15UQtrVNd9DmWV
U3gAnj7gLY4JGG8+nHsMWsTH5Oi3eXXf
=UvF3
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
