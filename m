Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SVhOn-0006vN-Qz
 for linux-mtd@lists.infradead.org; Sat, 19 May 2012 11:00:38 +0000
Received: by lbbgg6 with SMTP id gg6so3331324lbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 19 May 2012 04:00:35 -0700 (PDT)
Message-ID: <1337425233.2041.17.camel@koala>
Subject: Re: [PATCH v3] UBIFS: read crypto_lookup from datanodes to znodes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Sat, 19 May 2012 14:00:33 +0300
In-Reply-To: <alpine.DEB.2.00.1205191027340.18672@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205151101100.17750@eristoteles.iwoars.net>
 <1337087022.2528.204.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205161451250.27131@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1205191027340.18672@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-M50YmhQPM/FBi1MAemzZ"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-M50YmhQPM/FBi1MAemzZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-05-19 at 10:30 +0200, Joel Reardon wrote:
> +			crypto_lookup =3D le64_to_cpu(dn->crypto_lookup);
> +			if (zbr->crypto_lookup !=3D 0)
> +				ubifs_assert(zbr->crypto_lookup =3D=3D
> +					     crypto_lookup);

This "crypto_lookup" name is too long. Would you mind if we re-name it
to "ksa_pos" instead (KSA position)? Then we'll wrap less lines.

We can do this as a separate patch on top of this one. How does this
sound to you?


--=20
Best Regards,
Artem Bityutskiy

--=-M50YmhQPM/FBi1MAemzZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPt31RAAoJECmIfjd9wqK0lfYP/icetYjBKbQqms+TYZlBY/Gx
hl4rTLyuEn+fPPvmvLiY6PvVkrk6kX4mDGh1Bq058Gn0VwWa99NkhsxP4/n4Dis6
4pQzI5hxsy3Z5DYPXKQMPWf5w2ICHebN2dWnk/gWEF5lK9B4DBwXYWPItBQsLo3x
m2xlJuj7/QDEyYUjiJqr8kKS9K9w+oTv51wdIz7jBxspt3PtvFlW2nZyOpoR8+02
1MQX0javr4PhEZGzpf/V8omls3NvBj1JLKlHt770kGWWIRPgfOas6rEXKR3MLucO
cNe3UUSPdxN2TXHXiMNkizWvf80jfYis6w7QMb04fK5fKyHQ1fCDm/OBrS9jZhWj
BihKYxldSyVWCB5ZgbfqqQGpluEnntnJDX7jNRlmUBEbNxdPKffogmAJI+VSaL5h
UiKZTnCQCNZIKdG/DUoVTtCvNuGxQogPoecf+tx69v1nRR3Ain83xAm6hMQc5Tgy
YHRDBGQA2tFTmK9rVgWjpgfZTJoWMpVX/EpIG65VLjpqqwWawLhH77gkVexSxJw+
fcDwselj98MSPbM62REk4Skhk5FPkDJz2e+Tyw2JsMBkLPhr191XEaOTaaoettaG
Fd01FO+O4YG2FuwkRm8KVa6z/0o7wySC7oAgjApRNlO1osNz23qyVKRznLfPbnHo
1OhSJI9WExYjMrq4tXWP
=O5HV
-----END PGP SIGNATURE-----

--=-M50YmhQPM/FBi1MAemzZ--
