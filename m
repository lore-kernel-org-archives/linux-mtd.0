Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2ZuN-0007Cz-85
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 09:03:50 +0000
Date: Mon, 24 Apr 2017 11:03:19 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
Subject: Re: [PATCH] tango_nand.c: fix ecc.stats_corrected in empty flash case
Message-ID: <20170424090319.GA25399@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon> <20170422104033.GA14508@amd>
 <53204f36-9662-e8a0-c431-09fb68276ab6@sigmadesigns.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <53204f36-9662-e8a0-c431-09fb68276ab6@sigmadesigns.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Trimming CC list ]
>=20
> On 22/04/2017 12:40, Pavel Machek wrote:
>=20
> > Fix ecc.stats_corrected in empty flash case.
> >=20
> > Signed-off-by: Pavel Machek <pavel@denx.de>
> >=20
> > ---
> >=20
> > This was suggested by Boris Brezillon in another context. Not tested;
> > I don't have the hardware.
> >=20
> > diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nan=
d.c
> > index 4a5e948..db4bff4 100644
> > --- a/drivers/mtd/nand/tango_nand.c
> > +++ b/drivers/mtd/nand/tango_nand.c
> > @@ -193,6 +193,8 @@ static int check_erased_page(struct nand_chip *chip=
, u8 *buf)
> >  						  chip->ecc.strength);
> >  		if (res < 0)
> >  			mtd->ecc_stats.failed++;
> > +		else
> > +			mtd->ecc_stats.corrected +=3D res;
> > =20
> >  		bitflips =3D max(res, bitflips);
> >  		buf +=3D pkt_size;
> >=20
>=20
> Hello Pavel,
>=20
> You may have noticed that ecc_stats.corrected is not updated in
> decode_error_report() which is the main code path, i.e. the path
> that will succeed 99.99% of the time (HW read).
>=20
> It turns out that the HW does not report the number of errors
> corrected in a page... Instead it reports two values:
> 1) U =3D number of errors corrected in the first packet/step
> 2) V =3D max number of errors corrected in other packets/steps
>=20
> Thus, it is not possible to determine the actual number of errors
> corrected in a page (unless V is 0). Otherwise, we just have an
> interval; let n be the number of packets/steps:
>=20
> U + V <=3D corrected errors count <=3D U + (n-1)*V
>=20
> In my opinion, it is better to provide no information than to
> provide incorrect information. Therefore, I did not update
> ecc_stats.corrected in decode_error_report().
>=20
> One could argue that updating ecc_stats.corrected in
> check_erased_page() sets the correct value, since the error
> counts are computed in software for each step. But updating
> the value here is IMO pointless if we can't do it in the main
> code path.

Aha, thanks for explanation... perhaps comment is worth adding? This
is certainly "interesting" property (people would conclude that
check_erased_page is buggy -- and it is buggy -- but it matches
behaviour of rest of the driver). Also... people do copy&paste in
kernel (I did :-) ) and this is quite a trap for them.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj9v1cACgkQMOfwapXb+vK8ggCeK4iW0PPGAs7P4Y1BeDv4L4/p
gLUAn3gfvcT1K8efmONDM+SO1LI20mpy
=WxHA
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
