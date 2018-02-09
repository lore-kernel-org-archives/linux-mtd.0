Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ek7He-0001xG-7L
 for linux-mtd@lists.infradead.org; Fri, 09 Feb 2018 11:56:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Feb 2018 12:55:49 +0100
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: warn if hamming layout is used with too large
 ECC
In-Reply-To: <20180209105852.21c5a400@bbrezillon>
References: <20180208233305.20583-1-stefan@agner.ch>
 <20180209095027.63da257d@bbrezillon>
 <7ec8aa6337c59550f335957a34658a65@agner.ch>
 <20180209105852.21c5a400@bbrezillon>
Message-ID: <475d5f62d1cc95e38da0c7dc2e37a511@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09.02.2018 10:58, Boris Brezillon wrote:
> On Fri, 09 Feb 2018 10:20:37 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
>>
>> But some kind of sanity check somewhere might be worthwhile, I was a bit
>> surprised that this overflowing happens on a driver in operational use
>> and goes unnoticed. I realize that this patch is not ideal. Maybe making
>> length signed, then we could sanity check in
>> mtd_ooblayout_count_bytes...
> 
> Something like that should help us detect this unexpected case:
> 

It is less generic than making length signed and checking for positive
length, but fine for me.

--
Stefan

> --->8---
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 66b67014508f..ada2e709743f 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -201,6 +201,9 @@ static int nand_ooblayout_free_lp_hamming(struct
> mtd_info *mtd, int section, oobregion->offset = 2;
>                 oobregion->length = ecc_offset - 2;
>         } else {
> +               if (ecc_offset + ecc->total > mtd->oobsize)
> +                       return -EINVAL;
> +
>                 oobregion->offset = ecc_offset + ecc->total;
>                 oobregion->length = mtd->oobsize - oobregion->offset;
>         }
