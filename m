Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UV2Xw-0005ja-Of
 for linux-mtd@lists.infradead.org; Wed, 24 Apr 2013 16:27:54 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
Date: Wed, 24 Apr 2013 12:27:46 -0400
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304190853.54402.vapier@gentoo.org> <51713EC3.6070808@parrot.com>
In-Reply-To: <51713EC3.6070808@parrot.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1916118.tqK4jyUYxG";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201304241227.50603.vapier@gentoo.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart1916118.tqK4jyUYxG
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 19 April 2013 08:55:31 Matthieu CASTET wrote:
> Mike Frysinger a =C3=A9crit :
> > On Friday 19 April 2013 08:31:13 Artem Bityutskiy wrote:
> >> On Fri, 2013-04-19 at 07:57 -0400, Mike Frysinger wrote:
> >>> the reason we're talking about not allowing write support at the
> >>> *block* layer
> >>> is because it's questionable how many people actually want this, the
> >>> performance isn't good (compared to native flash filesystems), and
> >>> because the
> >>> write/wear characteristics are unknown.
> >>=20
> >> My opinion that unless people demonstrate that they need this, e.g. in=
 a
> >> product, etc, we should not merge this stuff.
> >>=20
> >> We recently merged fastmap, which is a big chunk of code, and it looks
> >> like no one really needs it. There was a problem report, and Richard
> >> promised to look, but did not. I do not blame him, he is a busy guy. B=
ut
> >> this shoes that this feature is not really needed, while adds
> >> maintenance burden.
> >>=20
> >> To put it differently, I do recommend to merge more UBI-related code
> >> without a solid user-base.
> >=20
> > also to be clear, i plan on using UBI block in read-only mode, so i'd
> > like to see an ubiblock driver merged
>=20
> Why can't you use gluebi + mtdblock ?
>=20
> Too much overhead ?

a poor man's read-only test on this one system shows ubiblock & mtdblock=20
provide about the same read speeds.  but this was just reading the raw bloc=
k=20
device directly.

the mtd faq suggests that gluebi is meant only for devices that actually wa=
nt=20
mtd behavior (read/write/erase/etc...) like jffs2 rather than for flash una=
ware=20
filesystems.  i'm not sure if gluebi will work if you want to run in read/w=
rite=20
mode w/a fs like ext2.
=2Dmike

--nextPart1916118.tqK4jyUYxG
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJReAgGAAoJEEFjO5/oN/WBmIgQAIeWwk0aHyZVVPdFllG+syUC
49m9Fsle7VYnM/8ZIEzyp7/FsfT2ACwDFwXPAA6vKkmysvlAqD+jUlvXJBQQbEGR
j9FWUifFfr4QcuOWe5+70nGF09lPO/V3fbG7zJ0heMZNRversUteE4QUU3wVIaSt
Uo4pHvw5p+EvpjcqgVZfDjb1WzShUQgZex+suuljc16/jG0YHF8m+LOl8NggN+ma
dgWv6o3+HE8vglFOUWc0UBQFRjd9cdKEdXLYmV7P1jagRF29H6aRabsVvuRP0WKY
Of/iw5UO4qNgw7pDlfqoxaEvs4toDkQ0Lgbc5I7WwUzrZ0Qka4U60BOSmMe+lRkX
NoA4UMYA/XUrO+LrH/jWroNy9IXGnWsvsRxW/6+9T3tekIfkJsjUw/pbXeZbJzv6
1he30JRy7WAq4Q9qPCyZNTc/LehINj/yemgbjASTrmFx8pzztluWhE5RiuWV1ZPS
ga2ugbijRGL0KaSyF8cZmHEwvoj/14O+c+Vj4qvoUFoTCEhAt4bM/pAw8OdeB3n1
OHkUDi+Yy3NyGbKVjvJxLoJWA8Pk/5BtTjmP9p56cj1eIVljq1LNeIMQfbMYOk2N
Zo/g3qKnKcioZ7dn4mzaZ3OHi8l84g6dZ+8LyOCrIwdlrM6TYpxAw5f+iR9U1KZP
XA5NhsBCONbMMU0s3kQV
=9Ezo
-----END PGP SIGNATURE-----

--nextPart1916118.tqK4jyUYxG--
