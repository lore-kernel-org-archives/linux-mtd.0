Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXCS6-0002P6-Eh
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 13:49:58 +0000
Received: by iadk27 with SMTP id k27so8181475iad.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 05:49:57 -0800 (PST)
Subject: Re: [PATCH] mtd: tests: stresstest: bail out if device has not
 enough eraseblocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Sun, 04 Dec 2011 15:50:47 +0200
In-Reply-To: <1322577248-20759-1-git-send-email-w.sang@pengutronix.de>
References: <1322577248-20759-1-git-send-email-w.sang@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-G4x+GNwwTbwkCnFLR8D9"
Message-ID: <1323006665.9400.54.camel@sauron.fi.intel.com>
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


--=-G4x+GNwwTbwkCnFLR8D9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-11-29 at 15:34 +0100, Wolfram Sang wrote:
> stresstest needs at least two eraseblocks. Bail out gracefully if that
> condition is not met. Fixes the following 'division by zero' OOPS:
>=20
> [  619.100000] mtd_stresstest: MTD device size 131072, eraseblock size 13=
1072, page size 2048, count of eraseblocks 1, pages per eraseblock 64, OOB =
size 64
> [  619.120000] mtd_stresstest: scanning for bad eraseblocks
> [  619.120000] mtd_stresstest: scanned 1 eraseblocks, 0 are bad
> [  619.130000] mtd_stresstest: doing operations
> [  619.130000] mtd_stresstest: 0 operations done
> [  619.140000] Division by zero in kernel.

Hi, thanks, added
Cc: stable@kernel.org
and pushed to l2-mtd-2.6.git.

--=20
Best Regards,
Artem Bityutskiy

--=-G4x+GNwwTbwkCnFLR8D9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO23q3AAoJECmIfjd9wqK0D3IQALp8BarIPNX93lT3MasoMAP2
VppFJWOfVk2Ff7t36fB9PaBpLUF8fcGxsXhEHOEd+rmmHHgF5vRwdsiEqF4X+sWP
5vciaXR51c++XsZdUnYlwgYqpdYP5g5Jg/SLxBhGgGSIFZqpVxiZuYtH3mUUPlmk
/WB/nLf7Al0b4RuqNg0OoKbPdRCfKu9JO9s2CcIaxYYu5SsiZPfb2/k5AdVqSP04
+8H5+VBpvd615med9Yo3A8HaaeR9kRAEiBtG3yyY4YTLl6YJbOmk2vAAmeVNFP51
ZNQv/akj9LYjRVjTcGSedVFsWoMNjUbElA0j86c3APx25I6n6Z0McNytUgK8Ppov
+I9xT6Q8vBbWyZsTos8VEqv8AWsKADIgGR5Ip4RV7CyIgd8ugCI7DL1iaQ7LDH50
M2hDreGsgy2bTUusMOr1mZEGzD2p4XmSPUanZZGCL/sD4nlFy478dH39qhvt8up1
6iaX4ktZAD+goVNrNKeetZBMEd/t3u3pXq4TEGBMSD9gJFbuFx+2wSjizqMrfBRw
/bye2qG5vAdU4K50ra6uyW2hXDNoipQraQcifXdoRJzpU2UVeojrXHUG7ou/MGf7
InJPNqPyzJ9xKGeVMHO3dA3kfrKRMyhX8QpsUQk0KKj/jomAGgwn0HAb5Lye9AYm
Jezx2BIdWoPnJB69/9El
=afYf
-----END PGP SIGNATURE-----

--=-G4x+GNwwTbwkCnFLR8D9--
