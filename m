Message-ID: <1340960973.3070.136.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v12 0/2] MTD: at91: Add PMECC support for at91 nand
 flash driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Fri, 29 Jun 2012 12:09:33 +0300
In-Reply-To: <4FED6EAB.3000802@atmel.com>
References: <1340871698-477-1-git-send-email-josh.wu@atmel.com>
 <1340898021.3070.123.camel@sauron.fi.intel.com>
 <4FED6EAB.3000802@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qFhV1aYbTOtMoSw/7UC7"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, richard.genoud@gmail.com, nicolas.ferre@atmel.com,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-qFhV1aYbTOtMoSw/7UC7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-29 at 17:00 +0800, Josh Wu wrote:
> > +drivers/mtd/nand/atmel_nand.c:480:32: error: bad constant expression [=
sparse]
> > +drivers/mtd/nand/atmel_nand.c:488:35: error: bad constant expression [=
sparse]
> > +drivers/mtd/nand/atmel_nand.c:633:32: error: bad constant expression [=
sparse]
> > +drivers/mtd/nand/atmel_nand.c:635:35: error: bad constant expression [=
sparse]
>=20
> I use CodeSourcery 2010q1, and no any error reported. So it seems=20
> related with the compiler.

They are from sparse, not gcc.

> When I send out the next version of the patch, Could you please test it=
=20
> about above fix? since I don't have Sparse compiler in my hand. Thanks.

I will feed it to aiaiai, but you can also do it easily if you want. You
can download my maintaining scripts from here:
http://git.infradead.org/users/dedekind/maintaining.git
and there is the documentation. You can use aiaiai in general for
checking your patching before submitting out. Catches some embarrassing
errors sometimes :-)

--=20
Best Regards,
Artem Bityutskiy

--=-qFhV1aYbTOtMoSw/7UC7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7XDOAAoJECmIfjd9wqK0Wi8QALE142ftQxhXH6SofqsUwgId
sVNVmhJCleN+5oWjnVPNSCCZdcK69nwJHq2FlpprBaYvkGvu8fCiCfSqQaAhzEZm
NSU/2hg90vkPn3m8R8Kg+IvJ9KVgDS7vYYRGOTXyNLywQWxariDSAKEhrnHCXFjN
7Nsi2GE/6Uriiw2Cb3R4jLEZKz6DbW0yclL2NB8TjmiTZcqH9tCeb1DpZ19VLbxD
5mrQyhnqpNDtDcvLmMb6S6vWKqgrRkpVIcX3hGTZfuqhZUEm67FStq1t9x1Eecy4
LCzBYF+lR2whooFsTNu+5RYnZGDd0ezYhpbvk5IEH2TGaWl61cVK3bv1EmHL39La
pbm45UqmouXR8aTGls6ZMUthzqRh49S34BxwyvFBE05HdI142/w3qc9GdRybLsAg
aypfprkqYmkrVoJwbbUrUQJsuEG98OdSvIqEskxzQmwCQwVh491m7syXZX+SpGBI
tQAdX94JJLt467Ud5EDA60skeNyhmf1tYquZk1DIFzjuaq2GnhXTcitk06hjfVWg
SVGphMWJUEKaymi/afTU3yI1EbHi/dOqdF0eD19OQXCox+2wmVKgIoWE5uBbdaqF
DOGKZQ8fEX4/Lj9kF+qlAx/9vemMxSTp/qLNl5X+mOPhr1ShnjNcI1kwmS+s1wPb
KFSV6Wnms7/QFK4aam4q
=vX+c
-----END PGP SIGNATURE-----

--=-qFhV1aYbTOtMoSw/7UC7--
