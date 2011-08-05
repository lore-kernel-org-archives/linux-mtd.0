Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QpKoN-0007QY-Co
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2011 13:51:40 +0000
Date: Fri, 5 Aug 2011 15:51:33 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: GPMI-NAND Status?
Message-ID: <20110805135133.GA26981@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
Cc: Huang Shijie <b32955@freescale.com>, Koen Beel <koen.beel.barco@gmail.com>,
	Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org,
	Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I am a bit uncertain how the state of the GPMI-NAND driver currently is, so
I'll try to sum it up here. There is without doubt interest in getting the
driver into mainline from at least Huang, Shawn, Lothar, Koen and me, so I
wonder if we can join forces more effectively. First of all, I want to thank
Huang Shijie for all his work so far which was already quite some effort; t=
his
sum-up is by no means meant as bashing, just trying to understand the status
quo (Sidenote: I am more or less on holiday until Monday, so no time for re=
al
debugging myself. I write this mail so we hopefully gain a common
understanding. When I am back to full strength, I can then start working on
what seems apropriate)

Issues with the current driver I am aware of:

DMA timeouts [1]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[    2.560000] [ start_dma_without_bch_irq : 392 ] DMA timeout, last DMA :1
[    3.560000] [ start_dma_with_bch_irq : 427 ] bch timeout!!!

Always reproducible by me when trying to format mtd0. Sometimes(always?) se=
en
by Koen during boot (on read?). Never seen by Huang? It is currently unclea=
r if
the bug is in the GPMI driver, or in the MXS-DMA driver. Still, I'd say the
issue is a show-stopper. We can't put a driver into mainline which leads to=
 the
above failure. The fact that there is _some_ configuration which works for
someone does not help, it doesn't work for Koen and me at least. We need
reliable drivers in mainline, so the issue needs to be resolved, regardless
where the bug resides.


problem overwriting all-0xff data in NAND [2]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Although it occured only when writing JFFS2 images so far, this is a generic
issue and needs to be fixed, right?


ecclayout needs to be used to show that OOB is fully in use [1]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Needed to make it work for JFFS2 and to pass the mtd-testsuite. A driver on=
ly
working with UBIFS is surely not ready for mainline.


Pecularities
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

There are a few issues which are odd. I don't know if some are mainly inten=
ded
for debugging, yet they shouldn't be in a mainline driver. At least:

* custom sysfs-entries
* custom kernel command line parameters
* namespacing (some functions have no prefix, some have "mil_", some have m=
x23)
  (I think 'mil' means 'mtd interface layer', but why is that needed?)

Complexity
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The driver is not easy to review. I wonder if it makes sense to use increme=
ntal
patches for it? maybe making it a staging driver could be a solution for th=
at?
Huang, are you interested in accepting patches or do you prefer we just poi=
nt
at certain code and you then fix it? Starting with a simpler driver and then
adding stuff might be another option if we can't chase all the bugs in the
current driver.

That being said, I'd think fixing the DMA issue has prio #1 and maybe we can
meet in IRC or something to work that out? Is there interest in that?

Ok, those were my two cents. Your mileages may vary, please give your thoug=
hts,
then. I mainly don't want the driver development to get stalled.

Regards,

   Wolfram

[1] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037200.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037104.html
--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk479WUACgkQD27XaX1/VRt/iQCaAxpRX2zOAlBBGHuHT4/PecKg
8rQAoLe1CBiSrGxUG/1EorJfwWow65fH
=N2bt
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
