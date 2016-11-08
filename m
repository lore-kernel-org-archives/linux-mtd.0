Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c41SA-0002oU-RF
 for linux-mtd@lists.infradead.org; Tue, 08 Nov 2016 08:08:24 +0000
Date: Tue, 8 Nov 2016 09:07:57 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Yao Yuan <yao.yuan@nxp.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "hramrach@gmail.com" <hramrach@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Peter Pan
 <peterpansjtu@gmail.com>
Subject: Re: SPI NAND support in drivers/mtd/spi-nor/spi-nor.c
Message-ID: <20161108090757.204ef112@bbrezillon>
In-Reply-To: <20161108020115.GA116407@google.com>
References: <DB6PR0401MB2407AE783B4F57D09750D8DA89A70@DB6PR0401MB2407.eurprd04.prod.outlook.com>
 <20161108020115.GA116407@google.com>
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

+Peter

On Mon, 7 Nov 2016 18:01:15 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> + others
>=20
> On Mon, Nov 07, 2016 at 09:53:34AM +0000, Yao Yuan wrote:
> >    Hi All, =20
>=20
> Hi Yao,
>=20
> I'm not that interested in handling private requests, and this is
> generally informative, so I've added the linux-mtd list, as well as the
> other maintainers.
>=20
> Also, when you're ready to send patches, make sure you use plain text
> instead of HTML email.
>=20
> >    I=E2=80=99m trying to add the QSPI NAND support in MTD.

Yao, can you sync with Peter who is currently working on a SPI NAND
framework (which would sit in drivers/mtd/nand/spi/).

> >=20
> >    But I have reached a junction, could you please take some minutes and
> >    give me some suggestions?
> >=20
> >=20
> >    You know, we have the QSPI NOR support in
> >    drivers/mtd/spi-nor/spi-nor.c,
> >=20
> >    And the QSPI NAND is very similar with QSPI NOR, but the Read, write
> >    and erase is different with SPI-NOR. =20
>=20
> How similar is the controller hardware? Does your IP support standard
> SPI protocol, or is it specialized for accelerating SPI NAND (e.g.,
> memory-mapped, DMA, etc.)? Does it support SPI NOR?
>=20
> >    So I have two ways to add QSPI-NAND: =20
>=20
> I'll leave your options intact below, but I don't think either of them
> are that good. SPI NOR and SPI NAND are different enough, I doubt that
> we'll get much benefit from using the same framework, unless you happen
> to have IP that's designed for both NOR and NAND, yet doesn't quite do
> traditional SPI.
>=20
> Particularly, NAND flash has a lot of issues that NOR flash generally
> does not, around bad block management and wear leveling. Also, there may
> be something to share around identification/ONFI? (Not sure how similar
> the implementations are there.) There's been some prior discussion about
> it, and maybe one of the CC'd people can direct you toward the latest
> opinions, or else you can search the archives youreself ("SPI NAND"
> should turn up several results).
>=20
> So the main issues would probably be around abstracting out the
> bad-block-related and chip identification code so you can share code
> with existing (parallel) NAND support. At least, that's what I think
> based on the last time I looked at things, and I think some of the other
> active maintainers had ideas along the same lines.

I'm not sure identification of raw and SPI NAND is working the same
way, but that's true for the BBT. And, as Brian said, you don't interact
with NANDs the same way you do with NORs, so it should IMO stay in
different frameworks.

Now, the remaining question is, how can we share QSPI controller code
between SPI-NOR and SPI-NAND (is it really needed?)?
I guess we could have a drivers/mtd/spi-flash directory containing such
controller drivers, and then each controller would register one or
several SPI-NOR/NAND devices to the spi-nor and spi-nand frameworks.

I'm just guessing here, and I don't know enough about SPI flashes to
have a definitive opinion on this.

Ezequiel, Cyrille, Marek, what's your opinion?

Regards,

Boris
