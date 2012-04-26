Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNHci-0002FK-Qw
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2012 05:52:13 +0000
Received: by lboj14 with SMTP id j14so807538lbo.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 22:52:11 -0700 (PDT)
Subject: RE: UBI use subpage and verify fail when write on nandflash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Date: Thu, 26 Apr 2012 08:52:08 +0300
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0BF6013E94@Cloud.RL.local>
References: <70E876B0EA86DD4BAF101844BC814DFE0BF6013E94@Cloud.RL.local>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ldGzHeOjkCYId8U2Q/7G"
Message-ID: <1335419530.2290.12.camel@koala>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 b w <wdjjwb@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ldGzHeOjkCYId8U2Q/7G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-18 at 06:05 +0100, Jon Povey wrote:
> I have just carried on happily using my hack. Don't have the time to
> work on a proper fix, sorry.
>=20
> Hack attached if it is of interest, apologies for the format,
> blame my email client. This is against roughly mainline 3.0

I really do not know why Thomas implemented it this way - probably there
was a reason. Would be nice to test your change on few more NANDs and if
it is fine - merge it.

--=20
Best Regards,
Artem Bityutskiy

--=-ldGzHeOjkCYId8U2Q/7G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPmOKIAAoJEJtuLFy+q7feMUoH/R05bEcqRwpFbOCvzohcTehh
PTzgpcnMym6pAWoM9hT3vjm4pSH+nEy2x84HKrH4q8lmop0xxzbVKnyG6WoAF1l2
gnIRq6Y92CND23djW0Omw17VGv/t1CxKVoE4LtMFCRGobNeOg31vu6nM0lN3KgAD
1l1kdSmGWGphYpswGMxxV7QNCUz7++IrOej00AyC7s+YM6+fmZwTptCDHXsMsjDW
YYiAyJtQ1zvyNCpHPbGrf4rbN5IuBD50JH59C7XcYdbtiduHOeNPvE6roImd+D4W
ge+TZ+ScFerr4ohGJulCsqwcGHdBmZKrLUmGXhqcJbjJfBlfOIGlrIsc4bSV1E0=
=m+Q8
-----END PGP SIGNATURE-----

--=-ldGzHeOjkCYId8U2Q/7G--
