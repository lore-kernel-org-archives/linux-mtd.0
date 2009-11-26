Received: from smtp-out113.alice.it ([85.37.17.113])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NDaYN-0004WI-VG
	for linux-mtd@lists.infradead.org; Thu, 26 Nov 2009 09:22:24 +0000
Date: Thu, 26 Nov 2009 10:22:08 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: dedekind1@gmail.com
Subject: Re: [PATCH] MTD: add missing put_chip() in cfi_intelext_reset()
Message-Id: <20091126102208.4392e7d3.ospite@studenti.unina.it>
In-Reply-To: <1259218878.29118.39.camel@localhost>
References: <20091023000533.57893593.ospite@studenti.unina.it>
	<alpine.LFD.2.00.0910231559320.21460@xanadu.home>
	<20091120111435.d28c19bf.ospite@studenti.unina.it>
	<1259218878.29118.39.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__26_Nov_2009_10_22_08_+0100_zJEhz5er+blk1wt1"
Cc: openezx-devel@lists.openezx.org, linux-mtd@lists.infradead.org,
	Nicolas Pitre <nico@fluxnic.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Thu__26_Nov_2009_10_22_08_+0100_zJEhz5er+blk1wt1
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2009 09:01:18 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2009-11-20 at 11:14 +0100, Antonio Ospite wrote:
> > On Fri, 23 Oct 2009 16:02:42 -0400 (EDT)
> > Nicolas Pitre <nico@fluxnic.net> wrote:
> >=20
> > >=20
> > > Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> > >
> >=20
> > Hi, has this fix been submitted yet?
> > I can't see it in 2.6.32-rc8.
>=20
> The current situation indicates it is not going to be there.
>=20
> This patch is in my l2-mtd tree, though.
>

Ok, thanks, I just want to be sure this will find its way to
mainline, I don't care which path it takes :)

> --=20
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>=20

Regards,
   Antonio

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Thu__26_Nov_2009_10_22_08_+0100_zJEhz5er+blk1wt1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksOSMAACgkQ5xr2akVTsAF6ZgCgrt58Kog3DGO0c0COhwYyJbBg
+4MAn2DQj5WwIVlfF1oMiQqKoe/If8Mr
=PRbo
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Nov_2009_10_22_08_+0100_zJEhz5er+blk1wt1--
