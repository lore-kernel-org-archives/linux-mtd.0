Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SXU8o-00073o-K1
 for linux-mtd@lists.infradead.org; Thu, 24 May 2012 09:15:31 +0000
Message-ID: <1337851149.15137.93.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: ABI documentation: clarification of bitflip_threshold
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Thu, 24 May 2012 12:19:09 +0300
In-Reply-To: <1337709822-11587-1-git-send-email-mikedunn@newsguy.com>
References: <1337709822-11587-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-XTCzX4Y9JvciiiaXioD6"
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


--=-XTCzX4Y9JvciiiaXioD6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-22 at 11:03 -0700, Mike Dunn wrote:
> The -EUCLEAN return value applies to mtd_read_oob() as well as mtd_read()=
, but
> only mtd_read() was mentioned in the blurd on bitflip_threshold in the AB=
I
> documentation.
>=20
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-XTCzX4Y9JvciiiaXioD6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPvf0NAAoJECmIfjd9wqK0QdAQAJVJVJjNNUFmhq7haTyUHNnw
7Hv/+LDrGiJT/di/v6Sdkh+0dq1nVwSz3AuSxaXxZVBxSgNawbN9EVhfN8EqQwqo
GHlJOsub5aRcy4AGtmhm0RDkhnBoEM+ON2n/AsmqWPjxJYBT0c9KtCczov2C+1O4
TMh1iPET0EWJVrQjma70WMsqEsw/7ixN6pEWlN8V2CeGzFxmvSTEkPuh/g08X+kv
eNAIsZGIlRZ1Qksjq6OlBTJ8Mpx5RczhW9Rf0ms7TBKeIUpI17U1di0H/PBlS2sA
Qr10TZtD3+XYBhigX2Qfn3jOpJoOZpeALYRaNl5R2eiB6IsYBYP101m/PvyUnPLz
qoxLXADVukT9RgAU5FFvFV+KhTzUquq5ptYMrWv1vZt6dwyeDze1jmahNSWZ6TLo
K6mhxJiygjdpEjhtzDL6GxzMZqwnUblsM5w5RGgnCeD9V6pcKxgqj5KsF7YIKGTF
WByxFKkpuE3rV41YkT3CH1lK3KqPhRg7Qv/P7tF/vhfcrhwdxfzE6mvrAWF7208N
MjKjz6K//mtWaLYfmFrHyeWLhef9cLmNELpTejQnqewo0gtjenyWZ+qFdg6NytTp
QgOcicJVaQ28boKQUGJ5yaMfXCe4YIOxvQgd31fIpDGmYbkTGzxmiZQad1Ep7t9S
+WL4vqyAyoysL3t7brPw
=OUfs
-----END PGP SIGNATURE-----

--=-XTCzX4Y9JvciiiaXioD6--
