Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SAg94-0003M9-Ve
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2012 11:25:31 +0000
Message-ID: <1332415701.18717.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: gpmi: fix function annotations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Thu, 22 Mar 2012 13:28:21 +0200
In-Reply-To: <1332354557-22600-1-git-send-email-w.sang@pengutronix.de>
References: <1332354557-22600-1-git-send-email-w.sang@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-dXkb0OH4R0PO1EpZwGDe"
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-dXkb0OH4R0PO1EpZwGDe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-21 at 19:29 +0100, Wolfram Sang wrote:
> A lot of functions have been marked __devinit, but they shouldn't, becaus=
e they
> are needed for bbt_scan. While I believe the whole MX23 handling should b=
e done
> entirely different, I am missing the resources to fix it. So, let's have =
at least
> the annotations correct.
>=20
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-dXkb0OH4R0PO1EpZwGDe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPawzVAAoJECmIfjd9wqK0OKUQAMm/51Xq/ysJgJgbi0MS4E/P
Hr71q4RwaaisZQEkskaIBEJJJkjZDmpMxt2YPp+2qDMohlrRyk0t/a93p1LEDIsP
TeYKPeZ+9Vd/FRCqVbv0YeEv3Xj8YMdhOCOX0zojoTcsjx3yAHVXZqTnt/pbmgYq
bLFWbStbdQjSUMshO1F6Wq092M9LP/wqIMVbZDAzhEuYXFgGaD5v4ziElbSrHlp5
gy4/voFOIYwzJ0iSuufWLNvkw6cKR1/iK1kL1znyKS6ZxupL4hH8rlKGys0eQfgP
/eXrwdY265gSKyNTAbTia6cLkIWsHhZLv6AYDkILqJa8i7GS8ZEfMlRxpN6tU56u
AahvbjBY1A1jsWI+R9xULwZZejoFPx+WE2KgybnsqgsIZHweVWx0oCXo4AAH4pqH
nOnnZWYgqSbRqD5AVW6wu38nlmiKb1uC5Z8ZIUQxPylv4DfQGY5G50HnyMrClbbG
H2gjV/pOgV/gkY8Qpncbhc+L4znGruDB23lNnS/DonKWg+OkjPbBsAFdgzCxzyes
hqE/PAirF8bNJ2CgLDRBe4OPkJS72jB7+UhYDqcBcKsRWA/Lw7mjWWDgoz6fqdS7
sQlSGJKQ0dVczN2mlew6F7T58DqyjSk8UV4KI0wf4/Hjv8Q6Ff0RE+2CZsqJv43/
spJI3dWZiqbSD78P7pMU
=9/or
-----END PGP SIGNATURE-----

--=-dXkb0OH4R0PO1EpZwGDe--
