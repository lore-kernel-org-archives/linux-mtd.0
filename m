Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbtts-0005N6-ND
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 12:29:49 +0000
Date: Wed, 29 Jun 2011 14:29:42 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC
	controller driver
Message-ID: <20110629122942.GH1992@pengutronix.de>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
	<1309335878-16678-2-git-send-email-b32955@freescale.com>
	<20110629100658.GE1992@pengutronix.de>
	<20110629103337.GF1992@pengutronix.de>
	<4E0B0296.6060902@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+G3HLlWI7eRTl+h"
Content-Disposition: inline
In-Reply-To: <4E0B0296.6060902@freescale.com>
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


--k+G3HLlWI7eRTl+h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Still, the problem exists: When a second channel GPMI channel is
> > requested, dmaengine will return -EBUSY, because the DMAIRQ is already
> > taken.
> >
> Yes, we should change the DMA code, it is a DMA bug.
> I ever submitted a patch about the issue:
> http://patchwork.ozlabs.org/patch/87145/

That approach was rejected because it would register the same handler
n-times where one time would do. Your other approach puts too much
mach-specific details into the driver IMO and probably won't scale very
well. Maybe we should add something to the private dma_data (like flags
indicating SHARED) and then do some refcounting?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--k+G3HLlWI7eRTl+h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk4LGrYACgkQD27XaX1/VRsQEgCfVj9mXP+BpIagO+7mMOX6SVZb
DgQAn0idOYuzZE+5RMsIXg5Qr8HuHliU
=RxgN
-----END PGP SIGNATURE-----

--k+G3HLlWI7eRTl+h--
