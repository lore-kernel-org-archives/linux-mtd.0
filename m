Message-ID: <1349953632.12014.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] ARM: nomadik: switch over to using the FSMC driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Oct 2012 14:07:12 +0300
In-Reply-To: <1349335709-13399-1-git-send-email-linus.walleij@linaro.org>
References: <1349335709-13399-1-git-send-email-linus.walleij@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4iyrLHNwMd7zf17pCMt7"
Mime-Version: 1.0
Cc: Mike Turquette <mturquette@linaro.org>, linux-mtd@lists.infradead.org,
 Mike Turquette <mturquette@ti.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Rubini <rubini@unipv.it>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4iyrLHNwMd7zf17pCMt7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-10-04 at 09:28 +0200, Linus Walleij wrote:
> The Nomadik NAND driver is really just a subset of the existing
> FSMC driver, so let's switch over to using that driver instead,
> since it handles more variants of this chip. The callbacks for
> setting up the chip is doing stuff now handled by the FSMC
> driver.
>=20
> Cc: Alessandro Rubini <rubini@unipv.it>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Pushed both to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-4iyrLHNwMd7zf17pCMt7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdqhgAAoJECmIfjd9wqK05DIQAJkJcyjlYwyYNtKWNQab4gaG
nG5hoistb5LGcPotbQcHVUJjudnus4xzarGIgaFAOhB7coujNbXtVQLzNhpuBDB8
rLbZqO3kkq93tOspvg3nddTGEaUWXb7OKXg9nvFjDObuidKkvhFlev2ZkukALWOQ
gBhyLvI+EQS9qlMSCM+8SsK1GIR7jrMfmisfx3hx8juJQdcFzW0MzFMA1lntJ1dN
vucYe2GKRlh6XxCgiP67DtSmSje5nzKIfGxWSyEIJit3jiIU4sB8HyTNlz+gIpUv
GbM0oWV3oBYnXRPDHmIMKGDiIub+8UnlZTba4HcDII82Ks6TOpZ3AVrmoy9IEl4Y
IIFUiszDJ5MnFEgTu6vIkEhahWKG9eE7qnOZquEwFr5w4QTZmcABylQqsfIwqWWU
qztVRG8RheTilnekaTPDZo6Wu9iwryMWVI9Q4Zk9UNUJK8lCjrwa6cA4JsCjiitB
xF8fSJ0hhLPgkzG9YYBQrLbuuqwfbIWVasNZob8FqsAwsR25OnRPI89tpSQsuXJk
05OtkC0wi5evst9MePAhjmsyCaj0gQTUjPSi22HZ6LBp5KIKwG9aCrXgOZS+biWd
rDNCIV0CWC5UjKkcbRdsTPTi/wYJP1k6bG0Rhknm84yRstwcgFsLofo8aAFcQMtW
V1wrDrIUxqxB9LyyWDYp
=xtoz
-----END PGP SIGNATURE-----

--=-4iyrLHNwMd7zf17pCMt7--
