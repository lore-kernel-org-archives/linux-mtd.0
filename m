Message-ID: <1358424745.2731.238.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 0/3] at91: PMECC: enable PMECC in dt for
 at91sam9x5ek, at91sam9n12ek
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Thu, 17 Jan 2013 14:12:25 +0200
In-Reply-To: <1358393072-14794-1-git-send-email-josh.wu@atmel.com>
References: <1358393072-14794-1-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DDCCQLqfSR9JC1x9M4YE"
Mime-Version: 1.0
Cc: plagnioj@jcrosoft.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nicolas.ferre@atmel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DDCCQLqfSR9JC1x9M4YE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-01-17 at 11:24 +0800, Josh Wu wrote:
> Those patches will enable PMECC in dt parameters for at91sam9x5ek, at91sa=
m9n12ek.
> The driver will check minimum required ecc on ONFI parameter from NAND fl=
ash.=20
> If pmecc-cap in dts doesn't meet the requirement then driver reports a er=
ror.
>=20
> v2: rebase to v3.8-rc3. And wrapped the commit message.

Please, whenever you know your patch-set depends on something which is
not yet in Linuse's tree, _always_ explicitly say about this.

--=20
Best Regards,
Artem Bityutskiy

--=-DDCCQLqfSR9JC1x9M4YE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9+qpAAoJECmIfjd9wqK0Ad0QALdN5acnXK3YCMqnYaKBDsbC
ThyH1rHB2O93JkaxeuixbCTnVKK/+ALcI+qb8J8TDMiwhnAQWvqT9Z2Msz3pmzGq
zubk1VbtNYhP2YBQws7QhGmYdJ5mZKWphdTIMpM7/Kwu7goHHseBpEOr0Sebpuxj
7JjDWkKQyLBhQJdHaTZx16Mz8W27Z+fC4QwxTH4RAnfR1lG27KUzWJeR6LpDrAEe
uN4h2JarJ0HGojO2zBpwzxR7UCgscxGu6sQDR/azQ6PEzUIK7iSfQY8oUKxJBD7e
H6tS79gK9M+K6Twk6r75kwRrj2TGLzeAojddaKWzGETs5fCz39IsR1NF1eV61GyN
562LLL4rDZYVLcCxdB4AjK3kUMkjV48IFxIy2i8PbPeTZ8W18rnq8QErvG+/AS4u
9ayvcHPGESO60foXjgxC+IjHNalfpF8/32k8xFCiiapiW6jbioJDNgFgjO1Ei6lR
hcVR/WxUGd9lCg2cR8x6xQzzoz+7MAjceKVEwED87+x2LpoUDnBGhXOShdY8GyTp
X6NlkRb1mssGQwdhNZFRZy4sL9wtnNv9zo+f4lx1KqFPU3oZ7Jd6FCApWSjBIWKn
7VfQfKGfiMPdRcIT7m+AujaKS6+scH8WXF4Cpa4Kw3BI5t7mQATLxfJerGyiI5ou
RXdtzgHkjYpfBEe+pYDM
=jYZ2
-----END PGP SIGNATURE-----

--=-DDCCQLqfSR9JC1x9M4YE--
