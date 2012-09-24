Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGAQ7-00014g-Og
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2012 15:18:04 +0000
Message-ID: <1348499871.4880.68.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: docg4: ecc.read_page() returns 0 on
 uncorrectible errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Mon, 24 Sep 2012 18:17:51 +0300
In-Reply-To: <1347378650-3522-1-git-send-email-mikedunn@newsguy.com>
References: <1347378650-3522-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-G787EQTfEZdElTV2D1hI"
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


--=-G787EQTfEZdElTV2D1hI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-11 at 08:50 -0700, Mike Dunn wrote:
> Currently the docg4's ecc.read_page() method returns -EBADMSG when uncorr=
ectible
> bitflips occur.  This is wrong; 0 should be returned in this case.  An er=
ror
> code should only be returned by this method in the case of a hardware err=
or
> (probably -EIO).
>=20
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-G787EQTfEZdElTV2D1hI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYHmfAAoJECmIfjd9wqK0DDMQAK0RJJyi8/9b3qjQGWI2yTkQ
2SYnxMKbZuOXQNfcS1CLVdoNsJ0b44PPXhq01BZtziN7uTdw0hs2pA21uIcs4vwp
TRCsLn49ZCVjRPwQ+GAQu4XcSxMW8wnM52O8Db07pgnAUf5zrl8LuZgu9I76arpl
mmtGDWigwvxCNFoJO1ip0GxAQaLVgobAAgljy3TiSv066vVgtOJE876dUhy6QXDz
sWsTw2+CXMWRiHfs7A8i6vIrV7DcE3rvaE6OqGUHrE1/aHOFcSBP0F8yzhabpm7Q
hkovXtybPE4Giq4pG/XnnQ9qbl+GaPEWBHKY8xi5XDaVrimOyS8S4UWyCEVpUTtF
0bai35j1DalvSwGPRaSiHnVn60F9FNnVr72A8jOJJ77s5s7jDHJEVkg6vQzkUA5e
YHloBjhJdigWi2uq8DXJRKt32J3W4w8howJP5nigGo/QBAsenQDcdAf4UCJmkCbd
n0Nl7+0eg37BpvSUBG0gNEVDdskNcktDYNECXbGWWl4/sLCx8qHonA37kyVphzYj
vzLm7zzq98LwDeuhT9f5DaiY3RiqJOwgGYxD1v3EFmHZtCposIGIJiGj7PlsNo4P
KU6l1/MfcAOEIHHTS2Hp41seE1xbNBso/C4CDXBVq86uQ6rB9amL302yHbDcSo7d
5G/lOW4VTItRRU81wNHc
=Kdsk
-----END PGP SIGNATURE-----

--=-G787EQTfEZdElTV2D1hI--
