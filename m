Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsBJA-000217-8Y
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 10:51:29 +0000
Date: Tue, 31 Jan 2012 11:51:18 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2] mtd/gpmi : add BBT support to gpmi nand driver
Message-ID: <20120131105118.GK2471@pengutronix.de>
References: <1328006303-26844-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="FCF9ydJxlAJsfRTu"
Content-Disposition: inline
In-Reply-To: <1328006303-26844-1-git-send-email-b32955@freescale.com>
Cc: marek.vasut@gmail.com, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--FCF9ydJxlAJsfRTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 06:38:23PM +0800, Huang Shijie wrote:
> Add a new field to gpmi_nand_platform_data{}.
> Make the BBT support to board specific.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Much better :)

> @@ -64,5 +65,6 @@ struct gpmi_nand_platform_data {
>  	/* Medium information. */
>  	struct		mtd_partition *partitions;
>  	unsigned	partition_count;
> +	int		enable_bbt;

Bitfield? (check imx for example)

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--FCF9ydJxlAJsfRTu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8nx6YACgkQD27XaX1/VRvKsACdGRgJoLkwwUN74aRDvx7ivfYj
fKYAnjO6abukmLQqXJWVm4vgAYGtzeRu
=WxUh
-----END PGP SIGNATURE-----

--FCF9ydJxlAJsfRTu--
