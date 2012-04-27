Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNlnj-0002pD-1R
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 14:05:36 +0000
Received: by lagy4 with SMTP id y4so606742lag.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 07:05:30 -0700 (PDT)
Message-ID: <1335535527.1910.6.camel@koala>
Subject: Re: Suggestion needed to set proper journal size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <snijsure@grid-net.com>
Date: Fri, 27 Apr 2012 17:05:27 +0300
In-Reply-To: <4F91EA56.50803@grid-net.com>
References: <4F91EA56.50803@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-pBaw8FImvxAJn0nH2Q1p"
Mime-Version: 1.0
Cc: mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-pBaw8FImvxAJn0nH2Q1p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-04-20 at 15:59 -0700, Subodh Nijsure wrote:
> Hello,
>=20
> I know general implications of changing journal size on UBIFS -- bigger=
=20
> the journal,
> longer it may take to replay the journal, increasing time UBIFS takes to=
=20
> mount. Smaller
> journal means more re-writes to flash.
>=20
> We created 2 partitions 100MB and 45MB and we see that by default=20
> mkfs.ubifs is reserving 8MB for journal.
>=20
> UBIFS: file system size:   101834752 bytes (99448 KiB, 97 MiB, 802 LEBs)
> UBIFS: journal size:         9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
>=20
> UBIFS: file system size:     47996928 bytes (46872 KiB, 45 MiB, 378 LEBs)
> UBIFS: journal size:          9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
>=20
> I know I can specify size of journal with -j option.
>=20
> Should the journal size be scaled in some proportion of size of UBIFS=20
> partition?

It does grow, but not infinitely. We have some heuristics in mkfs.ubifs,
but those were mostly taken out of thin air. I do not remember us doing
a lot of experimenting with that.

> Should the journal size depend on how often you expect file-system to be=
=20
> updated?
>=20
> Has anyone done experiments with setting really small (1MB/2MB) journal=
=20
> size?
> What side effects is one likely to encounter if the journal size is too=
=20
> small.
>=20
> fwiw in my use case, file-system doesn't get updated that often, perhaps=
=20
> 2K data in about 4 files once a week.

I think you should do your own experiments. If you share the results -
will be nice.

--=20
Best Regards,
Artem Bityutskiy

--=-pBaw8FImvxAJn0nH2Q1p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPmqenAAoJECmIfjd9wqK0Cg4QANKIkX7DVwCdWkD3tB2r69XA
DHmES6MhbmMLSRx6LuqLwZnFSdT8u0JrGlJGbSS8ZaNdCje8oalA8m3uIglFkyo3
s3SOrlCehS43mPkGIszUMfbZmpKbx2AHka/IZruDNgnPg+KHKHAowr8wlGFmAL/9
5Dutk3Rwad7M2a3mRBb5dlbL7RWeyPqTvE6wCSZUUnCvFCO9FGNxzMdV5Fxc8ElW
O1pWsyaDFyykttwFOGzelXEgmQXu9JBcmD7OR02Pw+oz2wXhDJYkHib2J6Xlkg1n
gYrIwllh1JBhK1+4B1CuUUfKztKKhOYk/yo1w6YP+6pUPMeETkG3D1wJQkrIHBsH
SIIvifPW7YqED8oPKLMjtsc/qyhMrBcGuPByIc0xMlOxwuGotOdPPjtUdY9WDoVT
RAxXW3i8EyAatfICNN3GKt75/TvDyNXUyTt5CZi/JFXtb5Q3nvqXLBMlMbnYUtiy
AKD5lsK3MN/CV86N+N6QX14wYJBs1Y2fb4rfpNeranifscqUSv4/LLOgNhU3J7ah
D5GNqmdAqrvihTYYENiqsYW/w3pTD6ephiX4Ys7H8VoggDR11QHI0O7uOO1cFOTn
fSuMSneUrLwCIcr8pFKAJEBXixJ7drCfcBOiRs2DP/IQbBNh8AS+qdiSCvYschyY
BIlAoeJSjTY/+wLlGxqK
=WIHa
-----END PGP SIGNATURE-----

--=-pBaw8FImvxAJn0nH2Q1p--
