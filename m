Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbvcs-0006KY-OS
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 14:52:39 +0000
Received: by iadk27 with SMTP id k27so5520887iad.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 06:52:38 -0800 (PST)
Message-ID: <1324133644.4240.38.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: write bad block marker even with BBT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 17 Dec 2011 16:54:04 +0200
In-Reply-To: <CAN8TOE9C9VEi7htM=-jypt29y23Ex3CCnYBOW3+OkTs1Zcra1A@mail.gmail.com>
References: <1323292100-19280-1-git-send-email-computersforpeace@gmail.com>
 <1323723000.2297.4.camel@koala>
 <CAN8TOE9C9VEi7htM=-jypt29y23Ex3CCnYBOW3+OkTs1Zcra1A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4KbOH3q+CAZms5wdOj4S"
Mime-Version: 1.0
Cc: Jim Quinlan <jim2101024@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4KbOH3q+CAZms5wdOj4S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-12-12 at 13:53 -0800, Brian Norris wrote:
> On Mon, Dec 12, 2011 at 12:49 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
> > On Wed, 2011-12-07 at 13:08 -0800, Brian Norris wrote:
> >> Add and option (NAND_BBT_WRITE_BBM) for writing bad block markers to
> >> proper OOB area on each block in addition to flash-based BBT. This is
> >> useful when:
> >>
> >>  * bootloader cannot read the flash-based BBT format
> >>  * BBT is corrupted and the flash must be rescanned for bad
> >>    blocks; we want to remember bad blocks that were marked from Linux
> >>
> >> Adapted from code by Matthieu CASTET.
> >>
> >> Cc: Matthieu CASTET <matthieu.castet@parrot.com>
> >> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >
> > 2 questions, perhaps silly, but still:
> >
> > 1. Why wouldn't you make this the only and the default behavior? Why
> > adding more options instead?
>=20
> Personally, I'd like it to be default behavior. I guessed that it may
> cause incompatibility with some other system which depended on the
> current behavior, but if that's not a realistic concern, then I don't
> mind dropping the option. It's also possible to add a flag to restore
> the old behavior if needed in the future.

Right, I do not see that it will likely break older systems. I suggest
making this the only behavior, unless someone spots a problem with this.

You could send a new patch, and put into CC major MTD contributors
obtained with git-log, for example. If they have concerns, they can
rise the flag. How does this sound to you?


--=20
Best Regards,
Artem Bityutskiy

--=-4KbOH3q+CAZms5wdOj4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7K0MAAoJECmIfjd9wqK0XNYP/0qADx5suHO6tvBHBte78kzp
8GdHFyETBY59mgqdATNhwM2ArvndI/F5qprSxv5gKjwtvJJULb3Jz8aAMoYmXNY3
aWbZV3fxWhaxjzImend7R0Wp1c2bmS/ofB6jg/TDFk33b1EFDgivdKrK7glZustf
FE0lHiQ3+XaodsoZzkQ9EaGYBstSCCJlnvUW+bJMS2gSl75i8q5Rk3OMZn6Dpnyi
EAy0I0GUF/krGfLmyOjFJeC99Jht+3t02Oh6wTfVBAF/jZeJZqvkHnti7U4vVK+5
CLOHdzw/W0PO9dLQQEqxCTGAPoBvGPQD0v0SmvNQUA0zANU135Of5tpilh7UkDKg
LkpXOT7hKEwYFSGMyd4LjsUgH3cMGLqKl2iJALzKC2rJYyCbSRiWHvLCsgACXS87
ZQZ5km+SNrXCVvb5Ab9kWJiNDnVbV6PzDkP1EpIfoL9GVdxYld4NVi3XHVsLvnjW
m7IVE5Klu8H8r9lq9LOsh1H0WKMTP5Y2awHLGf8RihRHNbNH92cvh2JSkZHKxkHA
ph57oKykQ7Z31CyliWsqKp67+oeRTvhdicGGIVBCKF+oZA1rUxX1msqi5mAOl0NM
VIW0duJGWjqRDJjalwfIeR/OZOfz+X8VOWlvq1Fs/sclOgOZec6sko2Nk0gUscdX
Kj1YrzCWml9h67vJcokn
=l9An
-----END PGP SIGNATURE-----

--=-4KbOH3q+CAZms5wdOj4S--
