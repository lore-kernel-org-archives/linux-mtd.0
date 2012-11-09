Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWqek-000805-Fs
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 15:38:07 +0000
Message-ID: <1352475517.1814.44.camel@sauron.fi.intel.com>
Subject: Re: Cortex A9 Ubifs Issues with SMP enable kernel <ubifs recovery
 needed>
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Darshan Nandanwar <dk.manit@gmail.com>
Date: Fri, 09 Nov 2012 17:38:37 +0200
In-Reply-To: <CAHeY5Qe2U8sGqMrvd5_uYOiBYu09Y818GUfFhJh3-TnMPnijbA@mail.gmail.com>
References: <CAHeY5Qe2U8sGqMrvd5_uYOiBYu09Y818GUfFhJh3-TnMPnijbA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-k4l3BMgbu/sDJbnK5NKd"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-k4l3BMgbu/sDJbnK5NKd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-26 at 23:37 +0530, Darshan Nandanwar wrote:
> Artem/Brian,,
>  I am facing  the issue when try to mount rootfs which inside one of
> the ubi partition .Linux kernel 3.x is being used .All goes perfect
> when i use it uni-processor mode but  when i enable SMP , then  it
> cribs for *ubifs recovery needed*. Does it imply that partition got
> corrupted?  if it is , then why its not in the case of  non-smp kernel
> image?  did you guys happen to face such kind of issue?
>=20
The "recovery needed" message is there when you do not unmount the
file-system before reboot. The recovery is done automatically, and if it
mounts, it should be all-right.

> if any recovery is required ubifs has to do by itself..  isn't it? cpu
> goes dead  after popping up s *ubifs recovery needed* message .. but
> when i used nfs ,same  kernel image works fine..

I do not think your system dies because of UBIFS recovery. UBIFS is
SMP-safe and was hevily tested in multicore systems. This is some kind
of coincidence.

Run mtd tests to start with.


--=20
Best Regards,
Artem Bityutskiy

--=-k4l3BMgbu/sDJbnK5NKd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQnSN9AAoJECmIfjd9wqK0LtEP+wT+uIuoD76gFUlagN6jn3At
ik2NrG/HIaJvHaLAuRJEfbX6L1dIHxL44mXJj8PJ72xR3FznDqasqXM1T1iC5XKN
5dKLrqtZEH6ANVW00sCBd0YdxdGqkJf5+e25kWk3eGnyD3+ClZ3pAo9+1N6VcPh3
w9AIxuuqiIKaupnIZmg3M1XS4LrDi7Zw3UAP46mbEnGPZ0unoxDGggiK0coINPOd
5GOtI5IvTbo8mayP472EtYTG+ejLBLMKY7KadFgoDMLvPl5ps2KgGLExGwDmI9jT
PWKJ1y0Xi7B4h3JxzWF06HrsqJyrm9OUaLRicBmz0zbVD7jhiGfFY03kHFaf+r95
G+8+tbzXVivZ2jWuKBVGIMdbKvfj9pRBJlj1TktPXr4v/yK01CWbwrE6FkB3hhcG
KwJWlDCtXoOVLB+hbXd1/GJgCaxVcOP62SJD9BMwoMp38PN9/mhRGTy4yeQAxn0v
YusiRfpB5hUK6xSGayCBbboPnVQgyX9MIUubjIKtydI0Kfo+bmvqWiCrMTbJhT7T
TIrHUI5fa3Hb4KfXfQ6nzMCsC9bSa5l65yiBxtkjiJpRUGTnRlBC0W8XzUp6IXz7
w/MxMWgCJ1Jf+cL+2SnXiFaamMeGLvicnFJhvO4IxRSzClfSh1LNQ6WWD/9YG3C5
N9PMdzr1tLquYPb9GesL
=Feiq
-----END PGP SIGNATURE-----

--=-k4l3BMgbu/sDJbnK5NKd--
