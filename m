Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZURtf-000135-3f
 for linux-mtd@lists.infradead.org; Wed, 26 Aug 2015 04:01:11 +0000
Message-ID: <55DD39E6.7030406@rempel-privat.de>
Date: Wed, 26 Aug 2015 06:00:38 +0200
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 3/3] mtd: nand: add Toshiba TC58NVG0S3E to nand_ids
 table
References: <20141230200946.277c56c0@bbrezillon>
 <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
 <1420030733-10374-3-git-send-email-linux@rempel-privat.de>
 <20150825192509.GI81844@google.com>
In-Reply-To: <20150825192509.GI81844@google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tdF75Gg23eB4aGDvSxMWpAnAgdSCOGAsj"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tdF75Gg23eB4aGDvSxMWpAnAgdSCOGAsj
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Am 25.08.2015 um 21:25 schrieb Brian Norris:
> An old one here...
>=20
> On Wed, Dec 31, 2014 at 01:58:53PM +0100, Oleksij Rempel wrote:
>> Add the full description of the Toshiba TC58NVG0S3E NAND chip in the
>> nand_ids table so that we can later use the NAND ECC infos and ONFI ti=
mings
>> mode in controller drivers.
>>
>> Tested with asm9260_nand driver.
>=20
> Looks like this driver work stalled?

Yea, i'm working on other project. The company with asm9260_nand chip
asked not to be named any more. I assume, they have some legal issues. I
can continue to work on this in my free time, but i need some suggestion
how to handle this issue. Any ideas?

>=20
>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
>=20
> This patch looks good anyway, so pushed to l2-mtd.git.

Thx

> Brian
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20


--=20
Regards,
Oleksij


--tdF75Gg23eB4aGDvSxMWpAnAgdSCOGAsj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlXdOewACgkQHwImuRkmbWnsEQD/UFBZzFvkaelfOL1mcdO2cRQ/
5mWJy5U52mRA+aihAiMA/iMRtN7t4s/lKDe0pHJ4jeoC/0bYN3azcIc1S8KDngEo
=OWqy
-----END PGP SIGNATURE-----

--tdF75Gg23eB4aGDvSxMWpAnAgdSCOGAsj--
