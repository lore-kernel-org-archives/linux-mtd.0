Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avh9c-0003gf-Ej
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2016 08:18:33 +0000
From: Markus Pargmann <mpa@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Han Xu <han.xu@nxp.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>,
 Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Stefan Christ <s.christ@phytec.de>
Subject: Re: [PATCH v2] gpmi-nand: Handle ECC Errors in erased pages
Date: Thu, 28 Apr 2016 10:17:57 +0200
Message-ID: <4159618.sXRX6hYBy1@adelgunde>
In-Reply-To: <20160426193002.187aefc2@bbrezillon>
References: <1461587712-16403-1-git-send-email-mpa@pengutronix.de>
 <20160426193002.187aefc2@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2407068.gS0KHTAZCo";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart2407068.gS0KHTAZCo
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 26 April 2016 19:30:02 Boris Brezillon wrote:
> On Mon, 25 Apr 2016 14:35:12 +0200
> Markus Pargmann <mpa@pengutronix.de> wrote:
>=20
> > ECC is only calculated for written pages. As erased pages are not
> > actively written the ECC is always invalid. For this purpose the
> > Hardware BCH unit is able to check for erased pages and does not ra=
ise
> > an ECC error in this case. This behaviour can be influenced using t=
he
> > BCH_MODE register which sets the number of allowed bitflips in an e=
rased
> > page. Unfortunately the unit is not capable of fixing the bitflips =
in
> > memory.
> >=20
> > To avoid complete software checks for erased pages, we can simply c=
heck
> > buffers with uncorrectable ECC errors because we know that any eras=
ed
> > page with errors is uncorrectable by the BCH unit.
> >=20
> > This patch adds the generic nand_check_erased_ecc_chunk() to gpmi-n=
and
> > to correct erased pages. To have the valid data in the buffer befor=
e
> > using them, this patch moves the read_page_swap_end() call before t=
he
> > ECC status checking for-loop.
> >=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > [Squashed patches by Stefan and Boris to check ECC area]
> > Cc: Stefan Christ <s.christ@phytec.de>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> >=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
>=20
> Applied, thanks.

Great, thanks all of you.

Best Regards,

Markus

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart2407068.gS0KHTAZCo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXIcc1AAoJEEpcgKtcEGQQMgwP/jnyEyr0cR5GblcLaW0uPe7A
vAs7bCiEnvNtFmHJbqi0G5QynaPCbmwvp6t16bhu2KAHRfSMV0FDMhkXBntTamDE
hIXwBN6n7qlbHHhQpYhJiPC1LOiUEB0ItJj7Ot5DynRMA4Qmre5bT6nScWkI7EY1
hhU+Ad+qCQhVy98Jp1ojxQ5TpUl322H0nzunfCotvRCW1VZYdrJpi10AcxDBuOw6
054LxdTM7yjFptvO5qqRwxg0qy+BKujBU7p4wMWEiMCgpK3wMqMKejLh6CjB6YfH
yD3lR/VqSu05uBdgvtgjJ8KzgjNZ8RWjRAFUrD1DQBcw66x+0CJAQtMjVttiCgnE
xZpwm4bsNAwS3nBg8ZTnZ/i/f5e6PFnsYQwNzaZsfXnCHI9nVj+FGeJXvjYsKdP8
EaZhsog1SbLBwjeHfKb1vmBSt1DyZMaBY5UOvQuKWCc9amYquE2kk/Qh6mOov6Bw
+hvo4lmDo3pO8zkKrDApIcgCYVUgOsVJxq8mWiMaO3Eb6hZUq+gswAax+/xa26eX
KXVfAWpsla79USj4BmC8V+mI4g1xTSJPi2M0IC5nuOsZ1sgmcZc/YfAvdUtMse+N
iFt6o/r/bnjm3G+UICzonq0m+Tb0aL9t0fWQSqAm/SJ/EwxqaYZf4dDj/CheIkRz
Tj6sTzWNdyhU6MrKsfOs
=1yTP
-----END PGP SIGNATURE-----

--nextPart2407068.gS0KHTAZCo--
