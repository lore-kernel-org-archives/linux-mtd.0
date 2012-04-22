Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLwX2-0004op-TJ
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 13:08:49 +0000
Message-ID: <1335100124.4879.22.camel@golum>
Subject: Re: [PATCH] [JFFS2] load_xattr_datum need to return a positive
 number in case of unrecoverable error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Sun, 22 Apr 2012 16:08:44 +0300
In-Reply-To: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
References: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lcF0RjY5EVnOBkwyKyic"
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


--=-lcF0RjY5EVnOBkwyKyic
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-11 at 22:54 +0200, Jean-Christophe DUBOIS wrote:
> As per load_xattr_datum() comment:
> 	rc < 0 : recoverable error, try again
> 	rc =3D 0 : success
> 	rc > 0 : Unrecoverable error, this node should be deleted.
>=20
> For now we were only returning negative number (so recoverable error).
> But a CRC failure or some inconsitent data seems fatal enough to
> consider the attribute instance (version) as lost.
>=20
> So this patch returns a positive number (1) when it detects an
> unrecoverable error.
>=20
> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>

Looks sensible. But since I did not take your previous patch, you might
want to check whether this patch is really independent. Also, please,
tell  whether this fixes a real-life bug or you are fixing a complaint
of a static analysis tools or something like this? And please, tell how
you tested it.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-lcF0RjY5EVnOBkwyKyic
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlALcAAoJECmIfjd9wqK0znUP+weD6OTBCu+kHAIaZtB+xQPi
7OgKd1ik1aie9M0HjBgjoEepsfKkpmOWQwOew3eyilVo1vYMD9J6MFwFbV9+oCl1
+31NvP3IQI30gQlkbFXgsAreKztdpWKR5PQh07rxUOPH3JlEPjGcRw9CeH+cnbVn
HIjVQgCdzH+U6YaSuumhpO4oayQCse801oLnQ5rJ90lqmj+qv0SnbMWFkvKlNvIF
dimcxBO1a2+XAK5EU4X4Akvh9LS/yzcK20XwEWFme+BXY6DbeqijzZqFWsiJDFFY
StLv545rLuhH8ozz8Cl3gwaIjQJMZXM/3wLahlAdpZJAAR/Ep8fGuVX9D9uxBE/i
RBbAFhlvTAz5GD+p4bfi8cBqFaOLPc7V9TydsHeg1T4CaGcKHWakMuuWwFkBIZZ2
IHelSOOKVngxahLZ/rP1E4nareaNIyj0BwGuIAbTb0O+d/cAYTrUdLbmOa9UbLNa
a8Qz4SLAgnVs76hL2Y2HT8mR0NuD15LJH6hLZRHTcbM705Qe8ZZ9eWzczmAd0RoS
SDTyqbZhHXh5i+eACsefbmuDaWg5P8oTPR8gfNBARW6JWw47jrI16GABdB+uG7Jb
O1L5A/EAZw4cjH3eSgCx9TE6e9QMnb9WYkxh0/ykCQVbuKBygLTf0TrTfRBVacuB
V06Df5TjnlX5CElQO4C7
=DPoc
-----END PGP SIGNATURE-----

--=-lcF0RjY5EVnOBkwyKyic--
