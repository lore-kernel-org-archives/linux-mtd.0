Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cALML-0005IW-EM
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 18:36:31 +0000
Date: Fri, 25 Nov 2016 19:35:57 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris
 <computersforpeace@gmail.com>, "hramrach@gmail.com" <hramrach@gmail.com>,
 Richard Weinberger <richard@nod.at>, Peter Pan <peterpansjtu@gmail.com>,
 linux-mtd@lists.infradead.org, Yao Yuan <yao.yuan@nxp.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Subject: Re: SPI NAND support in drivers/mtd/spi-nor/spi-nor.c
Message-ID: <20161125193557.2bbf064b@bbrezillon>
In-Reply-To: <0810b4e9-96fc-ae5d-590b-1449b646defb@gmail.com>
References: <DB6PR0401MB2407AE783B4F57D09750D8DA89A70@DB6PR0401MB2407.eurprd04.prod.outlook.com>
 <20161108020115.GA116407@google.com>
 <20161108090757.204ef112@bbrezillon>
 <b5b54cd1-87fb-3b56-6960-d87c172f93fb@atmel.com>
 <0810b4e9-96fc-ae5d-590b-1449b646defb@gmail.com>
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

On Fri, 25 Nov 2016 18:11:41 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 11/08/2016 11:52 AM, Cyrille Pitchen wrote:
> > Hi all,
> >=20
> > Le 08/11/2016 =C3=A0 09:07, Boris Brezillon a =C3=A9crit : =20
> >> +Peter
> >>
> >> On Mon, 7 Nov 2016 18:01:15 -0800
> >> Brian Norris <computersforpeace@gmail.com> wrote:
> >> =20
> >>> + others
> >>>
> >>> On Mon, Nov 07, 2016 at 09:53:34AM +0000, Yao Yuan wrote: =20
> >>>>    Hi All,   =20
> >>>
> >>> Hi Yao,
> >>>
> >>> I'm not that interested in handling private requests, and this is
> >>> generally informative, so I've added the linux-mtd list, as well as t=
he
> >>> other maintainers.
> >>>
> >>> Also, when you're ready to send patches, make sure you use plain text
> >>> instead of HTML email.
> >>> =20
> >>>>    I=E2=80=99m trying to add the QSPI NAND support in MTD. =20
> >>
> >> Yao, can you sync with Peter who is currently working on a SPI NAND
> >> framework (which would sit in drivers/mtd/nand/spi/).
> >> =20
> >>>>
> >>>>    But I have reached a junction, could you please take some minutes=
 and
> >>>>    give me some suggestions?
> >>>>
> >>>>
> >>>>    You know, we have the QSPI NOR support in
> >>>>    drivers/mtd/spi-nor/spi-nor.c,
> >>>>
> >>>>    And the QSPI NAND is very similar with QSPI NOR, but the Read, wr=
ite
> >>>>    and erase is different with SPI-NOR.   =20
> >>>
> >>> How similar is the controller hardware? Does your IP support standard
> >>> SPI protocol, or is it specialized for accelerating SPI NAND (e.g.,
> >>> memory-mapped, DMA, etc.)? Does it support SPI NOR?
> >>> =20
> >>>>    So I have two ways to add QSPI-NAND:   =20
> >>>
> >>> I'll leave your options intact below, but I don't think either of them
> >>> are that good. SPI NOR and SPI NAND are different enough, I doubt that
> >>> we'll get much benefit from using the same framework, unless you happ=
en
> >>> to have IP that's designed for both NOR and NAND, yet doesn't quite do
> >>> traditional SPI.
> >>>
> >>> Particularly, NAND flash has a lot of issues that NOR flash generally
> >>> does not, around bad block management and wear leveling. Also, there =
may
> >>> be something to share around identification/ONFI? (Not sure how simil=
ar
> >>> the implementations are there.) There's been some prior discussion ab=
out
> >>> it, and maybe one of the CC'd people can direct you toward the latest
> >>> opinions, or else you can search the archives youreself ("SPI NAND"
> >>> should turn up several results).
> >>>
> >>> So the main issues would probably be around abstracting out the
> >>> bad-block-related and chip identification code so you can share code
> >>> with existing (parallel) NAND support. At least, that's what I think
> >>> based on the last time I looked at things, and I think some of the ot=
her
> >>> active maintainers had ideas along the same lines. =20
> >>
> >> I'm not sure identification of raw and SPI NAND is working the same
> >> way, but that's true for the BBT. And, as Brian said, you don't intera=
ct
> >> with NANDs the same way you do with NORs, so it should IMO stay in
> >> different frameworks.
> >> =20
> >=20
> > I agree with Brian and Boris about separating NORs and NANDs in differe=
nt
> > frameworks. I know this is just a detail but for instance, the current
> > spi-nor framework starts sending the JEDEC Read ID command 9Fh to probe
> > the memory. At this point, you don't know yet what memory is connected =
to
> > the SPI controller. Hence you don't even know wether it is a NAND or a =
NOR.
> > Then if I take the Macronix MX35LFxGE4AB QSPI NAND as an example, its
> > datasheet claims that the JEDEC Read ID command (9Fh) requires 8 dummy
> > clock cycles after the op code and before reading the actual memory ID.
> > Those dummy cycles don't exist with SPI NOR memories.
> > So spi_nor_scan() cannot be used probe (Q)SPI NAND memories.
> >=20
> > Also, the read operation can be performed with a single (Fast) Read
> > command with (Q)SPI NOR memories whereas it has to be done in two steps
> > for QSPI NAND memories:
> > 1 - Page Read (13h): to transfer data from array to cache
> > 2 - Random Data Read (03h or 0Bh): to read data from the cache and
> >                                    transfer them on the SPI bus.
> >=20
> > So read operations are quite different as well between NORs and NANDs.
> > I didn't have a look at the Page Program operation but I expect
> > strong differences as well.
> >=20
> > I think there are too many differences to handle both kind of memories
> > with a single framework. =20
>=20
> Can a QSPI controller handle both SPI NOR and SPI NAND ? That is the
> question here. If so, we'd have the same driver for both, but different
> layer on top of it (handling either NOR or NAND commands). I think the
> different command sets are a detail which can be handled just fine and
> it should be a detail handled in separate SPI NOR and SPI NAND layers.
> Just my 5 cents ...

That was my feeling too, but as I said, I know almost nothing about
spi-nor/nand, so I trust people who already worked on this topic.
If we have enough code to share (everything that is storage agnostic),
then let's do that, but AFAIU, there's not much to share. And if it's
really storage agnostic, shouldn't we place that code in the spi
framework?
