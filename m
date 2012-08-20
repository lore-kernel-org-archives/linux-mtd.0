Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3XNY-0005KH-5E
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 19:11:12 +0000
Received: by bkcji2 with SMTP id ji2so2307854bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 12:11:10 -0700 (PDT)
Message-ID: <1345489867.1789.3.camel@kyv>
Subject: Re: another issue with ubifs on v3.6-rc2: attaching an formatted
 device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 20 Aug 2012 22:11:07 +0300
In-Reply-To: <20120820160750.GS2232@pengutronix.de>
References: <20120820160750.GS2232@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6/7eyIZBkB6fxL7T71zL"
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


--=-6/7eyIZBkB6fxL7T71zL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 18:07 +0200, Uwe Kleine-K=C3=B6nig wrote:
> [  163.714143] uncorrectable error :=20
> [  163.727597] UBI warning: ubi_io_read: error -74 (ECC error) while
> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> [  163.740737] uncorrectable error :=20
> [  163.744032] UBI warning: ubi_io_read: error -74 (ECC error) while
> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> [  163.757119] uncorrectable error :=20
> [  163.760487] UBI warning: ubi_io_read: error -74 (ECC error) while
> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> [  163.774427] uncorrectable error :=20
> [  163.777808] UBI error: ubi_io_read: error -74 (ECC error) while
> reading 64 bytes from PEB 0:0, read 64 bytes=20

This looks like your flash does not really support sub-pages while
declares that it does. Check it with MTD subpage test.

--=20
Best Regards,
Artem Bityutskiy

--=-6/7eyIZBkB6fxL7T71zL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMovLAAoJECmIfjd9wqK0zzoP/1NkzAFrFZ1e0ANAA153lFsA
zxk8+zLfbBunb1A6PaH6Fs6S464PVDuxz2fxIXNlkN1wKGdFjRryohkZzMglF/kY
1/HzWifRNZ/jMv2Kdjmjc1a3gGwLh1B/NKt/C0sFul0v31iqXlRJswyKon8U9CgR
5JXGV5LZ1EHsHDveBxP/jCfViu6OYU0LGGB+EpQ3NGCJtQyCeAWZ17ZznseHNbN7
1LiycDHlG4C1wacAXCV5RBF6tmoWFGtHHDoAXI2v8OZ4AIs/c/ejutinxFbYnfuS
kQCaz4eR0EpnfifwgKFyAXYhyI22YBviVd21RP5V8++vLt4mqLgAmcecXp5/7qf0
II/LdKIX7VIxVVszcOB2pIxZPxgR11Wwajjqgl9i1bi9DA+OB3RBX2FKY3fmA0o9
cUzOO1oEE/49kJLaJd0AaNJwRH84ozQIKPrB4Ow/zZ2tPfBxDfhPnuMbLnm5pELQ
GMlJza1r7y6RlibWVu0hMUdrn7/By97R9SZ4rHxPctEjziLQ9yYsnpjCCxDGF4I0
K8Uxq9XB46SsCAcLdJLjumfqHFGkqX9ueg3nf/TK7VrXZYVlOo5L1TR5jlH9XZD7
8kvvK0NwxkPPlgTupEgcnB9nbLV8zmt5vaLVpIiy5mW8i77OuSgot7b8pCVKoa5/
25agZEeXTtEyhUEe6+NS
=JU8F
-----END PGP SIGNATURE-----

--=-6/7eyIZBkB6fxL7T71zL--
