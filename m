Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ShIde-0005pM-K2
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2012 10:59:55 +0000
Message-ID: <1340190230.13910.122.camel@sauron.fi.intel.com>
Subject: Re: ubifs error : read_znode: bad indexing node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Wed, 20 Jun 2012 14:03:50 +0300
In-Reply-To: <4FE19D18.1040100@parrot.com>
References: <4FD5F9D6.9020800@parrot.com> <1340052317.1971.14.camel@koala>
 <4FE19D18.1040100@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-35d82vI1t1Ipyep9K/zR"
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


--=-35d82vI1t1Ipyep9K/zR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-20 at 11:51 +0200, Matthieu CASTET wrote:
> We may have a driver that corrupt the heap/memory.

If it is ARM and you do DMA in your driver - this may be the cause of
issues because UBIFS uses vmalloc()'ed memory and there are issues with
DMAing it. Also, various things related to cache coherency are often the
source of issues.

--=20
Best Regards,
Artem Bityutskiy

--=-35d82vI1t1Ipyep9K/zR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP4a4WAAoJECmIfjd9wqK0oh8QALImgjAPYpPivDPbPSxLG7Dg
Q/O0JHJNUoZY7ptSWT/D2Hrxw+dACOSf+DMjJ/1pTWZ2u34fWGPaA335tgB3H7oD
lX/EO+3XzP1WX5xOF2OQhTDD34V45yY/NXWjcO0/fMw89GyXZT8OlMGvHddA3ysC
n6CuBGrVvvVjVwOWJWff08rCNAR69N917oWDLNhgh31rdrFAtoWR3YjLJAwxsCCf
OdqUkkJFo1/mKdSS2GUcaQnNbcrAr1gdki59N8Ch9veWbVS7bzq65SKGTCrWl3kc
GX5NEAtNjICaWCofV137v9dBzJAMCxp/aRwGjemR0Kg3rYANPWhSdk027HmVgMXV
ahGgrsaXJCwWMj4isDOB/fwbYs7XfIOqoe9oavqWBh8kLfYWq8PVWWtGghu6Wh50
BBlLezN+VCc4FmqvU4palV6I91bm9SVpfEVZSdUYZSNRwfM8spnYltjJyiA55zWo
dxNr1Mb95CcTDN/Hl1i/g7Zz9KztXtPbyR6bzUNj7SgpFyJZlp7cx5ZXqvEFUYwN
dVKW4wOlWwhrVJJ24zWXBxkci25MkI+ac6cxi9JPjy6PbksV4LXPghr7G+KGrJA/
8UT2QmrQ1WVVAHmz2cp8/OsAXMOk9S2yhbEU7ajWHoZHX6FAT1czug1QGiVj6vFO
qILSp5CmSYLwCMSo41Ae
=p8T0
-----END PGP SIGNATURE-----

--=-35d82vI1t1Ipyep9K/zR--
