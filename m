Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbvr8-0007SI-Ej
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 15:07:22 +0000
Received: by iadk27 with SMTP id k27so5538460iad.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 07:07:22 -0800 (PST)
Message-ID: <1324134530.4240.41.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3] mtd/docg3: fixes and cleanups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Sat, 17 Dec 2011 17:08:50 +0200
In-Reply-To: <87pqfow3vw.fsf@free.fr>
References: <1322726702.2332.9.camel@koala>
 <1322852412-15193-1-git-send-email-robert.jarzmik@free.fr>
 <1323066682.2316.18.camel@koala> <877h2590zp.fsf@free.fr>
 <1323724387.2297.13.camel@koala> <874nx5zbuj.fsf@free.fr>
 <87pqfow3vw.fsf@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-s4KIthB9mZ1nnfMyF90k"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-s4KIthB9mZ1nnfMyF90k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-12-16 at 23:25 +0100, Robert Jarzmik wrote:
> > Artem Bityutskiy <dedekind1@gmail.com> writes:
> >
> >> On Fri, 2011-12-09 at 17:13 +0100, Robert Jarzmik wrote:
> >> May be it is better to just embrace this function with "#ifdef 0" and =
add a
> >> comment that we can do this but do not have a good use for this?
> > Ah yes, I didn't think about that possibility. It's looks better, I'll =
submit
> > another patch with a comment and the #if 0.
> How about the following patch ?

Pushed to l2-mtd-2.6.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-s4KIthB9mZ1nnfMyF90k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7LCCAAoJECmIfjd9wqK0wUYQAKWCrEwYnSVp69G6Ee3GvyLY
GPlC/L0WpYKG/J7uUlgr53fCjDCEKeocF9knf77JZ3P7kLMjVHR5PbuM8UeWST0P
6+YGg8CsEBxsgjvNGmhrcwokjjf1pU3buezyl8WfU3dOsHHEXh6T4g9ihxY5Ie/7
tHFhT81PZyKdPyDBYOWqCFrq0v+AEv3R/cLeMU3P8O6W9kDU0+TaP5m31p8Lz1f1
qnhk9tRQbH6oZn+L0gMn3tA3+wjI4lq0sdIbYOOXTZC4b6zjd9vQn3+9roLPmo1i
Fxfm3Yd1TtBzTtbl6aHNDcFaI0b4NNkwukWBENBNRmfinl6U17vzY+zoE1ghHL9R
ifQSMJCR7Zr6jB47Hy3dtIROkdbZ1Ci/fcrPyYearLirkZG7zPjeeI4bimGeN6UM
oDoKjUS2a2rdFcyHfrLbIGXOsRHI3kCuJZa9G4RaqlBGTD3A0j3DUSX59mfCJlOp
UuAA4Vc9WhrC9B3AR4Ys1khrWGCSmnjyYwz0jIa3ostqsOJMVrmn6Jgp4Jelhg8i
TNCFDmCuuBD7+sNmDFukq3dGli35oi248AsJvSNWcEp6a8NEfNZtiDzQaDUNxdXB
SB25DHZ8IEM+Db0+gMGWZc99HRA0Z2rLPyr8lrUx+xuojiIRNdFpLkwsPDElXxiw
mI97NjC5eRaStipmlv2f
=Z/AY
-----END PGP SIGNATURE-----

--=-s4KIthB9mZ1nnfMyF90k--
