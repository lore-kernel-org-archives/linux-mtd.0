Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHXt-0000OH-Ca
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 21:48:42 +0000
Date: Sun, 8 Jul 2018 23:48:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Bean
 Huo <beanhuo@micron.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 0/3] mtd: rawnand: micron: Get the actual number of
 bitflips
Message-ID: <20180708234829.0d8b4f7e@xps13>
In-Reply-To: <20180703122009.29914-1-boris.brezillon@bootlin.com>
References: <20180703122009.29914-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue,  3 Jul 2018
14:20:06 +0200:

> Hello,
>=20
> Back when support for Micron 4bit/512byte on-die ECC was added, we
> decided that it wasn't worth retrieving the real number of bitflips
> when the chip was returning WRITE_RECOMMENDED and instead decided to
> always return the maximum value (ECC strength).
>=20
> This decision leads to UBI moving eraseblocks around as soon as 1
> bitflip is present, which is far from optimal, and might wear the NAND
> out faster than if we get the actual number of bitflips by re-reading
> the page in raw mode and comparing its content to the corrected
> version.
>=20
> IIRC, Bean warned us about that, but it seems we didn't listen, so now
> is time to revisit the implementation and implement what Bean initially
> suggested.
>=20
> This implementation has been tested on an MT29F2G08ABAEAH4, and seems
> to work as expected (nandbiterrs works fine, and the real number of
> bitflips is now returned).
>=20
> Here are some details about these patches:
> Patch 1 is just a cleanup to avoid passing parameters we don't need to
> the ecc_status() functions. Patch 2 is preparing things for the actual
> changes by reworking the ordering in the read function, and patch 3 is
> implementing the read-in-raw-mode-and-compare logic.
>=20
> Regards,
>=20
> Boris
>=20
> Boris Brezillon (3):
>   mtd: rawnand: micron: Stop passing mtd to ecc_status() funcs
>   mtd: rawnand: micron: Disable ECC earlier in the read path
>   mtd: rawnand: micron: Get the actual number of bitflips
>=20
>  drivers/mtd/nand/raw/nand_micron.c | 145 ++++++++++++++++++++++++++++++-=
------
>  1 file changed, 120 insertions(+), 25 deletions(-)
>=20


Series applied to nand/next.

Thanks,
Miqu=C3=A8l
