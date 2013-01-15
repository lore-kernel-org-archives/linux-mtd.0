Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv1UH-0005CL-4i
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 08:03:13 +0000
Message-ID: <1358237077.2731.99.camel@sauron.fi.intel.com>
Subject: Re: [qestion] about multi-page read/write in nand flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Tue, 15 Jan 2013 10:04:37 +0200
In-Reply-To: <50C85426.2090309@atmel.com>
References: <50C85426.2090309@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-87PrnsuXJWKYOLeXsxcY"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-87PrnsuXJWKYOLeXsxcY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-12-12 at 17:53 +0800, Josh Wu wrote:
> Hi,
>=20
> I have a question about the nand flash driver. Whether the=20
> nand_ecc_ctrl->read_page/write_page can do more than one page operation?=
=20
> or is there any interface for nand_ecc_ctrl to let driver support=20
> multi-page read/write?
>=20
> Since in that case I can do some optimization in multiple pages=20
> read/write operation. for example: prepare the buffer for next page.

I think OneNand driver does multi-page I/O, check it.

--=20
Best Regards,
Artem Bityutskiy

--=-87PrnsuXJWKYOLeXsxcY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9Q2VAAoJECmIfjd9wqK0NPUP/2grwONOb1VYjkFRufB7djQl
KATSDGGMKKAu4j4i0GgwnRi6ZoBvoebxDFuGUzR0sC7gA83Jv/ntwo11dA/UFjUe
tWciZDNV2tpIntNvdk2CRaz2OZcHRs+5gtBSdFAEgObzN6/ygHzLKqd0T5fnwyap
MT6Seq0Yc3sA1twBwBFLdRoWLQWBFWyUyvs4qpHNijb4v1ocWdNSvX9CqIIv36+U
NY+GxRE17RevTaRgG+4kdoKaVfshGqaW9q/+hItRremzCi+Yc1AfzBrDbVXcc4VR
h8ms2HdN3C7X1myldCPtQcXM4UvWlKatFg8Gd4SAnWv8dH3HVhJPFBBKgwGMa11n
HdrkgufMSZfeAn4e040zh8yRLNmmrOCmacfmd1B58Zjtf16AQCAHyUtGyzvWkkzF
QLYRnEhorq4H2P5dcWAk7fqEdlZKhXl4SOQaiVZEVEGU8Ea/bja9xVXfvZgvQt0s
VYO2L3BHKcNAKTfgAF5Me/ROEJM1hSvSV/tYo3SuIBEUIIpyJgEqGba4qTrchSsL
YyuoYblZFB75WfI9+YdoNcum5b9SzTsESI+MFk4NIOa7w/9g3vjxeO78/IdUcUpr
TrZ81E01ZZ3wNpC8Ab5iAjl4fIvHxTatdmQA7ZAzeaoDr1BWRmLnFdvuY6tsro/U
aWJzyh673XCmMo1ywjuw
=As17
-----END PGP SIGNATURE-----

--=-87PrnsuXJWKYOLeXsxcY--
