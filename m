Message-ID: <1353571055.2701.21.camel@sauron.fi.intel.com>
Subject: Re: Possible regression in arm/io.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Will Deacon <will.deacon@arm.com>
Date: Thu, 22 Nov 2012 09:57:35 +0200
In-Reply-To: <20121024152730.GH7339@mudshark.cambridge.arm.com>
References: <CABYn4syj0GZAsDYVQfXg_qKAFkbrxPLoZWpKRzwf3gfRkMGZkQ@mail.gmail.com>
 <20121024105223.GC23775@mudshark.cambridge.arm.com>
 <CABYn4swp9JBEHgGTOkoe=tOh3Mf1dq5WYr=2xuKNpTmLX5LcFQ@mail.gmail.com>
 <20121024130957.GB7339@mudshark.cambridge.arm.com>
 <CABYn4sz4v7Uf07am=MtPAKAvvAjwt+-bTRaLrBjoiRuyR9cfZw@mail.gmail.com>
 <20121024135854.GD7339@mudshark.cambridge.arm.com>
 <CABYn4sxnwzj8KFfELzCLzQMcAjiqS3_Vr2kStkm-na8G1noPHA@mail.gmail.com>
 <20121024152730.GH7339@mudshark.cambridge.arm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-doxa22VVSothGINHpfBO"
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


--=-doxa22VVSothGINHpfBO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-24 at 16:27 +0100, Will Deacon wrote:
> On Wed, Oct 24, 2012 at 04:04:46PM +0100, Bastian Hecht wrote:
> > >> > Ok, I'll have a look at the impact of moving exclusively to "Q" wh=
en I get a
> > >> > chance. Which toolchain are you using?
> > >>
> > >> gcc version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5)
> > >> For a more verbose info take a look at the bug report link.
> > >
> > > Ok, thanks. One other thing you could try while I try to find a copy =
of that
> > > toolchain is changing the "+" modifier to an "=3D", like I proposed i=
n this
> > > version of the patch:
> >=20
> > So if alter it to fit to your patch scheme the result is:
>=20
> Sorry, the change wasn't as trivial as I thought -- you have to reorder t=
he
> constraints because an output becomes an input for the load accessors. I
> tried it myself and it doesn't fix the issue (I can reproduce it now).

Any progress with this? Do we end up with gcc 4.6+ - uncompilable MTD
drivers in 3.7?

--=20
Best Regards,
Artem Bityutskiy

--=-doxa22VVSothGINHpfBO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrdrvAAoJECmIfjd9wqK0ztQP/3VPu0jns/7mDn2Gq+f53G72
jEKuMG5XCy+57xM3/HuO2fAcUku/HMpGYKheI6ORvBFTovDN/Lgyzw+6YukV4VId
j4LNGmNjEGC+dQrMt5UsRDoIM3ZAlbCDElQ3FCR49D8cpK1xs/SPpZ3dgazFCbOx
pLeSt6o7zqOjG24a7wSpQKqdHd9h+WYw5Ik0jTCeFlm5qWXf9XpRmCJGMtPGSNCU
MxPRVwdohnkG8dBtN2xRPe3kC6q/t3QqM4JmFA4XBojlrKBYyvD8lqJ7t2VEyfPb
l6hzqcXi6VtTUBvXl107AqDfz0qTFYecT2QViltfBmi8R9RRlfo2DwiXkHbhYsyt
X5EFuPTj7bEKaWcclDwfg39zE/42gCjgqaXccr8pszW+uqvyQQXsdUFglNQ/LTen
Ymg6WxELkUfkVr+YPJRdlza/wdAPVn+XkfeFMfysZGE6ut2m6sMD1joUZKLy2R73
twnwP7wq3vohz/O01f8NN4kxV/w32nZb167Q+9SP9D3K9ws6GbsQIPur1YT56rgk
GY0hz59OaKpb3Rl/WwBWIquzLpXyA2GwCOIEKRC4XHhcPXkGza8QNYkTSiR+xqh3
fHeV7rUzpq3PBDj4JzPGc+q6aIGH019wqQaNEwuck2yC8yjRhLwqLin5YM05M+Ua
Ok3mLphHJpOpy59n5Vek
=lt/g
-----END PGP SIGNATURE-----

--=-doxa22VVSothGINHpfBO--
