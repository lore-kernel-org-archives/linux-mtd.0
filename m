Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfVzO-0005Nl-A7
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 13:23:15 +0000
Message-ID: <1354541049.11583.7.camel@sauron.fi.intel.com>
Subject: Re: Fix recovery after failed write-buffer operation in
 cfi_cmdset_0002.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Harald Nordgard-Hansen <hhansen@pvv.org>
Date: Mon, 03 Dec 2012 15:24:09 +0200
In-Reply-To: <50AFF477.2030803@pvv.org>
References: <509D03B7.3070304@pvv.org>
 <1353484119.2701.4.camel@sauron.fi.intel.com> <50AFF477.2030803@pvv.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-LWaiD765t8/WRMw6yCPY"
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


--=-LWaiD765t8/WRMw6yCPY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-23 at 23:11 +0100, Harald Nordgard-Hansen wrote:
> > Would be nice to put a short comment about what you do and why, may
> > be some reference as well. Just to make sure if someone reads the
> > code, he/she has some clue what are these about.
>=20
> Hopefully in place now.

Pushed to l2-mtd.git, thanks.

However, I had to do the following:

1. Make a commit message for you by copying parts of your e-mail.
2. Create a Signe-of-by for you.
3. Fix these checkpatch.pl warnings:

WARNING:LONG_LINE: line over 80 characters
#48: FILE: drivers/mtd/chips/cfi_cmdset_0002.c:1546:
+       cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cf=
i->device_type, NULL);

WARNING:LONG_LINE: line over 80 characters
#49: FILE: drivers/mtd/chips/cfi_cmdset_0002.c:1547:
+       cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cf=
i->device_type, NULL);

WARNING:LONG_LINE: line over 80 characters
#50: FILE: drivers/mtd/chips/cfi_cmdset_0002.c:1548:
+       cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi, cf=
i->device_type, NULL);

--=20
Best Regards,
Artem Bityutskiy

--=-LWaiD765t8/WRMw6yCPY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvKf5AAoJECmIfjd9wqK0L+oP/088fEnWOaDYRDJ8M4xPWlK7
I2jLY/lxIX+yE/Lb74uAe5iQeo7X65/1LO3QtnjysUvOUVq66MKgVgYAifxFA1mE
wvHvTQXNlWvlDJhzbmfaLZZl3MzWKujgeTzw8rIO+enbjQuXTS4ERyihTvDb5A1Q
aERkXrWffKNq2w9FgtRgjfnJiYHzTKS/+6PohyaUldyowtwSIqdXmiEyVa7fDygU
6nwfEwV/GUhHpZLZk/RrDhYVzUl4DsgxMGc+fCZkKRXxzwlDPcP3iJW7kK2OE6Gz
/eJm/4cC9a0EIBFroh0QyzmcgghW+50iVEaHDvJuuHM9ixe99Hdro+6EknzxQLe9
zRYxxUwNaIKntYZlWR5BiS5+gYrHvGBLjXQASQ4TeDJ4K+vZvBP2JWkbpsm1kshg
kaiow5uh3MSALBPr92WHY5lX8dMkbPtSHE7tN9cV1SZ6YDlRgA2XA8P+cuqwW0ED
yGG5SywRUQsrKUel2Nwn04kO3qJRUde70BrtV09XvtvE9ImZ5I6akhLoUH0hbrvi
BzCCZLBrYWa8ImfCM5e5cl0JLD9nQLDUuNSCwzxPneGhPQNq2JTFeNR9n5e4PjNO
q3i5kbeqrUabyPrig9yfcZU5jOGNNCY3YkWZwVch4vbOpoYzZ2OTOqVXhtckDpdP
U8ZY0CTeC4SInG/BgEAM
=gGAc
-----END PGP SIGNATURE-----

--=-LWaiD765t8/WRMw6yCPY--
