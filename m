Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TioAV-0005x1-Pg
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 15:24:20 +0000
Message-ID: <1355325915.3400.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Support Persistent Protection
 Bits (PPB) locking
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Wed, 12 Dec 2012 17:25:15 +0200
In-Reply-To: <50C62CBA.5040401@denx.de>
References: <1354864954-30290-1-git-send-email-sr@denx.de>
 <1355151644.2657.41.camel@sauron.fi.intel.com> <50C62CBA.5040401@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-LKocmJZsxOli1r5xDJCw"
Mime-Version: 1.0
Cc: Holger Brunck <holger.brunck@keymile.com>, devicetree-discuss@ozlabs.org,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-LKocmJZsxOli1r5xDJCw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-10 at 19:40 +0100, Stefan Roese wrote:
> On 12/10/2012 04:00 PM, Artem Bityutskiy wrote:
> > On Fri, 2012-12-07 at 08:22 +0100, Stefan Roese wrote:
> >> +       /*
> >> +        * Wait for some time as unlocking of all sectors takes quite =
long
> >> +        */
> >> +       timeo =3D jiffies + (2 * HZ);     /* 2s max (un)locking */
> >=20
> > Please, use msecs_to_jiffies() instead.
>=20
> Sure, thats better.

Would you please do this instead?

> AFAIK, chip->mutex protects the access to the chip itself. So that
> sequences are not interrupted.
>=20
> I have to admit that I haven't looked into get_chip() so far. It seems
> to handle a state machine. Normally (idle state) it will just fall
> through (FL_READY).

So it looks like the idea is that you first take the mutex, then call
get_chip() which will wait for the chip becoming really ready, and then
you can safely use it.

>=20
> > Why you need to drop the mutex here?
>=20
> Not sure, that might not be necessary. Copy and past from another loop
> in the same file.

Probably from 'get_chip()' ?

> > Why is it not an ABBA deadlock to do this:
> >=20
> > Task 1: In the loop above, has chip locked, doing
> >         mutex_lock(&chip->mutex);
> >=20
> > Task 2: done mutex_lock(&chip->mutex), now doing
> >         ret =3D get_chip(map, chip, adr + chip->start, FL_LOCKING);
>=20
> I don't see two different locks/mutexes (only A) here. As get_chip()
> does no request any real mutex. Please correct me if I'm wrong.

Right, there is indeed no deadlock.

> In many other places UDELAY() is called:
>=20
> #define UDELAY(map, chip, adr, usec)  \
> do {  \
> 	mutex_unlock(&chip->mutex);  \
> 	cfi_udelay(usec);  \
> 	mutex_lock(&chip->mutex);  \
> } while (0)

Why not to use this as well then for consistency?

--=20
Best Regards,
Artem Bityutskiy

--=-LKocmJZsxOli1r5xDJCw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQyKHbAAoJECmIfjd9wqK0da8P/ilCRK34yEUTubOmtcNiJI7O
OHcVRwU08/i49O412xdNVCUx8YUdQzo4iXRtapdTXwLqODUx3iatIl+2HG/ZXJDg
j7GYkQm3n9wKKmPkdKC4jCwkknVB6xvmIFwmjYQxqLM85IL7fJ3hc+nDBli1RgQF
c2ULJ4zU9AvG6IPW7vr+kZ7bNOb05pcW732A9tj16a1KIYYGywTTS9SQqXEv9P2Q
k0aA+iiQhffn137dWAnwny/RzUXiQR57xndLHzXjySUn3qJh32Z8PXRoALCwSyya
WmGOxvfjtWEl4+wr++F7wtcSLqbrrJWzoIkFsftDf2+CA/0hqlgIaPml9IFK6zfL
omCGEaFLhlRpJ9tvUXHSizgSHkGnC/LRjvN9JNSWEWTJns7g9Q2evyNXu1+nOj5c
HIbYStu/kiBpFXEuXfKYdlaLRtmPXhmZfBks74CW32TdgGrTrI0Ua2FxyFRw35Q+
zaSJOTGmErA0sQ7KBukZdNA+sFU/eickR2jvJZPZNh2Vnu5NRv4RMW6qaL/1LG/n
/45RneyA/GeoCEI18CjK5X02eSxHC6RhlNxsGeUqht4b1bCj+dY3aMwjUvpGo7ye
Gx0NEyOjxbFHa25Clzv2wpXzHUiqjv79NAj7qoYIXEUkv72XkY0kLdNoAmra/YyF
yYAfTcEq3hAehasmh5UB
=xh2Z
-----END PGP SIGNATURE-----

--=-LKocmJZsxOli1r5xDJCw--
