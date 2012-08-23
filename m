Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4WuW-0004eC-43
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 12:53:20 +0000
Message-ID: <1345726686.2848.241.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Thu, 23 Aug 2012 15:58:06 +0300
In-Reply-To: <20120823154404.51e31873@pixies.home.jungo.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
 <20120823154404.51e31873@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HVzZJQOCo/MJJiBClpUl"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-HVzZJQOCo/MJJiBClpUl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 15:44 +0300, Shmulik Ladkani wrote:
> Hi,
>=20
> On Thu, 23 Aug 2012 15:30:30 +0300 Artem Bityutskiy <dedekind1@gmail.com>=
 wrote:
> > From fa7595564e95672ab87d4a910c6bc02123b75e88 Mon Sep 17 00:00:00 2001
> > From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > Date: Thu, 23 Aug 2012 13:01:11 +0300
> > Subject: [PATCH] UBI: disallow max_beb_per1024 on NOR flash
> >=20
> > If the flash does not admit of bad blocks (e.g., NOR) - disallow using
> > 'max_beb_per1024'.
> >=20
> > Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > ---
> >=20
> > Second attempt, did not test :-)
>=20
> Looks ok to me.
>=20
> Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Thanks, it is pushed now. The further things we'd need to do are:

1. Somewhat test what we ended up with.
2. Write some documentation.
3. Search for UBI users in the mtd mailing list and send them
   an e-mail with heads-up, to make sure people have a possibility
   to complain before this stuff is merged.

I can do number 3 :-)

--=20
Best Regards,
Artem Bityutskiy

--=-HVzZJQOCo/MJJiBClpUl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNijeAAoJECmIfjd9wqK0th8QAMr1DHq7lC03zc5Qy2VsNYaH
Z2Ml4IJI5HM/r8Ru2tOy0464sJjBxphH2hK3qPnJmAQMxV6R/KnV212gootVoof/
En3ABkrxLEkIvajgeA7GAWvjqOsKY2oeM40qJLezPEt23QjaVaNztROEB4foFVZn
UH1U/GXrweK0uOHhW/3/DiZpu5pUnW4P0XNVpA7HChQ+udmzA0PX5PXutsBmWSIA
LHcnOGGlY6EdvNWK9XZryBDlkL+cCJrtLZJRMUg9lfyLV5gWJC5Ys1968aghQET+
kM4okYiKipNG8EllQ0Z3vrb5qpgObSgh3zFHxRTugV61bkU5kNqsxi6pXO5Si+BR
iaE6aPQmQ03B4IUKeYkWsmXy92UTmW7jkK+thwGLdLHwdaKJLKepDE6TL7yOfWDD
cwPGOVeDosnBLu1iSQval3dJhbaK7M4IvTNi9sSwQOd3HRBS+EcQxB2AHeEXOK8q
NLBEzMjXIrFJ/jN7DGH8AR/w1aiszOaiS4+R/MGzX/iLLLJaSGPwcmR3aFoTPJmh
ChfWAU1RHmDBv5qv+Ax8M7q6Qfm1B6fQWUPEhGl2yZU4KjkFqt+E8eqGFQpugIah
KvHS5jPd0fdncXXt0Bc1MusFUM03jp2pkkBNxst34PIyKvnrc067JxfP+d9WSnmB
vjJBwAwIHp38zE/hKvkd
=Qc2K
-----END PGP SIGNATURE-----

--=-HVzZJQOCo/MJJiBClpUl--
