Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V94Wm-0003PP-JW
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 02:40:09 +0000
Message-ID: <52099AD1.6070903@freescale.com>
Date: Tue, 13 Aug 2013 10:32:49 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 01/10] mtd: set the cell information for ONFI nand
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-2-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2A6B@DBDE04.ent.ti.com>
 <20130813004938.GD7267@brian-ubuntu>
In-Reply-To: <20130813004938.GD7267@brian-ubuntu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8813=E6=97=A5 08:49, Brian Norris =E5=86=99=
=E9=81=93:
> On Mon, Aug 12, 2013 at 07:22:38AM +0000, Gupta, Pekon wrote:
>>> The current code does not set the SLC/MLC information for onfi nand.
>>> (This makes that the kernel treats all the onfi nand as SLC nand.)
>>>
>>> This patch fills the chip->cellinfo when the onfi nand is a MLC(or TL=
C) nand
>>> (p->bits_per_cell>  1).
>>>
>>> The macro NAND_CI_CELLTYPE_SHIFT is added to avoid the hardcode.
>>>
>>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>>> ---
>>>   drivers/mtd/nand/nand_base.c |    3 +++
>>>   include/linux/mtd/nand.h     |    1 +
>>>   2 files changed, 4 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_bas=
e.c
>>> index ff605c8..ee1aa52 100644
>>> --- a/drivers/mtd/nand/nand_base.c
>>> +++ b/drivers/mtd/nand/nand_base.c
>>> @@ -2988,6 +2988,9 @@ static int nand_flash_detect_onfi(struct mtd_in=
fo
>>> *mtd, struct nand_chip *chip,
>>>   	chip->chipsize =3D le32_to_cpu(p->blocks_per_lun);
>>>   	chip->chipsize *=3D (uint64_t)mtd->erasesize * p->lun_count;
>>>
>>> +	/* @bits_per_cell equals 1 means this is a SLC nand. */
>>> +	chip->cellinfo =3D (p->bits_per_cell - 1)<<  NAND_CI_CELLTYPE_SHIFT=
;
>>> +
>> [Pekon]: For future scalability, good to update only MLC related bit-f=
ields
>> So ORing instead of assigning..
>> chip->cellinfo |=3D (p->bits_per_cell - 1)<<  NAND_CI_CELLTYPE_SHIFT;
> I was thinking of an alternate approach: since nand_chip.cellinfo is
> only used for checking SLC vs. MLC (and it is admittedly bad at that,
> currently), we should modify it so that is a reliable source of *only* =
1
> piece of information -- the number of bits per cell. Currently, it
> contains unused (and potentially unmaintainable) information for some
> chips about number of simultaneously-programmed pages, write caching,
> internal chip numbering, etc.
I do not object to rename the cellinfo to bits_per_cell. :)
It's okay to me.

Do Artem & David (or some other people) have any opinion about this?



> byte has the correct info (you can refer to [1]) and set it with
> something like this:
>
>    chip->bits_per_cell =3D id_data[2]&  NAND_CI_CELLTYPE_MSK
>    chip->bits_per_cell>>=3D NAND_CI_CELLTYPE_SHIFT;
>    chip->bits_per_cell +=3D 1;
>
> for chips listed by full-ID, add an appropriate flag/field; and for ONF=
I
> chips, just use p->bits_per_cell.
we do not need to worry about the full-id case, we can get the correct=20
cell info from the id[2] for all the 4 toshiba nand.

> If you really need the other cellinfo fields in the future, we can add
> more fields to nand_chip.
>
I only need the SLC/MLC info now.

thanks
Huang Shijie
>
