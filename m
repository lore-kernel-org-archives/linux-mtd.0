Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffPIl-0003Bj-66
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 12:42:01 +0000
Date: Tue, 17 Jul 2018 14:41:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: tegra: fix error handling of subop helpers
Message-ID: <20180717144124.4a22e133@xps13>
In-Reply-To: <20180717143841.3e8cbd88@bbrezillon>
References: <20180714163251.7773-1-miquel.raynal@bootlin.com>
 <20180717141733.61bc9c71@bbrezillon>
 <20180717142254.61998c98@xps13>
 <20180717143841.3e8cbd88@bbrezillon>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 17 Jul 2018
14:38:41 +0200:

> On Tue, 17 Jul 2018 14:22:54 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Hi Boris,
> >=20
> > Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 17 Jul 2018
> > 14:17:33 +0200:
> >  =20
> > > On Sat, 14 Jul 2018 18:32:51 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >    =20
> > > > A report from Colin Ian King pointed a CoverityScan issue where err=
or
> > > > values on these helpers where not checked in the drivers. These
> > > > helpers could error out only in case of a software bug in driver co=
de,
> > > > not because of a runtime/hardware error but in any cases it is safer
> > > > to handle these errors properly.
> > > >=20
> > > > Fix the Tegra NAND controller driver implementation by checking
> > > > potential negative error values coming from these helpers.     =20
> > >=20
> > > Hm, ok. I thought you were opting for a return 0 + WARN_ON() approach,
> > > what made you change your mind?   =20
> >=20
> > Wise people told me WARN_ON() should be avoided as much as possible. =20
>=20
> I think I mentioned BUG_ON(), not WARN_ON() :P.

I've never been a good listener :)

>=20
> > Hence after more discussion with myself I choose to implement the most
> > standard C solution: check the returned value...
> >=20
> > But if you think a return 0 + WARN_ON() would be better I'm ready to
> > change this as it was my initial idea :) =20
>=20
> Well, if this cannot happen without a SW bug, then I'd recommend the
> WARN_ON() + unsigned int ret approach. That should force people debug
> their implementation while keeping drivers code simple.

I'm fine with this approach, I'll send a v2.

Thanks,
Miqu=C3=A8l
