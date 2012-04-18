Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKUgE-0003vx-I6
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 13:12:19 +0000
Received: by lagy4 with SMTP id y4so6455817lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Apr 2012 06:12:15 -0700 (PDT)
Subject: Re: mtdchar kernel oops
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Wed, 18 Apr 2012 16:12:04 +0300
In-Reply-To: <alpine.DEB.2.00.1204181452410.8114@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1204151350450.13924@eristoteles.iwoars.net>
 <20120415153220.GR6589@ZenIV.linux.org.uk>
 <alpine.DEB.2.00.1204151951560.16000@eristoteles.iwoars.net>
 <20120415215355.GS6589@ZenIV.linux.org.uk>
 <alpine.DEB.2.00.1204161329200.21808@eristoteles.iwoars.net>
 <20120416191718.GT6589@ZenIV.linux.org.uk>
 <alpine.DEB.2.00.1204181452410.8114@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-D/HTcaz1cFcy14Sh5DrT"
Message-ID: <1334754734.2203.1.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Al Viro <viro@ZenIV.linux.org.uk>,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-D/HTcaz1cFcy14Sh5DrT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-18 at 14:55 +0200, Joel Reardon wrote:
> Perhaps Artem can shed some light on this, I'm working on a branch he's
> prepared. But if its not happening at your end then perhaps something's u=
p
> on mine; the oops log is rather bizzare. I'll remake it from scratch and
> see what happens.

I am having paternity leave and will not be very responsive for few
weeks from now, sorry. Try to play with rebasing/clean
compilation/changing the compiler etc.

--=20
Best Regards,
Artem Bityutskiy

--=-D/HTcaz1cFcy14Sh5DrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPjr2kAAoJEJtuLFy+q7fekFQIAKAMX6Ccdc50C0nCeQMQa7MZ
lvQ3VIw6lcrHOJ/427Llten4uMIe8FVxFne+KIn/1mdu390ldQF2ztpSFvqRJOlk
3tmaleDACavQQneF9BxXk7eTwmY68uPwGyoU2D8dFWb/xi9ivSVn1mZCTyW7kBvu
IIQ84FcjbO5DhtrWAreSFZ1wybv0b8FkivnR7NXogk+YNEL14xgtDjXav+RobxWT
VC+QzVXG6TEg/UXimWaUZc4iXDfRryO9KDWZwH6tz2nAZdtp1C5C0Wu2pVBHpcBK
J8CmmK4CrJV45fjD/aJkcLsWcvKMmmaeWt1ZegB5s1P8wGb9SNqkL8a8+JcDkOA=
=yQb4
-----END PGP SIGNATURE-----

--=-D/HTcaz1cFcy14Sh5DrT--
