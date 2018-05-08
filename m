Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGCDq-0006aF-Ru
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 23:40:45 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: ubifs error with marvell_nand on Armada-98DX4251 (was Re: [PATCH]
 mtd: rawnand: marvell: fix command xtype in BCH write hook)
Date: Tue, 8 May 2018 23:40:16 +0000
Message-ID: <ef26d2c2b42f48e59b467163bf08d717@svr-chch-ex1.atlnz.lc>
References: <20180503100027.16229-1-miquel.raynal@bootlin.com>
 <f1b88811dd88481da1c1b84341bbc9a5@svr-chch-ex1.atlnz.lc>
 <20180504091001.3e6650d6@xps13>
 <729567d8180a4b70ba9226dcd9eee0b4@svr-chch-ex1.atlnz.lc>
 <20180507095053.249547d0@bbrezillon>
 <91c282c4fe9344d88684131d1a64dcf2@svr-chch-ex1.atlnz.lc>
 <20180508095937.46678a01@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,=0A=
=0A=
On 08/05/18 19:59, Boris Brezillon wrote:=0A=
> On Tue, 8 May 2018 01:38:13 +0000=0A=
> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> Hi Boris,=0A=
>>=0A=
>> Thanks for picking this up while Miquel is taking a break.=0A=
> =0A=
> Can you try with the following diff applied?=0A=
> =0A=
> --->8---=0A=
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/m=
arvell_nand.c=0A=
> index db5ec4e8bde9..ebb1d141b900 100644=0A=
> --- a/drivers/mtd/nand/raw/marvell_nand.c=0A=
> +++ b/drivers/mtd/nand/raw/marvell_nand.c=0A=
> @@ -1194,11 +1194,13 @@ static void marvell_nfc_hw_ecc_bch_read_chunk(str=
uct nand_chip *chip, int chunk,=0A=
>                                    NDCB0_CMD2(NAND_CMD_READSTART);=0A=
>   =0A=
>          /*=0A=
> -        * Trigger the naked read operation only on the last chunk.=0A=
> -        * Otherwise, use monolithic read.=0A=
> +        * Trigger the monolithic read on the first chunk, then naked rea=
d on=0A=
> +        * intermediate chunks and finally a last naked read on the last =
chunk.=0A=
>           */=0A=
> -       if (lt->nchunks =3D=3D 1 || (chunk < lt->nchunks - 1))=0A=
> +       if (chunk =3D=3D 0)=0A=
>                  nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_RW)=
;=0A=
> +       else if (chunk < lt->nchunks - 1)=0A=
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(XTYPE_NAKED_RW);=0A=
>          else=0A=
>                  nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(XTYPE_LAST_NAKED_RW)=
;=0A=
>   =0A=
> =0A=
=0A=
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
=0A=
Works for:=0A=
=0A=
Armada-385 + Micron MT29F8G08ABACAWP=0A=
Armada-385 + Micron MT29F2G08ABAEAWP=0A=
Armada-385 + Macronix MX30LF2G18AC=0A=
Armada-98DX4251 + Micron MT29F8G08ABACAWP (previously failed)=0A=
Armada-98DX3236 + AMD/Spansion S34ML01G2=0A=
Armada-98DX3236 + Macronix MX30LF1G18AC=0A=
=0A=
=0A=
