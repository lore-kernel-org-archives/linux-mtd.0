Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rufyd-0006kd-Sr
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 08:00:36 +0000
Received: by pbdx9 with SMTP id x9so6816086pbd.36
 for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2012 00:00:33 -0800 (PST)
Message-ID: <1328601757.22240.46.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd: remove retlen zeroing duplication
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Tue, 07 Feb 2012 10:02:37 +0200
In-Reply-To: <20120207094715.63ffbe78@pixies.home.jungo.com>
References: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
 <20120207094715.63ffbe78@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3ncHJJZ1A63C5gEL5b3e"
Mime-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-3ncHJJZ1A63C5gEL5b3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-02-07 at 09:47 +0200, Shmulik Ladkani wrote:
> On Mon,  6 Feb 2012 14:03:07 +0200 Artem Bityutskiy <dedekind1@gmail.com>=
 wrote:
> > From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >=20
> > The MTD API function now zero the 'retlen' parameter before calling
> > the driver's method - do not do this again in dirvers. This removes
> > duplicated '*retlen =3D 0' assignent from the following methods:
> >=20
> >     'mtd_point()'
> >     'mtd_read()'
> >     'mtd_write()'
> >     'mtd_writev()'
> >     'mtd_panic_write()'
> >=20
>=20
> Seems that '*retlen =3D 0' is missing from mtd_read() in l2-mtd.
> Deliberately? or am I looking at the wrong repo?

Not, oversight, fixed in the repo.

--=20
Best Regards,
Artem Bityutskiy

--=-3ncHJJZ1A63C5gEL5b3e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPMNqdAAoJECmIfjd9wqK0TTQQAKb2Y0oph+hK2Sz0HLZOcjl2
MjOzB3U1FFE6UPD+SrsuuKvOfvh/FGH62OY2ZQjnq8oGtEKFeEuuQMBpsOtwW7vZ
hZkeBBgWv1PImPszyvMfGxVpvPZa2lKzo6PecTFkN0WzMDN+4wwwHZOkdqD7cb36
37W31N4nX8aj+mQHxOeIn92dT0IiXfBkXm6Tfe3yXCNHi2aWOerJwnisWMm+7zbc
vF3/kmI/8c8jLV4DnimoQOtQ5XZyIKoTzqzZ3R5uxq3CfUsrmPWZQmY7XoYxTK9z
JJ9REjE+1mH2YWb/CZTEan8+k7aal/JSzlW36c1wAVPQ9PIcR9Gf4OOSCsT7xM4i
7l3kFczO8bynrfm8g0iL7aslAQRSmWuP1W2vK1bhK84o2g2SkngTNakZ16Dabpe4
YD9DQ595taMY+optJw4SZO6t4De1CSKIcbLTO7n0yfNx9trYeVKTBXu5sWQDViMP
rAmMyGydosA3D5DDRvkMFWg6SYEG2grNhU8Tc7fvVJyraq5xB0cD6DcS50Tmo+S2
WdDCIalkRy2I0ExeHfn9KS0MJ1qWsPSWWH58DjN96CHtZgaW65GdrqIArfK9kqaM
H7byWodAebPhk6iDOgjbMO5/cNYkdbVaoYNkfDHfF+0QCI9s/s9bIhm/rxLjkNGl
TGQasHnD5ZbxihpmeLWi
=ZeHk
-----END PGP SIGNATURE-----

--=-3ncHJJZ1A63C5gEL5b3e--
