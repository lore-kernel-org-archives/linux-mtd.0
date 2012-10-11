Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMBq7-0002lH-1Y
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 06:01:47 +0000
Message-ID: <1349935314.20594.40.camel@sauron.fi.intel.com>
Subject: Re: output file cannot be in the UBIFS root directory check is not
 working quite well
From: Artem Bityutskiy <dedekind1@gmail.com>
To: kyak <bas@bmail.ru>
Date: Thu, 11 Oct 2012 09:01:54 +0300
In-Reply-To: <alpine.LNX.2.02.1210101855001.1211@bas>
References: <alpine.LNX.2.02.1210032322590.1375@bas>
 <alpine.LNX.2.02.1210051949390.1375@bas>
 <alpine.DEB.2.00.1210081556130.19047@lnxricardw.se.axis.com>
 <alpine.LNX.2.02.1210081833560.1375@bas>
 <alpine.DEB.2.00.1210081650200.19047@lnxricardw.se.axis.com>
 <alpine.LNX.2.02.1210081900410.1375@bas>
 <alpine.LNX.2.02.1210101855001.1211@bas>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SOLwC4CqjZGFu8OHDSHd"
Mime-Version: 1.0
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-SOLwC4CqjZGFu8OHDSHd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-10 at 18:55 +0400, kyak wrote:
> Thanks Artem, your patch=20
> (http://lists.infradead.org/pipermail/linux-mtd/2012-October/044477.html)=
=20
> has fixed my problem as well.

Good!

> > Yes, it only needs to check if the output file is above the top level
> > of the input tree. But I guess it's not that easy - first things that c=
ome=20
> > into my mind are symbolic links and mount --bind.

This patch should take care of symbolic links - realpath should resolve
them. WRT bind-mounts - well, I consider this an unlikely case and it is
not a big deal if we do not detect this. mkfs.ubifs will fail somewhere
else, I guess, then.

But of course, I will not object if someone improves the check and
submits a patch.

--=20
Best Regards,
Artem Bityutskiy

--=-SOLwC4CqjZGFu8OHDSHd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdmDSAAoJECmIfjd9wqK0cUoP/2UIo4RnfQLdeh/PiJwRLT7n
anM/i+UE64G/EXWi9HfGUzdoXl6DsQs3m5B61VoGdaJwTT1SPaAY5NCcgwWNcmEv
kMjt44uYnc8puqUgkA9SPiPs2ld0KoBOJG5I0v7JjMKX1qiqFsuSWZiDjGu/55Fv
Y/34I92Vyt0Amm3u4xTfbYXYS2SBfLHvUmsApzOONdexWR92Zx2vcdUUMjoZC+6V
JNd7SzDZXJo9NiKMVU/2O/8awSQof0is0H8AV/qNikDi4jMDXTwIeM1JvLDtd3rj
vKlu8hJZOHWJMlasy7Ex2uOawciPMKohg/zVt2uFA1ivDlgK/EjKS4HTQoenpDLe
X3Q9HUbk8BzktnQoJSNA0M+2gNT+ESpWt7ZDEZHDXMWpjfnC+9a7OdvttLWcefNe
ORv/bHJAgydl+ywjA+jNsJSTOLPlE5vxx22r2eos9p4auYguMdLO2E3f2ZET9sgV
KNisjQM+jPcoYFgQWPZf1arQ077fu1en3PbG1p7sYdrcdhbqk0mkNFFlqKNlejEt
HZgsKtpQSQAKbqBO1Ivqe4t39TmedICgKM6XsP1kewDTkZdbm88aW15jRuyeMWQp
9drF+yPLcJj7zGKnt6FmYoDcLWYH97Ppf3QSl8aGkiBRgoKIq+crlZJHxHWYOELI
c5szi+7mNI/XPI4hz4d/
=dyAV
-----END PGP SIGNATURE-----

--=-SOLwC4CqjZGFu8OHDSHd--
