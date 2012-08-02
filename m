Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Swx6R-0006pL-5s
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 15:14:19 +0000
Message-ID: <1343920728.25013.131.camel@sauron.fi.intel.com>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 02 Aug 2012 18:18:48 +0300
In-Reply-To: <20120802165921.17d83b8c@spider.haslach.nod.at>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343919530.25013.116.camel@sauron.fi.intel.com>
 <20120802165921.17d83b8c@spider.haslach.nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QhU7o7L/sz95XD7zCI0K"
Mime-Version: 1.0
Cc: nyoushchenko@mvista.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, Marius.Mazarel@ugal.ro,
 tim.bird@am.sony.com
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QhU7o7L/sz95XD7zCI0K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-02 at 16:59 +0200, Richard Weinberger wrote:
> Am Thu, 02 Aug 2012 17:58:50 +0300
> schrieb Artem Bityutskiy <artem.bityutskiy@linux.intel.com>:
>=20
> > On Mon, 2012-07-09 at 14:18 +0200, Richard Weinberger wrote:
> > > This is the next round of UBI fastmap updates.
> > > It fixes all issues pointed out by Shmulik. :-)
> >=20
> > Hi Richard,
> >=20
> > when I try to attach mtdram (NOR flash), UBI fails:
> >
> =20
> Hmm, and without fastmap it works fine?

Yes.

> I don't see much fastmap related here.

It is related to your changes in attach.c.

> Anyway, I'll try to reproduce.

Please, make sure that UBI tests work fine on mtdram as well.

--=20
Best Regards,
Artem Bityutskiy

--=-QhU7o7L/sz95XD7zCI0K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQGppYAAoJECmIfjd9wqK0DwcP/A7X6WG/JvqWuXZwjxk4DdUe
fs1YfcmdH5PWCR60r4X+U2jKeD6tFQJDqaBvVg4HnBWE34XZl4tbbvkmnr9m+/x1
GRJoCORjs5vjOKK80s9x0pmZZ3+putifnCiB+aL2yAV/XQPwJE86YGE4euhVhX+O
GodDBLMZkvqD4DpIhRDPTuOA37iXZFrUFYxeCecJFu+yjilSTiZc9GTUwpNECVaV
BwzqCBH0hLOq3n3jQe0kDs0vrk9X6X3KSaIzagDDdZAzK8PbzwOSAUPw0eQ/S11H
iXxCcBY0MrduuJZQqeLbXRRoXbk+6aYGLpUQtCgoxcBgC4hw3k/iviGwGSUNviXM
bmzaR1Et4ir0yOFjQivxev1Z+p4CsSsus/RVu60a0s3XoMi3HYmlZmBTv0ioXEsb
cklP8ekwDdLCmm9yFZ+Fs0+dheXd8AhREw8B0UFvRJ5KbMjnR7g0WMW9w1LYUbm+
zn3gv22TaiO1pZQ0JBQlDY/3IXD68VWJdWSJ9omyshkYwmqcfVnqKVGmnKPbFOvu
f5bxN2NOGqj2S+K6I2ORX9xsbolN3G7zReNwFUBUTw447pD0NblXBBCMVVxdMf2k
Ej+JkJTJo/vrRenQ2YCrZpM+eLqqRXGLlPe2GGO5fRS6LCuHxyQBWMEA9vWmMx5A
N54ng8dFJ5DIQNFTMKrG
=72Vh
-----END PGP SIGNATURE-----

--=-QhU7o7L/sz95XD7zCI0K--
