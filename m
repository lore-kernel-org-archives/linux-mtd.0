Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnoYm-0005Cp-US
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2012 09:45:34 +0000
Date: Thu, 19 Jan 2012 10:45:13 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 00/10] patch set about the MXS-DMA
Message-ID: <20120119094513.GB2630@pengutronix.de>
References: <1326953767-24155-1-git-send-email-b32955@freescale.com>
 <20120119091034.GH2247@S2101-09.ap.freescale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <20120119091034.GH2247@S2101-09.ap.freescale.net>
Cc: alsa-devel@alsa-project.org, vinod.koul@intel.com, b29396@freescale.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 artem.bityutskiy@intel.com, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > [2] patch 6 ~ patch 10: rewrite the last parameter of mxs_dma_prep_slav=
e_sg().
>=20
> For the sake of bitsec, at least patches #7 and #8 need to be one patch.
> That said, if I apply the series and then check out the commit at patch
> #7, you need to all mxs-dma client drivers, mxs-mmc, gpmi do not break.

I'd say patch 6-10 should be squashed, simply. My personal preference is
to change #9 to simply read the register when needed and do not expand
the struct, but this is a minor thing.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8X5ikACgkQD27XaX1/VRs1iQCfelj5s+udWkk+1mkd1T8lCB82
3T8An1b3bxZeJWRtXbyP/0da2ymYEMRs
=PAKK
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
