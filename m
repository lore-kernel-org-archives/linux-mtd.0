Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sa2gR-00013l-9o
 for linux-mtd@lists.infradead.org; Thu, 31 May 2012 10:32:48 +0000
Message-ID: <1338460565.2536.126.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] UBIFS: compute KSA size and store in superblock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Thu, 31 May 2012 13:36:05 +0300
In-Reply-To: <1338459575.2536.120.camel@sauron.fi.intel.com>
References: <alpine.DEB.2.00.1205251509220.2989@eristoteles.iwoars.net>
 <1337952271.30969.37.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205301531220.6465@eristoteles.iwoars.net>
 <1338391121.2536.94.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205311211340.15137@eristoteles.iwoars.net>
 <1338459575.2536.120.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ZwsZlK8b0etqFk24ElEZ"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ZwsZlK8b0etqFk24ElEZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-31 at 13:19 +0300, Artem Bityutskiy wrote:
> Why assert? The point is that if we read the superblock we should check
> that it is sane. See teh validate_sb() function. If any of the above 2
> checks fail - the superblock is insane and we should refuse mounting.

Let me put it this way. You are reading the KSA-related fields from the
flash. You cannot assume they have reasonable values to prevent attacks.

This is the general UBI/UBIFS pattern - we validate everything we read
from the flash. We check the CRC and make sure all the fields we use
have reasonable values.

--=20
Best Regards,
Artem Bityutskiy

--=-ZwsZlK8b0etqFk24ElEZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPx0mVAAoJECmIfjd9wqK09HIP/iKPI5yLLAnzSrwSV7aMh8TH
EEJ0YKBwIF/39SMgaBvHpq8wWLiqC0gAd3cuptre5l8LwdfFEWoYFutofd3vq2DS
wNi1JHMc5lD/TGiwbDdTX59daBQal6JA/BWj+6Mw1B/ZpYGFveK88djmxVnYIRw1
uD7yPouBrn8RVK/s/BZyGOu5dFuvHsRoP6mbOpaT8RmhVs3wpQGFALFCeSTcnYB0
++sVo1i0vk5zvctDOsAeMJKEC70+UlKFDhtHwxoEkyDETcFJehU5hJWWJZI3LLyM
xwWV+6vJ65fLK0DK8nUEu4g8tqs79UHmDkNiJ1eZmt7DW9yZZhSpNjpfyJWnd1vK
Lkh64jCnL/bqHmT8N9xqHIsM9EnwUL5cPtKwqAjeqnfzVkrywImTnCN/eooWbq2O
nplGELhJc7srw2Rud/Yw2rvPBo3fsNt+0tY/Xc2fkIFKGotov3oYOU39/64wXb8z
4EV1ieDjgUJT7Pa15jSZ8YNx0mBtBPPQdYK1IqdoksPxpryhMPlLUx/yOLjdrlP/
cjyoAdyVCFZGYJ/1tYxPNRgWnH0hDmAJJuG26aLC1H7GGOBcSwekM0G0QAhXQG+z
vjUwuVgPU3ShSNOIa3hqERWgJDK1MXnsfhT3eZaBJjs3Ndcz1pCffS+jLQg29p2X
xH4kPtEksueMBPBtkYeI
=tlsV
-----END PGP SIGNATURE-----

--=-ZwsZlK8b0etqFk24ElEZ--
