Message-ID: <1350817204.1704.0.camel@kyv>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 21 Oct 2012 14:00:04 +0300
In-Reply-To: <CAN8TOE91TDewmo=w7585sDrsXcPmBnvOjmD7sTizPSJ8RH8_Gg@mail.gmail.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
 <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
 <CACRpkdYjA8QUh4HqvE1rsnXcGA4WafTkMq_wLNJ__gXEnEYrow@mail.gmail.com>
 <507794B6.2000107@st.com> <1350307104.4115.23.camel@sauron.fi.intel.com>
 <CAN8TOE-7d=YUSYsHFw9X5vnz8cpSJYv5uZfvBpDyhg+-F_LDiQ@mail.gmail.com>
 <CACRpkdao_9TkH7=ia7kXB-KsQhNZQ7EfSS5B1X0wFPgg5OsuHA@mail.gmail.com>
 <1350371685.5769.45.camel@sauron.fi.intel.com>
 <CACRpkdY2=PLS_MT1h_nQJj+2ju26yXtt-aXSi=t9uUQ5+WJasA@mail.gmail.com>
 <CAN8TOE91TDewmo=w7585sDrsXcPmBnvOjmD7sTizPSJ8RH8_Gg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-M7wwxEK2HtIRl5uVZCf5"
Mime-Version: 1.0
Cc: Vinod Koul <vinod.koul@intel.com>, viresh kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 spear-devel <spear-devel@list.st.com>, Vipin Kumar <vipin.kumar@st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-M7wwxEK2HtIRl5uVZCf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-10-21 at 00:38 -0700, Brian Norris wrote:
> >> This is good idea, the problem is that it is a bit more work than
> >> hacking the driver, so most people prefer the latter. By removing all
> >> kmalloc()'s I basically wish to force people to go this way.
>=20
> Did you mean vmalloc()'s?

Yes.

>=20
> >> What are the SC functions names you refer?
> >
> > I'm mainly thinking of blk_rq_map_sg()
> > from block/blk-merge.c

Yeah, may be re-working or extending MTD api with SG lists would be the
way to go, but this is a lot more work...

--=20
Best Regards,
Artem Bityutskiy

--=-M7wwxEK2HtIRl5uVZCf5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQg9W0AAoJECmIfjd9wqK0hFUP/iqmxTFlsCZcn7wdbeW9owB6
eMk/GgOypzQbJQeBM1jieu+02C2vxYNiBTaD9B6Lin46/R7yqSH5fPSspUc8uYYH
MBoLjXI9w2/WQwsdbV63R7mkmTyHL+mMsoV/dMjsdac4mxmKU+uVtbJA5bsdkHct
CIhjaSBk/whwDEjh108dNUC0szDGoX1dWb1jwIPV9Nu2XPVMfkDbuGjxj8taeqJM
Nf3xGVVlb8VFT/ZfD0515O4OSXQZoLSt4VUYWO4YjYBY+aNzMexpfiUiccCu6saY
x+GB+iAXhLOrZwNqan8s3dMWJm5HXkuIoDcJx9jnXR8Vgk2uhs5mBgzIMugQ2Sh4
Bsjl3jKAGI4qDdV4acg6J340HysJVIjdybSPrgGcG6qt5BU8THZojA3gehATtFRv
vdixZdNdv8pAYeblXqt8ZI7e0pOmw0ZHTbqjPBurBRGt16X+JHfK7SGrLsfAupf/
6WxR28btkN3A0dXZojQEZI4XEV8UAAIkfnWICmAo8vAKO+zxI4BcnLQJ5IUg212y
bAlPyqESs5PnSUDOAQykFqxVxEblv1AOrjTrj99x1AuxZ0in04SanE41kSlnQG9K
f92vyNRzb0Ki313tvjwW7o/OckLph+mdiLfZPM6uCZ8J22tANmu16d6msa4xl1u+
ow8KNlEffoN9XD7alRFf
=C/WL
-----END PGP SIGNATURE-----

--=-M7wwxEK2HtIRl5uVZCf5--
