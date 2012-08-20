Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3PSr-00089b-Lz
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 10:44:10 +0000
Message-ID: <1345459731.2848.25.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] sync include/mtd/ubi-user.h with kernel v3.6-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 13:48:51 +0300
In-Reply-To: <CACQ1gAhv2mk-W2kxigFqUFjEbSMQTY9P2+vxmkgxFCLtumWVyg@mail.gmail.com>
References: <1345215442-19082-1-git-send-email-richard.genoud@gmail.com>
 <1345215442-19082-2-git-send-email-richard.genoud@gmail.com>
 <CACQ1gAhv2mk-W2kxigFqUFjEbSMQTY9P2+vxmkgxFCLtumWVyg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-pUJ64xaxYOYQn05T5SmV"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-pUJ64xaxYOYQn05T5SmV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 12:25 +0200, Richard Genoud wrote:
> 2012/8/17 Richard Genoud <richard.genoud@gmail.com>:
> >  /*
> > - * UBI data type hint constants.
> > - *
> > - * UBI_LONGTERM: long-term data
> > - * UBI_SHORTTERM: short-term data
> > - * UBI_UNKNOWN: data persistence is unknown
> > - *
> > - * These constants are used when data is written to UBI volumes in ord=
er to
> > - * help the UBI wear-leveling unit to find more appropriate physical
> > - * eraseblocks.
> > - */
> > -enum {
> > -       UBI_LONGTERM  =3D 1,
> > -       UBI_SHORTTERM =3D 2,
> > -       UBI_UNKNOWN   =3D 3,
> > -};
> Sorry, I didn't pay attention to that (I must have compiled without a
> make clean).
> mtd-utils should be updated not to use dtype anymore.
> If it's as simple as that, I can update it.

Let's first focus on the kernel part, get it in, then do the mtd-utils
part, and then we'll also need to update mtd-www (docs).


--=20
Best Regards,
Artem Bityutskiy

--=-pUJ64xaxYOYQn05T5SmV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMhYTAAoJECmIfjd9wqK09l0P/05vD575YHdpfrVsG9Dro0Wl
SLzaw89xDIoydg5TyNzWBPv3yGzKven+zexqd8f+Ffk6HA4vGGEry7jHb2FfMk09
zMCt8S0r2XtBuBaJ1kAwlq2T+p36GkAD8uR102oKAUQs8+4/zXGcE/f1kbb4aS79
NIcBFvuIoPBccMmBHQf/xRnaod86p2hE9A6xTGG1+nPzptg4NiLomnkm9+ycynJP
3CcXR0LzwJwPwFX4agw5xJnsMW68zCU+p5CCQoeZ1MZsLoTivwjMf/yy+y+R+NXJ
yl6vaVsX4F0gujD9jH1qRFpXaV8YZkrPOiU/ZQOZE7Y6DmxU8Agjqg/r6niSyc3u
7bBWTJAUejjiMqMxbuQl2L+rhVYcsS0US+HEEXt6q+EOjaj98TTv58yGtUycXozx
wCswF0D9FBwEm6GJKjI4lqTHFHzcezbdZMX/8wfVofx/lT1sNbaQ9ctrV0xSb4JT
ygMpd95oPT9brOyQ4cmSOqaHZ9THLhAMpg4bM1BT+3OqonXBcH9OIlK6tg/4E+0r
3/LVSPlLngsCuI6V0GHjZZaRlfGGIvLM/tozxD0BE9DBLv9p4JQsRh9A6Hi3aL1D
TUPlplPQcfFWj4BF+BiVKrEssUru8TyXKS1MAoOCMHzEgz3Ou3xnWZeB0NOXNcDS
carAjEiWRxNFGpweEvLX
=ymSf
-----END PGP SIGNATURE-----

--=-pUJ64xaxYOYQn05T5SmV--
