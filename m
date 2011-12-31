Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rh18d-0001GK-Rh
 for linux-mtd@lists.infradead.org; Sat, 31 Dec 2011 15:46:28 +0000
Date: Sat, 31 Dec 2011 16:46:18 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] MTD/GPMI : select more modules for GPMI by default
Message-ID: <20111231154618.GB27544@pengutronix.de>
References: <1325220337-23165-1-git-send-email-b32955@freescale.com>
 <20111231054432.GE12182@S2100-06.ap.freescale.net>
 <4EFEA210.30606@freescale.com>
 <20111231072441.GF12182@S2100-06.ap.freescale.net>
 <4EFEB968.2000905@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
In-Reply-To: <4EFEB968.2000905@freescale.com>
Cc: shijie8@gmail.com, Artem.Bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I do not like the GPMI depend on the MXS-DMA. It looks very strange
> when you do the "make menuconfig".

That doesn't change that it DOES depend on it :) (You can't use GPMI without
DMA, right?)

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7/LkoACgkQD27XaX1/VRvYEgCglCCN657ROPrVA93VM7sNKXt3
oQsAn2UlIYuHaD/yWx/Ou96I+v66xIcD
=h2sp
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
