Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7lvc-0000go-3z
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 10:59:36 +0000
Message-ID: <1331722929.2140.18.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Stefan Roese <sr@denx.de>
Date: Wed, 14 Mar 2012 13:02:09 +0200
In-Reply-To: <CACRpkdYOE0JbAoQqLUKro5Q2hRP9BJiJ-cEtXSE=bobCs82iDQ@mail.gmail.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
 <1331647621.3595.64.camel@sauron.fi.intel.com> <4F603BC0.7050808@st.com>
 <201203140810.10964.sr@denx.de>
 <CACRpkdYOE0JbAoQqLUKro5Q2hRP9BJiJ-cEtXSE=bobCs82iDQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lb7LHu8JtkVBdoXXEFgx"
Mime-Version: 1.0
Cc: Vipin Kumar <vipin.kumar@st.com>,
 Armando VISCONTI <armando.visconti@st.com>,
 "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lb7LHu8JtkVBdoXXEFgx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-14 at 09:57 +0100, Linus Walleij wrote:
> On Wed, Mar 14, 2012 at 8:10 AM, Stefan Roese <sr@denx.de> wrote:
> > On Wednesday 14 March 2012 07:33:36 Vipin Kumar wrote:
> >> Artem, please suggest how to proceed as there would be conflicts if yo=
u
> >> try to apply Stefan's patch before my patch-set
> >
> > I suggest to just drop my patch then, since I still have to rebase it o=
n-top
> > of the l2 tree. So easiest is most likely, to apply Vipins's patchset n=
ow.
>=20
> I agree, use Vipin's stuff!

Could you guys signe-off that patch to make sure you get Greg's
complaint later on and send him the version for -stable?

--=20
Best Regards,
Artem Bityutskiy

--=-lb7LHu8JtkVBdoXXEFgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYHqxAAoJECmIfjd9wqK0ngIP/iiJ/SMQYTK8r57/KhpFv0Z3
8mgAoYXT4uhT00uIv+SgNohF8QxskKuOSStPOg9X0JcDrh/2DBMdaVR4ODuYBEfX
s+l6UnxdNpbjmTQIMzdOmya22moXe6fMszH8USRGsJvJ1f427uezpEhCd6yargCy
VX18lLiiLUHvCnXrti+0neWXCP+yQGQHj7OfLyF523M76nBc0ihZl0u+97V8f+lw
CRGSM54Tg3f7gbTjieYYuqhjMLtwwP9eHV7uWDOnrC9z7kOZIbjxKo7ozKCU10Tc
8UQwqpDJxercdoGMISDkTf01i+UUgKqDML4XcNu+g63gaJnhPC7v7bd1bUpavaNM
nFlgBfdVC2F80PgI+7KkbFkoV6DBw/4ZO28FDNJ5lakfjRIN/Ho0NCW636NUh81v
URF+lftzAFvfAC0h97HyHypyzSOTO1Qwg43JNfPwZlUPmHsLr5Ucrcki0T7tJB4u
pB0TT6h2PVGp2RYY2WIJHsSgLQijqhMywjVsUvTzMKEA4eJ+DjS20Mstq9Vpavmv
m6Fr8lzz4AnY/+Cptk7EsXafpnyWtvlnvp67+RKl9n85MSFW2/awUXnu2kj8waBH
cCmG6FxVV8NJ/NUvC8VDX9YAlZ3ZiyWhILZS3a/DAGVKW/BGealjaYpiWgKVee6I
781ezM7TDa+bVNfTFmOM
=1ohw
-----END PGP SIGNATURE-----

--=-lb7LHu8JtkVBdoXXEFgx--
