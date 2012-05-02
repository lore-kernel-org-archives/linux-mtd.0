Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPY4b-0001oR-Jc
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 11:50:22 +0000
Message-ID: <1335959619.10293.41.camel@sauron.fi.intel.com>
Subject: Re: atmel_nand, DMA, and "Fall back to CPU I/O"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: George Pontis <GPontis@z9.com>
Date: Wed, 02 May 2012 14:53:39 +0300
In-Reply-To: <037801cd2330$0cd747d0$2685d770$@com>
References: <037801cd2330$0cd747d0$2685d770$@com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-04YgxnDu+5BOuYPJIQGH"
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


--=-04YgxnDu+5BOuYPJIQGH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-25 at 15:09 -0700, George Pontis wrote:
> Working with 3.0.13 kernel and the at91sam9g45, 8b NAND flash with rootfs=
 in
> NAND
>=20
> At boot, the kernel shows 22 DMA warnings, then another 260 as UBIFS moun=
ts
> the root FS:
>=20
> atmel_nand atmel_nand: Fall back to CPU I/O
>=20

Unfortunately UBI and UBIFS use vmalloced memory for I/O and many people
yelled but no one cared to fix this. I think we should make UBI/UBIFS to
use kmalloc()'ed memory instead.


--=20
Best Regards,
Artem Bityutskiy

--=-04YgxnDu+5BOuYPJIQGH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPoSBEAAoJECmIfjd9wqK0LSMQANAPh9RKK6uHEkh0vnMemJW8
zBdaaZhQwk02pueFzgufanWXIqgpTAb7/kcvLOXvn5kuy4lOWWBq5cbrutuxVeC4
MATkpFoX6M7Rw2sqo+fKXV+VpaNvm6KBCbsHtU0zMJ+p8UD11aGROGWfReVG8cq9
V0jvDPR8PsgMqz8nwCP00Y6GJLUvaWwx5hdrm2iHHZA0ymYTuj1w15l9dXJ8SkhX
RNFNPk0dteX5w+n4NlzyPQtYGVdvhdJ0l64wWEB+cSmWu0vfMrP3yTLH3kkOjDNo
PTpR7LFbPvzn8oEgUgpXIcU+GV3JHEkVTYeN+oRUGSomK+Pi5r/Iyjak4bMF3c3T
yNs51KkoSwgHZ1tfVOvTe/dZxNJyB7L0NjXeBVsGHLWgK5oH+N9nrAu4Ks6qBnvY
9y8ZnbtCeMxWt8uZRuTDbfAjaCjk2uJyaz8BTCRc2dIgW8F6sWY+Vo8n0F5pPBCI
Sls3hErjOML8zo+ul6bPI+qHRwwkSQQqZsVGjeZpu55v+9TGwDw57Yk5nsJsCps/
/BJYHLDonEkqqCoxAb+v+sYhuo6NkqM3RVHZZ8bO+60Z1TqxUYqC9bZDE5iGLxdY
/rnsAusYPEv3wJFm3aGME1lwwSl/aRLrfXAXVE1bVtEtEa0C416oK7e0fM6RoTS4
RZUWfBcX0n6+wWsMp1ho
=vow/
-----END PGP SIGNATURE-----

--=-04YgxnDu+5BOuYPJIQGH--
