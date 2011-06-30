Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcETI-0007b1-OY
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 10:27:45 +0000
Date: Thu, 30 Jun 2011 12:27:28 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC
	controller driver
Message-ID: <20110630102728.GB1997@pengutronix.de>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
	<1309335878-16678-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <1309335878-16678-2-git-send-email-b32955@freescale.com>
Cc: thierry.nolf.barco@gmail.com, LW@KARO-electronics.de,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> +static int mil_ecc_write_oob(struct mtd_info *mtd,
> +				struct nand_chip *nand, int page)
> +{
> +	struct gpmi_nfc_data *this =3D nand->priv;
> +	struct device *dev =3D this->dev;
> +	struct mil *mil	=3D &this->mil;
> +	uint8_t *block_mark;
> +	int block_mark_column;
> +	int status;
> +	int error =3D 0;
> +
> +	/* Only marking a block bad is permitted to write the OOB. */
> +	if (!mil->marking_a_bad_block) {
> +		dev_emerg(dev, "This driver doesn't support writing the OOB\n");
> +		WARN_ON(1);
> +		error =3D -EIO;
> +		goto exit;
> +	}

Huh? Why is that? This will break JFFS2, for example.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk4MT5AACgkQD27XaX1/VRsjAQCcDo8UEP9nzdpt3ifNAZngquBq
0cYAni4rUrvluTcF3+4ry6YwsiJsHu3a
=unt2
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
