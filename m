Message-ID: <1351148122.2507.63.camel@sauron.fi.intel.com>
Subject: Re: Possible regression in arm/io.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Will Deacon <will.deacon@arm.com>
Date: Thu, 25 Oct 2012 09:55:22 +0300
In-Reply-To: <20121024105223.GC23775@mudshark.cambridge.arm.com>
References: <CABYn4syj0GZAsDYVQfXg_qKAFkbrxPLoZWpKRzwf3gfRkMGZkQ@mail.gmail.com>
 <20121024105223.GC23775@mudshark.cambridge.arm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jiihOvxVN6a7af9hOX0m"
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


--=-jiihOvxVN6a7af9hOX0m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-24 at 11:52 +0100, Will Deacon wrote:
> 	(a) Understand what has changed in GCC to cause this error to start
> 	    cropping up.

This is about already quite old gcc 4.6.3, which I use for about 4 last
kernel releases already. So it is only the kernel that changed.

You can download the GCC I used from here:
http://kernel.org/pub/tools/crosstool/

--=20
Best Regards,
Artem Bityutskiy

--=-jiihOvxVN6a7af9hOX0m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQiOJaAAoJECmIfjd9wqK0wNkP/i3iIw9GSSooYZYLMtrk49z7
dRpwHlWkYH3A+gS2WOlK58eqRJLMSKEYo4uIKeXEYxVvYaHtuM6RfCVl+jsZz9nj
jEPril122776Z3J/+iT2xJ5qtQrG8M2owrPLRi19xpzRyZPtSbDopCLH+68iY3Y2
h86yZNFryR5W+8O2N8/f7VsaHInGs0R3gjF6GdcIETbBLFTZ+Jb8F5Ec5Wwr6HVI
1zfy8fAxm/ngngVpr42H6wfZ3AuU5SyjmHng6fYzq93LXK9AtqnG8K/elHWphxyl
zwAHVNR7ObjNInzIVKAm0ycp8v7VZTmvGw2hj0hQGYXqz+4hs84aFK0wSP/wKAqD
q13jKsfr52T+XnIR+En94+bXJhaIlxs+2iXSAoNbL042LgBTubiB6cdYrhDdagqL
sypMAWbbSN+dE5gG4lggCPnTJlwpOmdot1Lx1MR3uEDoJoGs6To3o1depjpZXB8k
4Lk2eZwjyDOSiy3RqvPFyI98AIX+HxfpBWuDBxpngp26jhXim+DNEfs0VbqNBvyw
N6bSa3Yj89srLrU9K5lhOnpIxD8FQP0vYe5Cf7Ve2IUaApgaf9gSqeHUJfra7PbP
fIumHMWmS6gGGWNqhufcjVT1QtxHxJ7nWEPtHRET3x+mjU6T3JNtoIjItLITvCKx
xtI/qnGpLmZPLyKb0nHo
=ei3h
-----END PGP SIGNATURE-----

--=-jiihOvxVN6a7af9hOX0m--
