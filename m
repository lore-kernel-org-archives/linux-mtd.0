Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv2oy-0000yA-UH
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 09:28:41 +0000
Message-ID: <1358242205.2731.119.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Zach Sadecki <zsadecki@itwatchdogs.com>
Date: Tue, 15 Jan 2013 11:30:05 +0200
In-Reply-To: <50CA90BB.5030801@itwatchdogs.com>
References: <50BD01F8.3040003@itwatchdogs.com>
 <1355147097.2657.33.camel@sauron.fi.intel.com>
 <50C5FD4A.6090405@itwatchdogs.com>
 <1355398036.3400.45.camel@sauron.fi.intel.com>
 <50CA90BB.5030801@itwatchdogs.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mD0Ck3rVtopVRdQPe+xD"
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


--=-mD0Ck3rVtopVRdQPe+xD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-12-13 at 20:36 -0600, Zach Sadecki wrote:
> Always report corrected and failed ECC stats back up to the MTD layer.  A=
lso
> return max_bitflips from read_page() as is expected from NAND drivers now=
.
>=20
> Signed-off-by: Zach Sadecki <zsadecki@itwatchdogs.com>
> Acked-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-mD0Ck3rVtopVRdQPe+xD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9SGdAAoJECmIfjd9wqK0jjcP/2uuiEmSLNTBgAcpakHkFG5c
g0do/IUU0WXxVBALrZWLB1q9qSWkJtkEFbEoeJxuKZ77IipSOdDzJYUBfuEbW/cx
skzensqBeWhkuD1rcJyjuAV+XFzKlQnRdFuShKRdd542xyzvzhXpSvAJsDUo8CvP
3c2a4UUTVe4Yn5f2C0X7epldfT1nzoEJDpoTtR9Rs4/PixnjgN3r9Vc/bk+TlGJA
EqUytNFKx85hlFe6+wZ7rPDkFZEHw3yFxTO4ceDXJvB07Fe8Vbb62FcRxEC3TmgA
G/rMYGjrTvgBtT58Bg63fOZhDrfPSGe5iK4OdBmt/ETGNYT88YK36Qm6GCa1DmH8
WN8DzkFa8jhIc4NF6I6pO9G7DGBczpJKGUaujo9Y1pWRSM1H3kT9G9ZrIHzTHhhH
q79p0UHkhpmJLpFDIxxFrBBZ21zlN/1YBp+OT7QIDZlk1FjLOxvBboe0/qJpCsxH
cALSpBo5vkSXf8Hqj5UwQT7aehV1jZAmlD/ziICR5RRjeMCsErDC4q4OvHjnSqTh
FMvgjA5eSN+NpNaJp1QEaXFtJ2gv8izoiXcWB6OX/Dha2OkyiRNNWtHSeH5YWS0B
o2gZR+jmay6/5crdR28rJRGM/nX9tPVpTdGZJZfgyb01p+AGC6yop06sni2WmTNu
OwZjjAEiH/baXkn1KS6+
=gnsx
-----END PGP SIGNATURE-----

--=-mD0Ck3rVtopVRdQPe+xD--
