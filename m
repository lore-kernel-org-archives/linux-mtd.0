Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2MMx-0001Nr-Fw
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 13:13:44 +0000
Message-ID: <1345209495.27859.87.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: physmap_of: Add "no-unaligned-direct-access" DT
 property
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Fri, 17 Aug 2012 16:18:15 +0300
In-Reply-To: <1342683840-31665-1-git-send-email-sr@denx.de>
References: <1342683840-31665-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mynk2Gk0HP/w04gA9OUL"
Mime-Version: 1.0
Cc: Albrecht Dress <albrecht.dress@arcor.de>,
 David Woodhouse <dwmw2@infradead.org>, Anatolij Gustschin <agust@denx.de>,
 linux-mtd@lists.infradead.org, Stephan Gatzka <Stephan.Gatzka@hbm.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mynk2Gk0HP/w04gA9OUL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-19 at 09:44 +0200, Stefan Roese wrote:
> On some platforms (e.g. MPC5200) a direct 1:1 mapping may cause
> problems with JFFS2 usage, as the local bus (LPB) doesn't support
> unaligned accesses as implemented in the JFFS2 code via memcpy().
> By defining "no-unaligned-direct-access", the flash will not be
> exposed directly to the MTD users (e.g. JFFS2) any more.
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Stephan Gatzka <Stephan.Gatzka@hbm.com>
> Cc: Anatolij Gustschin <agust@denx.de>
> Cc: Albrecht Dress <albrecht.dress@arcor.de>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>

Hi, would you please re-send it with the following mailing lists in CC
as well:

devicetree-discuss@lists.ozlabs.org
linux-arm-kernel@lists.infradead.org

--=20
Best Regards,
Artem Bityutskiy

--=-mynk2Gk0HP/w04gA9OUL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLkSXAAoJECmIfjd9wqK0VT0P/ju61V3KUwZB2tQSlrmwniQE
tC/+UYR66+zWczbpGdWtZOyFNpGDT5e3F/8NcCyhrRL/byjZZfEww6N6Hz4UsWng
SVtiohBEHABdpvZw0OXn3S9fYXwEu1BYXw27bJK6496tTBY+6yBkVWlQ8rV1OMZQ
dYJ2OFKZSjkEfHV+t9cAKA/ou86RSbwbDnEok5XMSPGpfFUyxjFhMzGTj67HU9mY
SmulTJGIC8USG7DZiTZqW6KIbocwtJyh225tqdq/7G8eXKzVQYAXAQWypYFE+CWW
Q8SeCWNyO8dmU2qffna+wiLxC65874/SjGlFHGkdzTfDW+xH1Qu56BF5iqxnoWKb
HP8+3vsSCAyNxNB3ES11L2nGAVaost753EpxccLSM9gk24KroR/0Oq/PJSrTc11I
u8ZEtyW5NEeRJ6rSH6wKdqwsYheQVRMR5A4qGAORr+6KXiNgU9fpdGkVKH4FHPER
3O7ZPWdB+9Ir824a0i4FklFtgofAddvtELoRAajd05MTj0sdKgXPUd4v7cxpJyJH
VLlHIfYdArQxhZUlYPMb0Bm6aVnd8kRD08gFamUaFJescQsS7/KVpH/UJFUdS/p2
ZCS3w4mobpHUamV5gXq2SY/tb1WHn+srQpDB/gC4yXC9I3h87P6R9om7ZnQ8kmge
2far7W7FBVFcrFD+20vS
=GFaO
-----END PGP SIGNATURE-----

--=-mynk2Gk0HP/w04gA9OUL--
