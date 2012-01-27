Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqnMl-00051F-DL
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 15:05:27 +0000
Received: by pbdx9 with SMTP id x9so2087518pbd.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 07:05:26 -0800 (PST)
Message-ID: <1327676852.29385.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: docg4: fix compiler warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Fri, 27 Jan 2012 17:07:32 +0200
In-Reply-To: <1327097569-6303-1-git-send-email-mikedunn@newsguy.com>
References: <1327097569-6303-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qHr/6nXa1T0RlnkLqFS3"
Mime-Version: 1.0
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-qHr/6nXa1T0RlnkLqFS3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-20 at 14:12 -0800, Mike Dunn wrote:
> This changes the declaration of the module parameter variable from int to=
 bool,
> an oversight that was flagged by the recent patch to moduleparam.h.
>=20
> Also added an item to the TODO list in the commentary at the top of the f=
ile.
>=20
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>

I've squashed this into your original driver and pushed to l2-mtd.git,
thanks.

Still wonder why it lives in mtd/nand while some other DoC drivers live
in mtd/devices ?

--=20
Best Regards,
Artem Bityutskiy

--=-qHr/6nXa1T0RlnkLqFS3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPIr20AAoJECmIfjd9wqK0/ygQAMk3HV3yHE8wU74w+5wz53bq
YENvCIYcZ7euwl3rZl44GD4M7BuB+6UURKGB2vfEEX30ud/L13E395+Nc/lxfkUr
axFVvuuJBPqKbmzOG3y2vcAAU4vci5IdmTTEBqFcuMbZkkvjB0Sz5LSDEST+QCdH
XDmGOE5ay1V+Og22Hwa9CEJzq1OdDx7Nv2j10Pj/5gXmITov9rG+ECKisl9szGs3
vuF+c4n4dkNF0tIecsOxf2vcRu09pZAhztXKLV3Y9oWVthxrhPEFSwxeZnewK51Y
B3hkJJJn55ubEX9yya8Ou9dRCKfIrpGlORsmqyLKkgvorjo8BJ6cKpaixtpnG4TC
aAzk2mYozejaHF0XRX1Y2v/YnOz3nzU6qmssegz0SE/u5C0OrIPd+hCxshO/0Gtu
IcQcLNwK6MmdqDMpngz2xjqDc7ofP7nKVemq7K1WoNIiAqId2lmrIHcsq+FlrXi+
9nRzz7AT/2awZmjR/GePaXIeCmsn60K3NrKSpqxjga1bNB+2MwMtHtdtKBw/RMiB
OIVJUZqW9+kNB5VNVecYIWAHT8FDaEhF10yWQs8oaqI0ox0hCu4j1zPtbV6Q8Dgw
mPCsjWUgsDgkFuRoCokI63rdiiMvXTxswWa03V9DZ/VBh3jW7s1BiAAeZWlz5jQE
ODDSRerUO+LUoflV1+6E
=fjpV
-----END PGP SIGNATURE-----

--=-qHr/6nXa1T0RlnkLqFS3--
