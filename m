Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFo3r-0002ZT-SQ
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2012 15:25:36 +0000
Received: by bkwj4 with SMTP id j4so180006bkw.36
 for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2012 08:25:32 -0700 (PDT)
Message-ID: <1348413915.12104.0.camel@kyv>
Subject: Re: [PATCH -next v4 0/5] mtd: mtd_nandecctest: add more tests
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Sun, 23 Sep 2012 18:25:15 +0300
In-Reply-To: <1347036490-18258-1-git-send-email-akinobu.mita@gmail.com>
References: <1347036490-18258-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6D0diZKgU4+kbhLWwYKi"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6D0diZKgU4+kbhLWwYKi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-09-08 at 01:48 +0900, Akinobu Mita wrote:
> This patch series adds several tests cases to mtd_nandecctest module
> and tries to cover possible patterns of corruption which can be reliably
> corrected or detected.

Pushed all to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-6D0diZKgU4+kbhLWwYKi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXynbAAoJECmIfjd9wqK03ZIQAJ0DZVABvVQ2SjXvSEAg+R1B
+dEJ/Mga37qIrCe2YP4Ckg1AenhPnh1lIzK4MoJ9IVCDM5dp6KzXQrJokom72WTQ
g4W+oqgS7leE1yP9ZkeVdufaAKL+Us0QbMTmILps0w4Vdsqn+8aONmb5fELiIqP0
gRObxz3ZK/kr2xE2ersvVeUwlKkmpJhp/S1WnBDF4duwrcSiYDQCXUmB3d9mBGzk
O+XY8QXlcP6Wh/GTZ7P9Wy14QggzbV8gxNA2XVcMLBd3uMoCoTxpW/epDa/KVylW
pEui7DNRdIHhFmIIU8v3DEWbtie76LOqIBcdtfMXvQNO693EI8Rz7bVFLySA6piR
KBylA5UQY7fN3AMHLoHNFNoIWEzaURQnBvT7KFR4h3nI9hkAWad60tKgdmflxuKI
AEI3LHb/mii63iJO5clUP0LJFG+gst+ChJB2ZTxEc8Suh8YNiOeKdifYH/kJt4BG
nfzpgfkHCc/dQ+HFYvahh4gR5o5eUSrhtzGNOq3ku2xKstGCz2ma7r74hKE+wqEa
uqs9w74hmAIKoMrmDJaqw/MO1CQlhyqWwgEwkrg8/MHVCSXELnk/+4G5sy0xCE2z
iGmN8OIrFKb0Cl8y57fZ3G9ww+PDlVQPXBp7IKpFU1BC39hPotC2k2w9DOEn5ADK
UKQERy/8yvaP0GgKnnnx
=tpiP
-----END PGP SIGNATURE-----

--=-6D0diZKgU4+kbhLWwYKi--
