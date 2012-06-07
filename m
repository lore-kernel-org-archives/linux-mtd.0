Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScXK5-0003SH-Ac
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 07:40:02 +0000
Message-ID: <1339055028.6875.87.camel@sauron.fi.intel.com>
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Thu, 07 Jun 2012 10:43:48 +0300
In-Reply-To: <20120606175507.GC17332@parrot.com>
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
 <20120606181529.291aa9a6@halley>
 <1338997575.6875.72.camel@sauron.fi.intel.com>
 <20120606175507.GC17332@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4W+5WYaqK0vv03jIOD/U"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4W+5WYaqK0vv03jIOD/U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 19:55 +0200, Ivan Djelic wrote:
> In your doc2000 example, why would it break with a threshold of 2 ?

Yes, "break" was a wrong word. It would just change the behavior. But I
guess it would in fact _improve_ the behavior. Let's not try treat the
legacy specially, I think we can indeed treat this change as an
improvement and se if anyone complains.

--=20
Best Regards,
Artem Bityutskiy

--=-4W+5WYaqK0vv03jIOD/U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP0Fu0AAoJECmIfjd9wqK07ncQAK36OZguHJm6vMw2tY78NO5M
UiYvqWWEgVtBRwlPy0MXViSXQbjT6YiyC7tZFuEjEpfhg+NenDxeqqbbBEb30F21
Am6CaPLVhPh8qJXwvcyKPyrNMkAHRJ8W3GJoaLas1Bieyl7cpCHVsRsJsgUa1nNd
+twZkvcdfJPwRH11nNWQ1WIGIzetKOUiwq1SfCr+Ejx7WIiXMm1r8kQIlABaLMoS
XRA8CU78XgJRJ5PpW1c90KwRJN2mEdZXZngvtYJRq0A4FAMD8PnNx4wjGcCVc4GQ
4A8TyJ5ycIOavnAasEAbhvQ8OHnQpw5v+gUitNH5zBS3B6zJEx5P4+37ZwpxgqE8
8TyfG/2rfFmXGOlTqGSR2ecKAIN1E27HO/DUG837pTu0qf9g10Xz2A46yceU/rUx
V+yp/lvNIVs2xW1WMqUc2iqbhlXcQW5VpMY8o6j02h3cMphyPPHLaq3nWAUHGOox
nU+KvwEfZNplltU/zKiQ8tFWL7LxWyiDY0oPA0EGQdy7lvweohDT27nHTIWOu35N
nsWvkIZ6LhOGVgx275cP5S0BlIQwPRjYKOiRPQpQOoMb91hALWXzH7nFcCeeLvmM
vHmnXotxMwEoAy6xIGvwN3nKS1EF8Dw3ZJXGrGxvplh3VwiAqLvLcKArKDs28pai
xoAdISFkPTH3yo2yvJPE
=KViO
-----END PGP SIGNATURE-----

--=-4W+5WYaqK0vv03jIOD/U--
