Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLwYW-0006DR-CK
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 13:42:37 +0000
Message-ID: <1349876553.20594.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V6] mtd: m25p80: Make fast read configurable via DT
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Marek Vasut <marex@denx.de>
Date: Wed, 10 Oct 2012 16:42:33 +0300
In-Reply-To: <1348450779-22495-1-git-send-email-marex@denx.de>
References: <1348450779-22495-1-git-send-email-marex@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gn/eqUjggLiIzoKfWqgH"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-gn/eqUjggLiIzoKfWqgH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-24 at 03:39 +0200, Marek Vasut wrote:
> Add DT property "m25p,fast-read" that signalises the particular
> chip supports "fast read" opcode.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-gn/eqUjggLiIzoKfWqgH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdXtKAAoJECmIfjd9wqK0IG8P/ReUKyNaa5BCDOduViB9D4V1
zG89E7GRr7aZAbRt2pEE6QotMX/vUyjvdGxIqSwoVv4vijmosxikGRGpFFGrqUBq
eWFHAT4IS1vIxo3l+DJd2+zG6wF90mvny7ecNh6Ob5rxVxMbJrIN8jLxMhTX1USC
3+Wutt6T+zLt3Hl9d54QhEGBoiXvVxW1w3aWVaqylJYLNP8riG6a05iCsETkRDBp
peCcG0GSaYbkjDiKfqQsFURMKpZ+mAscvBKYgRZvyHDSGJZ3kvPIdlfzFbMhqXOP
tMxVlvsraLm1TWz0tEmdEQGiDsLLdq2RWr8BLNH38nmcN0YwDdOzKHDbylB7GTKG
K9RTYTLeQP6l+oAKjgO4D6/4/fuanFEe29A0K/0N/V8BnGAxTLMqcjhRUpN2uGvb
l0xPWI+MKjNEtCruClocOVk69YgioL0YoDdvY2BgxSpBQBduCVF6RksIiTgDdgB4
j+svjZq8TrJmr52EqYSL2xqqmQm/F6GjD5CXOPVzkDnPpuIfADaEP56eV7Q6ZWdE
HtVZu2rVO3cM/EfbUyJp5UQl+AKmgUZxJiNUR/Oe8kLniO6Kr6uOT1vbjjigV9Aq
x5hPCtThZh9QeVhlEtNpaz89S6WMQr8z28H5855j/0FS/haacg1TsUodedR7Ov2N
e0iMDKGf6qN5hqJQtLP5
=YJaR
-----END PGP SIGNATURE-----

--=-gn/eqUjggLiIzoKfWqgH--
