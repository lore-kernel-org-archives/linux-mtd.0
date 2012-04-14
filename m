Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJ29n-0003es-DT
 for linux-mtd@lists.infradead.org; Sat, 14 Apr 2012 12:32:47 +0000
Received: by lagy4 with SMTP id y4so3468006lag.36
 for <linux-mtd@lists.infradead.org>; Sat, 14 Apr 2012 05:32:44 -0700 (PDT)
Subject: Re: UBI/UBIFS issue: corrupt empty space => switched to read-only mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>, Matthieu CASTET
 <matthieu.castet@parrot.com>
Date: Sat, 14 Apr 2012 15:32:40 +0300
In-Reply-To: <20120414121105.GB6207@parrot.com>
References: <CAHea38St440q-T+FawSic=brdv-dHb7H7yXh0Unq028Op75zuQ@mail.gmail.com>
 <1332239983.11468.14.camel@sauron.fi.intel.com>
 <loom.20120329T173823-262@post.gmane.org>
 <1334330445.2544.83.camel@sauron.fi.intel.com>
 <20120414121105.GB6207@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lf6SfGktETpF3wqIxmHr"
Message-ID: <1334406762.2263.35.camel@koala>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matteo Mattei <matteo.mattei@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lf6SfGktETpF3wqIxmHr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-04-14 at 14:11 +0200, Ivan Djelic wrote:
> On Fri, Apr 13, 2012 at 04:20:45PM +0100, Artem Bityutskiy wrote:
> > > > On Fri, 2012-03-16 at 17:14 +0100, Matteo Mattei wrote:
> > > > > Hi guys,
> > > > >=20
> > > > > I am working hard on UBIFS to make it works on 2.6.32 and OMAP353=
0.
> > > > >=20
> > > > > I already posted some requests to TI forum but I have no answers =
up to now:
> > > > > http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx#6278=
75
>=20
> Hello Matteo,
>=20
> I have been using a very similar setup (2.6.32 + OMAP3630), and I added B=
CH support
> (8-bit correction) to the mtd omap2 driver, using the BCH library (not TI=
 implementation).
> My patch corrects bitflips on empty space (erased pages), so that UBIFS d=
oes not choke on corrupted empty space.
>=20
> I posted a patch a while ago, albeit for a more recent kernel version:
> http://lists.infradead.org/pipermail/linux-mtd/2011-October/038207.html
> bit I did not get much feedback from TI maintainers.
>=20
> If you have some trouble backporting this patch to your kernel, let me kn=
ow, I may
> have an old 2.6.32 version of the patch somewhere on my hdd :).

If we have a "tested-by" - we can make them go in via the MTD tree. It
looks like Matthieu successfully tested them?

--=20
Best Regards,
Artem Bityutskiy

--=-lf6SfGktETpF3wqIxmHr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPiW5oAAoJEJtuLFy+q7fetzkH/iOk1VSIMtngMOhsuALYXHSD
v6cFmH8R1OZHVqwObTCPGfiEa7HHizDETzq9IxXcO8FPzsn3ez6jQSBt9B61XBAP
1+BCo0sKeouTK9uGH9WaUcJy/s/m/1hbBZrKeqT6y2YW4RTexvsWE8eqGX3sf1pU
/UAr3ptlKtOcRvGc/rukLMKnsyNc7LHHPUW3OdE2sg5srzRw1/KKsleNeLhbETh7
q2RNoF1oT27lt4ZoZh+Jhh3/SvxhXMdfLNoNqh1Za4JcJtqn8Nhg0IKfWI1X12HV
1Yzv9fqGtDTjBOGBwszTs4sAHSlWlvsk8HeBgzgO2wC8Y6g64S6Jdokxp9sRK/c=
=qKJN
-----END PGP SIGNATURE-----

--=-lf6SfGktETpF3wqIxmHr--
