Message-ID: <1353579808.2701.28.camel@sauron.fi.intel.com>
Subject: Re: Possible regression in arm/io.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Will Deacon <will.deacon@arm.com>
Date: Thu, 22 Nov 2012 12:23:28 +0200
In-Reply-To: <20121122101915.GA3113@mudshark.cambridge.arm.com>
References: <CABYn4syj0GZAsDYVQfXg_qKAFkbrxPLoZWpKRzwf3gfRkMGZkQ@mail.gmail.com>
 <20121024105223.GC23775@mudshark.cambridge.arm.com>
 <CABYn4swp9JBEHgGTOkoe=tOh3Mf1dq5WYr=2xuKNpTmLX5LcFQ@mail.gmail.com>
 <20121024130957.GB7339@mudshark.cambridge.arm.com>
 <CABYn4sz4v7Uf07am=MtPAKAvvAjwt+-bTRaLrBjoiRuyR9cfZw@mail.gmail.com>
 <20121024135854.GD7339@mudshark.cambridge.arm.com>
 <CABYn4sxnwzj8KFfELzCLzQMcAjiqS3_Vr2kStkm-na8G1noPHA@mail.gmail.com>
 <20121024152730.GH7339@mudshark.cambridge.arm.com>
 <1353571055.2701.21.camel@sauron.fi.intel.com>
 <20121122101915.GA3113@mudshark.cambridge.arm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Lc/gS/O6003KoN5O8TF1"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Bastian Hecht <hechtb@googlemail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Lc/gS/O6003KoN5O8TF1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 10:19 +0000, Will Deacon wrote:
> > Any progress with this? Do we end up with gcc 4.6+ - uncompilable MTD
> > drivers in 3.7?
>=20
> I fixed it in 7629a9f661f7 ("ARM: 7567/1: io: avoid GCC's offsettable
> addressing modes for halfword accesses").

Ah, this is in v3.7-rc5, I am using -rc4 and this is why I did not
notice this. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Lc/gS/O6003KoN5O8TF1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrf0gAAoJECmIfjd9wqK0RtUP/1uPoE1ERpULcBaiItiiCy76
zrMCCpxPbJidGK07FcRiLWxIezIBQA8PqNAdtYB9tnL9joxc8dT/vjFdmzDE2opO
eDocROzKpywpSrL3Yp5zHshzGz57LHIsyq/Ya0ZBc+zShT3/woGXXaXQYQBEnWZO
Uobz2MQ6F+uBYEglbq9NG9oQh96pC8ErIuhQkuoCEIspWGofgY84zm9U/5MDLItl
7WDcSERQLy7Jrb6DVtHupKslIVyrKXSjP1a7Ay0NXQVPgEGJFB/f9k0GEt30kPx6
tuQLZ9SOsceMi029j4hbI7YYNn2+sMIl6sTqVi1TW5S02s56OMPhVVFqjsWY/FNZ
8gyIk0c9YlpNNG/MTU1kr+DPtmCC4N+oDbj7NJp4ZAGmkHVgp3GKwvyQI4+XkJ8/
sIl51dfAA0NNAiogNSBV3luxqbAbEcMGmCbyRIvS2G9giuzs/Mh5ITgOJy9kIn0n
rHDcTQNg0j1YtLEDikpAMntbBAZNWBZxPjRPeSc8x7XKLHRoLLJQHZJsaxXTgkjJ
5B33gZXGZ+0KkjtOKnhqvv3GE0OdWi8Puc0k1sNanrNmVmc0bwR3tH+d5STO2IE8
s5tx2rYDq1R1hUfK+8Oqw3fy0ae64rLGFPXV8eYR5FS1b8xU1FZp1O8ZwrIbfP7u
wlXujd3RT7/Vt79DY2vE
=MnOs
-----END PGP SIGNATURE-----

--=-Lc/gS/O6003KoN5O8TF1--
