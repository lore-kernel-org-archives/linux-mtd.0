Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2Lsf-0004ua-6B
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 12:42:25 +0000
Message-ID: <1345207610.27859.71.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/6] mtd: s3c2410: Use module_platform_driver()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Fri, 17 Aug 2012 15:46:50 +0300
In-Reply-To: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ho59VK9/2kMxLRPZHDQk"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, ben-linux@fluff.org, patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ho59VK9/2kMxLRPZHDQk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-16 at 16:02 +0530, Sachin Kamat wrote:
> This makes the code simpler by eliminating module_init() and
> module_exit().
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Could you please send me a defconfig which I can use to compile-test
this?

--=20
Best Regards,
Artem Bityutskiy

--=-ho59VK9/2kMxLRPZHDQk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLj06AAoJECmIfjd9wqK0AEMP/jqakWWIxDQVnTxeOZDSaMxn
zc2rjTIBC7DRxzZujlrtHptDQ8DtjMOG8YFsIL7T7msUfXajqz10zGxGdvdpBujm
LLACj8vpFfb5R12/RzmSz/kIaLupxiG5oDdNhuRbZdpxYmLjzG9FRN8capuxTM+N
X/tIOnhP0bAbUWNP1yQZVT0bBhbGKsEMz8KTf5kGxHPcGCUKQXJw66RVhORuiTbB
ljaH6Ns5u0N1pRbig0AyFlVY6qJWAcbFTvDc7/MnJAlwXtYoVrwtMebkKnYmyq+t
seIdLS+Bz9R/196u9qSbAmTEfMrAcyfo+vp0awYiSQYHSBToNdEK2dwENZeNbqLj
KooNugHglgZ89E1b3u56ZvAHgOoY15+PlSDmGbp2aEU9d03AQF8LhGZsf5ZtbeIa
NnywIU+ZLjVhwjpogSWtWiqnYrPGESbPj7bEnj5f5fEswPA7cyS+neGOji7zewb6
/6SRRmfVKiGtSCEZdSfbQKeXZX6ngpXnLli+NKBuYgUAAVg1D4OUYURRDsCTTyg6
+SVZN5tUnzrvsZcKmv2ooxzLqGj5qplH9/JyyJOckm+1uRpw/448YRGLd6VxQ9RY
GJwpIFk1acp7LIPuQrZmQSjLzQ21NzHRcZxGiEWsEpv1Kcv65TFuPBTI5xYl5Uga
AO6O+/NRJsZaxK/MRMSw
=xI0t
-----END PGP SIGNATURE-----

--=-ho59VK9/2kMxLRPZHDQk--
