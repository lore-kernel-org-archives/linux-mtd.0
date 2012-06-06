Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScINR-0006Cr-AM
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 15:42:29 +0000
Message-ID: <1338997575.6875.72.camel@sauron.fi.intel.com>
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 06 Jun 2012 18:46:15 +0300
In-Reply-To: <20120606181529.291aa9a6@halley>
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
 <20120606181529.291aa9a6@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-yDsZvqm2wFRXNQ4px/s8"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-yDsZvqm2wFRXNQ4px/s8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 18:15 +0300, Shmulik Ladkani wrote:
> - By 'add_mtd_device'. Here it defaults to 'ecc_strength' if NOT
>   previously set by the driver.

But this is wrong. If I use the old doc2000 driver, with ecc_strength =3D
2, and it works fine for me, and I am happy that UBI scrubs for a single
bit-flip, why should my system become broken because someone decided
that now UBI should start scrubbing on 2 bit-flips?

We should not change the defaults - if I do not set the threshold via
sysfs of in the driver, it should be 1.

Unless I am completely confused, we should change this, CC -stable if
needed, and ask dwmw2 to merge that.

--=20
Best Regards,
Artem Bityutskiy

--=-yDsZvqm2wFRXNQ4px/s8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPz3tHAAoJECmIfjd9wqK0fZQP/A/2DbsS4CZRty1/vvjF0Y9n
g1BNY54PPQ6WxjrU9C6N1zbvfkH+X6wsk6OD7JpqIsWgt+Hf5ZavJ5wycmIQZkw1
7+GO38DxKRzD3DLXIsc8vpzL4JfDezfagi10KtLKMfZZ4XJB4b53qaqQqVv/+NYV
g7xiKJakUdsWcbJ8MyRZvWqwPd+hhBp697137jB6N1EfiIITGHcH+BoCA1wLpSGA
filUEcIw+lg1TsDr9EfRg2perROaDBErjIqkOXaaBFCJkwf8ZRi8X98fyWfZ55Yc
tkNFpMwTBVBN0gCJj6oi+QIxtgxldRNz45qrLOJQg6eO8z62sLv9IC14rJvUaN80
IJgay1B/rPTPdKCe7GLC/8b7ba5fE39H0agpQslhd9cRB0pILee6S4bRwmHcXuhh
Kw5tNDulHWu4xqmcXuC93EB7gaMXqrpG9gg3NFIMQt5DTm7edxeH+IkbzLovX/fb
45ahIorM5dPSuMoD1/9jP79hNaA0CbA+H9iqni7WcFc5Ieg9GJ4Hp1BXcfT6X4RK
ma1O8tMhk3fIwzt8NEcpj3K11u4/jaNjRTfYozUwGLCQpfupUphSLGU9JoROUwHP
v9CR3HMWJTvsV500YBy0Gawfe4Qr7L+yRb7vxtO4TLcVYM8dqU+TWwjLoMFE7il+
RmzluYbFpa8rktP3MefQ
=5Qp4
-----END PGP SIGNATURE-----

--=-yDsZvqm2wFRXNQ4px/s8--
