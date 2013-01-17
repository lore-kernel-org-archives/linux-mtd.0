Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TvoWl-00034K-5V
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 12:25:03 +0000
Message-ID: <1358425592.2731.239.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: chips: Add support for GigaDevice GD25Q32/GD25Q64
 SPI Flash in m25p80.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Michel Stempin <michel.stempin@wanadoo.fr>
Date: Thu, 17 Jan 2013 14:26:32 +0200
In-Reply-To: <50E8B9B8.2020701@wanadoo.fr>
References: <50E8B9B8.2020701@wanadoo.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-CrpTePO5QsuZIKNET+X4"
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


--=-CrpTePO5QsuZIKNET+X4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2013-01-06 at 00:39 +0100, Michel Stempin wrote:
> Add support for GigaDevice GD25Q32 32 Mbit (4 MB) SPI Flash (see datashee=
t: http://www.gigadevice.com/UserFiles/GD25Q32_Rev0.2(1).pdf) used in Hame =
MPR-A1 and clones, and for GigaDevice GD25Q64 64 Mbit (8 MB) SPI Flash used=
 in=20
> Hame MPR-A2 devices (datasheet: http://www.gigadevice.com/UserFiles/GD25Q=
64.pdf).
>=20
> Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-CrpTePO5QsuZIKNET+X4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9+34AAoJECmIfjd9wqK0ADUP/07MXUHK1Fh2WsSrsvmCw9Pd
vTXbmU9AMX7f38B37AYFw3Lq6CgdOieAJVj1cCidjSepUv6c6A6J0WaNa0dr+cup
9HauSHCh9ONPzjAenlRvapA1zTNnmgY/I0TPMvjbNsTKXkeOCoTamKKxLxa6f2oB
SEdbr7oE2v6+N58KdEq5/rVcQSk/M9XVP5z4z+8Z4cDtCBRAIXfzC0UfR9v9zAv4
dNqW2QBW2sVEMypjM0Y3uaHTeWqZRTobHV91V0k6SlGvrAYgXm4s97LxTkfKufdj
JZVP84SXDIv28t7HdXOM80k+Ch1l09ISshyglIJlj/f5r15cCaoUpz+oRNU4i2Zo
wDu8Z9Igp6mEEaI0NaarQ6Pe8/qLTRPc+vCvJlm57nXpEMgJmBQaGTt+5KqZTU9M
KVvBtEmcT1MtzrSCf2GPEOYJsFXsd0SoASRS1bB6XQA4u50Z9E9r230LaHbcule8
z78/hKapyXt8/7ud6MzlFasRwd7tjqXxntvg3I7HzPFCf3GJQA48CcEsrZpfygWD
4BHuP9Rl65u+bUggu/5p54DuOOaBQ+85Izh1UxS38uvph5qy0b1I+PlBMvAH6Ixi
sjz0CsIs8nnN1LjqdTc1IvODEAIblUPT8klFhKZgty8a3x9t/EsoQd029SjGqR9w
OXPEOBTIFIBXHBkK79iH
=TSXg
-----END PGP SIGNATURE-----

--=-CrpTePO5QsuZIKNET+X4--
