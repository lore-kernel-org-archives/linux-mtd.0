Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUuLL-00070F-BD
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 13:37:17 +0000
Date: Mon, 18 Jun 2018 15:37:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH 2/2] mtd: rawnand: marvell: Support page size of
 2048 with 8-bit ECC
Message-ID: <20180618153703.77bc01c1@xps13>
In-Reply-To: <20180618045255.8015-3-chris.packham@alliedtelesis.co.nz>
References: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
 <20180618045255.8015-3-chris.packham@alliedtelesis.co.nz>
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

Hi Chris,

On Mon, 18 Jun 2018 16:52:55 +1200, Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> The MT29F1G08ABAFAWP-ITE:F chip has 2048 byte pages and requires a
> minimum ECC strength of 8-bits. Allow for this combination of
> requirements using the marvell_nand controller.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> I've tried to follow the recommended AN-379 from Marvell. They do seem
> to have information that covers this particular set of chip requirements
> but I'm not confident I've translated their code correctly into the
> current marvell_nand implementation.
>=20
> This is enough to make the nand_scan work but ubi/ubifs fails to initiali=
se
> and/or mount so I may have something completely wrong. This may also be
> because this chip has internal ECC enabled which cannot be disabled. I
> turned up an old thread on this from April last year[1] but I didn't see
> anything resulting from this. Can this combination of ECC
> implementations even co-exist?
>=20
> [1] - http://lists.infradead.org/pipermail/linux-mtd/2017-April/073370.ht=
ml
>=20
>  drivers/mtd/nand/raw/marvell_nand.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/m=
arvell_nand.c
> index ebb1d141b900..5712df553a8e 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -217,6 +217,7 @@ static const struct marvell_hw_ecc_layout marvell_nfc=
_layouts[] =3D {
>  	MARVELL_LAYOUT(  512,   512,  1,  1,  1,  512,  8,  8,  0,  0,  0),
>  	MARVELL_LAYOUT( 2048,   512,  1,  1,  1, 2048, 40, 24,  0,  0,  0),
>  	MARVELL_LAYOUT( 2048,   512,  4,  1,  1, 2048, 32, 30,  0,  0,  0),
> +	MARVELL_LAYOUT( 2048,   512,  8,  1,  1, 1024, 0, 30,  1024,  32,  30),

I suppose you should not use HW_ECC for this chip. Hence this line is
useless. However I think it should be:

	MARVELL_LAYOUT( 2048,   512,  8,  2,  1, 1024, 0, 30, 1024, 32,	30),

                                          ^

>  	MARVELL_LAYOUT( 4096,   512,  4,  2,  2, 2048, 32, 30,  0,  0,  0),
>  	MARVELL_LAYOUT( 4096,   512,  8,  5,  4, 1024,  0, 30,  0, 64, 30),
>  };

Regards,
Miqu=C3=A8l
