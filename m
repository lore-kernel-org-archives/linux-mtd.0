Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2Y8V-0001RP-76
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 08:47:04 +0000
Date: Wed, 19 Sep 2018 10:46:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tony Lindgren <tony@atomide.com>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mtd: rawnand: ams-delta: Cleanups and optimizations
Message-ID: <20180919104639.6b5339e9@xps13>
In-Reply-To: <20180907164524.GH5662@atomide.com>
References: <20180813223448.21316-1-jmkrzyszt@gmail.com>
 <20180820213904.13475-1-jmkrzyszt@gmail.com>
 <20180905084757.432e7c19@xps13> <1855340.fVHtouTg44@z50>
 <20180907164524.GH5662@atomide.com>
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

Hi Janusz,

Tony Lindgren <tony@atomide.com> wrote on Fri, 7 Sep 2018 09:45:24
-0700:

> Hi,
>=20
> * Janusz Krzysztofik <jmkrzyszt@gmail.com> [180905 20:56]:
> > On Wednesday, September 5, 2018 8:47:57 AM CEST Miquel Raynal wrote: =20
> > > Patch 2/3 does not apply on nand/next. Indeed the driver does not look
> > > the same as in the diff. =20
> >=20
> > That's because I built it on top of my former series from the mid of Ju=
ly,=20
> > containing "[PATCH v2 2/3 v4] mtd: rawnand: ams-delta: use GPIO lookup =
table".=20
> > It was acked by you, Miquel, and supposed to be merged via linux-omap t=
ree. =20
>=20
> Hmm I thought the plan was for dependencies to clear and then
> merge the rest via various driver trees.. Or at least I don't have
> the patch above tagged anywhere for me to merge. Then again, I
> try to forget everything posted before -rc1 just to stay sane :)
>=20
> > > I don't see any changes on my side that could
> > > explain this so perhaps you could rebase on top of 4.19-rc2 (or
> > > nand/next, as you wish) and resend the series? =20
> >=20
> > As far as I can see, Tony hasn't applied that series yet, so maybe I ca=
n still=20
> > move that patch out of there and insert it into this series in front of=
 the=20
> > other 3 patches and resend. That would however make patch 3/3 of that o=
ld=20
> > series depend on this one.
> >=20
> > Tony, what do you think? =20
>=20
> Yes please resend based on v4.19-rc1 or MTD next. If there
> are still pending dependencies, please let us know and we can
> set up an immutable branch against v4.19-rc1 with those for
> MTD and me to merge in as needed.
>=20
> Regards,
>=20
> Tony

AFAIR I didn't received any new patches from you since Tony suggestion.
If you haven't done it already, please rebase against nand/next before
sending patches (internal API changed a bit, it might be worth fixing
the conflicts before sending them).


Thanks,
Miqu=C3=A8l
