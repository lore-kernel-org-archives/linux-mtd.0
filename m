Date: Fri, 7 Dec 2018 09:04:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tony Lindgren <tony@atomide.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Janusz Krzysztofik
 <jmkrzyszt@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: Subject: [PATCH v4 0/4] mtd: rawnand: ams-delta: Use GPIO API
 for data I/O
Message-ID: <20181207090425.4480d2c0@xps13>
In-Reply-To: <20181123170333.GH53235@atomide.com>
References: <20180813223448.21316-1-jmkrzyszt@gmail.com>
 <20181121110806.32076-1-jmkrzyszt@gmail.com>
 <20181121155639.77873f7f@bbrezillon>
 <20181123170333.GH53235@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tony,

Tony Lindgren <tony@atomide.com> wrote on Fri, 23 Nov 2018 09:03:33
-0800:

> * Boris Brezillon <boris.brezillon@bootlin.com> [181121 14:56]:
> > On Wed, 21 Nov 2018 12:08:02 +0100
> > Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> >  =20
> > > Finalize implementation of the idea suggested by Artem Bityutskiy and
> > > Tony Lindgren, described in commit b027274d2e3a ("mtd: ams-delta: fix
> > > request_mem_region() failure"). Use pure GPIO consumer API, as reqest=
ed
> > > by Boris Brezillon.
> > >=20
> > > Janusz Krzysztofik (4):
> > >       ARM: OMAP1: ams-delta: Provide GPIO lookup table for NAND data =
port
> > >       mtd: rawnand: ams-delta: Request data port GPIO resource
> > >       mtd: rawnand: ams-delta: Use GPIO API for data I/O
> > >       ARM: OMAP1: ams-delta: Drop obsolete NAND resources
> > >=20
> > >  arch/arm/mach-omap1/board-ams-delta.c |   22 ++----
> > >  drivers/mtd/nand/raw/ams-delta.c      |  120 +++++++++++++++++++----=
-----------
> > >  2 files changed, 80 insertions(+), 62 deletions(-)
> > >=20
> > > Performance on Amstrad Delta is now acceptable after recent extensions
> > > to GPIO API and rawnanad enhancements.
> > >=20
> > > Series intented to be merged via mtd tree, should not conflict with
> > > other OMAP1 patches submitted for 4.21. =20
> >=20
> > We'll prepare an immutable tag, just in case. =20
>=20
> Sounds good to me thanks:
>=20
> Acked-by: Tony Lindgren <tony@atomide.com>

Actually, I can't setup a topic branch with this series because it
depends on other changes in nand/next. If a conflict happens in -next,
I suppose we will have to send you a PR.


Thanks,
Miqu=C3=A8l
