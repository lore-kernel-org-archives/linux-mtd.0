Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy0cR-0004ef-VF
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 20:11:23 +0000
Date: Thu, 6 Sep 2018 22:10:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Antoine Tenart
 <antoine.tenart@bootlin.com>, Gregory Clement
 <gregory.clement@bootlin.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Ofer
 Heifetz <oferh@marvell.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: marvell: add new layout
Message-ID: <20180906221058.338f8c43@xps13>
In-Reply-To: <20180719152337.6372-1-miquel.raynal@bootlin.com>
References: <20180719152337.6372-1-miquel.raynal@bootlin.com>
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

Hello,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 19 Jul 2018
17:23:34 +0200:

> Hello,
>=20
> This series is an attempt at supporting a new layout for Marvell NAND
> controller: NAND chips using 2kiB pages, requesting at least 8
> correctable bits per 512-byte chunks.
>=20
> While this could have been trivial by the simple addition of this
> layout in the marvell_nfc_layout table as described in Marvell (not
> public) AN-379, actual testing shown a strange error. With this
> layout, one bitflip appears on the second chunk of every erased page
> when we read with BCH ECC engine activated.
>=20
> It has been experimentally checked that using 64 free OOB bytes
> instead of 32 in the second chunk cancels this bitflip. However, this
> is not a viable solution as the BootROM would not find the ECC bytes
> at the right place and would declare bad any block written with this
> layout.
>=20
> The solution found was to re-read in raw mode the whole page instead
> of just the ECC bytes when an ECC error occurs to check if the entire
> page is empty or not.
>=20
> Also, with this layout, Bad Block Markers (BBM) are expected to be
> within the data area. Prevent any use of the BBM in this case.
>=20
> The first patch reworks the ECC failure path of the BCH read function,
> the second patch adds support for the new layout with the above
> problems addressed and the last patch is just an optimization of the
> same ECC failure path for the Hamming read function.
>=20
> Thanks,
> Miqu=C3=A8l
>=20
>=20
> Miquel Raynal (3):
>   mtd: rawnand: marvell: rework BCH engine failure path
>   mtd: rawnand: marvell: support 8b/512B strength for 2kiB pages layout
>   mtd: rawnand: marvell: speed-up hamming failure path
>=20
>  drivers/mtd/nand/raw/marvell_nand.c | 123 +++++++++++++++++++++++-------=
------
>  1 file changed, 79 insertions(+), 44 deletions(-)
>=20

Patches 1 and 2 applied, patch 3 dropped because it would have cause
pxa (NFCv1) not to work anymore because of the unsupported "change
column".

Thanks,
Miqu=C3=A8l
