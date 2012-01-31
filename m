Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rs9x0-0005zU-Fd
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 09:24:31 +0000
Date: Tue, 31 Jan 2012 10:24:12 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Message-ID: <20120131092412.GA2471@pengutronix.de>
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <20120130094610.GA15596@pengutronix.de>
 <4F2671C3.6000809@freescale.com>
 <20120130104428.GB15596@pengutronix.de>
 <4F267F21.1030204@freescale.com>
 <20120130114131.GC15596@pengutronix.de>
 <4F27AA98.2090602@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <4F27AA98.2090602@freescale.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> What's about to add a module_param() to enable/disable the BBT for GPMI?
> What's your suggestion?

I'd make it board specific rather than a module parameter like most
other drivers seem to do.

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8nszwACgkQD27XaX1/VRtLxgCgthBktVOvL3RfOPH34KZ/bjBp
a88AoLwuPSyMRWCirlGYG5S8Dz+TWCwr
=VL84
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
