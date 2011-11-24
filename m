Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTThD-0001Oe-DF
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 07:26:12 +0000
Received: by iapp10 with SMTP id p10so3037662iap.36
 for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2011 23:26:09 -0800 (PST)
Subject: Re: [PATCH 0/2] small mtd-utils fixes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 24 Nov 2011 09:26:48 +0200
In-Reply-To: <CAMjpGUfkc7JftBx5uMBDy7YAn2z4yCh6eVYibEZ9pQayphFcsQ@mail.gmail.com>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala> <87k46xrqyr.fsf@macbook.be.48ers.dk>
 <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
 <1321735668.2167.2.camel@koala>
 <CAMjpGUfB0OoP_TvQ+eVEwx6_nmJ0p4jrCyu4ceTQBHGeRvUm-Q@mail.gmail.com>
 <1321743864.2167.6.camel@koala>
 <1321790131.15493.85.camel@shinybook.infradead.org>
 <1321794503.2170.3.camel@koala>
 <CAMjpGUdsdppTEOuPdWTGGU=ztbyvoF4_=TiZ1RqQ4W1_wFhbkQ@mail.gmail.com>
 <1321997940.2222.19.camel@koala>
 <CAMjpGUdxGfo7dfSNhzQUHg3QGkKW7rQewiFhDjGyJ0TjjQkdkA@mail.gmail.com>
 <1322034324.24797.230.camel@sauron.fi.intel.com>
 <CAMjpGUfkc7JftBx5uMBDy7YAn2z4yCh6eVYibEZ9pQayphFcsQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-32enh1yB79Bq44B1+JwD"
Message-ID: <1322119614.24797.294.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Kevin Cernekee <cernekee@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-32enh1yB79Bq44B1+JwD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-11-23 at 20:45 -0500, Mike Frysinger wrote:
> sure, but we're not taking about options here, we're talking about
> required arguments:
> ./make-release.sh <version> [output_dir]

Yes, but my point was that this way is not very normal and not
"standard" for Unix, at least by my perception of "standard".

> if we were to make it into:
> ./make-release.sh [-o output_dir] <version>
>=20
> then i'd understand the `getopt` desire

This is something standard - options are optional and go first, then
mandatory stuff without options.

--=20
Best Regards,
Artem Bityutskiy

--=-32enh1yB79Bq44B1+JwD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJOzfG4AAoJECmIfjd9wqK0kiIP/jL8bV5e/+zAK348lKAnWvoB
2cjGMw2BD5ydRCVJI+SbzmISt1wX5jmm/f2rsz99Yp6egWu753kebecnohR0Amfs
unmOy4h49eEAYVCxP8ViPryChJhV111OLQn6ZhkyFmzDSiwRs+XglplQi8Dlvogl
XkEtgeIebNRxL5nMMpojnnxU1TkMKUr1fxW0U71hqALnSS+P832CtRcDSMK+wrKC
yvlaqf3Pp68iBzpM/aCJ3Avh3Av6eo2kZqV1e0kIUD8jBwRvQxOMeqYTdI+o3h0G
Cb5a7B34eQMRrAuaby6/REKln2IIaPfubDYeESIDKBm1QLMUNdj9sDGQoIVacmJF
O1PV8wJPk4ar/k16yczIiCmJG0X8iObXzEOpkB3CVNjboqUFoyCATEMRBSGowxP2
0RSqzMzFEKKFKkDgwmGD/pWXq2bQpExPZdLqkpcpq3oOQAs6OpxVGGmd9WGkDmaH
I3HhnhDDizBQZcpHjfoJBEj6/HvQrzcbulnMrFhWRgvwogvZrZRUJafK/xHJ1Yp5
phPPsKljMpTx52tLzUf8w+NyxRsdeBnBd2+pxi5nJtwerE5h9B32olRGd6O45cLG
XuaewWb4tqB2vWBEzkNU/ImrJ5llmqUIj94zeAanw0oOWOKcIeAg3miRuub5tz3+
+GNfoQDDcgs7yttChGA2
=BQNo
-----END PGP SIGNATURE-----

--=-32enh1yB79Bq44B1+JwD--
