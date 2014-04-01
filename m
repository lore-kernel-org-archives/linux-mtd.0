Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUt7g-00013u-Ny
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 07:28:41 +0000
Received: by mail-pd0-f181.google.com with SMTP id p10so9135516pdj.12
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 00:28:19 -0700 (PDT)
Date: Tue, 1 Apr 2014 00:28:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v4 4/5] mtd: nand: Allocate extra buffers needed for
 on-die ECC controller.
Message-ID: <20140401072815.GC6400@brian-ubuntu>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-5-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1396308537-16013-5-git-send-email-davidm@egauge.net>
Cc: gsi@denx.de, linux-mtd@lists.infradead.org, pekon@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 31, 2014 at 05:28:56PM -0600, David Mosberger wrote:
> To avoid unnecessary rewrites, it is necessary to count the number of
> actual bitflips that occurred when the NAND_STATUS_REWRITE bit is set.
> This patch introduces the extra buffers needed to implement that
> counting.  The actual counting is in the next patch.
> 
> Signed-off-by: David Mosberger <davidm@egauge.net>
> ---
>  drivers/mtd/nand/nand_base.c |   13 ++++++++++++-
>  include/linux/mtd/nand.h     |    2 ++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 435ef44..834352a 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3935,13 +3935,24 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			!(chip->bbt_options & NAND_BBT_USE_FLASH));
>  
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
> +		size_t on_die_bufsz = 0;
> +
> +		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE)
> +			on_die_bufsz = 2*(mtd->writesize + mtd->oobsize);

Spacing:

			on_die_bufsz = 2 * (mtd->writesize + mtd->oobsize);

> +
>  		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
> -				+ mtd->oobsize * 3, GFP_KERNEL);
> +				+ mtd->oobsize * 3 + on_die_bufsz, GFP_KERNEL);
>  		if (!nbuf)
>  			return -ENOMEM;
>  		nbuf->ecccalc = (uint8_t *)(nbuf + 1);
>  		nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
>  		nbuf->databuf = nbuf->ecccode + mtd->oobsize;
> +		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE) {
> +			nbuf->chkbuf = (nbuf->databuf + mtd->writesize
> +					+ mtd->oobsize);
> +			nbuf->rawbuf = (nbuf->chkbuf + mtd->writesize
> +					+ mtd->oobsize);
> +		}
>  
>  		chip->buffers = nbuf;
>  	} else {
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index dbb99b3..456809b 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -533,6 +533,8 @@ struct nand_buffers {
>  	uint8_t	*ecccalc;
>  	uint8_t	*ecccode;
>  	uint8_t *databuf;
> +	uint8_t *chkbuf;
> +	uint8_t *rawbuf;

Do you really need two additional buffers? Can you get by with just one
of them?

>  };
>  
>  /**

Brian
