Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGmF3-00050A-DG
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 07:41:10 +0000
Message-ID: <1348645270.24309.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] mtd: prepare place for BCMA NAND flash driver(s)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Wed, 26 Sep 2012 10:41:10 +0300
In-Reply-To: <1347481275-995-1-git-send-email-zajec5@gmail.com>
References: <1347481275-995-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-weRZAh5Q694mn8myYA60"
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


--=-weRZAh5Q694mn8myYA60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-12 at 22:21 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> BCMA bus can contain NAND flash memory, it's registered in system as
> platform device. This adds required hooks and place for controler
> specific drivers.
> At this point it doesn't work yet, so it's marked as BROKEN.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

If you send the next version of this, would you please base it on
l2-mtd.git tree, to make my job simpler, because otherwise I have to
solve small conflicts.

--=20
Best Regards,
Artem Bityutskiy

--=-weRZAh5Q694mn8myYA60
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYrGWAAoJECmIfjd9wqK039MQAKu8zJED7bmLutRu/3YC2Vek
M+ySjcCjn6C+do4vnvfK9BgaJ4ibCMuTf4bwlssEcq3uaFBFYwgJ2Y2UI3zhMhvV
MuP3avrc3xmtAxBYZHnPbC684bfKNB1/QpAiv/sqrvxgFoW3CEHPUa7+55rAoIYL
MJ3tc1a4txfhZe3F6ofxR83Qfi4ZO8qeYtkDbIiK6c9ueyPeds57dbbSBwUTuAPC
PA/5JPdUaAs0x4q/kcE1eIXTCLGfIrhs/8VXqXMIm/FqH0VizQRqz66nw/6d79r0
iC+Pp8KGD2Wsr3W0DuZUnI7bK3+3znsMSyOTq5dmZvWV/NPPAIW+JWYzrTWWkb4G
9URLTem9vPgBa+7mYodx2IeT1N3gvpk5wBaQHMf7Ewe8NjOOwVIPLbOAZ6P/qiBL
9E2PfjEx9NkmktttFmY0wBOBQ5haO/t54Ul75hb8PhQwer4/3tPGO9eYpmUy8PIy
DxPyNUnUGDwkFjE63ro74NbluldmgdaLxuqEAjsWmV1bjomeOPWLGRFhUAn7T9Az
Go4rjOqpAiSxk2u7hQn3bCsGi66QvP+g7yd5JpT+O+WfsDUu3TFpLuz3OFJYJ7Gn
hGl1FdJ0moMwL3ikDPbYbb0JVawn44adPiSOHxGYx1x/BLpmqBalTK3ySVpxD+y5
ytVgo8E1raeVnPHRcfPS
=lszY
-----END PGP SIGNATURE-----

--=-weRZAh5Q694mn8myYA60--
