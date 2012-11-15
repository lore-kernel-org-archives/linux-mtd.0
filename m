Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYzk2-0005Wy-DZ
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 13:44:29 +0000
Message-ID: <1352987104.2221.50.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cmdlinepart: fix the overflow of big mtd partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Thu, 15 Nov 2012 15:45:04 +0200
In-Reply-To: <1351749497-31692-1-git-send-email-b32955@freescale.com>
References: <1351749497-31692-1-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uXeJfmipn9k3VFi5TE6P"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uXeJfmipn9k3VFi5TE6P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-01 at 13:58 +0800, Huang Shijie wrote:
> When the kernel parses the following cmdline
>=20
> 	#mtdparts=3Dgpmi-nand:16m(boot),16m(kernel),1g(home),4g(test),-(usr)
>=20
> for a big nand chip Micron MT29F64G08AFAAAWP(8GB), we got the following w=
rong
> result:
>=20
> 	.............................................
> 		"mtd: partition size too small (0)"
> 	.............................................
>=20
> We can not get any partition.
>=20
> The "4g(test)" partition triggers a overflow of the "size". The memparse(=
)
> returns 4g to the "size", but the size is "unsigned long" type, so a over=
flow
> occurs, the "size" becomes zero in the end.
>=20
> This patch changes the "size"/"offset" to "unsigned long long" type,
> and replaces the UINT_MAX with ULLONG_MAX for macros SIZE_REMAINING and
> OFFSET_CONTINUOUS.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-uXeJfmipn9k3VFi5TE6P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpPHgAAoJECmIfjd9wqK0n9kQALMBpSJLG1ggyGGJxkkctJg3
hc/QOtsoOG0MLMCSVjfREg/WposAPsVg4/aB/s+boln1xyChg51Wul7N87VOyTlN
qKJTd1D8HLoEr0cKUhRvfDAx94Xs7EVU1SV8keOzp6WVW2H0ZUn/qfqC9+5ETcIj
QjxOLMD549Hq/ygHbba3zkvAKi9wKTE9mbDak4dWYQ3DURuXk/KJGuQdhlPfXclw
59vFcLSz3ueR9sFU2NsFrZIj0CRatVnwWJn1jRInlqO+Ek1IaKfdt9F/acqQMZko
k0yLZjLdHKvYKNuiqTtIwiIn/HEkvKSvCaOBAqs8VK6uZlxtvAMjw16J6cvdMuxm
VNQzo8c/afo9RxBvlWqT0b7L1oFtYkEHasW5/oeXs9N4q7Hc88g9pTW5yYiAZSE6
9thg1iVBD2/rEt4KPvMD18kNp8PLuO2vlGjaIhbx3oX9NobbbBbHwGY3+sQH/aX/
m8W3jnHJZsN70sLiITXeqYDCM2SKDtHtZesnxXrjsIDWsnHLGIboGszkMMNX/BJd
aNh0+b2LUGfoepqrIadI3H8Skts4JRLdvE4klu5c0t0zEVKajbpfnZ7icOzVZGxJ
BNLceXBK6aoZhIvHDU1dh2gGIALtwfabiDMkTAdYKXUEfd8iWMGe/15I8sdk7z6g
XWZ+jAjk1CibDkCfAfIQ
=fYaT
-----END PGP SIGNATURE-----

--=-uXeJfmipn9k3VFi5TE6P--
