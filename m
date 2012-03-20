Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9wQz-0003W7-6I
 for linux-mtd@lists.infradead.org; Tue, 20 Mar 2012 10:36:57 +0000
Message-ID: <1332239983.11468.14.camel@sauron.fi.intel.com>
Subject: Re: UBI/UBIFS issue: corrupt empty space => switched to read-only mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matteo Mattei <matteo.mattei@gmail.com>
Date: Tue, 20 Mar 2012 12:39:43 +0200
In-Reply-To: <CAHea38St440q-T+FawSic=brdv-dHb7H7yXh0Unq028Op75zuQ@mail.gmail.com>
References: <CAHea38St440q-T+FawSic=brdv-dHb7H7yXh0Unq028Op75zuQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rqLIray1nJXNJOe13vBK"
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


--=-rqLIray1nJXNJOe13vBK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-16 at 17:14 +0100, Matteo Mattei wrote:
> Hi guys,
>=20
> I am working hard on UBIFS to make it works on 2.6.32 and OMAP3530.
>=20
> I already posted some requests to TI forum but I have no answers up to no=
w:
> http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx#627875

Well, this error was reported several times. AFAIR, there are 2 possible
causes for this.

1. Your driver does not protect the empty space. Normally the driver
corrects bit-flips using ECC, but some systems do not do this for empty
space, i.e., for the flash regions which have been erased but have never
been written. UBIFS expects to see all 0xFFs there, and if it doesn't,
it reports about corrupt empty space.

You can fix this by fixing the driver, at least this is what people seem
to do. If this is impossible to fix, you can teach UBIFS to tolerate
bit-flips in the empty space.

2. More difficult issue which no one still dares to start fixing is the
unstable bits issue. I do not have time to work on this, so I offer
everyone assistance, but no on so far started working on this, AFAIK.
Here is the description of the issue:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits

HTH.

--=20
Best Regards,
Artem Bityutskiy

--=-rqLIray1nJXNJOe13vBK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPaF5vAAoJECmIfjd9wqK0w1cP/imNugwqrXleF/psXINbaiHW
8GUvBX/P688x1ny1YWe2MQ1AYy40OjyekD750FehFHlyVtFqB6qlkVsfNPgA89QM
MRSPp2UZwI6JZ+j+hcVbjkUNkaARQsS5DeLCpCHIxhpBWHlWao9VlTonStrmpijx
pcddrShB3PnsU7GEpLsFSiYkrNq7yA4LvVhofswCL7pD4OZnYc1l76XGjqEJwRoD
T0WNkFBgjUaNvqvpnxkYKa1i4pdl20WUh+qNxC9zRBmTD+4ICA5WJPZWHMeglII8
52SOMgAl5NqKwQzTvf7BsAk+U4DhEpbTVGxst4BSXa4H8dtEgYN0Rp8CPNU7g/bq
5oKeL5/bOO4hh2PdQPEQUS6N6mpOQfQhVez6dvHU4CQImFeFqaYR39D/ZJOTUvWZ
mhrtspqd1oyIhpIwnz3xih0rFxiDfn4j587xz32dqUi0Tfa41SEsF4SlHS3a6WJO
nIsn+Lms2YVMoAfw7FOk0OPBBL1m7NF4/kHLhe1xBAPDJvCZjFuIzbywIekZmUpX
mg/9cMHQe6HwBkHW9URAwrHaqIlMNCDSh/E8XwyQnd3M1usAZgIEeMHU4hrJp9fZ
Joa+AqH3U0iUcayZyPO+WzF4iPUY5l0f4pIlbSdHal8KSCdsb8lRFwo5VXnhiIf0
HY3ppVOmrG3tAMnaphLJ
=KbQc
-----END PGP SIGNATURE-----

--=-rqLIray1nJXNJOe13vBK--
