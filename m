Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4wQc-0006QE-MN
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 16:08:11 +0000
Message-ID: <1345824780.2848.342.camel@sauron.fi.intel.com>
Subject: Re: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty
 LEB'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brent Taylor <motobud@gmail.com>
Date: Fri, 24 Aug 2012 19:13:00 +0300
In-Reply-To: <CAP+RiCASzaH-TFHSYK0ioyXackRcMrZD4eoev2qVUVLhGft7Bg@mail.gmail.com>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
 <loom.20120813T153641-586@post.gmane.org>
 <1345208270.27859.75.camel@sauron.fi.intel.com>
 <CAP+RiCASzaH-TFHSYK0ioyXackRcMrZD4eoev2qVUVLhGft7Bg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-vJhdteZldQ4VVJ3RG3xe"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-vJhdteZldQ4VVJ3RG3xe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-24 at 10:59 -0500, Brent Taylor wrote:
> On Fri, Aug 17, 2012 at 7:57 AM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
> >
> > On Mon, 2012-08-13 at 13:41 +0000, Brent Taylor wrote:
> > > I've been running with the patched kernel for about a month now and I=
've seen
> > > this issue once since then.  Does anyone have any other ideas on how =
I can
> > > better track this down.  I've taken precautions to test if the extern=
al data
> > > partitions mounted properly, if not, then they are reformatted and in=
itialized.
> > >  I will have a problem if the issue occurs in the root filesystem.
> >
> > What kind of test do you run?
> >
> > --
> > Best Regards,
> > Artem Bityutskiy
>=20
>=20
> Artem,
> Thanks for taking the time to look at this.
>=20
> I'm not sure if I can share the image just yet.  What all would you
> need?  vmlinuz, uImage, the config file?.

No. dd if=3D/dev/mtd4 of=3Dimage

and share the image. I could try to put it to mtdram and mount the
volume, and take a closer look at the error.

But I think I saw these errors before when testing, they were so rare,
and I did not have time to dig.

--=20
Best Regards,
Artem Bityutskiy

--=-vJhdteZldQ4VVJ3RG3xe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN6gMAAoJECmIfjd9wqK0wJsP/jHdAE1jdcSiN2rrBs/im/Cq
zgHko66O8zRCYktbpzMEyNbtcpk4cMhYzd3fMZfdAAnJAnOHfqsSr0XraV5sHPgm
hnZWXc6Y6JnBNdN+3udW5pK/z+1dSwBlnxW5dBpGqA8NJydLHmHasw/nI1/vhHHN
7Vjxi41e7eJfHTB7wJJllKajsa9w9ivJEzOh+DU3CMTINAbmlZ/SivaSV4ApVffC
+N6C0lnislzNgWie0tkuQi78l/fQPeZK94/zKgqTv9akJL59YLDleHHjzEnAxRbo
y0sUBnya/rWHIyfgMobyiH9LHr2FmHTFbC7PW1uN8sQ0kV9wKh+MRrRlSun5KXmF
yJ//pOHsxSrt5xER7HdytLdD52nsiwiNSWF8VBKNrKm93xnl32qqNf9heJXHTDQV
1cle6ZjFjSmLPmIHl3EqCN2EiM5R+DnPKQzkI2IJ9Cwcm2YyBQPAsUl0ld6aTPch
rktXYSJdUs+rlYZNVB7zkNa0T5p0OGPN8qGrSb9UP2tXn6+OJm4uskr8oLDN5AWP
WLivm9sYiZ1A6bh6V5TWjijyIU8SlPR0j5MB/n0/CsQrgAGS0R05o6wZFfbM13Qb
TBuGJiW7qL0OHC7PRqZMcKw6prh7NojImxVTPpLkiakFHBpRVHoEyMizPjGLnN0q
dMWNmybU5zxOoopVK98P
=hXDm
-----END PGP SIGNATURE-----

--=-vJhdteZldQ4VVJ3RG3xe--
