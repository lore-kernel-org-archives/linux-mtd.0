Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Ybz-0003V1-SO
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 15:30:52 +0000
Message-ID: <1346686544.3061.75.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Mon, 03 Sep 2012 18:35:44 +0300
In-Reply-To: <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346656701.3061.8.camel@sauron.fi.intel.com>
 <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IePPWPTwI6QdcotZ7oDi"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IePPWPTwI6QdcotZ7oDi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Dropped extra CCs - let's spam less]

On Mon, 2012-09-03 at 11:09 -0400, Huang Shijie wrote:
> On Mon, Sep 3, 2012 at 3:18 AM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> > On Sun, 2012-08-26 at 13:21 -0400, Huang Shijie wrote:
> >> + *
> >> + * Note:
> >> + * If you choose to set the @offset for the <partdef>, please set all
> >> + * the partitions with the same syntax, such as:
> >> + *     gpmi-nand:100m@0(boot),100m@100m(kernel),1g@200m(rootfs)
> >> + *
> >> + * Please do _NOT_ set the partitions like this:
> >> + *     gpmi-nand:100m@0(boot),100m(kernel),1g@200m(rootfs)
> >> + * The `kernel` partition does not set with the @offset, this is not =
permitted.
> >>   */
> >
> > I guess it is indeed OK to sort the partitions, just makes things a lot
> > simpler. But we probably then should also do the following:
> >
> > 1. Make sure there is only one partition without offset. If there are
> > several - error out.
>=20
>  Why allow `only one partition without offset`?

E.g.,

gpmi-nand:1g@200m(rootfs),100m(boot),100m@100m(kernel),200m(ququ)

how would "boot" and "ququ" look like?

What I basically say is that we should refuse lines like this. Which
means checking that there is only one "OFFSET_CONTINOUS" partition.

> Take the following unsorted partitions as an example:
>      #gpmi-nand:1g@200m(rootfs),100m(boot),100m@100m(kernel)
>=20
> The current code will parses out the following partitions:
>       rootfs: < size =3D 1g, offset=3D200m>
>       boot:   < size =3D 100m, offset=3D OFFSET_CONTINOUS>
>       kernel: <size =3D 100m, offset =3D 100m>
>=20
> If we sort the partitions by the offset, we get the following result:
>      "kernel" , "rootfs", "boot"

Yeah, for some reason I assumed that if you do not specify offset then
you mean the partition must be the _last_ and span the rest of flash. I
assume other usage is bogus. So from this POW the example is bogus and
lines like this would be rejected.

I guess the criteria is that this sting contains a "gap" (0-100m).

With the logic I suggested, for this case what I said would basically:

1. Sort. This leads to

100m@100m(kernel)
1g@200m(rootfs)
100m(boot)

"OFFSET_CONTINOUS" is always the largest and will be at the end when
sorting.

2. Verification.

We verify for overlaps and gaps. And refuse this one.

--=20
Best Regards,
Artem Bityutskiy

--=-IePPWPTwI6QdcotZ7oDi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRM5QAAoJECmIfjd9wqK0dsMP/RpotuUec1MFpOr8AaIVqW4y
rfAfw3fVntHlk9AJu4q26t/R07Hr/OTcUwM78R7EKImcK+d10BlNGNJD0sEHjUC8
8mlhYD/XqE3nQrLKiCo3KSWQ8YUMupN0pFdRjbyoLitF+Dcm6/GxhT/F5zXHf/vj
PyxgFhvV8tSLAsxZ/7B/D1AJ2AY9tUllNGAlDFea1tJEoA3ogESe+UokGc1afldi
6d5LuKSsq5nz7nH8fRRA6dLUv/RPU/Vq8/QQU40lD/EbwCtBrmbq4ufkWAmaM9rq
2FH8P4vEicAReKYKbEucgbqRcEDaSnRUA2wjzqU9xczBD1I9xWs6rTa6/YOrXbYF
Zy9NCc2cZpTgp2yMqG5BnoW5pb6fTBbJjG8kDeygvvxJ2ADX/E3HmmXky1bPG1x+
24QRGwpkDFZGHChZfhockwLelH2oGxfwQM5ZT+9Ugb7VFQ+HjclhMQympDLYO9de
LLX77iYIK19Ag2gUufHcyKz1YTHx41Qx0QKOkGO1ZhXNL80rGzWCkOL0aEAwBIcv
A8pqVSIFQFgr4N//jVR2H+W8H2hY10B8UwAWxlujprk+G9w3gGnsau4x0Qy9Iv9H
crktjsF3vvpkTyNnwPsJjE3seFynz18iDKoQwWjLCVhJ4zDFEVvm0DLhY0XfCcxP
ZPvmIGAMZTaVG255OT30
=t/7f
-----END PGP SIGNATURE-----

--=-IePPWPTwI6QdcotZ7oDi--
