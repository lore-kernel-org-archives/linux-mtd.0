Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMxzs-0001ki-Hb
 for linux-mtd@lists.infradead.org; Sun, 27 May 2018 15:54:18 +0000
Date: Sun, 27 May 2018 17:54:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>, Benjamin Lindqvist
 <benjamin.lindqvist@endian.se>, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, Lucas Stach <dev@lynxeye.de>, richard@nod.at,
 marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com,
 jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, Mirza
 Krak <mirza.krak@gmail.com>, linux-mtd@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 2/5] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Message-ID: <20180527175403.065a135d@xps13>
In-Reply-To: <20180527171337.002eeb9f@bbrezillon>
References: <cover.1526990589.git.stefan@agner.ch>
 <86fdf19ec92b732709732fb60199f16488b4b727.1526990589.git.stefan@agner.ch>
 <CAGefG55kvShaLhNYsFznbOq0_6RNbb+eJ47DLnnU9qRRpwu-iA@mail.gmail.com>
 <d8d6cb9fcd8ce7ea5c13b227012de6d2@agner.ch>
 <CAGefG56khQ2835c2QCteit7FuL_yG+APpj6-4vRRPxztFtkAMA@mail.gmail.com>
 <20180524135335.6aa0b7a4@bbrezillon>
 <146a3abbbff4dcef30ad662a0fb85ff1@agner.ch>
 <20180527161832.1152be6e@xps13>
 <20180527171337.002eeb9f@bbrezillon>
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

On Sun, 27 May 2018 17:13:37 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> On Sun, 27 May 2018 16:18:32 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Hi Stefan,
> >=20
> > On Thu, 24 May 2018 14:19:18 +0200, Stefan Agner <stefan@agner.ch>
> > wrote:
> >  =20
> > > On 24.05.2018 13:53, Boris Brezillon wrote:   =20
> > > > Hi Benjamin,
> > > >=20
> > > > On Thu, 24 May 2018 13:30:14 +0200
> > > > Benjamin Lindqvist <benjamin.lindqvist@endian.se> wrote:
> > > >      =20
> > > >> Hi Stefan,
> > > >>
> > > >> It seems to me that a probe similar to what the BootROM does shoul=
dn't
> > > >> be awfully complicated to implement - just cycle through the switch
> > > >> cases in case of an ECC error. But I guess that's more of an idea =
for
> > > >> further improvements rather than a comment to the patch set under
> > > >> review.     =20
> > > >=20
> > > > Nope, not really an option, because you're not guaranteed that the =
NAND
> > > > will be used as a boot media, and the first page or first set of pa=
ges
> > > > might just be erased.
> > > >      =20
> > >=20
> > > Yeah I did not meant probing like the Boot ROM does.
> > >=20
> > > What I meant was using only the ECC modes which are supported by the
> > > Boot ROM when the driver tries to choose a viable mode. So that would
> > > be:
> > > - RS t=3D4
> > > - BCH t=3D8
> > > - BCH t=3D16
> > >=20
> > > Maybe we could add a property to enable that behavior:
> > >=20
> > > tegra,use-bootable-ecc-only;   =20
> >=20
> > I'm not sure a property is needed.
> >=20
> > As there is currently no official user of this driver, why not turning
> > mandatory the nand-ecc-xxx properties? =20
>=20
> Not a big fan of this solution. We already have a few cases where the
> NAND part was changed on a design and the new NAND had different ECC
> requirements, With your suggestion, that means creating a new .dts file
> for each possible NAND part.
>=20
> Note that having a solution that picks the best ECC config based on
> chip->ecc_xxx_ds should be the preferred approach. nand-ecc- props are
> mainly here to address the case where you need/want to assign a config
> that does not match the ECC requirements exposed by the chip.

Ok, that's right it's a problem.

But then the driver has to choose a default algorithm if none is given.
In this case, should we select the one that fits best the NAND chip
requirements, or shall we limit to the ones supported by the BootRom?

The underlying question is: will we add a tegra,use-bootable-ecc-only
property?

>=20
> > In the documentation you can add
> > a note saying that using other algorithms than the three above is not
> > supported by the BootROM.
> >  =20
> > >    =20
> > > >>
> > > >> However, I think that allowing for an override of the oobsize
> > > >> inference would be a good idea before merging, no? This could just=
 be
> > > >> a trivial #ifdef (at least temporarily). If you agree but don't fe=
el
> > > >> like doing it yourself, I'd be happy to pitch in. Let me know.    =
 =20
> > > >=20
> > > > That's why we have nand-ecc-xxx properties in the DT.
> > > >      =20
> > >=20
> > > Yes, nand-ecc-strength is the first thing I plan to implement, that w=
ay
> > > strength can be defined in dt.
> > >=20
> > > --
> > > Stefan   =20
> >=20
> > Thanks,
> > Miqu=C3=A8l =20
>=20
