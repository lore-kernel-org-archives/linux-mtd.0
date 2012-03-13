Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7RVv-0001z9-CU
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 13:11:43 +0000
Message-ID: <1331644379.3595.49.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: fsmc_nand: restore platform data partition support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@stericsson.com>
Date: Tue, 13 Mar 2012 15:12:59 +0200
In-Reply-To: <1331643405-759-1-git-send-email-linus.walleij@stericsson.com>
References: <1331643405-759-1-git-send-email-linus.walleij@stericsson.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FbwoUsfolI3dVbT+vWp9"
Mime-Version: 1.0
Cc: Armando Visconti <armando.visconti@st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Vipin Kumar <vipin.kumar@st.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, stable@kernel.org,
 Vincenzo Frascino <vincenzo.frascino@st.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FbwoUsfolI3dVbT+vWp9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-03-13 at 13:56 +0100, Linus Walleij wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
>=20
> Commit 0d04eda1430e9a796214bee644b7e05d99cfe613
> "mtd: fsmc_nand.c: use mtd_device_parse_register"
> accidentally broke the platform data partition supply
> capability in the FSMC driver, this make it work again.
> Tested on the U300 that use this scheme.
>=20
> Cc: stable@kernel.org

Specify the version please: [3.2+]

> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This patch does not apply on top of the l2-mtd.git tree.

--=20
Best Regards,
Artem Bityutskiy

--=-FbwoUsfolI3dVbT+vWp9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPX0fbAAoJECmIfjd9wqK0F3YP/iqanUTnRucT1T12355jqSJ9
JW2iUuVSQ9AShluMp4YIW0GNRIQIX+ZTfhkzu7oOGRsHB/xBO/yLM747jc8q363X
O3hHY+js4VwBH//3y3vk3EFrDUeaF0rzfF/GP9I9sSWAbFzJ3f4VVBgHbHUVvzNq
F06+f3mgTLm1EsYaIkxI5R1oFYZwWSzfRhJ0I+MsEcg65P+xHIe4F9bioCb4LUB5
Zy8XXbORWsou+jAuqIe4ebehDY2eQjAMYoIafFImS2odny8qDGRUTHZncpRV3Vz9
/5th8cHIJOkG6bToOeP+gu3MkPCsT8/+c3cByYKJt8oz0XTzObhAhiTgIsCPGW8I
Eja+LFqHmZYzhZNaic3CtO6cgPjfTVN6hgtCH0mBkcgw2cHoL/xZ05G3RNjBCRtl
+jcdS5WvMHTgfokBplInHREUknRZ/MTajOYuTxDgFwBJsGoa22c9WVcWB69l2SpJ
n0IuFdXY2NOKD+1qwtjuSmqalK+Tu20e6f+qezr2rjv+ibZY5q2nShX91i+vxTb3
xoBp0Zb9ehWlyg4qWyaj33lvaEUsQra5RsXWOTv+/Lf0ee4hEtTAHPKRJNj3jYZs
RcPK2ene9BuEhlC5iOMD33aUy10NZ8ZDm+WKpVXm0263+YbjHg3yRAJJAKBTS19W
5g83MibXUuPYj0xIHM0A
=sG9M
-----END PGP SIGNATURE-----

--=-FbwoUsfolI3dVbT+vWp9--
