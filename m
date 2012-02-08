Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv6pM-00042Q-UN
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 12:40:49 +0000
Received: by dakp5 with SMTP id p5so536010dak.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 04:40:47 -0800 (PST)
Message-ID: <1328704973.22240.60.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/3] mtd: move zero length verification to MTD API
 functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 08 Feb 2012 14:42:53 +0200
In-Reply-To: <20120207143505.6fba6d5b@pixies.home.jungo.com>
References: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
 <1328529789-2106-2-git-send-email-dedekind1@gmail.com>
 <20120207143505.6fba6d5b@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qa/LJQf3Gl+toyxnVLkB"
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


--=-qa/LJQf3Gl+toyxnVLkB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-02-07 at 14:35 +0200, Shmulik Ladkani wrote:
> On Mon,  6 Feb 2012 14:03:08 +0200 Artem Bityutskiy <dedekind1@gmail.com>=
 wrote:
> > @@ -712,6 +717,8 @@ int mtd_point(struct mtd_info *mtd, loff_t from, si=
ze_t len, size_t *retlen,
> >  		return -EOPNOTSUPP;
> >  	if (from < 0 || from > mtd->size || len > mtd->size - from)
> >  		return -EINVAL;
> > +	if (!len)
> > +		return 0;
> >  	return mtd->_point(mtd, from, len, retlen, virt, phys);
> >  }
>=20
> Previously, '_point' implementors usually assigned *virt (e.g. for NOR -
> to the relevant ioremapped address), regardless 'len' value.
> Meaning, *virt was set, even in the 'len =3D=3D 0' case.
> New 'mtd_point()' does not set *virt in this case.
>=20
> (Luckily, seems there are no calls to 'mtd_point' with zero 'len'...)
>=20
> I guess it is safe to assume the *virt assignment in the '!len' case was
> wrong?

If length is zero then 'virt' is anyway useless. But we should set it to
NULL in 'mtd_point()' to make sure that if someone accesses it he gets
an oops. I'll amend the patch and update the commit message
correspondingly, thanks a lot for review.

--=20
Best Regards,
Artem Bityutskiy

--=-qa/LJQf3Gl+toyxnVLkB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPMm3NAAoJECmIfjd9wqK0zJwP/RLZtz72bWw3AFFjTcz3fi3s
RhykV4UFFJhSAlLjVvO7asVqIKq2LcbXj1xf/5jAg8YWUTqibKI6L2MJRu7t+Sy7
gPGD4zhay6CgP91CuAH+KGlNjLkOeyzKTwHnJhyL9hawAkl1musAR7zhbPuHWCY/
0ggIYPoWP42UHxdlkeAT+KoSUKleVU47wJvCcPpwYoNJmgmFwnlEjomjw8JTiRB6
BN/qh2ol2BXePPWy1SQC9xa6qEmAJVdEo7LDJad04+L4+GAGhmXsiwraE0RiQS00
laQwIkZZYmipItSj5N2S8yOgWUBEjfcuPm9WGqodp+wa1RLPvtHYHlBtfr90Mj9y
VfXcBTR9v5ROqRbNG3q4DBfGuEO6qT6bXKVPOD1ceZExErc0kAfR4D/ay15IzQH+
U9YwI6+QexnAeguVG1Byna8Fq425QrLT6+Z+7ZPNJj1EB7u47mTlcE0PaZ5035Km
ZdwmoJxazusuqSjq4ddqShIDVped+Iq7X/fOXpKS2JedII+MGIJ9XV6sbLL1RZ4g
c9+UiLQ8B8z2/9hrGXYoBYLzksfLH0YRzHcPgIHcRPoV4l4qq0NnlVe/YobHtcQ/
MKahqMHuKuET+5fS6d/Jh0Dbf5B1vvoqQEjjuYFsNYnMlO7yjAGTThEujqOr7WPn
Hnf0hFvCj+Kr0DudLxuF
=TC+S
-----END PGP SIGNATURE-----

--=-qa/LJQf3Gl+toyxnVLkB--
