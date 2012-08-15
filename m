Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1c6D-00072s-2j
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 11:49:21 +0000
Message-ID: <1345031619.3393.131.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 7/8] mtd: nand_bbt: use string library
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 15 Aug 2012 14:53:39 +0300
In-Reply-To: <1340408145-24531-8-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-8-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Vsaflw5eaFCcfNGSwDlc"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Akinobu Mita <akinobu.mita@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Vsaflw5eaFCcfNGSwDlc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-22 at 16:35 -0700, Brian Norris wrote:
> Some nand_bbt code can be shortened by using memcmp() and memchr_inv().
> As an added bonus, there is a possbile performance benefit.
>=20
> Borrowed some code from Akinobu Mita.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Akinobu Mita <akinobu.mita@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Vsaflw5eaFCcfNGSwDlc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQK43DAAoJECmIfjd9wqK015EP/R1kljXylNyzHhe88mYoT7VI
QHTgj0vI8gf2fldVxcwDdIfYkgGahJSj1oZof5YNd8DIoA0MAYjy622qdcl/k/7b
m3MDteDK/EIGBBv6h7KI3UZV+WvrgDgFZxLzDgifogNpuc7qf8oDslo1riAzDfhn
gIKSKLeo1c99iDQfmo+APZZpG8/tMWdukIe1F/HRfqCv0WfEDy7o3TTnFhMG5fBv
eX0d50IyYLrfJ4qRF47QFcecpffbcU3ug8N3COCEQJLylWVMDYguC6uAaw4OPGl2
tg7nDp6ocm9z00W4u8N9mjK9NZ8+WJomRsOy3lR4uQfKQMmpQWLUinX7u8V8sMYB
vsEoZ/fgZyr4S6WoIuQFjBhrFiDEULWLGFAoBxcZNun6/Tl9LidC/y4Cdz0cvQWQ
Bb7SsCIfP3bv2uTRNrqlQwK/7bfFHHvI+CG4vxJb4vcEvPgsQ2GKMvjYeF7R/BcM
ixMpGrIckdpDhfaT8KVToPHuPzmwqjt2lj+wuQp7d8kjdxrHpZeFMh0F1BUxViQP
goSANSmGnVDWysnjCeeMuHiHYJCiD1V1tIpb+V4L3xHFbRVEAIQEqH3TziO0K+xb
DksRo0t3OGm9LCemIN8UfsjAFqYgCa8oc4pk4U0h4NEiMZKAavZsfqXycq6T1XBr
16GYI6gJSE+q6QQwKAz0
=zKTa
-----END PGP SIGNATURE-----

--=-Vsaflw5eaFCcfNGSwDlc--
