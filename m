Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rroj3-00037q-MJ
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 10:44:43 +0000
Date: Mon, 30 Jan 2012 11:44:28 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Message-ID: <20120130104428.GB15596@pengutronix.de>
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <20120130094610.GA15596@pengutronix.de>
 <4F2671C3.6000809@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline
In-Reply-To: <4F2671C3.6000809@freescale.com>
Cc: artem.bityutskiy@intel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The bootloader usually is burned on /dev/mtd0, while the BBT is placed
> at the end
> of the NAND chip.
>=20
> I tested the NAND boot mode too.
>=20
> What's your concern?

Bootloaders may also need to write to NAND. So, they need to share the
same bad block information with the kernel. Currently, I am not aware of
a bootloader for mxs which support BBT without OOB. Unless this has
changed meanwhile, we shouldn't make this default, because they can't
share the same information then. To be on the safe side regardings
regressions, we shouldn't make this default as well, come to think of
it.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8mdIwACgkQD27XaX1/VRuAEgCeKHyy22FxvZA4f4VkbQDGrEKu
7yAAoMlWxNIEkDBKb//E6ZkAenUl+XXZ
=v8HI
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
