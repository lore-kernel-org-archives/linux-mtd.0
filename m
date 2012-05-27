Message-ID: <1338123053.19389.9.camel@koala>
Subject: Re: [PATCH v9 3/3] MTD: at91: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Sun, 27 May 2012 15:50:53 +0300
In-Reply-To: <1338038677-6752-4-git-send-email-josh.wu@atmel.com>
References: <1338038677-6752-1-git-send-email-josh.wu@atmel.com>
 <1338038677-6752-4-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-JLVCnh5Z4i7cPGII3wAV"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-JLVCnh5Z4i7cPGII3wAV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-05-26 at 21:24 +0800, Josh Wu wrote:
> +       while ((pmecc_readl_relaxed(host->ecc, SR) & PMECC_SR_BUSY)) {
> +               if (unlikely(timeout_count++ > PMECC_MAX_TIMEOUT_COUNT)) =
{
> +                       dev_err(host->dev, "PMECC: Timeout to get ECC val=
ue.\n");
> +                       return; /* Time out */

How this error is communicated then up the the user?

> +               }
> +               cpu_relax();
> +       }

I see this pattern all over the place - why people consider it reliable?
Is this code guaranteed to run on the same CPU?

Why not to use loops_per_jiffie * msecs_to_jiffies(TIMOUT) instead to
calculate how many iterations to do? Yes, due to HW register reading and
cpu_relax() the real timeout will be larger, but this is about error
anyway, so it does not hurt to iterate longer?

--=20
Best Regards,
Artem Bityutskiy

--=-JLVCnh5Z4i7cPGII3wAV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPwiMtAAoJECmIfjd9wqK0jOUP/iEkozd64aGrK/vnmvpDGKP+
8fKppDcEnTjeDyYt8q08O5F7c7CpiCyiWly3ZRLoKw8GOEY2QovSPmTOuxbhhVFQ
6cSqsB+PX+ci+uhsEUE7OAxt9DUyyG3B4qyWmyhlnUF7mkcEzFkd+R+i8HQwjATG
mMxFN2prGLsfGqKsjtBUo4Kx+agAwF2+/J+KGwOSP6J7+a0UZPBCiwNnJAa23wGe
Sd+0oIqVl5lgve7htql2xogXTfrXpsysxw0hLE/qKQg/Z1n0380Q7PXoiDdiRUcf
F09LZf6UXyRQUNOMbsv2KChbIBaL7rcUcxwmE1aGVdNWtoC3+f3A+CR6Ypp29+xi
aBuUHQLCaCvjaIbmkNfIKXzCignLVP8MIaqC8iJ9yRc63md7I5nfJvpwk/YRZltT
e8vQIbe/bY7xQ3Z0ZyA2jmzAxfpp9LOiOlGkqVhGD6wfG9obYxzoBxecpGO0wKwo
n8hs/prCZgeAPdWe21hlnU96pbsd4lelnUkgS56O3yCxhYEHUWRttaKP9PuUDBD3
rnc84u8YvYEBWuAECAmfgl1H1uyh5Dp7BFlbwofjTrgarqqNpAF2lTluc1wC8VkW
AWCkgUf6D/gm77tTfavqgZ3IDtMKHqMoTJ09jxdl/zcbcvIdUuqDHX4FIjgEKGmr
LKxalgLQ4vYSez2h7aG8
=G5YW
-----END PGP SIGNATURE-----

--=-JLVCnh5Z4i7cPGII3wAV--
