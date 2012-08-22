Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T496u-0006Pd-K1
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 11:28:33 +0000
Message-ID: <1345635197.2848.152.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 14:33:17 +0300
In-Reply-To: <1345635015.2848.150.camel@sauron.fi.intel.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
 <1345635015.2848.150.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QtZPQE/QfT82kG7uinG7"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QtZPQE/QfT82kG7uinG7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 14:30 +0300, Artem Bityutskiy wrote:
> 1. Add a 'get device property' ioctl, similar to the 'set volume
> property' ioctl we have. And use this ioctl to query the current bad
> PEBs limit.
>=20
> 2. Just call the 'attach' ioctl with an insane max_beb_per1024 value
> (say, -1) first. If it succeeded, than the driver does not support
> max_beb_per1024 at all, and you may exit with a warning that you have
> attached it, but the max_beb_per1024 was ignored because the kernel is
> old.
>=20
> If it fails with -EINVAL, this means the kernel checked the value and
> the feature is supported, so you can call it for the second time with
> the right max_beb_per1024.
>=20
> The first approach is more complex but probably cleaner. The second is
> easier to implement.

I guess I prefer the second option, though. What do you think?

--=20
Best Regards,
Artem Bityutskiy

--=-QtZPQE/QfT82kG7uinG7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNMN9AAoJECmIfjd9wqK07oEP/0vpoA0rmCQSLAIMqod9L2ZQ
zPyfgPwUY0jzPoom5hlgIzqxsdxiqk5wi0gVKK7qpyMwoO0dsKP1xVDW+0/ed+Ff
V3w1pOlLUqd/OKCUGkLLPfQhkzvi9ErJKLnbvcXtRv/WuWu2azpqmgMc2QVGyj6h
JyiCJF63kFQtatU8GM8WQ3KNSRLOmXYAgAQpgW2Exf5Ms/0YjCBm0zrXzDR8YgXL
rjSaqX1ssAQ/bdrEkyLRuzlCdWKp+5dsbXuM0IBb7/O8uXXKC2lPoEdsSV4rJJb6
tqhjpNaH13Mv+smAwFmYWKR2f/fxkiWNkzA/JDPg4/dJGnSFKAMORO0gYC9TjrkO
kyyYW2dm7jxU573eZfjcpHFtLJuSI54WhNVBf6zag9cawndU5l4sxNBiJ0dRyHyN
G4+9u+Ox+Zv+KXCkDX3gZavt+NWZaj8WKUbdCZoDDmV1oMNsgS4YRTWY7ae+rXzz
GX6J0Iz7w811/pQfhPT/fP0Kj+B9PmsVtjumj0PnJrh2yaPFA5zHm2Cb3IAH93Yg
reKJ96WjHUNOKR/JdpUIU7UjyfJzFKxMIIrSZO9rF2McOPgSihWu8LBjhiKlEuYP
I/u2lmo7htYc0vB075G4B/i97Wab7gl9Y6KFIY2CKpdhI43jlYoFrofyCDvkzoif
TtrdDrA677SeszWm93/I
=m71m
-----END PGP SIGNATURE-----

--=-QtZPQE/QfT82kG7uinG7--
