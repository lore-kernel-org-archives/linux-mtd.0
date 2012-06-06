Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScGGQ-00069o-PD
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 13:27:07 +0000
Message-ID: <1338989453.6875.49.camel@sauron.fi.intel.com>
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 06 Jun 2012 16:30:53 +0300
In-Reply-To: <20120606125013.5897a02d@pixies.home.jungo.com>
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-RQo8s6XDGmEhr7qhRq2L"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Mike Dunn <mikedunn@newsguy.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RQo8s6XDGmEhr7qhRq2L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 12:50 +0300, Shmulik Ladkani wrote:
> +	if (!mtd->bitflip_threshold)
> +		mtd->bitflip_threshold =3D mtd->ecc_strength;

Hmm, why se default is to report bit-flips only when one more flipping
bit would cause an ECC error? The default be 1 - report on any bit-flip.
The same should be done in 'add_mtd_device()' - we should preserve the
old behavior, as it was before these patches. Do I miss something?

--=20
Best Regards,
Artem Bityutskiy

--=-RQo8s6XDGmEhr7qhRq2L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPz1uNAAoJECmIfjd9wqK0aEYP/2o9A/j1TYzFWPBHdvb6SRww
PvRzkE8UVNImnjRelByY+Uys+Col2I/GgWnEU9+GBnnpnaMU/VZ5Wx//CrezgBYf
1O7U4MiQ7P45RF/y6Uh7Vlqx6eyG0BVngC8bq38+01A9+95gUmoREFw6te+44wLD
nSbMJF86Q16uQJRGFjEJSVeWa8HynTnI9hOMM9e4ZqmbluXmfYnZV1LYjxExAk52
NdHvmn+lUT29K+KSBCfMmGiTaGYK8fGm6rQQgHS1GPN2MKvRsNA5VY0KQczuq6NQ
S98k/jcnNcjKjrYaZ87UGuHcphxOm4lbKHwzMmzIV7MG0lAet9NFPJ2YCe5eHLp+
h2yrRa82NjF0aeCPFV+mXBU19ISejP/vYDFJLrF5pIVHcLEYlerExKEYdEjCaWvk
+9fEq1pIoUikfJaHiKtRYN6Bsb01PgWYKKV9zlZqpMJqDYKSebdEBB0nzZ+aVjAu
Qte7bw0+Hre2/6VH8J+Db2xVCaFtyJf2OnI86bGsGeVK01HHUJ26twlfhFm/mNXX
CWXdF6mnYTt+Kqod/Sqx9hlW8sJGi66u9cRcDO5gb1rjIjH3iQNSfa+aduhVXMow
5RJ4S381CawaOBjp7MohYd/6hXZhSOpy0K7Ub/ThjUQmbTxc8KSHX7l+aTNFU10v
kkDlUfCVPpNIx64BXAku
=ckuE
-----END PGP SIGNATURE-----

--=-RQo8s6XDGmEhr7qhRq2L--
