Message-ID: <1350820948.1704.2.camel@kyv>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 21 Oct 2012 15:02:28 +0300
In-Reply-To: <1350817204.1704.0.camel@kyv>
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
 <1350817204.1704.0.camel@kyv>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-aNl489gFMSt06aDOF7uE"
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


--=-aNl489gFMSt06aDOF7uE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-10-21 at 14:00 +0300, Artem Bityutskiy wrote:
> > > I'm mainly thinking of blk_rq_map_sg()
> > > from block/blk-merge.c
>=20
> Yeah, may be re-working or extending MTD api with SG lists would be the
> way to go, but this is a lot more work...

Sorry, it would be correct to say that re-working MTD API _users_ to
incorporate the SG API would be a lot more work.

--=20
Best Regards,
Artem Bityutskiy

--=-aNl489gFMSt06aDOF7uE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQg+RUAAoJECmIfjd9wqK044cP/3i7DOY5tERum/2U9c+CCIgc
PTlLFAVUtH7ZJ4a9cbUax/tAUM1zxICy5QTGajKJvrTPIRW99U4LZXjtCsJeK1Zq
zzhKiMedc/LvgvUAG9i0AYBe647ndsUMQKhwUNtXYqASTkaE7ie/GfkJ9bkG9csV
H0iDStGdmbaLvdvqVkCTGmO0GJ9wI2wPvnSg6pyyPJda44+DRvWgygWcQIsklbsZ
Bmb9AYGWsbQBgynGQ/QNaXTCu9UDvlCBj/zKj6HyDMnLitBnQ0oiWVT88k+M7eJ0
eh71WcKcUgFixt/73afFXv3De2/HY5tRZ94sUujsbzgaZml2zRyB7QIGHslRjYmW
jARysZvzRhAP48rSJqk9OElrN+QFQXEl/b9moXOxQtrejJ1MmJAdI7i0KbPwnUjo
5ucoFEPLIAe3HThAWpFiXmS9JGH1W9uyy3sIZnjiw9mMdjLc/0ihPJjRRGi7FAu8
UA74wkKTtS3W9Nm7xzkVgjT34B86q1E/0PH0Hs3uh/PBLBj4zKm8xmPmNlEdOhxu
ty2AH4/ZPvRkkKV1++w3jH8gY/YVvmyLE6uC1OOBL/YihPamn72+IvBoo2sIOBOe
SIMw5hVIgvfLuhk1MUH2nRQrCZojSbd+uFZmPId1QeS+TaITrWsx4PsRrDan9LVK
QcLSqkmeptvjgHYtcnCq
=Nw+W
-----END PGP SIGNATURE-----

--=-aNl489gFMSt06aDOF7uE--
