Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPC3u-0005Jl-Ci
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 12:20:11 +0000
Received: by lbbgg6 with SMTP id gg6so1236860lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 05:20:08 -0700 (PDT)
Message-ID: <1335874805.2095.11.camel@koala>
Subject: Re: [PATCH 7/7] mtd: driver _read() returns max_bitflips;
 mtd_read() returns -EUCLEAN
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Tue, 01 May 2012 15:20:05 +0300
In-Reply-To: <4F9EEE26.9040806@newsguy.com>
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-8-git-send-email-mikedunn@newsguy.com>
 <871unbis55.fsf@free.fr> <4F984CC9.9060701@newsguy.com>
 <1335727480.1942.18.camel@koala> <4F9EEE26.9040806@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MUJMuO/zURvBAUM7fRtV"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MUJMuO/zURvBAUM7fRtV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-30 at 12:55 -0700, Mike Dunn wrote:
> Thanks Artem.  Since you merged all 7, the only thing remaining is the fi=
x to
> docg3 that Robert describes above.  Robert, if you would rather prepare t=
hat
> patch, I defer to you.  Otherwise, I'll submit it no later than tomorrow.
>=20
> Yeah, sorry Artem, I neglected to add the Acked-by's in the patches you j=
ust merged.

If you know that an Acked-by or Reviewed-by was missed, let me know and
I'll add the tag(s) to the patch(es). I think it is important to be
careful about the tags because people spent their time helping to
improve the patches.

--=20
Best Regards,
Artem Bityutskiy

--=-MUJMuO/zURvBAUM7fRtV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPn9T1AAoJECmIfjd9wqK0D2wP/j2tHHMAlCH9t/PVfx3skI4O
gPZmSnvC9gFE9JNMqmK5II51YaD3H0cA7Jio7gXfnDG+7eelXfA1HhF85ZTdXZsx
xPmzSjJErrNapCzBq9dp8xpQGwHMmtZa34wc42Imwgm4955KMA77UdaFQY+kc3js
ErfWFuQxLmnOxDwuzJ5RJejp12se+xzJCUVMl6Cn0eLHn2WLYtAmtkTptfWoqH7j
pomPhfj+SG9Rxe9T932NRv5nRdM8UFQw3mEuXL80Q6XbjlWXwAnpfLLQrx/mWw0h
hAVqKe4u0LBtWoixEAFUZSjlTycTlLBYItcr0MP1p5FHAvtknhDJejUemgJgPXNs
qlQjUmt4hBkBXABNE+mHI8Fglv/qo3XSweaZREg3HU3Kvg47p3xd8Xaw8X98/Gji
gUsQPn8uTCpFdxgWAvR/I3IGWGTYIdSEgQ1piUbZNOXEkqX5TFPygNRKKTPAymrn
q68lywYJJRAU4BhZzT/WAbiw9EVP+Oo5pZTelYMRBcLakOaLKDmkTiU/DGdtpVDM
NpJ7sRzbADEWS5pzLhWOsT/YmbldCMleHqdeOo7bQ0TZYURxc9WNF28pVcRe76i1
5YgtVxu66mxj7yK+XJA7RXO4vRylB14490t6710H7rqs+Zmtteso+jrEi9Dg6M5v
bIn5nhbvsTzLB144UDRc
=52XT
-----END PGP SIGNATURE-----

--=-MUJMuO/zURvBAUM7fRtV--
