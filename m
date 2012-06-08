Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScvZ2-0001x6-VQ
 for linux-mtd@lists.infradead.org; Fri, 08 Jun 2012 09:33:05 +0000
Message-ID: <1339148214.6875.117.camel@sauron.fi.intel.com>
Subject: Re: Is there a bug in the UBIFS?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 08 Jun 2012 12:36:54 +0300
In-Reply-To: <4FD1BD03.60800@freescale.com>
References: <4FD1BD03.60800@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Gs/8W5bbFjz4a+LvpyUd"
Mime-Version: 1.0
Cc: Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Gs/8W5bbFjz4a+LvpyUd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-08 at 16:51 +0800, Huang Shijie wrote:
> [ 3526.960000] UBIFS error (pid 389): ubifs_scan: garbage

UBIFS complains that it read garbage instead of proper UBIFS nodes.

> I am not sure whether it's a UBIFS's bug, or the gpmi-nand's bug.

Does not look like a UBIFS issue. You can always validate UBIFS using
nandsim.

modprobe nandsim
modprobe ubi mtd=3D0
ubimkvol /dev/ubi0 -N test -m
mount -t ubifs /dev/ubi0_0 /mnt/ubifs
integck /mnt/ubifs


--=20
Best Regards,
Artem Bityutskiy

--=-Gs/8W5bbFjz4a+LvpyUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP0ce3AAoJECmIfjd9wqK08cwP/RmpZI9BbuoQgbzPGOb2PG0M
zBRMzaAn8iFlnYfGumXj4vI2QS0y08+hNh/4e0ntC6nt/gBPI76GaqcgNtqRkRrD
7lnUTtlE2k2clyGlG99ZZeUGwQYJi7h08w5wPy5Zsh83c0BbDgEfYiO5EMDpfEuD
+LbfbuRi3j2kw9SngJZ9PDADRQKTrmFvE8B1Hb3OnH0MwJoZG1izFQC1/XjmKdeY
A7uZP74V25CS9xI9JbkWlpKiRzFAAw6icjWzh3crNXQSnxnMcvWlXxrItnT3wX0z
hTLr3eFxY04FLKdK/J2sUu8aBat+3hf98ZuNAVd/xJNT7bUTBQTyNOwTS2k+ZKQE
6VQXDylBP/3UpmvjC5ecjhAHH/flDf4G7m+S4hPrRQW399+N3KNVvvbmQSfn/h+g
25Ah24VTgPAIL5F4IcHhVpga5O+vMxBQLm5QVNVvvdpAIOX6rz2FZQu0alE43c/V
kVNh4rTgaxFOFETB59EpHh74Hf8ejTxKKA1XJjjl8TfXHgH8y3Nv8jq26MO57lJE
+K/OzZhUuBQhjiRhPH13zaPCyDSYZ9GIpfewgoFVIU5uRWkZmfw6pxg79eUb0MkV
3yJH56wFEJQNZWzEHdi/XYt/zzOnNo9se1oBzxPjxI10/9/V6ljxuKjhbBwUGk/o
QvafP08O3uo7VhKBoAuw
=YF+u
-----END PGP SIGNATURE-----

--=-Gs/8W5bbFjz4a+LvpyUd--
