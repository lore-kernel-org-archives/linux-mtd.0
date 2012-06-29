Message-ID: <1340969664.3070.162.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd mxc_nand: use 32bit copy functions
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 29 Jun 2012 14:34:24 +0300
In-Reply-To: <20120525145901.GS30400@pengutronix.de>
References: <1337955762-19157-1-git-send-email-s.hauer@pengutronix.de>
 <1337957902.30969.46.camel@sauron.fi.intel.com>
 <20120525145901.GS30400@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4vu2+GSIjvhrg+qEgOTA"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4vu2+GSIjvhrg+qEgOTA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-25 at 16:59 +0200, Sascha Hauer wrote:
> > WARNING:LONG_LINE: line over 80 characters
> > #103: FILE: drivers/mtd/nand/mxc_nand.c:276:
> > +static void memcpy32_fromio(void *trg, const volatile void __iomem  *s=
rc, size_t size)
> >=20
> > WARNING:VOLATILE: Use of volatile is usually wrong: see Documentation/v=
olatile-considered-harmful.txt
> > #103: FILE: drivers/mtd/nand/mxc_nand.c:276:
> > +static void memcpy32_fromio(void *trg, const volatile void __iomem  *s=
rc, size_t size)
>=20
> This makes me wonder a bit, I basically copied the prototype from
> the _memcpy_*_io template from arch/arm/kernel/io.c. Should they
> be wrong?

Well, this is arch-specific code. In there we may make various
assumptions about CPU not doing re-ordering. You are changing generic
code, you should not do assumptions like this.

How about adding these functions to arch/arm/kernel/io.c instead?

> otoh I also wondered why there were volatiles in arch/arm/kernel/io.c
> in the first place ;)

Not sure, probably in that file we assume that the memory is
strongly-ordered.

--=20
Best Regards,
Artem Bityutskiy

--=-4vu2+GSIjvhrg+qEgOTA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7ZLAAAoJECmIfjd9wqK01aAP/A4cjdg/NuPmI7JhnXzydPxH
KHesnasTo/msjRnLCa3/ivTXOYQeer/phuTz2lEDQXJlHcfdaJsxobh46dyUUHfz
OSqpCpJq8F7dBhF/IoNMyBE/Zb+DPrfXcXaPTo2ddgKh/KBVu5jNNc+UMqlKBsML
5I9cf9I2hSWVsZ5RCopj+8RPd41XrNX6nVwqvUaanSoaE6+wk38OdWixh2xJeLZ8
chlazqSVDp5lO92xuwnr2OAU9ZMB2agoW37SbueB8VM5QmWIz7c0KD4+Q7giPyNa
typWnISj9oZGApZ6t83KFgS7NpR75lyEmqElBLD8Q93RCFmkVMOcRHhPC2ukB1s3
SeqsL6QAKTse4dN89kn1HyWMzR3FFqB1b8AxU1qn4LryWLRmAENdgR9OD7VMeFj4
bpg8GZXIiv7hSxKuvulayIZ9F7UgH0iDIJ53XqQ4L5lX/dfO5MDWj8rsXDqOcUtB
UjzGLJYNL0gLC384wuoSiejZ75FC8Ks8eSJOa7pzuFLaB2kRFeRcPpf9Lg8CTacr
x1cOXHpGySRhSENVGL6ggCyfdhZYFtoptWawMzH+RgMhuUcxl0j9v1gjTgd3umJO
ZMpIZWEzOHTWtRdOWaMqB216TzYVEC5s9JwhQFRQ4fklhMh5QTOdOQGuXw5CKfke
6I9C1AzCqKt9aZhfh4s+
=r0k1
-----END PGP SIGNATURE-----

--=-4vu2+GSIjvhrg+qEgOTA--
