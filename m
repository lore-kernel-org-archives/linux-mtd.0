Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIfI0-00073v-61
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 11:35:29 +0000
Received: by wwf27 with SMTP id 27so381419wwf.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Oct 2011 04:35:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: tests: don't use mtd0 as a default
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Tue, 25 Oct 2011 14:34:04 +0300
In-Reply-To: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
References: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iz8s9Sb8Prp4RNyUVqe3"
Message-ID: <1319542522.1757.5.camel@golum>
Mime-Version: 1.0
Cc: Roland Kletzing <devzero@web.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-iz8s9Sb8Prp4RNyUVqe3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-10-25 at 11:09 +0200, Wolfram Sang wrote:
> mtd tests may erase the mtd device, so force the user to specify which
> mtd device to test by using the module parameter. Disable the default
> (using mtd0) since this may destroy a vital part of the flash if the
> module is inserted accidently or carelessly.
>=20
> Reported-by: Roland Kletzing <devzero@web.de>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> ---
>  drivers/mtd/tests/mtd_oobtest.c     |    2 +-
>  drivers/mtd/tests/mtd_pagetest.c    |    2 +-
>  drivers/mtd/tests/mtd_readtest.c    |    2 +-
>  drivers/mtd/tests/mtd_speedtest.c   |    2 +-
>  drivers/mtd/tests/mtd_stresstest.c  |    2 +-
>  drivers/mtd/tests/mtd_subpagetest.c |    2 +-
>  drivers/mtd/tests/mtd_torturetest.c |    2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobt=
est.c
> index dec92ae..ff77b8e 100644
> --- a/drivers/mtd/tests/mtd_oobtest.c
> +++ b/drivers/mtd/tests/mtd_oobtest.c
> @@ -30,7 +30,7 @@
> =20
>  #define PRINT_PREF KERN_INFO "mtd_oobtest: "
> =20
> -static int dev;
> +static int dev =3D -1;
>  module_param(dev, int, S_IRUGO);
>  MODULE_PARM_DESC(dev, "MTD device number to use");

How about adding something like:

if (dev =3D=3D -1) {
	printk(KERN_WARN "Please, specify the test MTD device\n");
	printk(KERN_WARN "WARNING: this test destroys the test MTD device's data\n=
");
	return -1;
}

Of course for the readtest the warning should not be printed.

--=20
Best Regards,
Artem Bityutskiy

--=-iz8s9Sb8Prp4RNyUVqe3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOpp6sAAoJEJtuLFy+q7feKt0H/22/7QRChVvWF14RloO0PZdU
2I0u7sefBa/GMhR+SmEDE4M5TgNQ1vIbDFC5R3o3jfAncK01+0BVsGOVn0Iqo1w/
w31PEm5yVQ28Fd7jGtjLIkEqf7r2xeWcSb7fN6g0pAKXtMNMmBiORY2yW5Bjzg6Y
15PI9pWuJp1E2E/hRLsV62AiJgrQP61L5InSgiBANrRL9X9rL6z1utzygAtsNJVn
L3keCm7EDIcLY3tigbvZPkrKsvQVfTZaJ56Iwg9dmRihQcAvtVIONVprJTG3ooRP
anLKVbgNkMlEcyQkq3vt6PbrpLpp34vZNakhuCP7cOb3oLwIZOCt09eCazQ1gXA=
=ahuR
-----END PGP SIGNATURE-----

--=-iz8s9Sb8Prp4RNyUVqe3--
