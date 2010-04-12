Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O1AS4-0004tf-Qe
	for linux-mtd@lists.infradead.org; Mon, 12 Apr 2010 03:36:45 +0000
Date: Mon, 12 Apr 2010 05:36:42 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v2 3/7] mtd: cfi_probe: add support for SST 0x0701
	vendorname
Message-ID: <20100412033642.GC3274@pengutronix.de>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<20100330133458.20107.48734.stgit@shiryu.yomgui.biz>
	<20100408090553.GC21805@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline
In-Reply-To: <20100408090553.GC21805@pengutronix.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2010 at 11:05:53AM +0200, Wolfram Sang wrote:
> On Tue, Mar 30, 2010 at 03:34:58PM +0200, Guillaume LECERF wrote:
> > SST 39VF160x and 39VF320x chips use vendorname id 0x0701 and alternative
> > unlock addresses. Add support for them in cfi_probe.c.
> >=20
> > Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> > ---
> >  drivers/mtd/chips/cfi_probe.c |    9 +++++++++
> >  include/linux/mtd/cfi.h       |    1 +
> >  2 files changed, 10 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_prob=
e.c
> > index a28659d..f931e94 100644
> > --- a/drivers/mtd/chips/cfi_probe.c
> > +++ b/drivers/mtd/chips/cfi_probe.c
> > @@ -214,6 +214,12 @@ static int __xipram cfi_chip_setup(struct map_info=
 *map,
> >  	 * back into Read Mode, which is a nop in this case).
> >  	 */
> >  	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
> > +
> > +	if (cfi->cfiq->P_ID =3D=3D P_ID_SST_OLD) {
> > +		addr_unlock1 =3D 0x5555;
> > +		addr_unlock2 =3D 0x2AAA;
> > +	}
>=20
> Can't we set cfi->addr_unlock[12] here already? This way, we could later =
have
> just one fixup function for all old SST flashes.

Well, even if there is a way to do it (by replacing the NULL-checks of
addr_unlock[12] in cfi_cmdset_0002() with something else), it can be applied
later and on top of this series.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEARECAAYFAkvClUoACgkQD27XaX1/VRvKGACdFQHtpQ8KzyNKa19nBl0zpQEY
/eEAmLD3Bl4hai3L0qfIBXGHkp3UX1c=
=6FcZ
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
