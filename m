Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFS99-0003bx-KM
 for linux-mtd@lists.infradead.org; Sat, 22 Sep 2012 16:01:36 +0000
Received: by bkcji2 with SMTP id ji2so2148974bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 22 Sep 2012 09:01:32 -0700 (PDT)
Message-ID: <1348329689.1894.4.camel@kyv>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Sat, 22 Sep 2012 19:01:29 +0300
In-Reply-To: <20120905083020.0bf6b0bd@halley>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346656701.3061.8.camel@sauron.fi.intel.com>
 <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
 <1346686544.3061.75.camel@sauron.fi.intel.com>
 <20120904144826.7b9b7518@halley> <5046B504.6000608@freescale.com>
 <20120905083020.0bf6b0bd@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-vQcq0I2lR0oDR5zkWrw9"
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie8@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-vQcq0I2lR0oDR5zkWrw9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-05 at 08:30 +0300, Shmulik Ladkani wrote:
> On Wed, 5 Sep 2012 10:12:20 +0800 Huang Shijie <b32955@freescale.com> wro=
te:
> > yes, it's really simple and flexible.
> > But I think it's not wise to export the 0-size partition to user.
> > The user may confused at this.
> >=20
> > And the mtd-utils, such as mtd-info/mtd-debug, do they can work with a=
=20
> > 0-size partition?
>=20
> I think the 0 sized partition case is really seldom, don't worth the
> trouble, the user will probably observe something went wrong in his
> cmdline parts specification.
>=20
> But nevertheless, if we think it's a MUST to forbid the 0 sized
> partitions, then amend my patch as follows:

OK, pushed this one to l2-mtd.git. Guys, if there are more patches on
top of this, please, re-send them.

--=20
Best Regards,
Artem Bityutskiy

--=-vQcq0I2lR0oDR5zkWrw9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXeDZAAoJECmIfjd9wqK0EeoP/0Pc184rQXvW+Z5imDWiBTxb
dk2Ofy3uWXsUUk/yN94N0/G7Up/5n9SY24IRRvHqsi2aLRcyrYE/EaBozIU2VCkc
x33zGqgBW88vBF5R7+d7C/s16lP0m6zlDX/99UQedifjcZ+WDdzLZz308uzGx/qc
j4QSH1T1Ppvj3faHVzbZhSrzOjhJbFMNUF2bBKcol44BapykpqZ06tti6W3H0uez
+MN6nSmsZw9i07ppUV2jDRpthVCRrqrbyo4gSz0pkaoboOtk870SrX+ZfDcuXwEL
ZvyB4v5Uk7mfPLNsegNkAPLsmuLzX56cIA1KPxK1LLVNBHfvSNDF1zrw6XzpLu9H
eH7pHFODBG7NOSziCzZuDTxokqsZJ2T4hsL8mBoT1RPq7+uhS9N79inUwNSjdmAe
RRbH7XwJutmTrQTtM+JxqYvpMllxVrjkYEgZGLKb12sv3QXGnuAO40QoWCR/h8C8
1tIoWSNcXyVMXj8oDBLjPYlOWn5grZpuZhScypwKFok5wCwjs4GZr0Kw631ykJMp
071+czgXk0DdlVThVsMfDlPMlJU9Kck7VMKXAPVlKlyZnpjEscss2VV8TFAI5JdN
QwkEXI1PzKMnUNGsUbjq3P7OqH9dnztGfRTvbmZbH9CFxrs12FwHsFvk7VG4MWil
v+GtKRy96LxQLLf8QS1t
=26Qw
-----END PGP SIGNATURE-----

--=-vQcq0I2lR0oDR5zkWrw9--
