Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SVQuZ-00056v-1u
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 17:24:20 +0000
Message-ID: <4FB685B7.7000700@nod.at>
Date: Fri, 18 May 2012 19:24:07 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 00/22] UBI: massage for fastmap
References: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigDF3DAEB5C1DB7DB26C2CC6D0"
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigDF3DAEB5C1DB7DB26C2CC6D0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Am 18.05.2012 13:03, schrieb Artem Bityutskiy:
> Richard, by going through the commit messages you should get the idea w=
hat
> to re-name in your patches to make them match the new style. For functi=
ons
> it is easy - your code won't compile unless you rename. For variable na=
mes
> (e.g., si -> ai, seb -> aeb, etc) you'll need to just do the same I do =
in this
> patch-set.

Okay, I'll amend the fastmap patch to match these changes.

Thanks,
//richard



--------------enigDF3DAEB5C1DB7DB26C2CC6D0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEbBAEBAgAGBQJPtoW9AAoJEN9758yqZn9ebvAH+LjaIaAFWxG87zxjcvzIXZRb
0f3Ft4kzbTdshySZuHhf8voU2buPXJ4YRkqn57YV5OXziZiKAiv8ZyGIZpcj/jyj
GRExQAakTcQ9uRjOPtC7uzQ99HhzEqMhKM6kn0YX680Xw4xb5AZiLl7xihvBxFA0
RD7q+Iyw7MBAoQexDFHPvucf5BxfLkBDm8Lfiv+N0Yx94NaWBO6kzyys1cRnY/6+
+WYzkV8SU4Ueyj0f30w6WAscjLq3x+Yj+kX4oTj1JmDf1aJwsIYrHGyJRPKH2BIt
rWWqMqdiGhisZ+OpKSd5+GQGVJafEHpQvrxEM1EB6F+1rDjKrV41Zwouk8l+KQ==
=3vs8
-----END PGP SIGNATURE-----

--------------enigDF3DAEB5C1DB7DB26C2CC6D0--
