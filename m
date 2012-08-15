Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1aMI-00066Z-44
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 09:57:50 +0000
Message-ID: <1345024951.3393.119.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mtd_nandecctest: add more tests
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Wed, 15 Aug 2012 13:02:31 +0300
In-Reply-To: <1341838545-25328-1-git-send-email-akinobu.mita@gmail.com>
References: <1341838545-25328-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1bJF1dVUvXuwb+9u98BM"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-1bJF1dVUvXuwb+9u98BM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-09 at 21:55 +0900, Akinobu Mita wrote:
> Current mtd nand ecc test module tests only single error correcting.
>=20
> This adds tests with possible corruption pattern as listed below and
> overall rewrite for minimizing duplication of each test as much as
> possible.

This patch is very big, could you please split it on smaller patches
which could be reviewed with less efforts?

--=20
Best Regards,
Artem Bityutskiy

--=-1bJF1dVUvXuwb+9u98BM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQK3O3AAoJECmIfjd9wqK0/ikP/jq3qMUoVe/fCdQVDzXNAkJZ
Z8DXB/LUrniLbaklL+m9o/10dQCtwzqODZYzORkFRoeIYXuOkIQDRzXXNYUjoC9j
bMB1hBOVOJoHgU3tMJC7AEuu7qcdjebQjdFzlU/BZuEI4FHGiEzqoP32b/bytZMN
3DTpgTAG+ENDh1Ur62az4KLsUHqShSateJjWlOBGIkefe+vfClsLHK/1DupestrE
nv8WQwKJX3tmEjVfwc5hASA0Jlp7p4WWUhWe04dAgA3vy45p9j7z8ntfSVqo23js
Xy01fH4onWI8t4FTG15JUpn4MDiY0eRR21SGJsqreG+fLgMzINCSxPWxrrc5sK/W
NXr8ouxEjUu/rGd1hqdYP/rqJ/T7aSrcObBtfY0syMSzoy7Ba/byPKSBZIF9Pjyg
QsOFN8W9FSdVoJ8CbBRovMfU8UHitkqf7nhnAGdh0+IKyv4lHDZWUM2JQCisIrWv
rOYK7EOUiCmQxOMfu7owAfwTeyl8oE1YITiuuH3FDyxenSnD7CbmVKuhsg2rs/IN
zC5bUFcXMKBe0AnSyBLQ8YJHrLEBEMfWDuTaXw62JUgKTTZptphh/VrYTdKLXYwU
R11FJRGyTTHY95+xDmFC4OamZ2oJ+BGOs3TC0HeCuTtMqVTOxve3hEwYEGPxCCpl
yKInURggKtGoPmCuw4tA
=WmGz
-----END PGP SIGNATURE-----

--=-1bJF1dVUvXuwb+9u98BM--
