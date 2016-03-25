Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajNT4-0007ii-DK
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 08:51:43 +0000
Date: Fri, 25 Mar 2016 09:51:20 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com, Peter
 Pan <peterpandong@micron.com>
Subject: Re: [PATCH 05/11] mtd: nand: use new BBT API instead of old ones
Message-ID: <20160325095120.640afc2c@bbrezillon>
In-Reply-To: <1457923684-13505-6-git-send-email-peterpandong@micron.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
 <1457923684-13505-6-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 Mar 2016 02:47:58 +0000
Peter Pan <peterpansjtu@gmail.com> wrote:

> Use new BBT APIs (nand_bbt_*()) in NAND. Keep old APIs (nand_*_bbt())
> exist temporarily.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/docg4.c     |   7 +-
>  drivers/mtd/nand/nand_base.c | 151 ++++++++++++++++++++++++++++++++++++++++---
>  include/linux/mtd/nand.h     |  15 ++++-
>  3 files changed, 160 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index b6facac..6f0e3b9 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c

[...]

> +static int nand_default_bbt(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_bbt *nand_bbt = NULL;
> +	struct nand_chip_layout_info *info =
> +		kzalloc(sizeof(struct nand_chip_layout_info), GFP_KERNEL);

No, this should be directly embedded in nand_chip, and should replace
the numchips/chipsize/... fields declared in there.

> +
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->numchips = chip->numchips;
> +	info->chipsize = chip->chipsize;
> +	info->chip_shift = chip->chip_shift;
> +	info->bbt_erase_shift = chip->phys_erase_shift;
> +	info->page_shift = chip->page_shift;
> +
> +	if (!chip->badblock_pattern &&
> +		nand_create_factory_badblock_pattern(chip))
> +		return -ENOMEM;
> +
> +	nand_bbt = nand_bbt_create(mtd, &default_bbt_ops,
> +				info, chip->bbt_options,
> +				chip->bbt_td, chip->bbt_md);
> +	if (IS_ERR(nand_bbt))
> +		return PTR_ERR(nand_bbt);
> +	chip->nand_bbt = nand_bbt;
> +
> +	return 0;
> +}



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
