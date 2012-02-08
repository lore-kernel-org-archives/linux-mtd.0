Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvA0P-00016o-DK
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 16:04:25 +0000
Received: by pbdx9 with SMTP id x9so802095pbd.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 08:04:23 -0800 (PST)
Message-ID: <1328717189.22240.67.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/3] mtd: move zero length verification to MTD API
 functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 08 Feb 2012 18:06:29 +0200
In-Reply-To: <20120208165437.3d0af6b5@pixies.home.jungo.com>
References: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
 <1328529789-2106-2-git-send-email-dedekind1@gmail.com>
 <20120207143505.6fba6d5b@pixies.home.jungo.com>
 <1328704973.22240.60.camel@sauron.fi.intel.com>
 <1328707598.22240.64.camel@sauron.fi.intel.com>
 <20120208165437.3d0af6b5@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Y+U/LJVKIrDVrElKgfsS"
Mime-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Y+U/LJVKIrDVrElKgfsS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-08 at 16:54 +0200, Shmulik Ladkani wrote:
> I guess new interface (checking the returned 'phys') is reasonable as
> well. And, nothing gets broken since no such users...
>=20
> Reviewed-by: shmulik.ladkani@gmail.com

Thanks, but I added more preferable
Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

--=20
Best Regards,
Artem Bityutskiy

--=-Y+U/LJVKIrDVrElKgfsS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPMp2GAAoJECmIfjd9wqK0EBIQAM83Z3lUvWMp3W95vs06eAAB
CfGOx1cskUirxo688RRNm+1aUYx4OVbCoRBB9HtRalbX+m1TXr12rIHgiNT+UQ0s
/7tsLaAOom9h9+rqhxqdmSCItR8jW8ci3swzSwraBLxqu7ka46R6DI6lvoWqR1tY
4n8odXGXZAbYgGopS8PmpBppAJmBqUBajH6K1BLQwsaT2RcVf7lORnIyeDcshvNl
0DvYeVPvGYBCRPyZXXAhBExugDAs4T64sIt5ju0wDbHhXcTwdN478uSWINTt/YS1
8N6S1Fp0WVYKMWPMwKeVBMvDVaGKLXv/cCi+fXRAYFKnKKaE6swViua7heeXz7Ss
HxQHZlfGRuvXpo82vjrWBVPgAY54P6Ug6pQiwdJsoWiG7cYGoBxl/ZKxtN/XKHJg
8yBeoiipyOFriSGVe1VHhrLlT0aTTyQzZCAEmEzKtvgD/PeF1KSZfHnkebUnzNGw
UoucUkc53yWKlOOldfHfRJcsJTor5MsNDy5ranrlB++VlvY7QQ5Am3+eORyrNgiu
K/zS+J6CvEo893t2ua67R8HiS2E3ktq9P26Fx8Xcw5drVWxUlXs3ynWUbIqpZCMr
LVP+PdAaTN09OowzIlOUAy01fPhpKDWp0UCMyQEMFa52ovOR7N6xpEOELlGdBrdf
smDqFOfAXutfYO9IKgzt
=Do1+
-----END PGP SIGNATURE-----

--=-Y+U/LJVKIrDVrElKgfsS--
