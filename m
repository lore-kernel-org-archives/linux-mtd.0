Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjonU-0005NE-OX
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 09:44:29 +0000
Message-ID: <1340790509.29342.16.camel@sauron.fi.intel.com>
Subject: Re: Overrule mtd "ro" ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>
Date: Wed, 27 Jun 2012 12:48:29 +0300
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB670345A94E@WETMEX10.loepfe.com>
References: <1531E53627F1F749B4FE809BF2A4EB670345A94E@WETMEX10.loepfe.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+5LqdFx2QSjRjQWwqAH6"
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


--=-+5LqdFx2QSjRjQWwqAH6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-14 at 10:05 +0200, Vellemans, Noel wrote:
> Hi all,
>=20
> I've a rather simple question, don't know if it is the good place to
> ask, but I'll give it a go.
>=20
>=20
> If I have a mtd device that has been mounted ad READ-only.
> For example because I've injected kernel command line parameters
> mtdparts=3Datmel_nand:4M(BOOT)ro,16M(l1)ro.
>=20
> Is there any way on the kernel "prompt" to over-rule this "ro" behavior
> and to make it writable.

Not sure, probably not. Check the if any mtd ioctl allows this. I guess
you could implement this feature.

--=20
Best Regards,
Artem Bityutskiy

--=-+5LqdFx2QSjRjQWwqAH6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6tbtAAoJECmIfjd9wqK0T5sP/iMcYd28ONS14wjZ/7EcMJvw
2qFsYsCUcZxAK2CTkhEiaMpXPQ9uO6VtPDqxH1i+jumHKPNd9j2qSqNsbZfUOtvY
gm/pTLn1MkyKoBlaSKn/r9iCU22E52FL0zacsxCsbF1G9BgddkabXXKsKpZG7nsl
/CX6GJEfPr8HG3/+eHNFXSI2EczNrygV++b0qlS5d212bmsTzVe/9XCrxsVc0Roz
s/wG9evCrM865Ps3PY19FNz5jgqezsM2iEfm2QdjUuBfLWsD0sSWG9e1AdblBYTF
076O6HFAv97TopPDf3LDZ0MmbXfw0RC0S5I0G+fcw8dD7+uD0m1LR7t3B/wH0aO2
zuQ2z+yg6YjZvk5E5DRxtQaw7nZZURH8nur2crYVllgldBQJSOYvyvhOBEfl7+D4
xVgTTzKCPk/z2isW8T+nKs7Dd8EexU9obViJGVcrP+zdZtbIAtgf4Tizi/HLY2fG
aHUgIJPBwKkFwIYZNiYwKGZCyLPL2MY1wcwMCLg+9ET2+HDCeEvikFj6GgWGJ3tC
KpH+L2h+rOZgBvgGGt9nYsVN6Sl1lP8eAl2ehv23zm5NLMtAi4Po2qa40O58skRG
LfTkQan5PByuxtqO9erOk1LVgEpDHxyE4JoFZI0rJ1BjfEL6UNG8W/OmxyYrpQlX
J7sLH0pPRdTv+R7nVb+Q
=29J2
-----END PGP SIGNATURE-----

--=-+5LqdFx2QSjRjQWwqAH6--
