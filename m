Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGpEb-0007rB-66
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 14:38:45 +0000
Date: Wed, 6 Jan 2016 15:38:22 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, fransklaver@gmail.com,
 Peter Pan <peterpandong@micron.com>, beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 karlzhang@micron.com
Subject: Re: [PATCH v2 05/12] mtd: nand: use new BBT API instead of old ones
Message-ID: <20160106153822.0ebf2e50@bbrezillon>
In-Reply-To: <1450159178-29895-6-git-send-email-peterpandong@micron.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
 <1450159178-29895-6-git-send-email-peterpandong@micron.com>
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

On Tue, 15 Dec 2015 05:59:31 +0000
Peter Pan <peterpansjtu@gmail.com> wrote:

> From: Brian Norris <computersforpeace@gmail.com>
> 
> Use new BBT APIs (nand_bbt_*()) in NAND. Keep old APIs (nand_*_bbt())
> exist temporarily.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> [Peter: 1. use nand_bbt_markbad_factory() in docg4.c and implement
>         2. nand_create_factory_badblock_pattern(), nand_is_bad_bbm() and
>         nand_default_bbt() in nand_base.c
>         3. add NAND_BADBLOCK_PATTERN_ALLOC macro]
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/docg4.c     |   6 +-
>  drivers/mtd/nand/nand_base.c | 140 ++++++++++++++++++++++++++++++++++++++++---
>  include/linux/mtd/nand.h     |   9 ++-
>  3 files changed, 143 insertions(+), 12 deletions(-)
> 

[...]

> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 5aec154..28d7a58 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c

[...]

> +
> +static int nand_default_bbt(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	struct nand_bbt *bbt = kzalloc(sizeof(struct nand_bbt), GFP_KERNEL);
> +
> +	if (!bbt)
> +		return -ENOMEM;
> +
> +	bbt->bbt_options = chip->bbt_options;
> +	bbt->mtd = mtd;
> +	bbt->numchips = chip->numchips;
> +	bbt->chipsize = chip->chipsize;
> +	bbt->chip_shift = chip->chip_shift;
> +	bbt->bbt_erase_shift = chip->phys_erase_shift;
> +	bbt->page_shift = chip->page_shift;
> +	bbt->bbt_td = chip->bbt_td;
> +	bbt->bbt_md = chip->bbt_md;
> +	bbt->is_bad_bbm = nand_is_bad_bbm;
> +	bbt->erase = nand_bbt_erase_block;
> +	chip->nand_bbt = bbt;
> +
> +	if (!chip->badblock_pattern &&
> +		nand_create_factory_badblock_pattern(chip))
> +		return -ENOMEM;
> +
> +	return nand_bbt_init(chip->nand_bbt);

I'd prefer if we could have a nand_bbt_create() (and the associated
nand_bbt_destroy()) function that would do both the allocation and
initialization step, but given the number of fields to set in bbt it's
not really doable.
Note that creating the nand_chip_info and nand_bbt_ops would reduce the
number of parameters to pass (bbt_options, mtd, nand_chip_info,
bbt_td, bbt_md and bbt_ops).
Alternatively, we could create a nand_bbt_info struct that would only
be used to pass the config parameters to nand_bbt_create().


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
