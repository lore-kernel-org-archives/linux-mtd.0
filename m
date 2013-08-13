Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V92r4-0001y5-Nz
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 00:52:59 +0000
Received: by mail-pd0-f179.google.com with SMTP id v10so4172040pde.10
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 17:52:37 -0700 (PDT)
Date: Mon, 12 Aug 2013 17:52:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 02/10] mtd: add a helper to check the SLC/MLC nand chip
Message-ID: <20130813005234.GE7267@brian-ubuntu>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-3-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376286173-12581-3-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 01:42:45PM +0800, Huang Shijie wrote:
> Add a helper to check if a nand chip is SLC or MLC.
> This helper makes the code more readable.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/denali.c    |    2 +-
>  drivers/mtd/nand/nand_base.c |   14 ++++++--------
>  include/linux/mtd/nand.h     |    9 +++++++++
>  3 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 2ed2bb3..645721e 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1520,7 +1520,7 @@ int denali_init(struct denali_nand_info *denali)
>  	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
>  	 * SLC if possible.
>  	 * */
> -	if (denali->nand.cellinfo & NAND_CI_CELLTYPE_MSK &&
> +	if (!nand_is_slc(&denali->nand) &&

According to my recommendations in patch 1, this would only need to be:

  if (denali->nand.bits_per_cell > 1 && ...)

IMO, that is plenty readable, then we don't need the helper.

>  			(denali->mtd.oobsize > (denali->bbtskipbytes +
>  			ECC_15BITS * (denali->mtd.writesize /
>  			ECC_SECTOR_SIZE)))) {
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ee1aa52..fd5117d 100644

(ditto elsewhere)

Thanks,
Brian
