Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjnZv-0002Eh-QH
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 08:26:24 +0000
Message-ID: <1340785815.29342.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 13/21] UBI: Fastmap: Introduce WL pool Signed-off-by:
 Richard Weinberger <richard@nod.at>
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Wed, 27 Jun 2012 11:30:15 +0300
In-Reply-To: <4FEAC26A.4020708@nod.at>
References: <1339584138-69914-1-git-send-email-richard@nod.at>
 <1339584138-69914-14-git-send-email-richard@nod.at>
 <1340770405.2317.10.camel@koala> <4FEAC26A.4020708@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-EglAo7fixwek+Qwazbkb"
Mime-Version: 1.0
Cc: Joel Reardon <joel@clambassador.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-EglAo7fixwek+Qwazbkb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-27 at 10:20 +0200, Richard Weinberger wrote:
> I'm confused.
> schedule_erase() needs now vol_id and lnum as parameters but
> the erase worker does not use them at all.
> Am I missing something?

The wl flush function needs them to force erasure of a all PEBs
belonging to a specific LEB.

--=20
Best Regards,
Artem Bityutskiy

--=-EglAo7fixwek+Qwazbkb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6sSXAAoJECmIfjd9wqK0XZMP+QEbJmUi/W+KuNwJhT84abMh
vb/G8N2nGrRxSdtAF5WmJwv2pzbrQ8In8QXrcL2mGSZD1a9ym7Z1s09031A1sj87
chJnx15ZqNJuv8tNyqG6hD5FGJNaC8QKmCBD46ygNoPpmop1Bun66w605/c0rw9V
L3XOBeTtuYtvUXlfADZVi1DmdAHnHlydiXJoM6TYVwdw7lRXQlZtFqbD8J5IlvY0
EgkKu1k7r3Km4ia2ihHrxsJw7v/01Y3awshVF+BS7Fxl7FSAF1aqeOz/jJ4vst1E
TVQaZcpO0yCPUn0RrSp6DGM1HVdBQOXX8EwmLwUKI0bxSEhcgvrzBocfubzA5XUw
Nw9t/IW+tpLQ1NtVrc25SGdYn0KujR8z/f9cyoK+PxHN0sw2rtPT5FE4i3o+VsYa
5YcMIfvgPOgmaAlFAT867pnT5luvBmDnoLLlHvfE8/i6R/SwqnvvPwk+QiSmOc2/
oF/fMELEAW3dF9pXjvb0N1laOWSgLZavpUMVg/Una3blI+4vApED76RQ3MeA9i2M
Bs+8oZsKHwBPmFOptJ4B7oIthzytLaGwqkyq0Wp1zuK8pJmbuYMv1AyUPn1jrQY/
nult6A4p5ZX3EV2T0yf3Ca4sltjX1IawXi78gMiARy0T1MGh9aTDn0H40ZLcOuZU
kQj7xlzCLbAYUbj2Fv2V
=GU0T
-----END PGP SIGNATURE-----

--=-EglAo7fixwek+Qwazbkb--
