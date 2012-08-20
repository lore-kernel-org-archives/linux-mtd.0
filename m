Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3XRy-0005d9-R4
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 19:15:47 +0000
Received: by bkcji2 with SMTP id ji2so2309141bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 12:15:45 -0700 (PDT)
Message-ID: <1345490142.1789.6.camel@kyv>
Subject: Re: new 3.5.2 ubifs debug assert
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MichaelHench@gmail.com
Date: Mon, 20 Aug 2012 22:15:42 +0300
In-Reply-To: <CAHyXW63+bY-Dq_miAWMQc=RYqaBwGrZHn95wgJXuK3NHWsnzbg@mail.gmail.com>
References: <CAHyXW63+bY-Dq_miAWMQc=RYqaBwGrZHn95wgJXuK3NHWsnzbg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-nTUXnH2SAJIwkqNtJQQX"
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


--=-nTUXnH2SAJIwkqNtJQQX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 13:09 -0500, Michael Hench wrote:
> apparently UBIFS debugging is always on in 3.5.2
> can anyone tell me what this means ?
>=20
> UBIFS assert failed in dbg_snprintf_key at 136 (pid 28692)
>=20
>=20
> everything seems to work, just lots of debug messages.
> this partition hasn't changed in quite some time over several kernel vers=
ions.

Could you please send a couple of warnings fully, with the stack dumps.
I'll try to prepare a fix.

--=20
Best Regards,
Artem Bityutskiy

--=-nTUXnH2SAJIwkqNtJQQX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMozeAAoJECmIfjd9wqK0mz8P/jqzs75B/b8PAaM0oa+vXb6E
JNRuTD72m3tiMeXhIKLrsiN8t7Xby46FqeIU0RAiIumyZNbOk6WqK9SS6wEoQzRr
bACHhlEXrgi2P3OxwEY3CZdDrfszK0fwXo5coDAxcoxQD6XjTNLwzQKClxv9k17F
m1C0LnSfUhZ4ZkOq48ZYbNhzyP3RX3w/huqIIjSwtqXYrcdbPaJlCGkm3jk+DaOR
ql2JWdCbMNw2qZmDMpyrJwXiVJYvRAHT+DYi9fqoU1T5uC31+FuNo4jnj11O1f+h
I6Mm0c6UQX/5KNBCBB1ZJn7I4ydjN1AOKVN45Lj2+6YScOSg5ohV3nM55Asipivx
bk9HnmTl95D4g9o5cw46U/AAAm1uiBTR445S+c/6oQmxhY85VrIJaeNW4+a1JVet
z2b0mfzq78pXeFBY88DVToCwnDCp5GE7Dufuo/KzNGRanYxhouypmLwZEcw5kcwk
MvpHSPQ8D66bzrhnHAZRSg5kAE6JbgpxfIe3aJ2FO9M11d5j2rDC+Xr1a0W68Rc/
WrXVNMNFOVOYw6kKggbv6VKwsiJfAkm2x98wuuTWGMnVpGYb00GTI2IBau59d6CP
8A6Utb7qHbiD3zzDW4zOKQM84I2RSXoyKmQxBfgXvC0TaJlzwkIP4pZhGofd1Raw
+gsLGwJF15Vg+a/xRUDJ
=mgOf
-----END PGP SIGNATURE-----

--=-nTUXnH2SAJIwkqNtJQQX--
